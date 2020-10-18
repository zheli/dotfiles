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

### zprezto
Run `cd ~`. And add symlinks to all the following files
```
ln -s ~/code/dotfiles/.prezto .zprezto
ln -s ~/code/dotfiles/.prezto/runcoms/zlogin .zlogin
ln -s ~/code/dotfiles/.prezto/runcoms/zlogout .zlogout
ln -s ~/code/dotfiles/.prezto/runcoms/zprezto .zprezto
ln -s ~/code/dotfiles/.prezto/runcoms/zprezto-custom .zprezto-custom
ln -s ~/code/dotfiles/.prezto/runcoms/zpreztorc .zpreztorc
ln -s ~/code/dotfiles/.prezto/runcoms/zprofile .zprofile
ln -s ~/code/dotfiles/.prezto/runcoms/zshenv .zshenv
ln -s ~/code/dotfiles/.prezto/runcoms/zshrc .zshrc
ln -s ~/code/dotfiles/.zprezto-custom/zl-prompt/external/zl ~/.zprezto/modules/prompt/external/
```

## Update prezto git module
```
cd .zprezto
git pull
cd ..
git add .zprezto
git commit -m "Update prezto."
```
