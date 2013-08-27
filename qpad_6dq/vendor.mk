

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

#pcscd ,libusb will install with LOCAL_REQUIRED_MODULES instruction
PRODUCT_PACKAGES += \
	libccidtwin \
	libccid \
	Info.plist \
	libpcsclite \
	pcscd \
	reader.conf

#Wireless
PRODUCT_PACKAGES += \
	mlan.ko \
	bt8xxx.ko \
	mlan2040coex \
	mlanconfig \
	mlanevent \
	mlanutl \
	uaputl \
	wifidirectutl \
	MarvellWirelessDaemon \
	libMarvellWireless \
	libbt-vendor
	
#sensors
PRODUCT_PACKAGES += \
	magd \
	sensors.imx6


