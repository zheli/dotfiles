#!/usr/bin/env bash

#
# User Configuration
#
show_controls=yes
only_show_control=yes
#icon_color=5bb1b4
icon_color=fff
play_icon=""
pause_icon=""
player_icon=" "

# Get song title
title=$(playerctl metadata 2>/dev/null| grep -Po '(?<=title               )([^\(]*)')

# Get song artist
artist=$(playerctl metadata 2>/dev/null| grep -Po '(?<=:artist              )[^,]*')

# Get play/paused status
status=$(playerctl status 2>/dev/null)

# Set play_pause_icon to $play_icon or $pause_icon depending on player status
if [ "$status" == "Paused" ]; then
    play_pause_icon=$play_icon
else
    play_pause_icon=$pause_icon
fi

# If title and artist are null, print an empty string so polybar hides the module
if [ -z "$title" ] && [ -z "$artist" ]; then
    echo ""
else
    # Print polybar widget string
    if [ $only_show_control == "yes" ]; then
        echo "%{F#$icon_color}%{A1:playerctl previous:}%{A} %{A1:playerctl play-pause -p spotify:}$play_pause_icon%{A} %{A1:playerctl next:} %{A}%{F-}"
    else
        if [ $show_controls == "yes" ]; then
            echo "%{F#$icon_color}$player_icon%{F-} $(head -c 30 <<< $title) - $(head -c 20 <<< $artist) %{F#$icon_color}%{A1:playerctl previous:}%{A} %{A1:playerctl play-pause:}$play_pause_icon%{A} %{A1:playerctl next:} %{A}%{F-}"
        else
            echo "%{F#$icon_color}$player_icon%{F-} $(head -c 30 <<< $title) - $(head -c 20 <<< $artist)%{F-}"
        fi
    fi
fi
