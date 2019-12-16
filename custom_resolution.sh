#!/bin/bash

CUSTOM_RESOLUTION="1368 768"
DISPLAY_PORT="$(xrandr | awk 'NR==2{print $1}')"
RESOLUTION_STRING="$(cvt $CUSTOM_RESOLUTION | awk 'NR==2')"
RESOLUTION_NAME="$(cvt $CUSTOM_RESOLUTION | awk 'NR==2{print $2}')"

xrandr --newmode ${RESOLUTION_STRING:9}
xrandr --addmode ${DISPLAY_PORT} ${RESOLUTION_NAME}
xrandr --output ${DISPLAY_PORT} --mode ${RESOLUTION_NAME}