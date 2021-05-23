#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H:%M:%S")
arecord -d 60 -f dat -c 1 /home/pi/recordings/tempwav/$DATE.wav
ffmpeg -i /home/pi/recordings/tempwav/$DATE.wav -acodec flac /home/pi/recordings/flacs/pi1_$DATE.fl$
rm /home/pi/recordings/tempwav/$DATE.wav
rclone move /home/pi/recordings/flacs/pi1_$DATE.flac remote:recordings/pi1
