#!/bin/bash

#  This script use to build boot.img or recovery.img.
#  Compare with 'make bootimage' or 'make recoveryimage'at android top directory , it will not check android makefile, save time to enter build process
#
#  Read me for copy it your project, Configuration between {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{ 
#  and }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} may need modify.
# 
#  This scipt is created by Frank.Chen, any problem with this, let me know

function usage () {
	echo "Usage:"
	echo "   Pelease run the script in android top directory"
	echo "   device/fsl/qpad_6dq/quick_build_kernel.sh bootimage [kernel config]     --> build boot.img"
	echo "   device/fsl/qpad_6dq/quick_build_kernel.sh recoveryimage [kernel config]  --> recovery.img"
	echo "   device/fsl/qpad_6dq/quick_build_kernel.sh menuconfig                    --> open kernel menuconfig"
#	echo "   device/fsl/qpad_6dq/quick_build_kernel.sh saveconfig                    --> make savedefconfig"
}

if [ $# -lt 1 ]; then
    echo "Error: wrong number of arguments in cmd: $0 $* "
    usage
    exit 1
fi



#{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
KERNEL_DEFCONFIG=imx6_qpad_android_defconfig
KERNET_ROOTDIR=kernel_imx
PROJECT_NAME=qpad_6dq
#}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

KERNEL_OUT=out/target/product/$PROJECT_NAME/
KERNEL_CONFIG=kernel_imx/.config
PRODUCT_OUT=out/target/product/$PROJECT_NAME
NEW_KERNEL_CONFIG=

MKBOOTFS=$ANDROID_BUILD_TOP/out/host/linux-x86/bin/mkbootfs
MINIGZIP=$ANDROID_BUILD_TOP/out/host/linux-x86/bin/minigzip
############################## bootimage ####################################
if [ $1 = bootimage ]; then

if [ $# -eq 2 ]; then
	if [ ! -f kernel_imx/arch/arm/configs/$2 ]; then
		if [ ! -f kernel_imx/arch/arm/configs/$2 ]; then
			echo "No $2 found!"
			exit 1
		fi
	fi
	NEW_KERNEL_CONFIG=$2
fi
	
if [ ! -f out/host/linux-x86/bin/mkbootimg ]; then
	echo "No out/host/linux-x86/bin/mkbootimg found! You need build it first"
	echo "make bootimage at android top dir"
	exit 1
fi

if [ ! -d $PRODUCT_OUT/root ]; then
	echo "No $PRODUCT_OUT/root found! You need build it first"
	echo "make bootimage at android top dir"
	exit 1
fi

if [ ! -f $PRODUCT_OUT/root/init ]; then
	echo "No $PRODUCT_OUT/root/init found! You need build it first"
	echo "make bootimage at android top dir"
	exit 1
fi

#if [ -n $NEW_KERNEL_CONFIG ]; then
if [ $# -eq 2 ]; then
	make -C $KERNET_ROOTDIR ARCH=arm CROSS_COMPILE=$ANDROID_BUILD_TOP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- $NEW_KERNEL_CONFIG
else
	if [ ! -f $KERNEL_CONFIG ]; then
		make -C $KERNET_ROOTDIR ARCH=arm CROSS_COMPILE=$ANDROID_BUILD_TOP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- $KERNEL_DEFCONFIG
	fi
fi


make -C $KERNET_ROOTDIR ARCH=arm CROSS_COMPILE=$ANDROID_BUILD_TOP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- uImage
cp $KERNET_ROOTDIR/arch/arm/boot/uImage $PRODUCT_OUT/uImage
cp $KERNET_ROOTDIR/arch/arm/boot/zImage $PRODUCT_OUT/kernel

$MKBOOTFS  $PRODUCT_OUT/root | $MINIGZIP > $PRODUCT_OUT/ramdisk.img
out/host/linux-x86/bin/mkbootimg --kernel $PRODUCT_OUT/kernel --ramdisk $PRODUCT_OUT/ramdisk.img --cmdline "console=ttymxc0,115200 init=/init video=mxcfb0:dev=mipi_dsi video=mxcfb1:off video=mxcfb2:off fbmem=10M fb0base=0x27b00000 vmalloc=400M androidboot.console=ttymxc0 androidboot.hardware=freescale enable_wait_mode=off" --output $PRODUCT_OUT/boot.img

echo "Build $PRODUCT_OUT/boot.img Done"
exit 0
fi

############################## recoveryimage ####################################
if [ $1 = recoveryimage ]; then

if [ $# -eq 2 ]; then
	if [ ! -f kernel_imx/arch/arm/configs/$2 ]; then
		if [ ! -f kernel_imx/arch/arm/configs/$2 ]; then
			echo "No $2 found!"
			exit 1
		fi
	fi
	NEW_KERNEL_CONFIG=$2
fi

if [ ! -f out/host/linux-x86/bin/mkbootimg ]; then
	echo "No out/host/linux-x86/bin/mkbootimg found! You need build it first"
	echo "make recoveryimage at android top dir"
exit 1
fi
 
if [ ! -d $PRODUCT_OUT/recovery/root ]; then
	echo "No $PRODUCT_OUT/recovery/root found! You need build it first"
	echo "make recoveryimage at android top dir"
exit 1
fi

#if [ -n $NEW_KERNEL_CONFIG ]; then
if [ $# -eq 2 ]; then
	make -C $KERNET_ROOTDIR ARCH=arm CROSS_COMPILE=$ANDROID_BUILD_TOP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- $NEW_KERNEL_CONFIG
else
	if [ ! -f $KERNEL_CONFIG ]; then
		make -C $KERNET_ROOTDIR ARCH=arm CROSS_COMPILE=$ANDROID_BUILD_TOP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- $KERNEL_DEFCONFIG
	fi		
fi

make -C $KERNET_ROOTDIR ARCH=arm CROSS_COMPILE=$ANDROID_BUILD_TOP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- uImage

cp $KERNET_ROOTDIR/arch/arm/boot/uImage $PRODUCT_OUT/uImage
cp $KERNET_ROOTDIR/arch/arm/boot/zImage $PRODUCT_OUT/kernel

$MKBOOTFS  $PRODUCT_OUT/recovery/root | $MINIGZIP > $PRODUCT_OUT/ramdisk-recovery.img

out/host/linux-x86/bin/mkbootimg --kernel $PRODUCT_OUT/kernel  --ramdisk $PRODUCT_OUT/ramdisk-recovery.img --cmdline "console=ttymxc0,115200 init=/init video=mxcfb0:dev=mipi_dsi video=mxcfb1:off video=mxcfb2:off fbmem=10M fb0base=0x27b00000 vmalloc=400M androidboot.console=ttymxc0 androidboot.hardware=freescale enable_wait_mode=off" --output $PRODUCT_OUT/recovery.img

echo "Build $PRODUCT_OUT/recovery.img Done"
exit 0
fi

############################## menuconfig ####################################
if [ $1 = menuconfig ]; then
	if [ ! -f $KERNEL_CONFIG ]; then
		make -C $KERNET_ROOTDIR ARCH=arm CROSS_COMPILE=$ANDROID_BUILD_TOP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- $KERNEL_DEFCONFIG
	fi
	make -C $KERNET_ROOTDIR $KERNEL_ENV menuconfig
	cp $KERNET_ROOTDIR/.config $KERNET_ROOTDIR/arch/arm/configs/$KERNEL_DEFCONFIG
	exit 0
fi

############################## saveconfig ####################################
if [ $1 = saveconfig -o $1 = savedefconfig ]; then
	if [ ! -f $KERNEL_CONFIG ]; then
		echo " $KERNEL_CONFIG is not found"
		make -C $KERNET_ROOTDIR O=../$KERNEL_OUT ARCH=arm CROSS_COMPILE=$ANDROID_BUILD_TOP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- $KERNEL_DEFCONFIG
	fi
	make -C $KERNET_ROOTDIR O=../$KERNEL_OUT ARCH=arm CROSS_COMPILE=$ANDROID_BUILD_TOP/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- savedefconfig

	echo "config saved to $KERNEL_OUT/defconfig"
	exit 0
fi

echo "Error: unrecognized  argument"
usage
