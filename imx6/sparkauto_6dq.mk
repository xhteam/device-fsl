# This is a FSL Android Reference Design platform based on i.MX6Q ARD board
# It will inherit from FSL core product which in turn inherit from Google generic

$(call inherit-product, device/fsl/imx6/imx6.mk)
$(call inherit-product-if-exists,vendor/google/products/gms.mk)

# Overrides
PRODUCT_NAME := sparkauto_6dq
PRODUCT_DEVICE := sparkauto_6dq

PRODUCT_COPY_FILES += \
	device/fsl/sparkauto_6dq/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/fsl/sparkauto_6dq/init.rc:root/init.freescale.rc \
	device/fsl/sparkauto_6dq/vold.fstab:system/etc/vold.fstab \
	device/fsl/sparkauto_6dq/audio_policy.conf:system/etc/audio_policy.conf \
	device/fsl/sparkauto_6dq/audio_effects.conf:system/vendor/etc/audio_effects.conf

# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/sparkauto_6dq/overlay

PRODUCT_CHARACTERISTICS := tablet
#tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

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
	device/fsl/imx6/etc/init.modem.sh:system/etc/init.modem.sh \
	device/fsl/imx6/etc/init.pppd.sh:system/etc/init.pppd.sh
	

#WIFI nvram FIXME?????
PRODUCT_COPY_FILES += \
	device/fsl/sparkauto_6dq/bcmdhd.cal:system/vendor/firmware/bcmdhd.cal \
	device/fsl/sparkauto_6dq/bcm4330.hcd:system/vendor/firmware/bcm4330.hcd \
	device/fsl/sparkauto_6dq/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
	device/fsl/sparkauto_6dq/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

	


$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)


$(call inherit-product-if-exists, device/fsl/sparkauto_6dq/vendor.mk)
	


