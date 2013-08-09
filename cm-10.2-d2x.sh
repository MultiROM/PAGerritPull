#!/bin/bash


# Camera: Bring Samsung camera fixes and features to 4.3
CHANGES+=(46287)

# audio-caf: Fix -Wreorder warnings
CHANGES+=(47233)

#d2-common:  Move Camera overlay settings to Gallery2
# -Adjust settings for 10.2 camera
CHANGES+=(46772)

# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}

