#
# Product-specific compile-time definitions.
#

include device/fsl/imx6/soc/imx6dq.mk
include device/fsl/sparkauto_6dq/build_id.mk
include device/fsl/imx6/BoardConfigCommon.mk
include device/fsl-proprietary/gpu-viv/fsl-gpu.mk
include device/fsl/sparkauto_6dq/vendor.mk
# sparkauto_6dq default target for EXT4
BUILD_TARGET_FS ?= ext4
include device/fsl/imx6/imx6_target_fs.mk

PREBUILT_3G_MODEM_RIL			:= true
TARGET_BOOTLOADER_BOARD_NAME := sparkauto
PRODUCT_MODEL := SPARKAUTO-MX6DQ

# Wifi FIXME
WPA_SUPPLICANT_VERSION				:= VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      	:= NL80211
BOARD_HOSTAPD_DRIVER             	 	:= NL80211
WIFI_TEST_INTERFACE			 		:= "sta"


#BT FIXME
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/fsl/sparkauto_6dq/bluetooth

BOARD_USES_ALSA_AUDIO := false

BOARD_MODEM_VENDOR := AMAZON

BOARD_HAVE_HARDWARE_GPS := true
USE_NMEA_GPS_HARDWARE := true

#for accelerator sensor, need to define sensor type here
BOARD_HAS_SENSOR := true
SENSOR_MMA8451 := true

# for recovery service
TARGET_SELECT_KEY := 28

# we don't support sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true


BOARD_KERNEL_CMDLINE := console=ttymxc0,115200 init=/init video=mxcfb0:dev=ldb,bpp=32 video=mxcfb1:off video=mxcfb2:off fbmem=10M fb0base=0x27b00000 vmalloc=400M androidboot.console=ttymxc0 androidboot.hardware=freescale enable_wait_mode=off


USE_ION_ALLOCATOR := false
USE_GPU_ALLOCATOR := true

# camera hal v2
IMX_CAMERA_HAL_V2 := true

# define frame buffer count
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

#
#BOOTLOADER and Linux Kernel configuration
#
TARGET_BOOTLOADER_CONFIG := 6q:mx6q_sparkauto_android_config 
TARGET_KERNEL_DEFCONF := imx6_sparkauto_android_defconfig


