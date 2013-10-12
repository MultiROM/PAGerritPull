#!/bin/bash

# Below is an example on how to implent the gerrit changes
# CHANGES+=()  inside the "()" is the ID number of the gerrit commit
# i.e https://gerrit.paranoidandroid.co/#/c/1/ would be "CHANGES+=(1)"


# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}




