

#RIL library
PRODUCT_PACKAGES += \
	libqst_ril

#GPS
PRODUCT_PACKAGES += \
	gps.freescale
	
PRODUCT_COPY_FILES += \
	device/fsl/tdh/gps.conf:system/etc/gps.conf 

#NFC
PRODUCT_PACKAGES += \
	libnfc_ndef \
	libnfc \
	libnfc_jni \
	Nfc \
	libpn544_fw \
	nfc.freescale



#pcscd ,libusb will install with LOCAL_REQUIRED_MODULES instruction
PRODUCT_PACKAGES += \
	libccidtwin \
	libccid \
	Info.plist \
	libpcsclite \
	pcscd \
	reader.conf \
	TFIDemo \
	libscard \
	com.quester.android.platform_library \
	libplatform_library_pcscd_jni

#Wireless
PRODUCT_PACKAGES += \
	mlan.ko \
	bt8xxx.ko \
	mbt8xxx.ko \
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

