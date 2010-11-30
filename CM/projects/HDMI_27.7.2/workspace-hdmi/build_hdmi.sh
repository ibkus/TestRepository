#!/bin/bash

export YOUR_PATH=`pwd`
export MYDROID=$YOUR_PATH
mkdir $MYDROID/logs
# Java setting
export JAVA_HOME=/opt/jdk-1.5.0_19
# Toolchain setting
export PATH=$PATH:/net/grp_flextronics/001_PRJ_FW_EXT_PHONE_SVCS/50_Integration/tools/arm-2009q1/bin
export CROSS_COMPILE= /net/grp_flextronics/001_PRJ_FW_EXT_PHONE_SVCS/50_Integration/tools/arm-2009q1/bin/arm-none-linux-gnueabi-
# u-boot setting
export PATH=$YOUR_PATH/u-boot/tools:$PATH
echo  === FINISHED exporting of variables ===

# For OMAP 4430/Blaze

# ------------------------------------------------------------------------------
echo  === STARTED Building u-boot ===
cd $MYDROID/repo/u-boot
pwd
make distclean 
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- omap4430sdp_config
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- | tee 2>&1 $MYDROID/logs/u-boot_build_$(date +\%G-\%m-\%d_\%H-\%M).log
cp -Rfp ./tools/mkimage ~/bin
echo  === FINISHED Building u-boot ===

# ------------------------------------------------------------------------------
echo  === STARTED Building x-loader ===
cd $MYDROID/repo/x-loader
pwd
make distclean
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- omap4430sdp_config
make ift | tee 2>&1 $MYDROID/logs/xloader_build_$(date +\%G-\%m-\%d_\%H-\%M).log
echo  === FINISHED Building x-loader ===

# ------------------------------------------------------------------------------
echo  === STARTED Building OMAP-kernel ===
cd $MYDROID/kernel/android-2.6.35
pwd
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- distclean
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- android_4430_defconfig
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- uImage | tee 2>&1 $MYDROID/logs/omap_kernel_$(date +\%G-\%m-\%d_\%H-\%M).log
echo  === FINISHED Building OMAP-kernel ===

# ------------------------------------------------------------------------------
echo  === STARTED Building OMAP-kernel modules ===
cd $MYDROID/kernel/android-2.6.35
pwd
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- modules | tee 2>&1 $MYDROID/logs/omap_kernel_modules_$(date +\%G-\%m-\%d_\%H-\%M).log
echo  === FINISHED Building OMAP-kernel modules ===

# ------------------------------------------------------------------------------
echo  === STARTED Building WLAN driver ===
cd $MYDROID/hardware/ti/wlan/wl1283/platforms/os/linux
pwd
export HOST_PLATFORM=sdc4430
export KERNEL_DIR=$MYDROID/kernel/android-2.6.35
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- | tee 2>&1 $MYDROID/logs/wlan_build_$(date +\%G-\%m-\%d_\%H-\%M).log
cp tiwlan_drv.ko $MYDROID/out/target/product/blaze/system/etc/wifi
echo  === FINISHED Building WLAN driver ===

# ------------------------------------------------------------------------------
echo  === STARTED Building Android Filesystem - AFS - with TI Codecs enabled ===
cd $MYDROID
pwd
cp -Rfp device/ti/blaze/buildspec.mk.default buildspec.mk
# clean required for rebuild only
make clean
make -j4 2>&1 |tee $MYDROID/logs/Android_AFS_with_TI_codecs_$(date +\%G-\%m-\%d_\%H-\%M).log
echo  === FINISHED Building Android Filesystem - AFS - with TI Codecs enabled ===
# ------------------------------------------------------------------------------

