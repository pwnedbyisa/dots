#!/bin/bash

# directly plagarized from https://github.com/aroma1994/polybar-windows/blob/master/polybar-windows.sh 
# bc i want to make some changes
# but this is a private repo and i'm too lazy to fork so

active_window=$(xprop -root _NET_ACTIVE_WINDOW|cut -d ' ' -f 5|sed -e 's/../0&/2')
current_display=$(wmctrl -d|grep "*"|awk '{print $1}')

current_windows=$(wmctrl -lx|awk -v current_display="$current_display" -v active_window="$active_window" '

	{if ($2==current_display) {

		if ($1==active_window) {

			$3="#"$3;

			}

		split($3,window_title,".")

		print "%{A1: wmctrl -ia "$1" & disown:}"window_title[1]"%{A}"

		}

	}')

echo $current_windows
