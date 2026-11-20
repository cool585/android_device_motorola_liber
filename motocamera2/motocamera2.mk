#
# SPDX-FileCopyrightText: The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

MOTOCAMERA2_PATH := device/motorola/liber/motocamera2

# SOONG NAMESPACE
PRODUCT_SOONG_NAMESPACES += \
    $(MOTOCAMERA2_PATH) \
    $(MOTOCAMERA2_PATH)/overlay/MotCamera2Overlay

# Packages
PRODUCT_PACKAGES += \
    MotCamera2-whitney \
    MotCamera2AI \
    MotoPhotoEditor \
    MotoSignatureApp \
    MotoSignature2App \
    MotorolaSettingsProvider \
    MotCamera2Overlay

# Framework and shared libraries
PRODUCT_PACKAGES += \
    com.motorola.frameworks.core.addon \
    moto-checkin \
    moto-core_services \
    moto-settings \
    com.motorola.motosignature \
    com.motorola.android.dropboxhelper \
    com.motorola.androidx.camera.extensions \
    com.motorola.camera.extensions \
    libmcf_native_window_helper.motocamera \
    libenginepostproc.moto \
    public.libraries-moto \
    public.libraries-motocamera

# Permissions, sysconfig, and inits
PRODUCT_PACKAGES += \
    com.motorola.camera2.whitney \
    com.motorola.camera2.content.ai \
    com.motorola.photoeditor \
    com.motorola.maya \
    privapp-permissions-com.motorola.camera2 \
    deviceowner-configuration-com.motorola.camera2 \
    hiddenapi-whitelist-com.motorola.camera2 \
    initial-package-stopped-states-com.motorola.camera2 \
    init.motcamera2.lens \
    init.moto_package_name.motcamera2
