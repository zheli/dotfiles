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

## Installation
### Spacemacs
After installing Emacs 27+, checkout spacemacs's develop branch locally:
```
git clone --single-branch --branch develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
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


### kubectl completion
```
mkdir -p ~/.zsh/completion
kubectl completion zsh > ~/.zsh/completion/kubectl_completion
```
