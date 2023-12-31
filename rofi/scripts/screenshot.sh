
#!/bin/bash

#			 			  __
# .-----.----.----.-----.|  |_.--------.-----.-----.--.--.
# |__ --|  __|   _|  _  ||   _|        |  -__|     |  |  |
# |_____|____|__| |_____||____|__|__|__|_____|__|__|_____|

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

# This script requires scrot


option1="  Entire Screen"
option2="  Entire Screen with Delay"
option3="  Focused Window"
option4="  Select Area"

options="$option3\n$option4\n$option2\n$option1"

choice=$(echo -e "$options" | rofi -i -dmenu -no-sidebar-mode -lines 4 -width 30 -p " " -location 0 -yoffset 0 -fixed-num-lines true)

case $choice in
	$option1)
		scrot -e 'mv $f ~/Pictures/Scrot/' && notify-send -a 'Scrot' 'Screenshot saved.' -i 'dialog-information' -t 2000 ;;
	$option2)
		delayoption1=" Take screenshot with 3 sec delay"
		delayoption2=" Take screenshot with 5 sec delay"
		delayoption3=" Take screenshot with 10 sec delay"
		delayoptions="$delayoption1\n$delayoption2\n$delayoption3"
		delay=$(echo -e "$delayoptions" | rofi -i -dmenu -no-sidebar-mode -lines 3 -width 30 -p " " -location 0 -yoffset 0 -fixed-num-lines true)

		case $delay in

			$delayoption1)
				scrot -d 3 -e 'mv $f ~/Pictures/Scrot/' && notify-send -a 'Scrot' 'Screenshot saved.' -i 'dialog-information' -t 2000 ;;
			$delayoption2)
				scrot -d 5 -e 'mv $f ~/Pictures/Scrot/' && notify-send -a 'Scrot' 'Screenshot saved.' -i 'dialog-information' -t 2000 ;;
			$delayoption3)
				scrot -d 10 -e 'mv $f ~/Pictures/Scrot/' && notify-send -a 'Scrot' 'Screenshot saved.' -i 'dialog-information' -t 2000 ;;
		esac ;;

	$option3)
		scrot -u -b -e 'mv $f ~/Pictures/Scrot/' && notify-send -a 'Scrot' 'Screenshot saved.' -i 'dialog-information' -t 2000 ;;
	$option4)
		scrot -s -e 'mv $f ~/Pictures/Scrot/' && notify-send -a 'Scrot' 'Screenshot saved.' -i 'dialog-information' -t 2000 ;;
esac
