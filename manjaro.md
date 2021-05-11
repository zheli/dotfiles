# Introduction
Instructions for setting up Manjaro system

## Setup i3
```
ln -s $(pwd)/polybar ~/.config/
ln -s $(pwd)/rofi ~/.config/
sudo pacman -Syu polybar rofi
```

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

## Enable emoji
https://forum.manjaro.org/t/howto-enable-emoji-fonts/36695

## Fix spelling check
If you get "(Can’t find Hunspell dictionary with a .aff affix file)" error in
Emacs, open "Manjaro Settings Manager" and install all en_US language packages.
