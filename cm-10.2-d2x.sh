#!/bin/bash


# libgralloc:  Change ionFlags for GRALLOC_USAGE_PRIVATE_MM_HEAP case
#   - fixes secure memory crash in OMX
CHANGES+=(46521)

# Camera: Bring Samsung camera fixes and features to 4.3
CHANGES+=(46287)

# audio-caf: Fix -Wreorder warnings
CHANGES+=(47233)

#d2-common:  Move Camera overlay settings to Gallery2
# -Adjust settings for 10.2 camera
CHANGES+=(46772)

# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}

