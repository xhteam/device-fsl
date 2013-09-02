

#RIL library
PRODUCT_PACKAGES += \
	libqst_ril

#GPS
PRODUCT_PACKAGES += \
	gps.freescale

#pcscd ,libusb will install with LOCAL_REQUIRED_MODULES instruction
PRODUCT_PACKAGES += \
	libccidtwin \
	libccid \
	Info.plist \
	libpcsclite \
	pcscd \
	reader.conf

#Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images


