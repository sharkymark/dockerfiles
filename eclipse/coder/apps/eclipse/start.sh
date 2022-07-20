#!/bin/bash

# start Eclipse app on the VNC desktop
DISPLAY=:90 /opt/eclipse/eclipse -data /home/coder &
# make it fullscreen 
sleep 10
DISPLAY=:90 xdotool key alt+F11