#
# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true

$(call inherit-product, device/motorola/sm6150-common/common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/liber/liber-vendor.mk)

# Dolby
TARGET_INCLUDES_OEM_App := true
$(call inherit-product-if-exists, hardware/dolby/dolby.mk)

# Properties
-include $(LOCAL_PATH)/properties.mk

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    ApertureOverlayLiber \
    LineageSdkGoogleAssistantKey \
    FrameworksResLiber \
    SettingsResLiber \
    SystemUIResLiber

PRODUCT_PACKAGES += \
    Aperture

# Audio
PRODUCT_PACKAGES += \
    libgui_vendor

# audio.primary.sm6150 shim
PRODUCT_PACKAGES += \
    android.hardware.power-V1-ndk.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths_awinic_snd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_awinic_snd.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Init
PRODUCT_PACKAGES += \
    init.mmi.overlay.rc \
    init.oem.fingerprint.sh \
    init.oem.fingerprint2.sh

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.liber

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/gpio-keys.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/gpio-keys.idc \
    $(LOCAL_PATH)/idc/uinput_nav.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput_nav.idc \
    $(LOCAL_PATH)/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/uinput_nav.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput_nav.kl \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal

# libbase shim for sensors.moto
PRODUCT_PACKAGES += \
    libbase_shim

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
