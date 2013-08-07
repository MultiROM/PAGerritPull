#!/bin/bash


# libgralloc:  Change ionFlags for GRALLOC_USAGE_PRIVATE_MM_HEAP case
#   - fixes secure memory crash in OMX
CHANGES+=(46521)

# qcom-common: enable hardware aac encoder
CHANGES+=(47200)

# Camera: Bring Samsung camera fixes and features to 4.3
CHANGES+=(46287)

# libstagefright: Add legacy LPAPlayer
CHANGES+=(46451)

# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}
