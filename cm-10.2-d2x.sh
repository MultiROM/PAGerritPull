#!/bin/bash


# audio-caf: Fix -Wreorder warnings
CHANGES+=(47233)

# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}

