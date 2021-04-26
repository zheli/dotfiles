#
# Defines environment variables.
#

# Function for adding path to PATH
pupdate() { case ":${PATH:=$1}:" in *:"$1":*) ;; *) PATH="$1:$PATH" ;; esac; }

export EDITOR='vim'
export MANPATH="/usr/local/man:$MANPATH"

# ignore command with space prefix in history
export HISTCONTROL=ignorespace

# vim 256 color
export TERM='xterm-256color'

# local bins
pupdate $HOME/.local/bin

# Kubernetes
PROMPT='$(kube_ps1)'$PROMPT

## Minna Kubectl plugin
pupdate $HOME/code/minna/developer-tools/kubectl-plugins

# fzf
FZF_TMUX=1

# istio
pupdate $HOME/.local/istio/bin

# NodeJS
## NVM
export NVM_DIR="$HOME/.nvm"

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Golang
export GOPATH=$HOME/.go
pupdate $HOME/.go/bin

# krew
pupdate "${KREW_ROOT:-$HOME/.krew}/bin"

# Scala
## SBT
export SBT_OPTS="-Xmx4G"

# ZSH
## substring history search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=red,fg=white,bold"

## zsh-autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=59"

## zsh cache for completion
export ZSH_CACHE_DIR="$HOME/.zsh/completion"
