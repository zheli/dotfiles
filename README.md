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
Run `cd ~ && ln -s ~/code/dotfile/.prezto`. And add symlinks to all the following files
```
ln -s ~/code/dotfile/.prezto/runcoms/zlogin .zlogin
ln -s ~/code/dotfile/.prezto/runcoms/zlogout .zlogout
ln -s ~/code/dotfile/.prezto/runcoms/zprezto .zprezto
ln -s ~/code/dotfile/.prezto/runcoms/zprezto-custom .zprezto-custom
ln -s ~/code/dotfile/.prezto/runcoms/zpreztorc .zpreztorc
ln -s ~/code/dotfile/.prezto/runcoms/zprofile .zprofile
ln -s ~/code/dotfile/.prezto/runcoms/zshenv .zshenv
ln -s ~/code/dotfile/.prezto/runcoms/zshrc .zshrc
```

## Update prezto git module
```
cd .zprezto
git pull
cd ..
git add .zprezto
git commit -m "Update prezto."
```
