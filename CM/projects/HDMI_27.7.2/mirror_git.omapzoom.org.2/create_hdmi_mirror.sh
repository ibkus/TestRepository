#!/bin/bash

CDIR=`pwd`

echo === repo init ===
repo init --mirror -u git://git.omapzoom.org/platform/omapmanifest.git

echo === syncing repo ===
repo sync

echo === mirroring kernel ===
git clone --mirror git://git.omapzoom.org/kernel/omap.git kernel/omap.git

echo === mirroring u-boot ===
git clone --mirror git://git.omapzoom.org/repo/u-boot.git repo/u-boot.git

echo === mirroring x-loader ===
git clone --mirror git://git.omapzoom.org/repo/x-loader.git repo/x-loader.git

echo === mirroring blaze.git ===
git clone --mirror git://git.omapzoom.org/device/ti/blaze.git device/ti/blaze.git

echo === mirroring hostapd.git ===
git clone --mirror git://git.omapzoom.org/platform/external/hostapd.git platform/external/hostapd.git

echo === mirroring IM.git ===
git clone --mirror git://git.omapzoom.org/platform/packages/apps/IM.git platform/packages/apps/IM.git

echo === mirroring OMAPCamera.git ===
git clone --mirror git://git.omapzoom.org/platform/packages/apps/OMAPCamera.git platform/packages/apps/OMAPCamera.git
