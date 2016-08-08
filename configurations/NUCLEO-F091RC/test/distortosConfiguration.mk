#
# Automatically generated file; DO NOT EDIT.
# Configuration
#

#
# Board, chip & architecture configuration
#
CONFIG_CHIP_STM32=y
CONFIG_CHIP_STM32F0=y
# CONFIG_CHIP_STM32F1 is not set
# CONFIG_CHIP_STM32F4 is not set
# CONFIG_BOARD_CUSTOM is not set
CONFIG_BOARD_NUCLEO_F091RC=y
CONFIG_BOARD_TOTAL_BUTTONS=1
CONFIG_BOARD_TOTAL_LEDS=1
CONFIG_BOARD_INCLUDES="source/board/STM32/STM32F0/NUCLEO-F091RC/include"
CONFIG_BOARD="NUCLEO-F091RC"

#
# Generic board options
#
CONFIG_BOARD_BUTTONS_ENABLE=y
CONFIG_BOARD_LEDS_ENABLE=y

#
# STM32F0 chip options
#

#
# Clocks configuration
#
CONFIG_CHIP_STM32F0_STANDARD_CLOCK_CONFIGURATION_ENABLE=y
# CONFIG_CHIP_STM32F0_RCC_HSE_ENABLE is not set
CONFIG_CHIP_STM32F0_RCC_HSI48_ENABLE=y
# CONFIG_CHIP_STM32F0_RCC_PLL_ENABLE is not set
# CONFIG_CHIP_STM32F0_RCC_SYSCLK_HSI is not set
CONFIG_CHIP_STM32F0_RCC_SYSCLK_HSI48=y
CONFIG_CHIP_STM32F0_RCC_AHB_DIV1=y
# CONFIG_CHIP_STM32F0_RCC_AHB_DIV2 is not set
# CONFIG_CHIP_STM32F0_RCC_AHB_DIV4 is not set
# CONFIG_CHIP_STM32F0_RCC_AHB_DIV8 is not set
# CONFIG_CHIP_STM32F0_RCC_AHB_DIV16 is not set
# CONFIG_CHIP_STM32F0_RCC_AHB_DIV64 is not set
# CONFIG_CHIP_STM32F0_RCC_AHB_DIV128 is not set
# CONFIG_CHIP_STM32F0_RCC_AHB_DIV256 is not set
# CONFIG_CHIP_STM32F0_RCC_AHB_DIV512 is not set
CONFIG_CHIP_STM32F0_RCC_APB_DIV1=y
# CONFIG_CHIP_STM32F0_RCC_APB_DIV2 is not set
# CONFIG_CHIP_STM32F0_RCC_APB_DIV4 is not set
# CONFIG_CHIP_STM32F0_RCC_APB_DIV8 is not set
# CONFIG_CHIP_STM32F0_RCC_APB_DIV16 is not set

