#!/bin/bash

sketchybar --add item pdfRenamer q \
		--set pdfRenamer icon="*.pdf" \
		label="" \
		update_freq=30 \
		label.font="$NERD_FONT:12.0" \
		icon.font="$FONT:semibold:12.0" \
		script="$PLUGIN_DIR/pdfRenamer.sh" \
		click_script="$PLUGIN_DIR/pdfRenamer_click.sh"
