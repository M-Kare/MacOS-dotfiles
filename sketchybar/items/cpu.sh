#!/bin/bash

sketchybar --add item cpu e \
  --set cpu update_freq=15 \
  icon=􀧓 \
  script="$PLUGIN_DIR/cpu.sh"
