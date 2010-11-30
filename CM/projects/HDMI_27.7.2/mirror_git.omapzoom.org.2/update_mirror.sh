#!/bin/bash

CDIR=`pwd`

# repo init --mirror -u git://git.omapzoom.org/platform/omapmanifest.git
# repo sync
cd $CDIR
echo === syncing repo ===
repo sync

# git clone --mirror git://git.omapzoom.org/kernel/omap.git kernel/omap.git
echo === updating kernel ===
cd $CDIR
cd kernel/omap.git
git fetch git://git.omapzoom.org/kernel/omap.git

# git clone --mirror git://git.omapzoom.org/repo/u-boot.git repo/u-boot.git
echo === updating u-boot ===
cd $CDIR
cd repo/u-boot.git
git fetch git://git.omapzoom.org/repo/u-boot.git

# git clone --mirror git://git.omapzoom.org/repo/x-loader.git repo/x-loader.git
echo === updating x-loader ===
cd $CDIR
cd repo/x-loader.git
git fetch git://git.omapzoom.org/repo/x-loader.git

# git clone --mirror git://git.omapzoom.org/device/ti/blaze.git device/ti/blaze.git
echo === updating blaze.git ===
cd $CDIR
cd device/ti/blaze.git
git fetch git://git.omapzoom.org/device/ti/blaze.git

# git clone --mirror git://git.omapzoom.org/platform/external/hostapd.git platform/external/hostapd.git
echo === updating hostapd.git ===
cd $CDIR
cd platform/external/hostapd.git
git fetch git://git.omapzoom.org/platform/external/hostapd.git

# git clone --mirror git://git.omapzoom.org/platform/packages/apps/IM.git platform/packages/apps/IM.git
echo === updating IM.git ===
cd $CDIR
cd platform/packages/apps/IM.git
git fetch git://git.omapzoom.org/platform/packages/apps/IM.git

# git clone --mirror git://git.omapzoom.org/platform/packages/apps/OMAPCamera.git platform/packages/apps/OMAPCamera.git
echo === updating OMAPCamera.git ===
cd $CDIR
cd platform/packages/apps/OMAPCamera.git
git fetch git://git.omapzoom.org/platform/packages/apps/OMAPCamera.git

cd $CDIR


CDIR=`pwd`
