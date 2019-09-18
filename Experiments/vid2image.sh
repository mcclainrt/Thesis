#!/bin/bash
# If necessary, install avconv
#sudo apt-get install libav-tools

# Input video
VID="../RovVideo/2019-09-17_15.14.08.mp4"
# How often to extract images (Hz)
RATE=0.5

avconv -i ${VID} -r ${RATE} -f image2 ./images/%04d.png
