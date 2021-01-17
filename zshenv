#
# Defines environment variables.
#
export EDITOR='vim'
export MANPATH="/usr/local/man:$MANPATH"

# ignore command with space prefix in history
export HISTCONTROL=ignorespace

# vim 256 color
export TERM='xterm-256color'

# local bins
PATH=$PATH:$HOME/.local/bin

# fzf
FZF_TMUX=1

# NodeJS
## NVM
export NVM_DIR="$HOME/.nvm"

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