#
# Memory configuration
#
CONFIG_CHIP_STM32F0_FLASH_PREFETCH_ENABLE=y
# CONFIG_CHIP_STM32F03 is not set
# CONFIG_CHIP_STM32F030 is not set
# CONFIG_CHIP_STM32F030C is not set
# CONFIG_CHIP_STM32F030C6 is not set
# CONFIG_CHIP_STM32F030C8 is not set
# CONFIG_CHIP_STM32F030CC is not set
# CONFIG_CHIP_STM32F030F is not set
# CONFIG_CHIP_STM32F030F4 is not set
# CONFIG_CHIP_STM32F030K is not set
# CONFIG_CHIP_STM32F030K6 is not set
# CONFIG_CHIP_STM32F030R is not set
# CONFIG_CHIP_STM32F030R8 is not set
# CONFIG_CHIP_STM32F030RC is not set
# CONFIG_CHIP_STM32F031 is not set
# CONFIG_CHIP_STM32F031C is not set
# CONFIG_CHIP_STM32F031C4 is not set
# CONFIG_CHIP_STM32F031C6 is not set
# CONFIG_CHIP_STM32F031E is not set
# CONFIG_CHIP_STM32F031E6 is not set
# CONFIG_CHIP_STM32F031F is not set
# CONFIG_CHIP_STM32F031F4 is not set
# CONFIG_CHIP_STM32F031F6 is not set
# CONFIG_CHIP_STM32F031G is not set
# CONFIG_CHIP_STM32F031G4 is not set
# CONFIG_CHIP_STM32F031G6 is not set
# CONFIG_CHIP_STM32F031K is not set
# CONFIG_CHIP_STM32F031K4 is not set
# CONFIG_CHIP_STM32F031K6 is not set
# CONFIG_CHIP_STM32F038 is not set
# CONFIG_CHIP_STM32F038C is not set
# CONFIG_CHIP_STM32F038C6 is not set
# CONFIG_CHIP_STM32F038E is not set
# CONFIG_CHIP_STM32F038E6 is not set
# CONFIG_CHIP_STM32F038F is not set
# CONFIG_CHIP_STM32F038F6 is not set
# CONFIG_CHIP_STM32F038G is not set
# CONFIG_CHIP_STM32F038G6 is not set
# CONFIG_CHIP_STM32F038K is not set
# CONFIG_CHIP_STM32F038K6 is not set
# CONFIG_CHIP_STM32F04 is not set
# CONFIG_CHIP_STM32F042 is not set
# CONFIG_CHIP_STM32F042C is not set
# CONFIG_CHIP_STM32F042C4 is not set
# CONFIG_CHIP_STM32F042C6 is not set
# CONFIG_CHIP_STM32F042F is not set
# CONFIG_CHIP_STM32F042F4 is not set
# CONFIG_CHIP_STM32F042F6 is not set
# CONFIG_CHIP_STM32F042G is not set
# CONFIG_CHIP_STM32F042G4 is not set
# CONFIG_CHIP_STM32F042G6 is not set
# CONFIG_CHIP_STM32F042K is not set
# CONFIG_CHIP_STM32F042K4 is not set
# CONFIG_CHIP_STM32F042K6 is not set
# CONFIG_CHIP_STM32F042T is not set
# CONFIG_CHIP_STM32F042T6 is not set
# CONFIG_CHIP_STM32F048 is not set
# CONFIG_CHIP_STM32F048C is not set
# CONFIG_CHIP_STM32F048C6 is not set
# CONFIG_CHIP_STM32F048G is not set
# CONFIG_CHIP_STM32F048G6 is not set
# CONFIG_CHIP_STM32F048T is not set
# CONFIG_CHIP_STM32F048T6 is not set
# CONFIG_CHIP_STM32F05 is not set
# CONFIG_CHIP_STM32F051 is not set
# CONFIG_CHIP_STM32F051C is not set
# CONFIG_CHIP_STM32F051C4 is not set
# CONFIG_CHIP_STM32F051C6 is not set
# CONFIG_CHIP_STM32F051C8 is not set
# CONFIG_CHIP_STM32F051K is not set
# CONFIG_CHIP_STM32F051K4 is not set
# CONFIG_CHIP_STM32F051K6 is not set
# CONFIG_CHIP_STM32F051K8 is not set
# CONFIG_CHIP_STM32F051R is not set
# CONFIG_CHIP_STM32F051R4 is not set
# CONFIG_CHIP_STM32F051R6 is not set
# CONFIG_CHIP_STM32F051R8 is not set
# CONFIG_CHIP_STM32F051T is not set
# CONFIG_CHIP_STM32F051T8 is not set
# CONFIG_CHIP_STM32F058 is not set
# CONFIG_CHIP_STM32F058C is not set
# CONFIG_CHIP_STM32F058C8 is not set
# CONFIG_CHIP_STM32F058R is not set
# CONFIG_CHIP_STM32F058R8 is not set
# CONFIG_CHIP_STM32F058T is not set
# CONFIG_CHIP_STM32F058T8 is not set
# CONFIG_CHIP_STM32F07 is not set
# CONFIG_CHIP_STM32F070 is not set
# CONFIG_CHIP_STM32F070C is not set
# CONFIG_CHIP_STM32F070C6 is not set
# CONFIG_CHIP_STM32F070CB is not set
# CONFIG_CHIP_STM32F070F is not set
# CONFIG_CHIP_STM32F070F6 is not set
# CONFIG_CHIP_STM32F070R is not set
# CONFIG_CHIP_STM32F070RB is not set
# CONFIG_CHIP_STM32F071 is not set
# CONFIG_CHIP_STM32F071C is not set
# CONFIG_CHIP_STM32F071CB is not set
# CONFIG_CHIP_STM32F071R is not set
# CONFIG_CHIP_STM32F071RB is not set
# CONFIG_CHIP_STM32F071V is not set
# CONFIG_CHIP_STM32F071V8 is not set
# CONFIG_CHIP_STM32F071VB is not set
# CONFIG_CHIP_STM32F072 is not set
# CONFIG_CHIP_STM32F072C is not set
# CONFIG_CHIP_STM32F072C8 is not set
# CONFIG_CHIP_STM32F072CB is not set
# CONFIG_CHIP_STM32F072R is not set
# CONFIG_CHIP_STM32F072R8 is not set
# CONFIG_CHIP_STM32F072RB is not set
# CONFIG_CHIP_STM32F072V is not set
# CONFIG_CHIP_STM32F072V8 is not set
# CONFIG_CHIP_STM32F072VB is not set
# CONFIG_CHIP_STM32F078 is not set
# CONFIG_CHIP_STM32F078C is not set
# CONFIG_CHIP_STM32F078CB is not set
# CONFIG_CHIP_STM32F078R is not set
# CONFIG_CHIP_STM32F078RB is not set
# CONFIG_CHIP_STM32F078V is not set
# CONFIG_CHIP_STM32F078VB is not set
CONFIG_CHIP_STM32F09=y
CONFIG_CHIP_STM32F091=y
# CONFIG_CHIP_STM32F091C is not set
# CONFIG_CHIP_STM32F091CB is not set
# CONFIG_CHIP_STM32F091CC is not set
CONFIG_CHIP_STM32F091R=y
# CONFIG_CHIP_STM32F091RB is not set
CONFIG_CHIP_STM32F091RC=y
# CONFIG_CHIP_STM32F091V is not set
# CONFIG_CHIP_STM32F091VB is not set
# CONFIG_CHIP_STM32F091VC is not set
# CONFIG_CHIP_STM32F098 is not set
# CONFIG_CHIP_STM32F098C is not set
# CONFIG_CHIP_STM32F098CC is not set
# CONFIG_CHIP_STM32F098R is not set
# CONFIG_CHIP_STM32F098RC is not set
# CONFIG_CHIP_STM32F098V is not set
# CONFIG_CHIP_STM32F098VC is not set
CONFIG_CHIP_ROM_SIZE=262144
CONFIG_CHIP_ROM_ADDRESS=0x08000000
CONFIG_CHIP_STM32F0_SRAM_SIZE=32768
CONFIG_CHIP_STM32F0_SRAM_ADDRESS=0x20000000
CONFIG_CHIP_STM32F0_RCC_HSE_CLOCK_BYPASS_CONFIGURABLE=y
# CONFIG_CHIP_STM32F0_RCC_HSE_CLOCK_BYPASS_DEFAULT is not set
CONFIG_CHIP_STM32F0_RCC_HSE_FREQUENCY_CONFIGURABLE=y
CONFIG_CHIP_STM32F0_RCC_HSE_FREQUENCY_DEFAULT=8000000
CONFIG_CHIP_STM32F0_RCC_HPRE=1
CONFIG_CHIP_STM32F0_RCC_PPRE=1
CONFIG_CHIP="STM32F091RC"
CONFIG_CHIP_INCLUDES="source/chip/STM32/STM32F0/include external/CMSIS-STM32F0 external/CMSIS"

