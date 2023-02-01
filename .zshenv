#
# Defines environment variables.
#

# Function for adding path to PATH
pupdate() { case ":${PATH:=$1}:" in *:"$1":*) ;; *) PATH="$1:$PATH" ;; esac; }

export MANPATH="/usr/local/man:$MANPATH"

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

# JAVA
export JAVA_HOME="/usr/lib/jvm/java-11-adoptopenjdk"

# krew
pupdate "${KREW_ROOT:-$HOME/.krew}/bin"

# Python
## pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || pupdate "$PYENV_ROOT/bin"
eval "$(pyenv init -)"

# Ruby
## rvm
### for arch linux
### `yay -S rvm`
unset GEM_HOME
if [ -f '$HOME/.cache/yay/rvm/src/rvm/scripts/rvm' ]; then .
'source $HOME/.cache/yay/rvm/src/rvm/scripts/rvm'; fi

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
