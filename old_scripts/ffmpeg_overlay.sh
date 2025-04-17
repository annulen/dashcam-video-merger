#!/bin/sh
#ffmpeg -i Front/output.mp4 -i Back/output.mp4 -filter_complex [1:v]scale=w=iw/2:h=ih/2[a]; [0][a]overlay=W-w:10 output-video-overlay.mp4
#ffmpeg -i Front/output.mp4 -i Back/output.mp4 -filter_complex "[1:v]crop=x=265:y=210:w=485:h=270[pip]; [pip]scale=w=iw/2:h=ih/2[pip]; [pip]eq=brightness=0.1[pip]; [0][pip]overlay=W-w:0" output-video-overlay.mp4

# lossless: -crf 0 или -crf 18, -preset veryslow , -sws_flags lanczos
#ffmpeg -i Front/output.mp4 -i Back/output.mp4 -sws_flags bicubic -filter_complex "[1:v]crop=x=250:y=210:w=500:h=270[pip]; [pip]scale=w=iw/2:h=ih/2[pip]; [pip]eq=brightness=0.15[pip]; [0][pip]overlay=W-w:0" output-video-overlay.mp4
#ffmpeg -i Front/output.mp4 -i Back/output.mp4 -sws_flags lanczos -filter_complex "[1:v]crop=x=250:y=210:w=500:h=270[pip]; [pip]scale=w=iw/2:h=ih/2[pip]; [pip]eq=brightness=0.15[pip]; [0][pip]overlay=W-w:0" output-video-overlay.mp4
ffmpeg -i Front/output.mp4 -i Back/output.mp4 -preset slow -sws_flags lanczos -filter_complex "[1:v]crop=x=250:y=210:w=500:h=270[pip]; [pip]scale=w=iw/2:h=ih/2[pip]; [pip]eq=brightness=0.15[pip]; [0][pip]overlay=W-w:0" output-video-overlay.mp4
