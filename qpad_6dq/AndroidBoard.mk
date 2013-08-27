LOCAL_PATH := $(call my-dir)

ifeq ($(PREBUILT_FSL_IMX_CODEC),true)
include device/fsl-proprietary/codec/fsl-codec.mk
endif

ifeq ($(BOARD_HAS_SENSOR),true)
include device/fsl-proprietary/sensor/fsl-sensor.mk
endif
