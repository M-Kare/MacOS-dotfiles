#!/bin/bash

source "$CONFIG_DIR/themes/current_theme.sh"

sketchybar --add item theme q \
			--set theme icon="" \
			label=$CURRENT_THEME \
			click_script="$PLUGIN_DIR/theme_click.sh"
