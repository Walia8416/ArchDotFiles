
#!/bin/bash

# .-----.-----.--.--.--.-----.----.--------.-----.-----.--.--.
# |  _  |  _  |  |  |  |  -__|   _|        |  -__|     |  |  |
# |   __|_____|________|_____|__| |__|__|__|_____|__|__|_____|
# |__|

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC


option1="  Logout"
option2="  Restart"
option3="  Power off"
option4="  Sleep"

options="$option1\n"
options="$options$option2\n"
options="$options$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -i -lines 4 -width 30 -p " " -location 0 -yoffset 0 -fixed-num-lines true)

case $choice in
	$option1)
		bspc quit || i3-msg exit || herbstclient quit ;;
	$option2)
		systemctl reboot ;;
	$option3)
		systemctl poweroff ;;
	$option4)
		systemctl suspend ;;
esac

