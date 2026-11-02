#!/bin/sh

# Kill already running duplicate process
_ps="swaybg somebar"
for _prs in $_ps; do
    if [ "$(pidof "${_prs}")" ]; then
         killall -9 "${_prs}"
    fi
 done

# Start our applications
swaybg --image /home/alonso/wallpapers/lowell-fishing.webp &
#mako &
#waybar &
foot --server &
#somebar
#someblocks -p  | dwlb -status-stdin all &
/home/alonso/repos/scripts/statusbar/startup.sh &
/home/alonso/repos/scripts/statusbar/bar.sh &

exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots &

dwlb
