#
# Product-specific compile-time definitions.
#

TARGET_BOARD_INFO_FILE := device/fsl/qpad_6dq/board-info.txt

include device/fsl/imx6/soc/imx6dq.mk
include device/fsl/qpad_6dq/build_id.mk
include device/fsl/imx6/BoardConfigCommon.mk
include device/fsl-proprietary/gpu-viv/fsl-gpu.mk
# qpad_6dq default target for EXT4
BUILD_TARGET_FS ?= ext4
include device/fsl/imx6/imx6_target_fs.mk

PREBUILT_3G_MODEM_RIL			:= true

TARGET_BOOTLOADER_BOARD_NAME := qpad
PRODUCT_MODEL := QPAD-MX6DQ

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/fsl/qpad_6dq/bluetooth
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_MRVL := false
MRVL_WIRELESS_DAEMON_API := true


#WiFi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mrvl8787
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mrvl8787
BOARD_WLAN_DEVICE := mrvl8787
BOARD_WLAN_VENDOR := MRVL
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/sd8xxx.ko"
WIFI_DRIVER_MODULE_NAME	:= "sd8xxx"
#The bit settings of drv_mode are,default is 7
#			Bit 0 :  STA
#			Bit 1 :  uAP
#			Bit 2 :  WIFIDIRECT
WIFI_DRIVER_MODULE_ARG  := "drv_mode=5 cfg80211_wext=12 sta_name=wlan uap_name=wlan wfd_name=p2p max_uap_bss=1 fw_name=mrvl/sd8787_uapsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/proc/mwlan/config"
WIFI_DRIVER_FW_PATH_STA := "drv_mode=5"
WIFI_DRIVER_FW_PATH_AP :=  "drv_mode=6"
WIFI_DRIVER_FW_PATH_P2P := "drv_mode=5"


WIFI_SDIO_IF_DRIVER_MODULE_PATH  := "/system/lib/modules/mlan.ko"
WIFI_SDIO_IF_DRIVER_MODULE_NAME  := "mlan"
WIFI_SDIO_IF_DRIVER_MODULE_ARG   := ""


BOARD_HAVE_HARDWARE_GPS := true
USE_NMEA_GPS_HARDWARE := true

#for accelerator sensor, need to define sensor type here
BOARD_HAS_IMX_SENSOR := true

# for recovery service
TARGET_SELECT_KEY := 28

# we don't support sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true


BOARD_KERNEL_CMDLINE := console=ttymxc0,115200 init=/init video=mxcfb0:dev=mipi_dsi video=mxcfb1:off video=mxcfb2:off fbmem=10M fb0base=0x27b00000 vmalloc=400M androidboot.console=ttymxc0 androidboot.hardware=freescale enable_wait_mode=off maxcpus=2


USE_ION_ALLOCATOR := false
USE_GPU_ALLOCATOR := true

# camera hal v2
IMX_CAMERA_HAL_V2 := true

# define frame buffer count
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

#
#BOOTLOADER and Linux Kernel configuration
#
TARGET_BOOTLOADER_CONFIG := 6q:mx6q_qpad_android_config 
TARGET_KERNEL_DEFCONF := imx6_qpad_android_defconfig

#override device key with my own key
PRODUCT_DEFAULT_DEV_CERTIFICATE := device/fsl/qpad_6dq/security/releasekey

TARGET_FORCE_ADB_NONSECURE := 1

BOARD_CHARGER_ENABLE_SUSPEND := 1

#override fsl recovery_ui lib
TARGET_RECOVERY_UI_LIB := librecovery_ui_qpad

