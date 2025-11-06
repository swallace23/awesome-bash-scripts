#!/bin/bash
con="$(xrandr | grep -w connected | grep -v '^e')"
if [ -z "${con}" ]; then
	echo "no external monitor connected"
	exit 1
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
