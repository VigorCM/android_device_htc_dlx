#
# Copyright (C) 2011 The CyanogenMod Project
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

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/htc/dlx/device-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/dlx/overlay

## common overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/msm8960-common/overlay

# Inherit from msm8960-common
$(call inherit-product, device/htc/msm8960-common/msm8960.mk)

# Boot ramdisk setup
PRODUCT_PACKAGES += \
    fstab.dlx \
    init.qcom.firmware_links.sh \
    init.target.rc

# recovery and custom charging
PRODUCT_COPY_FILES += \
    device/htc/dlx/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/dlx/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/dlx/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/dlx/recovery/sbin/detect_key:recovery/root/sbin/detect_key

# HTC BT audio config
PRODUCT_COPY_FILES += device/htc/dlx/configs/AudioBTID.csv:system/etc/AudioBTID.csv

# vold.fstab
PRODUCT_COPY_FILES += \
    device/htc/dlx/configs/vold.fstab:system/etc/vold.fstab

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/dlx/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/dlx/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg 

PRODUCT_COPY_FILES += \
    device/htc/dlx/dsp/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/htc/dlx/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/dlx/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/dlx/keylayout/dummy_keypad.kl:system/usr/keylayout/dummy_keypad.kl \
    device/htc/dlx/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/htc/dlx/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/htc/dlx/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    device/htc/dlx/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/dlx/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/dlx/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/dlx/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/dlx/idc/qwerty2.idc:system/usr/idc/qwerty2.idc

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/htc/dlx/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/htc/dlx/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Filesystem management tools
PRODUCT_PACKAGES += \
   make_ext4fs \
   e2fsck \
   setup_fs

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

## CDMA Sprint stuffs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.clientidbase.yt=android-verizon \
    ro.com.google.clientidbase.am=android-verizon \
    ro.com.google.clientidbase.gmm=android-htc \
    ro.com.google.clientidbase.ms=android-verizon \
    ro.com.google.locationfeatures=1 \
    ro.cdma.home.operator.numeric=310012 \
    ro.cdma.home.operator.alpha=Verizon \
    gsm.sim.operator.alpha = Verizon \
    gsm.sim.operator.numeric = 310012 \
    gsm.operator.alpha = Verizon \
    gsm.operator.numeric = 310012 \
    ro.carrier=Verizon

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_LOCALES += en_US

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
