#!/bin/sh

if [ "$SENDER" == "mouse.entered" ]; then
  IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
  sketchybar --set $NAME label="$IP_ADDRESS"
  exit 0
fi

SSID=$(system_profiler SPAirPortDataType | awk '/Current Network Information:/ { getline; print substr($0, 13, (length($0) - 13)); exit }')

if [ "$SSID" = "" ]; then
  sketchybar --set $NAME icon="􀙈" label="Disconnected"
else
  sketchybar --set $NAME icon="􀙇" label="$SSID"
fi
