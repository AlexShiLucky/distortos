#
# file: cmake/70-STM32-SPIv1.cmake
#
# author: Copyright (C) 2018 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Automatically generated file - do not edit!
#

distortosSetConfiguration(BOOLEAN
		distortos_Peripherals_SPI1
		OFF
		HELP "Enable SPI1 low-level driver."
		OUTPUT_NAME CONFIG_CHIP_STM32_SPIV1_SPI1_ENABLE)

distortosSetConfiguration(BOOLEAN
		distortos_Peripherals_SPI2
		OFF
		HELP "Enable SPI2 low-level driver."
		OUTPUT_NAME CONFIG_CHIP_STM32_SPIV1_SPI2_ENABLE)

distortosSetConfiguration(BOOLEAN
		distortos_Peripherals_SPI3
		OFF
		HELP "Enable SPI3 low-level driver."
		OUTPUT_NAME CONFIG_CHIP_STM32_SPIV1_SPI3_ENABLE)

include("${CMAKE_CURRENT_SOURCE_DIR}/source/chip/STM32/peripherals/SPIv1/distortos-sources.cmake")
