#
# file: cmake/80-STM32.cmake
#
# author: Copyright (C) 2018-2019 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Automatically generated file - do not edit!
#

distortosSetFixedConfiguration(BOOLEAN
		CONFIG_CHIP_STM32
		ON)

distortosSetFixedConfiguration(BOOLEAN
		CONFIG_CHIP_STM32F0
		ON)

distortosSetFixedConfiguration(BOOLEAN
		CONFIG_CHIP_STM32F09
		ON)

distortosSetFixedConfiguration(BOOLEAN
		CONFIG_CHIP_STM32F091
		ON)

distortosSetFixedConfiguration(BOOLEAN
		CONFIG_CHIP_STM32F091R
		ON)

distortosSetFixedConfiguration(BOOLEAN
		CONFIG_CHIP_STM32F091RC
		ON)

distortosSetFixedConfiguration(STRING
		CONFIG_CHIP
		"STM32F091RC")

include("${CMAKE_CURRENT_SOURCE_DIR}/source/chip/STM32/STM32F0/distortos-sources.cmake")
