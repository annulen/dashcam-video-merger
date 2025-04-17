#!/bin/bash
ffmpeg -f concat -safe 0 -i <(for f in $@; do echo "file '$PWD/$f'"; done) -c copy output.mp4
