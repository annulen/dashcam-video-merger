# This is a comment
    # Space symbols in the beginning of each line are ignored

# These are command line arguments passed directly to ffmpeg
# See `man ffmpeg` or https://ffmpeg.org/ffmpeg.html
[ffmpeg_args]
    -loglevel warning
    -preset slow        # You can place comments at the end of line
    -sws_flags lanczos  # This option slightly improves quality of rescaling

# See https://ffmpeg.org/ffmpeg-filters.html and https://trac.ffmpeg.org/wiki/FilteringGuide
# for details on filters and syntax.
# Crash course:
#   "[AAA] some_filter [BBB]" means some_filter reads from stream "AAA" and writes to "BBB"
#   ";" separators between instructions in the chain are mandatory!
[filter_complex]
    # 1. Assign symbolic name [front] to stream [0:v:1], and [back] to stream [1:v:1]
    # [0] and [1] correspond to the "front" and "back" files, respectively
    # [0:v:1] means second video stream (which has low resolution) in file [0]
    [0:v:1] null [front];
    [1:v:1] null [back];

    # 2. Process [back] stream
    [back] crop=x=250:y=150:w=500:h=330 [back];
    [back] scale=w=iw/2:h=ih/2 [back];
    [back] eq=brightness=0.15 [back];

    # 3. Overlay [back] on top of [front] in the top right corner
    [front][back] overlay=W-w:0;

