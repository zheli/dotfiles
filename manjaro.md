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

## Automatically xrandr profile when plug in new monitors
```
sudo pacman -Syu autorandr
autorandr --save <name>
```
See https://www.donarmstrong.com/posts/autorandr/.

## Install pipenv
```
pip install --user pipenv
```

## Set Droidcam to use HD resolution
1. Set resolution in `/etc/modprobe.d/droidcam.conf` (see
   https://www.dev47apps.com/droidcam/linux/). But use modprobe instead of insmod.
2. Reload module:
```
sudo rmmod v4l2loopback_dc
sudo modprobe v4l2loopback-dc width=1920 height=1080
```
3. Check if module is installed.
```
lsmod | grep v4l2loopback_dc
```

## switch terraform version with tfswitch
```
# Download the latest version
tfswitch -b ~/.local/bin/terraform --latest

# switch to different version
tfswitch -b ~/.local/bin/terraform
```

## Cannot boot up. "grub_is_lockdown" not found issue
See https://archived.forum.manjaro.org/t/using-livecd-v17-0-1-and-above-as-grub-to-boot-os-with-broken-bootloader/24916

## Fix temperature sensor issue for Gigabyte motherboard
See
* https://wiki.archlinux.org/title/lm_sensors#Gigabyte_B250/Z370/B450M/B560M_motherboards
* https://unix.stackexchange.com/questions/165110/grub-quiet-splash

1. Add "acpi_enforce_resources=lax" to GRUB_CMDLINE_LINUX_DEFAULT in
/etc/default/grub.
2. Install module.
```
yay -S it87-dkms-git5~
sudo modprobe it87 force_id=0x8686
```
3. Add files in modules-load.d and modprobe.d folder.
4. Run `sudo sensors-detect`.
