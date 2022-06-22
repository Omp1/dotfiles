#!/bin/sh

# Check if polybar is already running
SERVICE="polybar"

#if ps ax | grep -v grep | grep -v "spotify_status.py" | grep -v "polybar.sh" | grep $SERVICE > /dev/null
if ps ax | grep -vE "grep|spotify_status.py|polybar.sh|config" | grep $SERVICE > /dev/null
then
  echo "polybar already running! Please kill it first."
  exit 0;
fi


if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if ! [ $m == DP-1 ] ; then
    	MONITOR=$m polybar --reload main -c /home/v4ngbz/.config/polybar/blocks/config.ini &
    else
        MONITOR=$m polybar --reload main -c /home/v4ngbz/.config/polybar/blocks/config2.ini &
    fi
    echo $count
  done
else
  polybar --reload main -c /home/v4ngbz/.config/polybar/blocks/config.ini &
fi
