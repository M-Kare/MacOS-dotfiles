#!/bin/bash

source "$CONFIG_DIR/plugins/pdfRenamer.sh"

if [[ "$BUTTON" == "left" ]];then
	sketchybar --set pdfRenamer label=""
	if [ -z $RUNNING ];then
		source $HOME/Python/venv/bin/activate
		python3 $HOME/Python/pdfRenamer.py
	fi
else
	pkill -f pdfRenamer.py
	sketchybar --set pdfRenamer label=""
fi
