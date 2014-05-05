#RIL library
PRODUCT_PACKAGES += \
	libqst_ril

#GPS
PRODUCT_PACKAGES += \
	gps.freescale
	
PRODUCT_COPY_FILES += \
	device/fsl/tdh/gps.conf:system/etc/gps.conf 



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

#environment tools
PRODUCT_PACKAGES += \
	envtool

