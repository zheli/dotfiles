# Introduction
Instructions for setting up Manjaro system

## Setup i3
```
ln -s $(pwd)/polybar ~/.config/
ln -s $(pwd)/rofi ~/.config/
sudo pacman -Syu polybar rofi rofi-emoji
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
```
yay -S noto-fonts-emoji
```

## Fix spelling check
If you get "(Can’t find Hunspell dictionary with a .aff affix file)" error in
Emacs, open "Manjaro Settings Manager" and install all en_US language packages.

## Automatically xrandr profile when plug in new monitors
```
sudo pacman -Syu autorandr
autorandr --save <name>
```
See https://www.donarmstrong.com/posts/autorandr/.

## Use alt tab for application switching
```
yay -S alttab
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

## terraform & terragrunt aliases
```
cd
mkdir -p ~/.aliases && cd ~/.aliases && git clone https://github.com/zer0beat/terraform-aliases.git
```

## switch terraform & terragrunt version with tfswitch & tgswitch
```
# Download the latest version
tfswitch -b ~/.local/bin/terraform --latest
tgswitch -b ~/.local/bin/terragrunt 0.45.9

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
yay -S it87-dkms-git
sudo modprobe it87 force_id=0x8686
```
3. Add files in modules-load.d and modprobe.d folder.
4. Run `sudo sensors-detect`.

## Visual Studio Code
```
yay -Su visual-studio-code-bin
```
If VSCode hijacks opening folder function, add this into your ~/.config/mimeapps.list file:
```
inode/directory=thunar.desktop
```

## Ruby stuff
### Install ruby using rvm with openssl fix
```
PKG_CONFIG_PATH=/usr/lib/openssl-1.1/pkgconfig:/usr/lib/pkgconfig rvm install 2.7.2

```

## Python stuff
### Install pipenv
```
pip install --user pipenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```

## Arduino permssion
```
sudo chmod a+rw /dev/ttyUSB0
```
Or add current user to group
```
stat /dev/ttyUSB0
sudo usermod -a -G dialout $USER
```

## OBS doesn't work
Remove `libva-vdpau-driver` package.

## Fix hibernation
See https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Configure_the_initramfs
1. Add `resume` to /etc/mkinitcpio.conf and run `sudo mkinitcpio -P`
```
HOOKS=(base udev autodetect modconf kms keyboard keymap consolefont block filesystems resume fsck)
```
2. Add swapdisk UUID to grub cfg (/etc/default/grub) `GRUB_CMDLINE_LINUX_DEFAULT` and run `sudo grub-mkconfig -o /boot/grub/grub.cfg`
```
resume=UUID=4209c845-f495-4c43-8a03-5363dd433153
```

# Display
## Set one monitor to higher refresh rate when you use dual monitors
1. "Force Full Composition Pipeline" in nvidia-settings for all monitors
2. Disable "Sync to VBlank" and "Allow Flipping" in nvidia-settings -> OpenGL Settings
3. Put these lines in /etc/environment :
```
CLUTTER_DEFAULT_FPS=<highest_refresh_rate, like 144>
__GL_SYNC_DISPLAY_DEVICE=<display_with_highest_refresh_rate, like DP-2>
__GL_SYNC_TO_VBLANK=0
```
Adjust "CLUTTER_DEFAULT_FPS" and "__GL_SYNC_DISPLAY_DEVICE" appropriate to your setup.

Then run `xrandr --output DP-4 --mode 1920x1080 --rate 240` and use `autorandr` to save the current settings