#
# Generic chip options
#
CONFIG_ARCHITECTURE_ARMV6_M=y
# CONFIG_ARCHITECTURE_ARMV7_M is not set
CONFIG_TOOLCHAIN_PREFIX="arm-none-eabi-"

#
# ARMv6-M architecture options
#
CONFIG_ARCHITECTURE_ARM_CORTEX_M0=y
# CONFIG_ARCHITECTURE_ARM_CORTEX_M0PLUS is not set
# CONFIG_ARCHITECTURE_ARM_CORTEX_M1 is not set
# CONFIG_ARCHITECTURE_HAS_ITERATIVE_MULTIPLIER is not set
CONFIG_ARCHITECTURE_FLAGS="-mcpu=cortex-m0 -mthumb"
CONFIG_ARCHITECTURE_ARMV6_M_ARMV7_M_MAIN_STACK_SIZE=2048
CONFIG_ARCHITECTURE_INCLUDES="source/architecture/ARM/ARMv6-M-ARMv7-M/include"

#
# Generic architecture options
#
# CONFIG_ARCHITECTURE_HAS_FPU is not set
CONFIG_ARCHITECTURE_ARM=y
# CONFIG_CHIP_HAS_LFBGA100 is not set
# CONFIG_CHIP_HAS_LFBGA144 is not set
# CONFIG_CHIP_HAS_LQFP32 is not set
# CONFIG_CHIP_HAS_LQFP48 is not set
CONFIG_CHIP_HAS_LQFP64=y
# CONFIG_CHIP_HAS_LQFP100 is not set
# CONFIG_CHIP_HAS_LQFP144 is not set
# CONFIG_CHIP_HAS_LQFP176 is not set
# CONFIG_CHIP_HAS_LQFP208 is not set
# CONFIG_CHIP_HAS_TFBGA64 is not set
# CONFIG_CHIP_HAS_TFBGA216 is not set
# CONFIG_CHIP_HAS_TSSOP20 is not set
CONFIG_CHIP_HAS_UFBGA64=y
# CONFIG_CHIP_HAS_UFBGA100 is not set
# CONFIG_CHIP_HAS_UFBGA144 is not set
# CONFIG_CHIP_HAS_UFBGA169 is not set
# CONFIG_CHIP_HAS_UFBGA176 is not set
# CONFIG_CHIP_HAS_UFQFPN28 is not set
# CONFIG_CHIP_HAS_UFQFPN32 is not set
# CONFIG_CHIP_HAS_UFQFPN48 is not set
# CONFIG_CHIP_HAS_VFQFPN36 is not set
# CONFIG_CHIP_HAS_WLCSP25 is not set
# CONFIG_CHIP_HAS_WLCSP36 is not set
# CONFIG_CHIP_HAS_WLCSP49 is not set
CONFIG_CHIP_HAS_WLCSP64=y
# CONFIG_CHIP_HAS_WLCSP81 is not set
# CONFIG_CHIP_HAS_WLCSP90 is not set
# CONFIG_CHIP_HAS_WLCSP143 is not set
# CONFIG_CHIP_HAS_WLCSP168 is not set
# CONFIG_CHIP_LFBGA100 is not set
# CONFIG_CHIP_LFBGA144 is not set
# CONFIG_CHIP_LQFP32 is not set
# CONFIG_CHIP_LQFP48 is not set
CONFIG_CHIP_LQFP64=y
# CONFIG_CHIP_LQFP100 is not set
# CONFIG_CHIP_LQFP144 is not set
# CONFIG_CHIP_LQFP176 is not set
# CONFIG_CHIP_LQFP208 is not set
# CONFIG_CHIP_TFBGA64 is not set
# CONFIG_CHIP_TFBGA216 is not set
# CONFIG_CHIP_TSSOP20 is not set
# CONFIG_CHIP_UFBGA64 is not set
# CONFIG_CHIP_UFBGA100 is not set
# CONFIG_CHIP_UFBGA144 is not set
# CONFIG_CHIP_UFBGA169 is not set
# CONFIG_CHIP_UFBGA176 is not set
# CONFIG_CHIP_UFQFPN28 is not set
# CONFIG_CHIP_UFQFPN32 is not set
# CONFIG_CHIP_UFQFPN48 is not set
# CONFIG_CHIP_VFQFPN36 is not set
# CONFIG_CHIP_WLCSP25 is not set
# CONFIG_CHIP_WLCSP36 is not set
# CONFIG_CHIP_WLCSP49 is not set
# CONFIG_CHIP_WLCSP64 is not set
# CONFIG_CHIP_WLCSP81 is not set
# CONFIG_CHIP_WLCSP90 is not set
# CONFIG_CHIP_WLCSP143 is not set
# CONFIG_CHIP_WLCSP168 is not set
CONFIG_CHIP_PACKAGE="LQFP64"

