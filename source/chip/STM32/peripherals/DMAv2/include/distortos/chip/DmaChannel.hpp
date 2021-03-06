/**
 * \file
 * \brief DmaChannel class header for DMAv2 in STM32
 *
 * \author Copyright (C) 2018-2019 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
 *
 * \par License
 * This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
 * distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef SOURCE_CHIP_STM32_PERIPHERALS_DMAV2_INCLUDE_DISTORTOS_CHIP_DMACHANNEL_HPP_
#define SOURCE_CHIP_STM32_PERIPHERALS_DMAV2_INCLUDE_DISTORTOS_CHIP_DMACHANNEL_HPP_

#include "estd/EnumClassFlags.hpp"

#include <utility>

#include <cerrno>
#include <cstddef>
#include <cstdint>

namespace distortos
{

namespace chip
{

/// DMA transfer configuration flags
enum class DmaChannelFlags : uint32_t
{
	/// "transfer complete" interrupt is disabled
	transferCompleteInterruptDisable = 0 << 4,
	/// "transfer complete" interrupt is enabled
	transferCompleteInterruptEnable = 1 << 4,

	/// DMA is the flow controller
	dmaFlowController = 0 << 5,
	/// peripheral is the flow controller
	peripheralFlowController = 1 << 5,

	/// transfer from peripheral to memory
	peripheralToMemory = 0 << 6,
	/// transfer from memory to peripheral
	memoryToPeripheral = 1 << 6,

	/// peripheral address is fixed
	peripheralFixed = 0 << 9,
	/// peripheral address is incremented after each transaction
	peripheralIncrement = 1 << 9,

	/// memory address is fixed
	memoryFixed = 0 << 10,
	/// memory address is incremented after each transaction
	memoryIncrement = 1 << 10,

	/// peripheral data size - 1 byte
	peripheralDataSize1 = 0 << 11,
	/// peripheral data size - 2 bytes
	peripheralDataSize2 = 1 << 11,
	/// peripheral data size - 4 bytes
	peripheralDataSize4 = 2 << 11,

	/// memory data size - 1 byte
	memoryDataSize1 = 0 << 13,
	/// memory data size - 2 bytes
	memoryDataSize2 = 1 << 13,
	/// memory data size - 4 bytes
	memoryDataSize4 = 2 << 13,

	/// low priority
	lowPriority = 0 << 16,
	/// medium priority
	mediumPriority = 1 << 16,
	/// high priority
	highPriority = 2 << 16,
	/// very high priority
	veryHighPriority = 3 << 16,

	/// peripheral burst size - single transfer
	peripheralBurstSize1 = 0 << 21,
	/// peripheral burst size - incremental burst of 4 beats
	peripheralBurstSize4 = 1 << 21,
	/// peripheral burst size - incremental burst of 8 beats
	peripheralBurstSize8 = 2 << 21,
	/// peripheral burst size - incremental burst of 16 beats
	peripheralBurstSize16 = 3 << 21,

	/// memory burst size - single transfer
	memoryBurstSize1 = 0 << 23,
	/// memory burst size - incremental burst of 4 beats
	memoryBurstSize4 = 1 << 23,
	/// memory burst size - incremental burst of 8 beats
	memoryBurstSize8 = 2 << 23,
	/// memory burst size - incremental burst of 16 beats
	memoryBurstSize16 = 3 << 23,

	/// memory and peripheral data size - 1 byte
	dataSize1 = peripheralDataSize1 | memoryDataSize1,
	/// memory and peripheral data size - 2 bytes
	dataSize2 = peripheralDataSize2 | memoryDataSize2,
	/// memory and peripheral data size - 4 bytes
	dataSize4 = peripheralDataSize4 | memoryDataSize4,

	/// memory and peripheral burst size - single transfer
	burstSize1 = peripheralBurstSize1 | memoryBurstSize1,
	/// memory and peripheral burst size - incremental burst of 4 beats
	burstSize4 = peripheralBurstSize4 | memoryBurstSize4,
	/// memory and peripheral burst size - incremental burst of 8 beats
	burstSize8 = peripheralBurstSize8 | memoryBurstSize8,
	/// memory and peripheral burst size - incremental burst of 16 beats
	burstSize16 = peripheralBurstSize16 | memoryBurstSize16,
};

}	// namespace chip

}	// namespace distortos

namespace estd
{

/// \brief Enable bitwise operators for distortos::chip::DmaChannelFlags
template<>
struct isEnumClassFlags<distortos::chip::DmaChannelFlags> : std::true_type
{

};

}	// namespace estd

namespace distortos
{

namespace chip
{

class DmaChannelFunctor;
class DmaChannelPeripheral;
class DmaPeripheral;

/**
 * DmaChannel class is a low-level DMA channel driver for DMAv2 in STM32
 *
 * \ingroup devices
 */

