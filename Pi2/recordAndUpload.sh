#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H:%M:%S")
arecord -D plughw:0 -d 60 -c 2 -r 48000 -f S32_LE -t wav /home/pi/recordings/tempwav/$DATE.wav
ffmpeg -i /home/pi/recordings/tempwav/$DATE.wav -acodec flac -sample_fmt s16 /home/pi/recordings/flacs/pi2_$DATE.flac
rm /home/pi/recordings/tempwav/$DATE.wav
rclone move /home/pi/recordings/flacs/pi2_$DATE.flac remote:recordings/pi2
