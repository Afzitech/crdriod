#! /bin/bash
 
rm -rf .repo/local_manifests; \
repo init -u https://github.com/crdroidandroid/android.git -b 16.0 --git-lfs --no-clone-bundle; \
rm -rf prebuilts/clang/host/linux-x86; \
/opt/crave/resync.sh; \
 
mf=(
device/realme/porsche
device/oneplus/sm8350-common
kernel/oneplus/sm8350
vendor/realme/porsche
vendor/oneplus/sm8350-common
hardware/oplus
)
 
rm -rf "${mf[@]}"
 
#Device tree
git clone https://github.com/pjgowtham/android_device_realme_porsche.git -b lineage-23.0 device/realme/porsche
 
#Common tree
git clone https://github.com/MISTERXZONE/device_oneplus_sm8350-common -b lineage-23.0_dolby device/oneplus/sm8350-common
 
#Vendor
git clone https://gitlab.com/pjgowtham/proprietary_vendor_realme_porsche -b lineage-23.0 vendor/realme/porsche
 
#Proprietary Vendor
git clone https://gitlab.com/pjgowtham/proprietary_vendor_oneplus_sm8350-common.git -b lineage-23.0 vendor/oneplus/sm8350-common
 
#Hardware
git clone https://github.com/MISTERXZONE/hardware_oplus -b lineage-23.0_dolby hardware/oplus
 
#Kernel
git clone https://github.com/MISTERXZONE/android_kernel_oneplus_sm8350 -b lineage-23.0 kernel/oneplus/sm8350
 
#Start Build
. build/envsetup.sh
breakfast porsche
mka bacon
