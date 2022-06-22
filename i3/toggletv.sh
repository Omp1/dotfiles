#!/bin/sh
currentstate=$(xrandr | grep -wE "HDMI-1-1 connected")
#echo $currentstate
if [ -z "$currentstate" ]; then
  exit -1;
fi
if [ "${currentstate: 0: 26}" = 'HDMI-1-1 connected (normal' ]; then
	echo "Turning on TV"
	xrandr --dpi 60 --output DVI-D-0 --off --output HDMI-0 --primary --mode 2560x1080 --rate 75 --pos 1920x0 --rotate normal --output DP-0 --off --output DP-1 --mode 1920x1080 --rate 60 --pos 4480x0 --rotate normal --output HDMI-1-1 --mode 1920x1080 --rate 60 --pos 0x0 --rotate normal --output DVI-I-1-1 --off --output VGA-1-1 --off
	feh --bg-scale /home/shared/Pictures/wallpapers/sakura.png --bg-scale /home/shared/Pictures/wallpapers/medukagod.png --bg-scale /home/shared/Pictures/wallpapers/meguminexplosion.png
	/home/$USER/.config/i3/restartpolybar.sh
else
	echo "Turning off TV"
	xrandr --dpi 60 --output DVI-D-0 --off --output HDMI-0 --primary --mode 2560x1080 --rate 75 --pos 1920x0 --rotate normal --output DP-0 --off --output DP-1 --mode 1920x1080 --rate 60 --pos 4480x0 --rotate normal --output HDMI-1-1 --off --output DVI-I-1-1 --off --output VGA-1-1 --off
	feh --bg-scale /home/shared/Pictures/wallpapers/sakura.png --bg-scale /home/shared/Pictures/wallpapers/medukagod.png
	/home/$USER/.config/i3/restartpolybar.sh
fi
