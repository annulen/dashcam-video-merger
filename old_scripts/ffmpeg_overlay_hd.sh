#!/bin/sh
#ffmpeg -i Front/output.mp4 -i Back/output.mp4 -preset slow -sws_flags lanczos -filter_complex "[1:v]crop=x=566:y=472:w=1132:h=607[pip]; [pip]scale=w=iw/2:h=ih/2[pip]; [pip]eq=brightness=0.15[pip]; [0][pip]overlay=W-w:0" output-video-overlay.mp4
#ffmpeg -i Front/output.mp4 -i Back/output.mp4 -preset slow -sws_flags lanczos -filter_complex "[0:v]scale=1920:1080[main]; [1:v]crop=x=566:y=472:w=1132:h=607[pip]; [pip]scale=w=iw/2:h=ih/2[pip]; [pip]eq=brightness=0.15[pip]; [main][pip]overlay=W-w:0" output-video-overlay.mp4

#codec="-c:v libx265"
#codec="-threads 4"
codec=""
ffmpeg -i Front/output.mp4 -i Back/output.mp4 -preset slow -sws_flags lanczos $codec -filter_complex "[0:v]scale=1280:1024[main]; [1:v]crop=x=566:y=430:w=1132:h=650[pip]; [pip]scale=w=iw/2.1:h=ih/2.1[pip]; [pip]eq=brightness=0.15[pip]; [main][pip]overlay=W-w:0" output-video-overlay.mp4
