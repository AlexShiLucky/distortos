/**
 * \file
 * \brief SpiMasterLowLevelDmaBased class implementation for SPIv2 in STM32
 *
 * \author Copyright (C) 2018-2019 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
 *
 * \par License
 * This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
 * distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include "distortos/chip/SpiMasterLowLevelDmaBased.hpp"

#include "distortos/chip/STM32-SPIv2.hpp"
#include "distortos/chip/STM32-SPIv2-SpiPeripheral.hpp"

#include "distortos/devices/communication/SpiMasterBase.hpp"

#include "distortos/assert.h"

#include "estd/ScopeGuard.hpp"

#include <cerrno>

namespace distortos
{

namespace chip
{

/*---------------------------------------------------------------------------------------------------------------------+
| public functions
+---------------------------------------------------------------------------------------------------------------------*/

SpiMasterLowLevelDmaBased::~SpiMasterLowLevelDmaBased()
{
	if (isStarted() == false)
		return;

	// reset peripheral
	spiPeripheral_.writeCr1({});
	spiPeripheral_.writeCr2({});
}

std::pair<int, uint32_t> SpiMasterLowLevelDmaBased::configure(const devices::SpiMode mode,
		const uint32_t clockFrequency, const uint8_t wordLength, const bool lsbFirst, const uint32_t dummyData)
{
	if (isStarted() == false)
		return {EBADF, {}};

	if (isTransferInProgress() == true)
		return {EBUSY, {}};

	const auto ret = configureSpi(spiPeripheral_, mode, clockFrequency, wordLength, lsbFirst);
	if (ret.first != 0)
		return ret;

	txDummyData_ = dummyData;
	wordLength_ = wordLength;
	return ret;
}

int SpiMasterLowLevelDmaBased::start()
{
	if (isStarted() == true)
		return EBADF;

	{
		const auto ret = rxDmaChannelUniqueHandle_.reserve(rxDmaChannel_, rxDmaRequest_, rxDmaChannelFunctor_);
		if (ret != 0)
			return ret;
	}

	auto rxDmaChannelUniqueHandleScopeGuard = estd::makeScopeGuard([this]()
			{
				rxDmaChannelUniqueHandle_.release();
			});

	{
		const auto ret = txDmaChannelUniqueHandle_.reserve(txDmaChannel_, txDmaRequest_, txDmaChannelFunctor_);
		if (ret != 0)
			return ret;
	}

	rxDmaChannelUniqueHandleScopeGuard.release();

	wordLength_ = 8;
	spiPeripheral_.writeCr1(SPI_CR1_SSM | SPI_CR1_SSI | SPI_CR1_SPE | SPI_CR1_BR | SPI_CR1_MSTR);
	spiPeripheral_.writeCr2(SPI_CR2_FRXTH | (wordLength_ - 1) << SPI_CR2_DS_Pos | SPI_CR2_TXDMAEN | SPI_CR2_RXDMAEN);
	started_ = true;

	return 0;
}

int SpiMasterLowLevelDmaBased::startTransfer(devices::SpiMasterBase& spiMasterBase, const void* const writeBuffer,
		void* const readBuffer, const size_t size)
{
	if (size == 0)
		return EINVAL;

	if (isStarted() == false)
		return EBADF;

	if (isTransferInProgress() == true)
		return EBUSY;

	const auto dataSize = (wordLength_ + 8 - 1) / 8;
	if (size % dataSize != 0)
		return EINVAL;

	const auto transactions = size / dataSize;

	const auto commonDmaFlags = DmaChannel::Flags::peripheralFixed |
			(dataSize == 1 ? DmaChannel::Flags::dataSize1 : DmaChannel::Flags::dataSize2);

	{
		const auto memoryAddress = reinterpret_cast<uintptr_t>(readBuffer != nullptr ? readBuffer : &rxDummyData_);
		const auto rxDmaFlags = DmaChannel::Flags::transferCompleteInterruptEnable |
				DmaChannel::Flags::peripheralToMemory |
				(readBuffer != nullptr ? DmaChannel::Flags::memoryIncrement : DmaChannel::Flags::memoryFixed) |
				DmaChannel::Flags::veryHighPriority;
		const auto ret = rxDmaChannelUniqueHandle_.configureTransfer(memoryAddress, spiPeripheral_.getDrAddress(),
				transactions, commonDmaFlags | rxDmaFlags);
		if (ret != 0)
			return ret;
	}
	{
		const auto memoryAddress = reinterpret_cast<uintptr_t>(writeBuffer != nullptr ? writeBuffer : &txDummyData_);
		const auto txDmaFlags = DmaChannel::Flags::transferCompleteInterruptDisable |
				DmaChannel::Flags::memoryToPeripheral |
				(writeBuffer != nullptr ? DmaChannel::Flags::memoryIncrement : DmaChannel::Flags{}) |
				DmaChannel::Flags::lowPriority;
		const auto ret = txDmaChannelUniqueHandle_.configureTransfer(memoryAddress, spiPeripheral_.getDrAddress(),
				transactions, commonDmaFlags | txDmaFlags);
		if (ret != 0)
			return ret;
	}

	spiMasterBase_ = &spiMasterBase;
	size_ = size;

	{
		const auto ret = rxDmaChannelUniqueHandle_.startTransfer();
		assert(ret == 0);
	}
	{
		const auto ret = txDmaChannelUniqueHandle_.startTransfer();
		assert(ret == 0);
	}

	return 0;
}

int SpiMasterLowLevelDmaBased::stop()
{
	if (isStarted() == false)
		return EBADF;

	if (isTransferInProgress() == true)
		return EBUSY;

	rxDmaChannelUniqueHandle_.release();
	txDmaChannelUniqueHandle_.release();

	// reset peripheral
	spiPeripheral_.writeCr1({});
	spiPeripheral_.writeCr2({});
	started_ = false;
	return 0;
}

/*---------------------------------------------------------------------------------------------------------------------+
| private functions
+---------------------------------------------------------------------------------------------------------------------*/

void SpiMasterLowLevelDmaBased::eventHandler(const size_t transactionsLeft)
{
	txDmaChannelUniqueHandle_.stopTransfer();
	rxDmaChannelUniqueHandle_.stopTransfer();

	const auto bytesTransfered = size_ - transactionsLeft * ((wordLength_ + 8 - 1) / 8);
	size_ = {};

	const auto spiMasterBase = spiMasterBase_;
	spiMasterBase_ = {};
	assert(spiMasterBase != nullptr);
	spiMasterBase->transferCompleteEvent(bytesTransfered);
}

/*---------------------------------------------------------------------------------------------------------------------+
| SpiMasterLowLevelDmaBased::RxDmaChannelFunctor public functions
+---------------------------------------------------------------------------------------------------------------------*/

void SpiMasterLowLevelDmaBased::RxDmaChannelFunctor::transferCompleteEvent()
{
	owner_.eventHandler(0);
}

void SpiMasterLowLevelDmaBased::RxDmaChannelFunctor::transferErrorEvent(const size_t transactionsLeft)
{
	owner_.eventHandler(transactionsLeft);
}

/*---------------------------------------------------------------------------------------------------------------------+
| SpiMasterLowLevelDmaBased::TxDmaChannelFunctor public functions
+---------------------------------------------------------------------------------------------------------------------*/

void SpiMasterLowLevelDmaBased::TxDmaChannelFunctor::transferErrorEvent(const size_t transactionsLeft)
{
	owner_.eventHandler(transactionsLeft);
}

}	// namespace chip

}	// namespace distortos
