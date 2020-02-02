#!/bin/bash

###### Edit this! ######
reference="in.mp4"
compressed="slow_21.mp4"
########################

# 1. cut original videos
mkdir -p vmaf
ffmpeg -n -i $reference  -t 00:00:10 -c copy vmaf/ref.mp4
ffmpeg -y -i $compressed -t 00:00:10 -c copy vmaf/mod.mp4

cut_ref="vmaf/ref.mp4"
cut_mod="vmaf/mod.mp4"

# 2. convert to yuv
ffmpeg -n -i $cut_ref -pix_fmt yuv420p -vsync 0 reference.yuv
ffmpeg -y -i $cut_mod -pix_fmt yuv420p -vsync 0 distorted.yuv

# 3. run vmaf
vmafossexec yuv420p 1920 1080 reference.yuv distorted.yuv /usr/share/model/vmaf_v0.6.1.pkl
