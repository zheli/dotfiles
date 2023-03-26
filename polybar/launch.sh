#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# polybar example &
# Launch Polybar, using default config location ~/.config/polybar/config
if type "xrandr"; then
    IFS=$'\n'  # must set internal field separator to avoid dumb
    for entry in $(xrandr --query | grep " connected"); do
        mon=$(cut -d" " -f1 <<< "$entry")
        status=$(cut -d" " -f3 <<< "$entry")

        tray_pos=""
        # For primary detection
        # if [[ "$status" == "primary" ]]; then
        if [[ "$mon" == "HDMI-1" ]]; then
            tray_pos="right"
        fi

        MONITOR=$mon TRAY_POS=$tray_pos polybar --reload topbar 2>&1 | tee -a /tmp/polybar-top-monitor-"$mon".log & disown
        MONITOR=$mon TRAY_POS=$tray_pos polybar --reload bottombar 2>&1 | tee -a /tmp/polybar-bottom-monitor-"$mon".log & disown
    done
    unset IFS
else
    pos polybar --reload topbar 2>&1 | tee -a /tmp/polybar-top-monitor-"$mon".log & disown
    pos polybar --reload bottombar 2>&1 | tee -a /tmp/polybar-bottom-monitor-"$mon".log & disown
fi

echo "Polybar launched..."
