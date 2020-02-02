#!/bin/bash

presets="ultrafast superfast veryfast faster fast medium slow slower veryslow"
crf_val="30"
times=()

i=0
for p in $presets
do
  exec 3>&1 4>&2
  times[$i]=$( { time ffmpeg -y -i in.mp4 -c:v libx264 -preset $p -crf $crf_val -c:a copy out_${p}.mp4 1>&3 2>&4; } 2>&1 )  
  exec 3>&- 4>&-
  let i=i+1
done

echo
i=0
for p in $presets
do
  t=${times[$i]}
  t=$(echo $t | cut -d' ' -f2)
  s=$(ls -lh out_${p}.mp4 | cut -d' ' -f5)
  echo '* '$p'  '$t'  '$s
  let i=i+1
done
