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
Use the develop branch.

## Update prezto git module
```
cd .zprezto
git pull
cd ..
git add .zprezto
git commit -m "Update prezto."
```
