#!/bin/bash
# TODO: add DropDown Menu for wallpaper selection
source "$CONFIG_DIR/current_wallpaper.sh"

wallpaper_name="${CURRENT_WALLPAPER%.*}"
n=5

[[ ${#wallpaper_name} -gt $n ]] && wallpaper_name="${wallpaper_name:0:n}..." || wallpaper_name="$wallpaper_name"

sketchybar --add item wallpaper q \
			--set wallpaper icon="󰟾" \
			label.padding_right=0 \
			label.padding_left=0 \
			click_script="$PLUGIN_DIR/wallpaper_click.sh"
