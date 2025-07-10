#!/bin/bash

# A color config for hover and highlight effects
# Example
# export BAR_COLOR=0x40000000
# export ITEM_BG_COLOR=0xff353c3f
# export ACCENT_COLOR=0xffffffff
# export BACKGROUND=0xff101314
source "$CONFIG_DIR/colors.sh"

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused --format "%{workspace}")

if [ "$SENDER" == "mouse.entered" ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    exit 0
  fi
  sketchybar --set "$NAME" \
    background.drawing=on \
    label.color="$ITEM_COLOR" \
    icon.color="$ITEM_COLOR" \
    background.color="$ACCENT_COLOR"
  exit 0
fi

if [ "$SENDER" == "mouse.exited" ]; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    exit 0
  fi
  sketchybar --set "$NAME" \
    background.drawing=off \
    label.color="$SECONDARY_ITEM_COLOR" \
    icon.color="$SECONDARY_ITEM_COLOR" \
    background.color="$TRANSPARENT"
  exit 0
fi

icons=""
APPS_INFO=$(aerospace list-windows --workspace "$1" --json --format "%{monitor-appkit-nsscreen-screens-id}%{app-name}")
IFS=$'\n'
APPS=$(echo "$APPS_INFO" | jq -r "map ( .\"app-name\" ) | .[]")
if [ ! -z "$APPS" ]; then
  for sid in $APPS; do
    icons+=" $($CONFIG_DIR/plugins/icons.sh "$sid")"
  done
else
  icons=" —"
fi

monitor=$(aerospace list-workspaces --all --json --format "%{workspace}%{monitor-appkit-nsscreen-screens-id}" | jq -r --arg workspace "$1" '.[] | select(.workspace == $workspace) | .["monitor-appkit-nsscreen-screens-id"]')

# When icons is empty, set it to " " --> not needed because empty workspaces get " -"
#if [ -z "$icons" ]; then
#  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#    sketchybar --animate sin 10 \
#      --set "$NAME" \
#      y_offset=10 y_offset=0 \
#      background.drawing=on
#
#    sketchybar --set "$NAME" \
#      display="$monitor" \
#      drawing=on \
#      label="$icons" \
#      label.color="$ITEM_COLOR" \
#      icon.color="$ITEM_COLOR" \
#      background.color="$ACCENT_COLOR"
#  else
#  #  sketchybar --set "$NAME" drawing=off
#  sketchybar --set $NAME \
#      display="$monitor" \
#      background.drawing=on \
#	  label=$icons \
#      label.color="$ACCENT_COLOR" \
#      icon.color="$ACCENT_COLOR" \
#      background.color="$BAR_COLOR"
#
#  fi
#else
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --animate sin 10 \
      --set "$NAME" \
      y_offset=10 y_offset=0 \
      background.drawing=on

    sketchybar --set "$NAME" \
      display="$monitor" \
      drawing=on \
      label="$icons" \
      label.color="$ITEM_COLOR" \
      icon.color="$ITEM_COLOR" \
      background.color="$ACCENT_COLOR"
  else
    sketchybar --set $NAME \
      display="$monitor" \
      drawing=on \
      label="$icons" \
      background.drawing=on \
      label.color="$SECONDARY_ITEM_COLOR" \
      icon.color="$SECONDARY_ITEM_COLOR" \
      background.color="$TRANSPARENT"
  fi
#fi
