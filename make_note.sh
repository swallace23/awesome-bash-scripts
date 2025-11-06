#!/bin/bash
today="$(date -I)"
year="${today:0:4}"
month="${today:5:2}"
this_year="$(find ~/Documents/notes -maxdepth 1 -name "*${year}*")"
this_month="$(find ~/Documents/notes -maxdepth 1 -name "*${month}*")"
swp="$(find ~/Documents/notes -maxdepth 1 -name "*.swp")"
if [ "$swp" ]; then rm "$swp"; fi
if [[ ! $this_year ]] && [[ ! $this_month ]]; then
	read -p "Make new note for $month ? (y/n)" make_new
	if ["$make_new" = "y"]; then
       		touch ~/Documents/notes/${year}-${month}.txt
	else
		echo "Quitting script."
	fi
else
	vi ~/Documents/notes/${year}-${month}.txt
fi
