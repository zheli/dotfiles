# Introduction
Instructions for setting up Manjaro system

## Use fastest pacman mirror
```
sudo pacman-mirrors --fasttrack && sudo pacman -Syyu
```
## Cannot connect to bluetooth headset
Install pulseaudio-alsa, pulseaudio-bluetooth and bluez-utils providing the
bluetoothctl utility first and then launch pulseaudio:
```
pulseaudio --start
```

## Switch audio output easier
`sudo pacman -Syu pavucontrol`

## Enable Emacs daemon
`systemctl --user enable --now emacs`
