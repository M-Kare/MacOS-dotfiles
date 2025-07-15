#!/bin/bash

source "$CONFIG_DIR/colors.sh"

sketchybar --add slider volume_slider right 100                                   \
           --set volume_slider script="$PLUGIN_DIR/volume.sh"					  \
                        slider.highlight_color=$ITEM_COLOR                        \
						slider.knob=""											\
						slider.knob.color=$ITEM_COLOR							\
						slider.knob.drawing=off									\
                        slider.background.height=6                               \
                        slider.background.corner_radius=6                         \
                        slider.background.color=$BAR_COLOR                       \
						slider.width=0											  \
           --subscribe volume_slider volume_change mouse.entered mouse.clicked mouse.exited
