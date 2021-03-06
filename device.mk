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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/gps.conf

## recovery and custom charging
PRODUCT_COPY_FILES += \
    device/htc/ruby/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/ruby/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/ruby/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/ruby/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/ruby/recovery/sbin/htcbatt:recovery/root/sbin/htcbatt

## ramdisk stuffs
PRODUCT_COPY_FILES += \
    device/htc/ruby/root/init.ruby.rc:root/init.ruby.rc \
    device/htc/ruby/root/ueventd.ruby.rc:root/ueventd.ruby.rc

#      device/htc/ruby/prebuilt/init:root/init \
#  device/htc/ruby/init.ruby.usb.rc:root/init.ruby.usb.rc \

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/htc/ruby/ruby-vendor.mk)

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

## overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/ruby/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# GPS and Light
PRODUCT_PACKAGES += \
    gps.ruby \
    lights.ruby

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/ruby/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/ruby/dsp/AIC3254_REG_DualMic_XD.csv:system/etc/AIC3254_REG_DualMic_XD.csv \
    device/htc/ruby/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/ruby/dsp/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/ruby/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/ruby/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/ruby/dsp/TPA2051_CFG_XC.csv:system/etc/TPA2051_CFG_XC.csv \
    device/htc/ruby/dsp/TPA2051_CFG_XC.csv:system/etc/TPA2051_CFG_XB.csv \
    device/htc/ruby/dsp/soundimage/Sound_MFG.txt:system/etc/soundimage/Sound_MFG.txt \
    device/htc/ruby/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/ruby/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/ruby/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/ruby/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/ruby/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/ruby/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/ruby/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/ruby/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/ruby/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/ruby/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/ruby/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/ruby/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/ruby/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/ruby/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg

# keylayouts
PRODUCT_COPY_FILES += \
    device/htc/ruby/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl\
    device/htc/ruby/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/ruby/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl\
    device/htc/ruby/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/ruby/keylayout/ruby-keypad.kl:system/usr/keylayout/ruby-keypad.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/ruby/keychars/ruby-keypad.kcm:system/usr/keychars/ruby-keypad.kcm \
    device/htc/ruby/keychars/atmel-touchscreen.kcm:system/usr/keychars/atmel-touchscreen.kcm

# idc
PRODUCT_COPY_FILES += \
    device/htc/ruby/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/ruby/idc/ruby-keypad.idc:system/usr/idc/ruby-keypad.idc

# Device Specific Firmware
PRODUCT_COPY_FILES += \
    device/htc/ruby/firmware/default_bak.acdb:system/etc/firmware/default_bak.acdb \
    device/htc/ruby/firmware/default_rogers_bak.acdb:system/etc/firmware/default_rogers_bak.acdb

# HTC BT Audio tune
PRODUCT_COPY_FILES += device/htc/ruby/configs/AudioBTID.csv:system/etc/AudioBTID.csv

# QC thermald config
PRODUCT_COPY_FILES += device/htc/ruby/configs/thermald.conf:system/etc/thermald.conf

# misc
PRODUCT_COPY_FILES += \
    device/htc/ruby/prebuilt/vold.fstab:system/etc/vold.fstab

# wifi firmware
PRODUCT_COPY_FILES += \
    device/htc/ruby/wifi/firmware.bin:system/etc/wifi/firmware.bin \
    device/htc/ruby/wifi/firmware_ap.bin:system/etc/wifi/firmware_ap.bin \
    device/htc/ruby/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/htc/ruby/wifi/tiwlan.ini:system/etc/wifi/tiwlan.ini \
    device/htc/ruby/wifi/tiwlan_ap.ini:system/etc/wifi/tiwlan_ap.ini \
    device/htc/ruby/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/htc/ruby/firmware/fmc_init_1273.2.bts:system/etc/firmware/fmc_init_1273.2.bts \
    device/htc/ruby/firmware/fm_rx_init_1273.2.bts:system/etc/firmware/fm_rx_init_1273.2.bts \
    device/htc/ruby/firmware/htc_1271fw.bin:system/etc/firmware/htc_1271fw.bin \
    device/htc/ruby/firmware/htc_1271fw_196_header.bin:system/etc/firmware/htc_1271fw_196_header.bin \
    device/htc/ruby/firmware/TIInit_7.6.15.bts:system/etc/firmware/TIInit_7.6.15.bts \
    device/htc/ruby/firmware/WL127x_2.0_2.25.bts:system/etc/firmware/WL127x_2.0_2.25.bts \
    device/htc/ruby/firmware/vac_config.ini:system/etc/firmware/vac_config.ini \
    device/htc/ruby/firmware/version:system/etc/firmware/version


# Kernel and modules
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/htc/ruby/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif


# common msm8660 configs
$(call inherit-product, device/htc/msm8660-common/msm8660.mk)

## htc audio settings
$(call inherit-product, device/htc/ruby/media_htcaudio.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/htc/ruby/ruby-vendor.mk)
