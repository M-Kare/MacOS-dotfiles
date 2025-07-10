#!/bin/bash
sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
  monitor=$(aerospace list-workspaces --all --json --format "%{workspace}%{monitor-appkit-nsscreen-screens-id}" | jq -r --arg workspace "$sid" '.[] | select(.workspace == $workspace) | .["monitor-appkit-nsscreen-screens-id"]')

  sketchybar --add item space."$sid" left \
    --subscribe space."$sid" aerospace_workspace_change system_woke mouse.entered mouse.exited \
    --set space."$sid" \
    icon=$sid \
    background.color=$TRANSPARENT \
    label.color=$ACCENT_COLOR \
    icon.color=$ACCENT_COLOR \
    display=$monitor \
    label.font="sketchybar-app-font:Regular:12.0" \
    icon.font="SF Pro:Semibold:12.0" \
    label.padding_right=10 \
    label.y_offset=-1 \
    click_script="aerospace workspace $sid" \
    script="$PLUGIN_DIR/aerospace.sh $sid"
done

