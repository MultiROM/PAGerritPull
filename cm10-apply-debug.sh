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

set -e

################ Apply the Normal Patches Below ####################

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/cm10-apply.sh


################ Apply Common Patches Below ####################

repo start auto kernel/samsung/msm8660-common
cdv kernel/samsung/msm8660-common
echo "### skyrocket: enable additional kernel debugging"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_kernel_samsung_msm8660-common refs/changes/69/23269/1 && git cherry-pick FETCH_HEAD
echo "### defconfig: hercules: Enable more debugging options"
git fetch http://review.cyanogenmod.com/CyanogenMod/android_kernel_samsung_msm8660-common refs/changes/77/23277/1 && git cherry-pick FETCH_HEAD
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
