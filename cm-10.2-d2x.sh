#!/bin/bash


# Gallery2: Initial storage location configuration options
CHANGES+=(47623)

# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}

