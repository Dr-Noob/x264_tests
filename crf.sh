#!/bin/bash

input_video="in_cut.mp4"
out_dir="crf_out"
preset_val="slow"
crfs="17 18 19 20 21 22 23 24 25 26 27 28"
times=()

mkdir -p $out_dir

i=0
for c in $crfs
do
  ffmpeg -y -i $input_video -c:v libx264 -preset $preset_val -crf $c -c:a copy $out_dir/out_crf${c}.mp4
done

echo
for c in $crfs
do
  s=$(ls -lh $out_dir/out_crf${c}.mp4 | cut -d' ' -f5)
  echo '* CRF '$c' '$s
done
