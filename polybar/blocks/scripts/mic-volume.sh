#!/bin/bash

display_volume() {
	if [ -z "$volume" ]; then
	  echo "No Mic Found"
	else
	  volume="${volume//[[:blank:]]/}" 
	  if [[ "$mute" == *"yes"* ]]; then
	    echo "[$volume]"
	  elif [[ "$mute" == *"no"* ]]; then
	    echo "$volume"
	  else
	    echo "$volume !"
	  fi
	fi
}

case $1 in
	"show-vol")
		COUNTER=3
		while [ true ]
		do
			if [ -z "$2" ]; then
  				declare -i LEFT=$(amixer -D pulse sget Capture | grep "Front Left" | grep "\[on\]" | cut -c 30-31)
  				declare -i RIGHT=$(amixer -D pulse sget Capture | grep "Front Left" | grep "\[on\]" | cut -c 30-31)
  				((combined=($RIGHT+$LEFT)/2))
  				if [ $combined -eq 0 ]; then
  					echo "Muted"
  				else
  					echo $combined"%"
  				fi
			else
				echo 30
  				#volume=$(pacmd list-sources | grep "$2" -A 6 | grep "volume" | awk -F/ '{print $2}')
  				#mute=$(pacmd list-sources | grep "$2" -A 11 | grep "Muted" )
				#display_volume
			fi
			if [ $COUNTER -gt 0 ]; then
				sleep 3
				let "COUNTER--"
			else
				sleep 15
			fi

		done
		;;
	"inc-vol")
		if [ -z "$2" ]; then
			COUNTER=5
			#pactl set-source-volume $DEFAULT_SOURCE_INDEX +7%
			amixer -D pulse sset Capture 2%+
			pkill -f "bash /home/v4ngbz/.config/polybar/blocks/scripts/mic-volume.sh"
			#pkill -f "polybar --reload main -c /home/$USER/.config/polybar/blocks/config.ini"
		else
			#pactl set-source-volume $2 +7%
			echo 42
		fi
		;;
	"dec-vol")
		if [ -z "$2" ]; then
			COUNTER=5
			#pactl set-source-volume $DEFAULT_SOURCE_INDEX -7%
			amixer -D pulse sset Capture 2%-
			pkill -f "bash /home/v4ngbz/.config/polybar/blocks/scripts/mic-volume.sh"
		else
			echo 50
		fi
		;;
	"mute-vol")
		if [ -z "$2" ]; then
			COUNTER=5
			#pactl set-source-mute $DEFAULT_SOURCE_INDEX toggle
			amixer -D pulse sset Capture toggle
			pkill -f "bash /home/v4ngbz/.config/polybar/blocks/scripts/mic-volume.sh"
		else
			#pactl set-source-mute $2 toggle
			echo 59
		fi
		;;
	*)
		echo "Invalid script option"
		;;
esac
