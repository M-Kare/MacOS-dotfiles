#!/bin/bash

USAGE="$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%.0f\n", 100-$5"%") }')%"

sketchybar --set $NAME label="$USAGE"
