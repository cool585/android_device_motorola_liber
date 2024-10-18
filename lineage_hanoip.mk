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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from hanoip device
$(call inherit-product, device/motorola/hanoip/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_hanoip
PRODUCT_DEVICE := hanoip
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(60)
PRODUCT_MANUFACTURER := motorola

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2460
TARGET_SCREEN_WIDTH := 1080

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Build info
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="hanoip_retail-user 11 S2RI32.32-20-9-9-2 1591b release-keys" \
    BuildFingerprint=motorola/hanoip_retail/hanoip:11/S2RI32.32-20-9-9-2/1591b:user/release-keys \
    DeviceProduct=hanoip_retail
