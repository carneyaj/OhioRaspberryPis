#!/bin/bash

rclone delete /home/pi/recordings/tempwav --include *.wav --min-age 2h
