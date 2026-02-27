#!/bin/sh

# Kill already running duplicate process
_ps="swaybg"
for _prs in $_ps; do
    if [ "$(pidof "${_prs}")" ]; then
         killall -9 "${_prs}"
    fi
 done

# Start our applications
swaybg --image /home/alonso/wallpapers/firewatch1.png &
#mako &
#waybar &
foot --server &

exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
