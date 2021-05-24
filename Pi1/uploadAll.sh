#!/bin/bash

rclone move /home/pi/recordings/flacs --min-age 2h remote:recordings/pi1
