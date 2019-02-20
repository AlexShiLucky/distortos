#
# file: distortos-sources.cmake
#
# author: Copyright (C) 2018-2019 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

if(DEFINED DISTORTOS_SDMMCCARD_BUFFER_ALIGNMENTS)
	distortosMax(DISTORTOS_SDMMCCARD_BUFFER_ALIGNMENT ${DISTORTOS_SDMMCCARD_BUFFER_ALIGNMENTS})
	distortosSetFixedConfiguration(INTEGER
			CONFIG_SDMMCCARD_BUFFER_ALIGNMENT
			${DISTORTOS_SDMMCCARD_BUFFER_ALIGNMENT})
endif(DEFINED DISTORTOS_SDMMCCARD_BUFFER_ALIGNMENTS)

if(DEFINED DISTORTOS_SPIMASTER_BUFFER_ALIGNMENTS)
	distortosMax(DISTORTOS_SPIMASTER_BUFFER_ALIGNMENT ${DISTORTOS_SPIMASTER_BUFFER_ALIGNMENTS})
	distortosSetFixedConfiguration(INTEGER
			CONFIG_SPIMASTER_BUFFER_ALIGNMENT
			${DISTORTOS_SPIMASTER_BUFFER_ALIGNMENT})
endif(DEFINED DISTORTOS_SPIMASTER_BUFFER_ALIGNMENTS)

if(DEFINED DISTORTOS_UART_BUFFER_ALIGNMENTS)
	distortosMax(DISTORTOS_UART_BUFFER_ALIGNMENT ${DISTORTOS_UART_BUFFER_ALIGNMENTS})
	distortosSetFixedConfiguration(INTEGER
			CONFIG_UART_BUFFER_ALIGNMENT
			${DISTORTOS_UART_BUFFER_ALIGNMENT})
endif(DEFINED DISTORTOS_UART_BUFFER_ALIGNMENTS)

target_sources(distortos PRIVATE
		${CMAKE_CURRENT_LIST_DIR}/fatalErrorHandler.cpp)

doxygen(INPUT ${CMAKE_CURRENT_LIST_DIR}/fatalErrorHandler.cpp
		${CMAKE_CURRENT_LIST_DIR}/C-API
		${CMAKE_CURRENT_LIST_DIR}/clocks
		${CMAKE_CURRENT_LIST_DIR}/devices
		${CMAKE_CURRENT_LIST_DIR}/FileSystem
		${CMAKE_CURRENT_LIST_DIR}/gcc
		${CMAKE_CURRENT_LIST_DIR}/memory
		${CMAKE_CURRENT_LIST_DIR}/newlib
		${CMAKE_CURRENT_LIST_DIR}/scheduler
		${CMAKE_CURRENT_LIST_DIR}/synchronization
		${CMAKE_CURRENT_LIST_DIR}/threads)

include(${CMAKE_CURRENT_LIST_DIR}/C-API/distortos-sources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/clocks/distortos-sources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/devices/distortos-sources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/FileSystem/distortos-sources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/gcc/distortos-sources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/memory/distortos-sources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/newlib/distortos-sources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/scheduler/distortos-sources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/synchronization/distortos-sources.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/threads/distortos-sources.cmake)
