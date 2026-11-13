#
# Copyright (C) 2022-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Dolby runtime sourced from hardware/motorola/dolby (v17). This is the
# Motorola stack that matches this device: the effect libraries are 32-bit
# (the effects factory lives in the 32-bit audio/HAL side) and the DMS HAL,
# its impl and the service are 64-bit.
#
# The previous in-tree copy was the Xiaomi "spatial/atmos" variant: its
# libswdap needs vendor.dolby.hardware.dms@2.0-atmos.so.so, libdlbpreg,
# libspatializerparamstorage and libstagefright_foundation-atmos. Combined
# with this device's blobs the DAP effect failed to initialize (AudioFlinger
# status -19 / NO_INIT), which made LunarisDolby crash-loop.
DOLBY_PATH := device/motorola/liber/dolby

# Enable Dolby DAP support in the audio HAL
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true

# The Motorola Dolby stack ships its own AudioFX/effect configuration
TARGET_EXCLUDES_AUDIOFX := true

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(DOLBY_PATH)/sepolicy/vendor

# Dolby runtime
PRODUCT_PACKAGES += \
    libdapparamstorage \
    libdeccfg \
    libdlbdsservice \
    libqcbassboost \
    libqcreverb \
    libqcvirt \
    libstagefright_soft_ac4dec \
    libstagefright_soft_ddpdec \
    libstagefright_foundation-v33 \
    libswdap \
    libswgamedap \
    libswvqe \
    vendor.dolby.hardware.dms@2.0 \
    vendor.dolby.hardware.dms@2.0-impl \
    vendor.dolby.hardware.dms@2.0-service

# Dolby configs
PRODUCT_PACKAGES += \
    vendor.dolby.hardware.dms@2.0-service.xml

PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/vendor/etc/init/vendor.dolby.hardware.dms@2.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.hardware.dms@2.0-service.rc \
    $(DOLBY_PATH)/proprietary/vendor/etc/dolby/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    $(DOLBY_PATH)/proprietary/vendor/etc/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml

# Dolby props
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.dolby.dax.version=DAX3_3.7.0.8_r1 \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.dolby.ds2.enabled=false
