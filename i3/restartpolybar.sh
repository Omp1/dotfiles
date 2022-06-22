POLYNUM=0
MONITORS=$(xrandr --query | grep -w "connected" | wc -l)

while [ $POLYNUM -lt $MONITORS ]
do
	killall polybar
	sleep 1
	/home/v4ngbz/.config/i3/polybar.sh
	POLYNUM=$(ps ax | grep -vE "grep|spotify_status.py|polybar.sh" | grep "polybar --reload main -c" | wc -l)
done
