# This is a FSL Android Reference Design platform based on i.MX6Q ARD board
# It will inherit from FSL core product which in turn inherit from Google generic

$(call inherit-product, device/fsl/imx6/imx6.mk)
$(call inherit-product-if-exists,vendor/google/products/gms.mk)

PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=zh_CN \
	ro.product.locale.region=zh_CN \
	persist.sys.language=zh \
	persist.sys.country=CN \
	persist.sys.timezone=Asia/Shanghai

# Overrides
PRODUCT_NAME := qpad_6dq
PRODUCT_DEVICE := qpad_6dq

PRODUCT_COPY_FILES += \
	device/fsl/qpad_6dq/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/qpad_6dq/init.rc:root/init.freescale.rc \
	device/fsl/qpad_6dq/vold.fstab:system/etc/vold.fstab \
	device/fsl/qpad_6dq/audio_policy.conf:system/etc/audio_policy.conf \
	device/fsl/qpad_6dq/audio_effects.conf:system/vendor/etc/audio_effects.conf


PRODUCT_COPY_FILES += \
	device/fsl/qpad_6dq/splash.img:splash.img

# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/qpad_6dq/overlay

PRODUCT_CHARACTERISTICS := phone

PRODUCT_AAPT_CONFIG := nodpi normal large xlarge ldpi mdpi hdpi xhdpi tvdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

#hardware permission
#	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml

#software permission
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml 

# for PDK build, include only when the dir exists
# too early to use $(TARGET_BUILD_PDK)
ifneq ($(wildcard packages/wallpapers/LivePicker),)
PRODUCT_PACKAGES += \
	android.software.live_wallpaper.xml
endif

#RIL library related
PRODUCT_COPY_FILES += \
	device/fsl/imx6/etc/ppp/options:system/etc/ppp/options \
	device/fsl/imx6/etc/ppp/ip-up-ppp0:system/etc/ppp/ip-up-ppp0 \
	device/fsl/imx6/etc/ppp/ip-down-ppp0:system/etc/ppp/ip-down-ppp0 \
	device/fsl/imx6/etc/ppp/init.modem-rt:system/etc/ppp/init.modem-rt \
	device/fsl/imx6/etc/ppp/init.pppd-daemon:system/etc/ppp/init.pppd-daemon
	
#WIFI 
PRODUCT_COPY_FILES += \
	device/fsl/qpad_6dq/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product-if-exists, device/fsl/qpad_6dq/vendor.mk)

