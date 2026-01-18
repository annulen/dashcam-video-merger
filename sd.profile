# This is a comment
    # Space symbols in the beginning of each line are ignored

# These are command line arguments passed directly to ffmpeg
# See `man ffmpeg` or https://ffmpeg.org/ffmpeg.html
[ffmpeg_args]
    -loglevel warning
    -preset slow        # You can place comments at the end of line
    -sws_flags lanczos  # This option slightly improves quality of rescaling

# See https://ffmpeg.org/ffmpeg-filters.html for details on filters and syntax
# Crash course:
#   [AAA]...[BBB] means filter reads from stream "AAA" and writes to "BBB"
#   [0] and [1] correspond to the "front" and "back" files, respectively
#   [0:v] means first video stream in [0], but you can use  [0:v:1] for second video stream, and so on
#   [front] and [back] are symbolic names for processed streams (you can use any names)
#   ';' separators between instructions in the chain are mandatory!
[filter_complex]
    [1:v:1]crop=x=250:y=150:w=500:h=330[back];
    [back]scale=w=iw/2:h=ih/2[back];
    [back]eq=brightness=0.15[back];
    [0:v:1][back]overlay=W-w:0;

