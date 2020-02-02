#!/bin/bash -u

###### Edit this! ######
reference="in_cut.mp4"        # Original video
compressed_dir="presets_out/" # Modified videos
########################

COLOR='\033[0;34m'
NC='\033[0m'
outputs=() # store vmafossexec outputs
ffmpeg -n -i $reference -pix_fmt yuv420p -vsync 0 reference.yuv
i=0

for f in $(ls $compressed_dir)
do
  ffmpeg -y -i $compressed_dir/$f -pix_fmt yuv420p -vsync 0 distorted.yuv
  outputs[$i]=$(vmafossexec yuv420p 1920 1080 reference.yuv distorted.yuv /usr/share/model/vmaf_v0.6.1.pkl)
  let i=i+1
done

echo
echo -n -e "${COLOR}"
echo 'SUMMARY:'
i=0

for f in $(ls $compressed_dir)
do
  p=${outputs[$i]}
  p=$(echo $p | cut -d'=' -f2)
  echo '* '$f':'$p
  let i=i+1
done
echo -n -e "${NC}"
