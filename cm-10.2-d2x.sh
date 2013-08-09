#!/bin/bash


# Camera: Bring Samsung camera fixes and features to 4.3
CHANGES+=(46287)

# audio-caf: Fix -Wreorder warnings
CHANGES+=(47233)

# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}

