#
# Properties for liber
#

# Audio
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.audio.calfile0=/vendor/etc/acdbdata/Bluetooth_cal.acdb \
    persist.vendor.audio.calfile1=/vendor/etc/acdbdata/General_cal.acdb \
    persist.vendor.audio.calfile2=/vendor/etc/acdbdata/Global_cal.acdb \
    persist.vendor.audio.calfile3=/vendor/etc/acdbdata/Handset_cal.acdb \
    persist.vendor.audio.calfile4=/vendor/etc/acdbdata/Hdmi_cal.acdb \
    persist.vendor.audio.calfile5=/vendor/etc/acdbdata/Headset_cal.acdb \
    persist.vendor.audio.calfile6=/vendor/etc/acdbdata/Speaker_cal.acdb \
    persist.vendor.audio.calfile7=/vendor/etc/acdbdata/Codec_cal.acdb

# Camera
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.physical.num=5 \
    persist.vendor.camera.expose.aux=1 \
    persist.vendor.camera.privapp.list=com.motorola.camera2,org.lineageos.aperture \
    vendor.camera.aux.packagelist=com.motorola.camera2,org.lineageos.aperture \
    vendor.camera.aux.packagelist2=com.motorola.ccc,com.android.settings,com.motorola.motocit

PRODUCT_SYSTEM_PROPERTIES += \
    ro.camera.cfa.packagelist=com.motorola.coresettingsext,com.motorola.camera2,com.motorola.actions

PRODUCT_PRODUCT_PROPERTIES += \
    ro.mot.build.customerid=global

# Chipset
PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.manufacturer=QTI \
    ro.soc.model=SM7150

# HDR
PRODUCT_PRODUCT_PROPERTIES += \
    ro.qcom.hdr.config=/vendor/etc/hdr_tm_config.xml

# Sensor
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.sensors.mot_ltv=true \
    persist.vendor.sensors.hal_trigger_ssr=true \
    persist.vendor.sensors.odl.adsp=true
