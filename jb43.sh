#!/bin/bash



# Do the cherry-picking
./build/tools/repopick.py -b ${CHANGES[@]}


# Below is an example on how to implent the gerrit changes
# CHANGES+=()  inside the "()" is the ID number of the gerrit commit
# i.e https://gerrit.paranoidandroid.co/#/c/1/ would be "CHANGES+=(1)"

# fw/base: Add option to turn off CRT Effect [1/2]
CHANGES+=(14)

# Settings: Add option to turn off CRT Effect [2/2]
CHANGES+=(15)

