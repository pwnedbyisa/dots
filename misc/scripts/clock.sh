#!/bin/bash

# test array
ascii_digits=(
"
  _____
 /     |
 |  /  |
 |_____/
"
"
  _____
 |_    |
  |    |
  |____|
"
"
  ______
 |____  |
 |    --|
 |______|
"
"
  ______
 |___   |
 |___   |
 |______|
"
"
  __   _
 |  | | |
 |  |_| |
 '----__|
"
"
  ______
 |  ____|
 |___   \\
 |______/
"
"
   ____
  /   /_
 |   _  |
 |______|
"
"
  ______
 |___   |
   /   /
  |___|
"
"
  _____
 <  -  >
 /  _  \\
 \_____/
"
"
  ______
 |   _  |
 |____  |
     |__|
"
)

end_screen() {
    tput cnorm
    stty echo
    exit 0
}

trap end_screen EXIT

get_time() {
    current_time=$(date +"%T")
    hour=$(printf "%02.f" "${current_time:0:2}")  # %02d threw octal errors for 08 and 09
    minute=$(printf "%02.f" "${current_time:3:2}")
    second=$(printf "%02.f" "${current_time:6:2}")
}

display() {
    echo "${ascii_digits[${hour:0:1}]}${ascii_digits[${hour:1:1}]}:
    ${ascii_digits[${minute:0:1}]}${ascii_digits[${minute:1:1}]}:
    ${ascii_digits[${second:0:1}]}${ascii_digits[${second:1:1}]}" | sed ':a;N;$!ba;s/\n:/:/g' # remove \n before :
}

while true; do
		tput civis
    stty -echo
    get_time
    display
		sleep 0.1
    printf "\033[H\033[2J"
    tput cup 0 0
done