class DmaChannel
{
public:

	/// import DmaChannelFlags
	using Flags = DmaChannelFlags;

	/// UniqueHandle class can be used to access DmaChannel's functionality
	class UniqueHandle
	{
	public:

		/**
		 * \brief UniqueHandle's constructor
		 */

		constexpr UniqueHandle() :
				channel_{}
		{

		}

		/**
		 * \brief UniqueHandle's destructor
		 */

		~UniqueHandle()
		{
			release();
		}

		/**
		 * \brief Configures parameters of transfer.
		 *
		 * \param [in] memoryAddress is the memory address, must be divisible by configured memory data size
		 * \param [in] peripheralAddress is the peripheral address, must be divisible by peripheral data size
		 * \param [in] transactions is the number of transactions
		 * \param [in] flags are configuration flags
		 *
		 * \return 0 on success, error code otherwise:
		 * - EBADF - no low-level DMA channel driver is associated with this handle;
		 * - error codes returned by DmaChannel::configureTransfer();
		 */

		int configureTransfer(const uintptr_t memoryAddress, const uintptr_t peripheralAddress,
				const size_t transactions, const Flags flags) const
		{
			if (channel_ == nullptr)
				return EBADF;

			return channel_->configureTransfer(memoryAddress, peripheralAddress, transactions, flags);
		}

		/**
		 * \return pair with return code (0 on success, error code otherwise) and number of transactions left; error
		 * codes:
		 * - EBADF - no low-level DMA channel driver is associated with this handle;
		 */

		std::pair<int, size_t> getTransactionsLeft() const
		{
			if (channel_ == nullptr)
				return {EBADF, {}};

			return {{}, channel_->getTransactionsLeft()};
		}

		/**
		 * \brief Releases any associated low-level DMA channel driver.
		 */

		void release()
		{
			if (channel_ == nullptr)
				return;

			channel_->release();
			channel_ = {};
		}

		/**
		 * \brief Reserves low-level DMA channel driver for exclusive use via this handle.
		 *
		 * \param [in] channel is a reference to low-level DMA channel driver which will be associated with this handle
		 * \param [in] request is the request identifier with which low-level DMA channel driver will be associated
		 * \param [in] functor is a reference to DmaChannelFunctor object that will be notified about transfer-related
		 * events
		 *
		 * \return 0 on success, error code otherwise:
		 * - error codes returned by DmaChannel::reserve();
		 */

		int reserve(DmaChannel& channel, const uint8_t request, DmaChannelFunctor& functor)
		{
			release();

			const auto ret = channel.reserve(request, functor);
			if (ret != 0)
				return ret;

			channel_ = &channel;
			return {};
		}

		/**
		 * \brief Starts asynchronous transfer.
		 *
		 * This function returns immediately. When the transfer is physically finished (either expected number of
		 * transactions were executed or an error was detected), one of DmaChannelFunctor functions will be executed.
		 *
		 * \return 0 on success, error code otherwise:
		 * - EBADF - no low-level DMA channel driver is associated with this handle;
		 * - error codes returned by DmaChannel::startTransfer();
		 */

		int startTransfer() const
		{
			if (channel_ == nullptr)
				return EBADF;

			return channel_->startTransfer();
		}

		/**
		 * \brief Stops transfer.
		 *
		 * This function should be used after previous asynchronous transfer is finished to restore DMA channel to
		 * proper state. It may also be used to stop any ongoing asynchronous transfer.
		 *
		 * \return 0 on success, error code otherwise:
		 * - EBADF - no low-level DMA channel driver is associated with this handle;
		 */

