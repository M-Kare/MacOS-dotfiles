#!/bin/bash

source "$CONFIG_DIR/colorpin_current.sh"
source "$CONFIG_DIR/plugins/colorpin_color.sh"

if [ -z $COLORPIN_CURRENT ]; then
		echo "export COLORPIN_CURRENT=${COLORPIN_COLORS[0]}"
		COLORPIN_CURRENT=${COLORPIN_COLORS[0]}
fi

sketchybar -m --add item colorpin q \
			  --set colorpin background.color=$COLORPIN_CURRENT \
			  background.corner_radius=50 \
			  click_script="$PLUGIN_DIR/colorpin_click.sh"
