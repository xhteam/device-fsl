

#RIL library
PRODUCT_PACKAGES += \
	libqst_ril

#GPS
PRODUCT_PACKAGES += \
	gps.freescale
	
#NFC
PRODUCT_PACKAGES += \
	libnfc_ndef \
	libnfc \
	Nfc \
	libpn544_fw \
	nfc.freescale


PRODUCT_COPY_FILES += \
	device/fsl/qpad_6dq/gps.conf:system/etc/gps.conf