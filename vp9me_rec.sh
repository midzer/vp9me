#!/bin/sh
###################################################################################################
#
# vp9me_rec.sh - Shell Script to Recursively Encode Videos with VP9 Codec
#
# This script looks for encodable video files in a directory
# and uses the vp9me.sh script to create .webm VP9 videos.
#
# Author: Dennis Rohner (@midzer)
# URL: https://github.com/midzer/vp9me
#
# License: MIT
#
# Version 0.1
#
###################################################################################################

# Enter "/path/to/vp9me.sh" script
vp9me="./vp9me.sh"

# Define, which files are to be encoded
encodable="mp4|mkv"

# Enter directory to start (recursively) looking for encodable files
dir="/path/to/your/files"

find $dir -regextype posix-extended -regex ".*\.($encodable)" -exec sh -x $vp9me {} \;
