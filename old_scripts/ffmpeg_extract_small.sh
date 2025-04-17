#!/bin/sh
date=20250130
target_dir=/home/ktokarev/Documents/Автошкола/$date/Back
mkdir -p $target_dir
#for f in `ls -l | awk '$6 == "дек" && $7 == 24 {print $9}'`; do echo $f; ffmpeg -i $f -map 0:2 -map 0:1 -c copy $target_dir/$f; done
for f in `ls -1t NO$date* | tail -n 7`; do echo $f; ffmpeg -i $f -map 0:2 -map 0:1 -c copy $target_dir/$f; done