#
# Scheduler configuration
#
CONFIG_TICK_FREQUENCY=1000
CONFIG_ROUND_ROBIN_FREQUENCY=10
CONFIG_THREAD_DETACH_ENABLE=y

#
# main() thread options
#
CONFIG_MAIN_THREAD_STACK_SIZE=4096
CONFIG_MAIN_THREAD_PRIORITY=127
CONFIG_MAIN_THREAD_CAN_RECEIVE_SIGNALS=y
CONFIG_MAIN_THREAD_QUEUED_SIGNALS=10
CONFIG_MAIN_THREAD_SIGNAL_ACTIONS=10

#
# Applications configuration
#
CONFIG_TEST_APPLICATION_ENABLE=y

#
# Build configuration
#
# CONFIG_BUILD_OPTIMIZATION_O0 is not set
# CONFIG_BUILD_OPTIMIZATION_O1 is not set
CONFIG_BUILD_OPTIMIZATION_O2=y
# CONFIG_BUILD_OPTIMIZATION_O3 is not set
# CONFIG_BUILD_OPTIMIZATION_OS is not set
# CONFIG_BUILD_OPTIMIZATION_OG is not set
CONFIG_DEBUGGING_INFORMATION_ENABLE=y
CONFIG_ASSERT_ENABLE=y
CONFIG_BUILD_OPTIMIZATION="-O2"
CONFIG_DEBUGGING_INFORMATION_COMPILATION="-g -ggdb3"
CONFIG_DEBUGGING_INFORMATION_LINKING="-g"
CONFIG_ASSERT=""
