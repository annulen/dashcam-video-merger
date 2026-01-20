# This profile produces video HEVC (H.265) format, which significantly improves
# output file size while dramatically increasing processing cost.
# It's most helpful for high-resolution streams, but can work for low-resolution
# streams too.
[ffmpeg_args]
    # Same as in default.profile example
    -loglevel warning
    -preset slow
    -sws_flags lanczos

    # Encode video as H.265 using x265 codec
    -c:v libx265

    # Make x265 less chatty
    -x265-params log-level=warning

[filter_complex]
    [0:v] null [front];
    [1:v] null [back];

    # Unlike hd.profile here we don't rescale [front]

    [back] crop=x=566:y=430:w=1132:h=650 [back];
    [back] scale=w=iw/2.1:h=ih/2.1 [back];
    [back] eq=brightness=0.15 [back];

    [front][back] overlay=W-w:0;

