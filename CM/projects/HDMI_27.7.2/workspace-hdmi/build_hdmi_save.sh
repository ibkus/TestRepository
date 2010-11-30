#!/bin/bash

export YOUR_PATH=`pwd`
export MYDROID=$YOUR_PATH

echo  === STARTED Preparing Android binaries ===
cd $YOUR_PATH
mkdir myfs
cd myfs
pwd
cp -Rfp $YOUR_PATH/kernel/android-2.6.35/drivers/staging/ti-st/*.ko $MYDROID/out/target/product/blaze/root
cp -Rfp $MYDROID/out/target/product/blaze/root/* .
cp -Rfp $MYDROID/out/target/product/blaze/system/ .
cp -Rfp $MYDROID/out/target/product/blaze/data/ .
cp -Rfp $MYDROID/device/ti/blaze/init.omap4sdp.rc init.rc

# if you are using EMU or HS device, plese copy signed MLO instead
cp $MYDROID/repo/x-loader/MLO .   
cp $MYDROID/repo/u-boot/u-boot.bin .
cp $MYDROID/kernel/android-2.6.35/arch/arm/boot/uImage .
echo  === FINISHED Preparing Android binaries ===
# ------------------------------------------------------------------------------
 
