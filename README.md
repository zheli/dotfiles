# dotfiles
My shell environment setup for the following softwares:

* alacritty
* kitty
* spacemacs
* tmux (>2.9)
* prezto (zsh configuration framework)

## Dependencies
### Fonts
On MacOS, install them using `brew cask`:
```
brew cask install font-meslo-for-powerline
brew cask install font-menlo-for-powerline
```

## Installation & configuration
### Windows WSL2
See https://docs.microsoft.com/en-us/windows/wsl/install-win10

### Spacemacs
After installing Emacs 27+, checkout spacemacs's develop branch locally:
```
git clone --single-branch --branch develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
```
Install private layers:
```
git clone git@github.com:ashyisme/fzf-spacemacs-layer.git ~/.emacs.d/private/fzf
git clone --branch fix-refresh-token-function-name git@github.com:zheli/google-calendar-layer.git ~/.emacs.d/private/google-calendar
```

### zsh
#### Install zsh
##### Arch/Manjaro
```
sudo pacman -Syu zsh
```
##### Ubuntu
```
sudo apt-get install zsh
```
#### Change user default shell
```
chsh --shell /bin/zsh
```

### on-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s $(pwd)/.zshrc ~
```

### aliases
```
ln -s $(pwd)/.aliases.zsh ~
```

### Docker
#### Grant current user permission to docekr
```
sudo usermod -aG docker ${USER}
```

### Tmux
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Git
```
git config user.email "Your email" && git config user.name "Your name"
```

### Redshift
Alternative to flux.

Make sure you create an API key for geoclue service from GCP console:
https://console.cloud.google.com/apis/credentials and add that to
'/etc/geoclue/geoclue.conf' file.
```
sudo pacman -Syu redshift
systemctl --user enable redshift.service
systemctl --user start redshift.service
```

### Chinese input method on Manjaro/i3
1. Install some fonts here: https://wiki.archlinux.org/index.php/fonts#Chinese
2. Run `pacman -Syu fcitx fcitx-googlepinyin fcitx-im fcitx-configtool`.

If it doesn't work, add these in `~/.xinitrc`:
```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```
Reference: https://medium.com/@slmeng/how-to-install-chinese-fonts-and-input-method-in-arch-linux-18b68d2817e7

### kubectl completion
```
mkdir -p ~/.zsh/completion
kubectl completion zsh > ~/.zsh/completion/kubectl_completion
```
