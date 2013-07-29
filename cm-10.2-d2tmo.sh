#!/bin/bash

# use older ION
#CHANG#ES+=(46106)

# gralloc (display-caf)
CHANGES+=(46166)

# DashPlayer: make jb_mr2 compatible
CHANGES+=(46086)

#Use display-caf for QCOM_BSP
CHANGES+=(46183)

#hwc: Add support for smooth streaming feature.
CHANGES+=(46205)

# mm-video: revert usage of flag GRALLOC_USAGE_PRIVATE_CP_BUFFER
CHANGES+=(46276)

# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}

