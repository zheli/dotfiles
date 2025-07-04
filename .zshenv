#
# Defines environment variables.
#

# Function for adding path to PATH
pupdate() { case ":${PATH:=$1}:" in *:"$1":*) ;; *) PATH="$1:$PATH" ;; esac; }

export MANPATH="/usr/local/man:$MANPATH"

# ZSH path. Has to be loaded first
if [[ $(uname -s) == "Darwin" ]]; then
    pupdate "/opt/homebrew/bin"
fi

# ignore command with space prefix in history
export HISTCONTROL=ignorespace

# vim 256 color
export TERM='xterm-256color'

# local bins
pupdate $HOME/.local/bin

# doom
pupdate $HOME/.doom-emacs.d/bin

# Kubernetes prompt
# PROMPT='$(kube_ps1)'$PROMPT
## Get all node IPs
function externalips {
  kubectl get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type=="ExternalIP")].address }'; echo
}

## Minna Kubectl plugin
pupdate $HOME/code/minna/developer-tools/kubectl-plugins

# fzf
# FZF_TMUX=1

# istio
pupdate $HOME/.local/istio/bin

# NodeJS
## NVM
export NVM_DIR="$HOME/.nvm"

## Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Golang
export GOPATH=$HOME/.go
pupdate $HOME/.go/bin
if [[ -f "$HOME/.go/env" ]]; then
    source "$HOME/.go/env"
fi

# JAVA
export JAVA_HOME="/usr/lib/jvm/java-11-adoptopenjdk"

# krew
pupdate "${KREW_ROOT:-$HOME/.krew}/bin"

# Python
## pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || pupdate "$PYENV_ROOT/bin"
eval "$(pyenv init -)"
### pyenv virtualenv
eval "$(pyenv virtualenv-init -)"
## pipx
#set -gx PIPX_DEFAULT_PYTHON "$HOME/.pyenv/versions/3.10.14/bin/python"

# Postgres tools on Macos

# brew install libpq
if [[ $(uname -s) == "Darwin" ]]; then
    pupdate "/opt/homebrew/opt/libpq/bin"
fi

# Ruby
## rvm
### Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
pupdate "$HOME/.rvm/bin"

# Rust
. "$HOME/.cargo/env"


# Scala
## coursier
pupdate "$HOME/.local/share/coursier/bin"
## SBT
export SBT_OPTS="-Xmx4G"

# ZSH
## substring history search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=red,fg=white,bold"

## zsh-autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=59"

## zsh cache for completion
export ZSH_CACHE_DIR="$HOME/.zsh/completion"

source ~/.zshenv_secrets

## nvidia driver for pc-amd
## https://wiki.archlinux.org/title/Hardware_video_acceleration#Configuring_VA-API
LIBVA_DRIVER_NAME=nvidia

# To prevent torch.OutOfMemoryError
PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
