#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

case "$SENDER" in
  "volume_change")
			
    VOLUME=$INFO

    case $VOLUME in
    [6-9][0-9] | 100)
      ICON="􀊩"
      ;;
    [3-5][0-9])
      ICON="􀊥"
      ;;
    [1-9] | [1-2][0-9])
      ICON="􀊡"
      ;;
    *) ICON="􀊣" ;;
    esac

    sketchybar --set $NAME icon="$ICON" label="$VOLUME%" slider.percentage=$VOLUME
	;;
  "mouse.clicked")
	osascript -e "set volume output volume $PERCENTAGE"
    ;;
  "mouse.entered")
	sketchybar --set $NAME slider.knob.drawing=on \
				--animate tanh 30 --set $NAME slider.width=100
    ;;
  "mouse.exited")
	sketchybar --set $NAME slider.knob.drawing=off \
				--animate tanh 30 --set $NAME slider.width=0
    ;;
esac

