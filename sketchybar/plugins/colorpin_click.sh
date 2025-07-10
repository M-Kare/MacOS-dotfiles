#!/bin/bash

source "$CONFIG_DIR/plugins/colorpin_color.sh"
source "$CONFIG_DIR/colorpin_current.sh"

if [ -z $COLORPIN_CURRENT ];then
		COLORPIN_CURRENT=$COLORPIN_COLORS[0]
fi

for i in ${!COLORPIN_COLORS[@]}; do
	if [ "${COLORPIN_COLORS[i]}" = "$COLORPIN_CURRENT" ]; then
			if [ $(($i+1)) -ge ${#COLORPIN_COLORS[@]} ]; then
			COLORPIN_CURRENT=${COLORPIN_COLORS[0]}
		else
			COLORPIN_CURRENT=${COLORPIN_COLORS[$i+1]}
		fi
		echo "export COLORPIN_CURRENT=$COLORPIN_CURRENT" > "$CONFIG_DIR/colorpin_current.sh"
		sketchybar --set $NAME background.color=$COLORPIN_CURRENT
		exit 0
	fi
done


echo "export COLORPIN_CURRENT=${COLORPIN_COLORS[0]}" > "$CONFIG_DIR/colorpin_current.sh"
sketchybar --set $NAME background.color=${COLORPIN_COLORS[0]}

