#!/bin/bash
source "$CONFIG_DIR/themes/current_theme.sh"
THEME_DIR="$CONFIG_DIR/themes"


for file in "$THEME_DIR"/*.th
do
	themes+=("$(basename "$file" .th)")
done

for i in "${!themes[@]}"; do
	if [[ "${themes[$i]}" == "$CURRENT_THEME" ]]; then
		if [[ "$BUTTON" == "right" ]];then
			next_index=$i
		else
			next_index=$((i+1))
		fi	

		if (( next_index < ${#themes[@]} )); then
			next_theme="${themes[$next_index]}"
		else
			next_theme="${themes[0]}"
		fi

		echo "export CURRENT_THEME=${next_theme}" > "$THEME_DIR/current_theme.sh"
		cp "$THEME_DIR/$next_theme.th" "$CONFIG_DIR/colors.sh"
		sketchybar --set $NAME label=$next_theme
		sketchybar --reload
		source "$CONFIG_DIR/colors.sh"
		#borders "active_color=$WINDOW_BORDER_COLOR"
		exit 0
	fi
done

echo "export CURRENT_THEME=${themes[0]}" > "$THEME_DIR/current_theme.sh"
cp "$THEME_DIR/${themes[0]}.th" "$CONFIG_DIR/colors.sh"
sketchybar --set $NAME label=${themes[0]}
sketchybar --reload
