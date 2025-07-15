#!/bin/bash

CURRENT_WALLPAPER_DIR="$HOME/.config/sketchybar/current_wallpaper.sh"
WALLPAPER_DIR="$HOME/Pictures/wallpaper"
n=5
source "$CURRENT_WALLPAPER_DIR"

for file in "$WALLPAPER_DIR"/*
do
	wallpaper+=("$(basename "$file")")
done

for i in "${!wallpaper[@]}"; do
	if [[ "${wallpaper[$i]}" == "$CURRENT_WALLPAPER" ]]; then
		next_index=$((i+1))
		if (( next_index < ${#wallpaper[@]} )); then
			next_wallpaper="${wallpaper[$next_index]}"
		else
			next_wallpaper="${wallpaper[0]}"
		fi

		echo "export CURRENT_WALLPAPER=${next_wallpaper}" > "$CURRENT_WALLPAPER_DIR"
		osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER_DIR/$next_wallpaper\" as POSIX file"

		#wallpaper_name="${next_wallpaper%.*}"
		#[[ ${#wallpaper_name} -gt $n ]] && wallpaper_name="${wallpaper_name:0:n}..." || wallpaper_name="$wallpaper_name"
		#sketchybar --set wallpaper label="$wallpaper_name"
		exit 0
	fi
done

echo "export CURRENT_WALLPAPER=${wallpaper[0]}" > "$CURRENT_WALLPAPER_DIR"
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$WALLPAPER_DIR/${wallpaper[0]}\" as POSIX file"

#wallpaper_name="${next_wallpaper%.*}"
#[[ ${#wallpaper_name} -gt $n ]] && wallpaper_name="${wallpaper_name:0:n}..." || wallpaper_name="$wallpaper_name"
#sketchybar --set wallpaper label="$wallpaper_name"