		int stopTransfer() const
		{
			if (channel_ == nullptr)
				return EBADF;

			channel_->stopTransfer();
			return {};
		}

		UniqueHandle(const UniqueHandle&) = delete;
		UniqueHandle(UniqueHandle&&) = delete;
		const UniqueHandle& operator=(const UniqueHandle&) = delete;
		UniqueHandle& operator=(UniqueHandle&&) = delete;

	private:

		/// pointer to low-level DMA channel driver associated with this handle
		DmaChannel* channel_;
	};

	/**
	 * \brief DmaChannel's constructor
	 *
	 * \param [in] dmaPeripheral is a reference to raw DMA peripheral
	 * \param [in] dmaChannelPeripheral is a reference to raw DMA channel peripheral
	 */

	constexpr DmaChannel(const DmaPeripheral& dmaPeripheral, const DmaChannelPeripheral& dmaChannelPeripheral) :
			dmaPeripheral_{dmaPeripheral},
			dmaChannelPeripheral_{dmaChannelPeripheral},
			functor_{},
			request_{}
	{

	}

	/**
	 * \brief Interrupt handler
	 *
	 * \note this must not be called by user code
	 */

	void interruptHandler();

private:

	/**
	 * \brief Configures parameters of transfer.
	 *
	 * \param [in] memoryAddress is the memory address, must be divisible by configured memory data size multiplied by
	 * configured memory burst size (which must be less than or equal to 16)
	 * \param [in] peripheralAddress is the peripheral address, must be divisible by peripheral data size multiplied by
	 * configured peripheral burst size
	 * \param [in] transactions is the number of transactions
	 * \param [in] flags are configuration flags
	 *
	 * \return 0 on success, error code otherwise:
	 * - EBUSY - transfer is in progress;
	 * - EINVAL - \a memoryAddress and/or \a peripheralAddress and/or \a transactions and/or \a flags are invalid;
	 * - ENOTSUP - more than 65535 \a transactions are not supported;
	 */

	int configureTransfer(uintptr_t memoryAddress, uintptr_t peripheralAddress, size_t transactions, Flags flags) const;

	/**
	 * \return number of transactions left
	 */

	size_t getTransactionsLeft() const;

	/**
	 * \brief Releases low-level DMA channel driver.
	 */

	void release();

	/**
	 * \brief Reserves low-level DMA channel driver for exclusive use.
	 *
	 * \param [in] request is the request identifier with which this object will be associated
	 * \param [in] functor is a reference to DmaChannelFunctor object that will be notified about transfer-related
	 * events
	 *
	 * \return 0 on success, error code otherwise:
	 * - EBUSY - the driver is not released;
	 * - EINVAL - \a request is invalid;
	 */

	int reserve(uint8_t request, DmaChannelFunctor& functor);

	/**
	 * \brief Starts asynchronous transfer.
	 *
	 * This function returns immediately. When the transfer is physically finished (either expected number of
	 * transactions were executed or an error was detected), one of DmaChannelFunctor functions will be executed.
	 *
	 * \return 0 on success, error code otherwise:
	 * - EBUSY - transfer is in progress;
	 */

	int startTransfer() const;

	/**
	 * \brief Stops transfer.
	 *
	 * This function should be used after previous asynchronous transfer is finished to restore DMA channel to proper
	 * state. It may also be used to stop any ongoing asynchronous transfer.
	 */

	void stopTransfer() const;

	/// reference to raw DMA peripheral
	const DmaPeripheral& dmaPeripheral_;

	/// reference to raw DMA channel peripheral
	const DmaChannelPeripheral& dmaChannelPeripheral_;

	/// pointer to DmaChannelFunctor object associated with this one
	DmaChannelFunctor* functor_;

	/// request identifier with which this object is associated
	uint8_t request_;
};

}	// namespace chip

}	// namespace distortos

#endif	// SOURCE_CHIP_STM32_PERIPHERALS_DMAV2_INCLUDE_DISTORTOS_CHIP_DMACHANNEL_HPP_
