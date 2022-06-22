#!/bin/sh

#id=$(xinput list | grep "G102" | head -1 | cut -f 2 | cut -c 4,5)
#echo $VAR
#xinput --set-prop $id 'libinput Accel Profile Enabled' 0, 1
xinput --set-prop 'Logitech G102 Prodigy Gaming Mouse' 'libinput Accel Profile Enabled' 0, 1
