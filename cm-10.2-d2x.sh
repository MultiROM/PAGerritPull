#!/bin/bash


# gralloc (display-caf)
#CHANGES+=(46166)

# DashPlayer: make jb_mr2 compatible
CHANGES+=(46086)

#Use display-caf for QCOM_BSP
CHANGES+=(46183)

# mm-video: revert usage of flag GRALLOC_USAGE_PRIVATE_CP_BUFFER
CHANGES+=(46276)

# Camera: Bring Samsung camera fixes and features to 4.3
CHANGES+=(46287)

# libstagefright: Add legacy LPAPlayer
CHANGES+=(46451)

# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}

