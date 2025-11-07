#!/bin/bash
con="$(xrandr | grep -w connected | grep -v '^e')"
if [ -z "${con}" ]; then
	xrandr --output DP-1 --off
	xrandr --output DP-2 --off
	xrandr --output DP-3 --off
	xrandr --output DP-4 --off
	exit 0
fi
id="${con:0:4}"
dir="right"
dir="${1:-$dir}"
if [ $dir == "left" ]; then
	xrandr --output ${id} --auto --left-of eDP-1
elif [ $dir == "right" ]; then
	xrandr --output ${id} --auto --right-of eDP-1
else
	echo "invalid monitor direction"
fi
