#!/bin/sh
###################################################################################################
#
# vp9me.sh - Shell Script to Encode Videos with VP9 Codec
#
# This script creates VP9 videos (.webm) from original video files.
# Right now, MP4 and mkv are supported input file types.
# You can specify an video quality for the conversion.
#
# Author: Dennis Rohner (@midzer)
# URL: https://github.com/midzer/vp9me
#
# License: MIT
#
# Version 0.1
#
###################################################################################################

# Set quality [0-63]
quality=42

# Determine size of original file
origFile="$1"
origFileSize=$(stat -c %s "$origFile")

# Let's start!
echo "Processing $origFile ..."
ffmpeg -i $origFile -c:v libvpx-vp9 -crf $quality -b:v 0 ${origFile%.*}.webm

# How did we perform?
vp9edFileSize=$(stat -c %s "${origFile%.*}.webm")
percent=$((100 - vp9edFileSize * 100 / origFileSize))
percent=$( printf '%d' $percent )

result="File size reduced by "
result=$result$percent
result="$result percent"
echo $result
