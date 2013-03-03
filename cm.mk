$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/cdma.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/dlx/dlx.mk)

# Device naming
PRODUCT_DEVICE := dlx
PRODUCT_NAME := cm_dlx
PRODUCT_BRAND := verizon_wwe
PRODUCT_MODEL := DLX
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_dlx BUILD_ID=JRO03C BUILD_FINGERPRINT="verizon_wwe/dlx/dlx:4.1.1/JRO03C/147796.2:user/release-keys" PRIVATE_BUILD_DESC="2.04.605.2 CL147796 release-keys"

# Release name
PRODUCT_RELEASE_NAME := dlx

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

-include vendor/cm/config/common_versions.mk
