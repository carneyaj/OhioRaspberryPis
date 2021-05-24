# OhioRaspberryPis

#### Pi 1
SoundBlaster usb audio card and Røde lav mic (mono).

#### Pi 2
Stereo mems mics connected via i2s

## Setup Instructions:

First, install git: `sudo apt install git`.

Next, clone this repository: `git clone https://github.com/carneyaj/OhioRaspberryPis`

In `/home/pi/OhioRaspberryPis/` get rid of git tracking of execute permissions: `git config --local core.fileMode false`

In `/home/pi/OhioRaspberryPis/Pi1/` make everything executable: `chmod +x *.sh`.

make a program called `update.sh` in `/home/pi/` with the following code:
```
#!/bin/bash
git -C /home/pi/OhioRaspberryPis/Pi1 pull -v
cp -r /home/pi/OhioRaspberryPis/Pi1/schedule /etc/cron.d
```
Make this file executable: `chmod +x update.sh`
Note: Change the directory to `/home/pi/Pi2` on Pi 2.

Finally, add a file called `update` to `/etc/cron.d/` consisting of the following:
```
0 2 * * * root /home/pi/update.sh > /home/pi/update.log 2>&1
```
This will run at 2am every morning to pull updates and install them.
