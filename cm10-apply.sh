#!/bin/bash

unset SUCCESS
on_exit() {
  if [ -z "$SUCCESS" ]; then
    echo "ERROR: $0 failed.  Please fix the above error."
    exit 1
  else
    echo "SUCCESS: $0 has completed."
    exit 0
  fi
}
trap on_exit EXIT

http_patch() {
  PATCHNAME=$(basename $1)
  curl -L -o $PATCHNAME -O -L $1
  cat $PATCHNAME |patch -p1
  rm $PATCHNAME
}

# Change directory verbose
cdv() {
  echo
  echo "*****************************"
  echo "Current Directory: $1"
  echo "*****************************"
  cd $BASEDIR/$1
}

# Change back to base directory
cdb() {
  cd $BASEDIR
}

# Sanity check
if [ -d ../.repo ]; then
  cd ..
fi
if [ ! -d .repo ]; then
  echo "ERROR: Must run this script from the base of the repo."
  SUCCESS=true
  exit 255
fi

# Save Base Directory
BASEDIR=$(pwd)

# Abandon auto topic branch
repo abandon auto
set -e


################ Apply Common Patches Below ####################


repo start auto device/samsung/msm8660-common
cdv device/samsung/msm8660-common
echo "### msm8660: import latest power HAL from qcom-common tree"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_device_samsung_msm8660-common refs/changes/59/23959/1 && git cherry-pick FETCH_HEAD
cdb

repo start auto frameworks/base
cdv frameworks/base
echo "### power: Add CPU boosting interface"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_frameworks_base refs/changes/89/23789/4 && git cherry-pick FETCH_HEAD
echo "### Add CPU boosting hooks"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_frameworks_base refs/changes/90/23790/5 && git cherry-pick FETCH_HEAD
cdb

repo start auto kernel/samsung/msm8660-common
cdv kernel/samsung/msm8660-common
echo "### cypress: enable debugging (do not submit)"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_kernel_samsung_msm8660-common refs/changes/63/23963/1 && git cherry-pick FETCH_HEAD
echo "### skyrocket: enable additional kernel debugging"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_kernel_samsung_msm8660-common refs/changes/69/23269/2 && git cherry-pick FETCH_HEAD
echo "### defconfig: hercules: Enable more debugging options"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_kernel_samsung_msm8660-common refs/changes/77/23277/2 && git cherry-pick FETCH_HEAD
echo "### video: msm: Add support for VSYNC notify via sysfs"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_kernel_samsung_msm8660-common refs/changes/41/23941/1 && git cherry-pick FETCH_HEAD
echo "### msm8660: enable vsync sysfs on all supported devices"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_kernel_samsung_msm8660-common refs/changes/60/23960/1 && git cherry-pick FETCH_HEAD
cdb

repo start auto hardware/qcom/display
cdv hardware/qcom/display
echo "### hwc: Support VSYNC notification via sysfs"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_hardware_qcom_display refs/changes/23/23923/2 && git cherry-pick FETCH_HEAD
cdb

repo start auto system/core
cdv system/core
echo "### charger: make default to not suspend in charge mode"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_system_core refs/changes/46/23946/1 && git cherry-pick FETCH_HEAD
cdb


################ Apply Hercules-Specific Patches Below ####################

#if [ -e device/samsung/hercules ]; then
#repo start auto device/samsung/hercules
#cdv device/samsung/hercules
#cdb
#fi

################ Apply Skyrocket-Specific Patches Below ####################

#if [ -e device/samsung/skyrocket ]; then
#repo start auto device/samsung/skyrocket
#cdv device/samsung/skyrocket
#cdb
#fi


##### SUCCESS ####
SUCCESS=true
exit 0

