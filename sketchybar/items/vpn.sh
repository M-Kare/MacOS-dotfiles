#!/bin/bash

sketchybar -m --add item vpn right \
			  --set vpn icon=󰯄 \
						label=" " \
						label.font="Hack Nerd Font:Regular:12.0" \
						label.padding_right=10 \
			  			update_freq=5 \
						script="$PLUGIN_DIR/vpn.sh" \
						click_script="/Applications/OpenVPN\ Connect/OpenVPN\ Connect.app/Contents/MacOS/OpenVPN\ Connect"

