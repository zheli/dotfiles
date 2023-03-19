# Directories
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# Docker
alias dm='docker-machine'
alias dco='docker-compose'
alias dcod='docker-compose -p default'
alias dcodv='docker-compose --verbose -p default'
alias dcov='docker-compose --verbose'
alias dcol="docker-compose -f docker-compose.base.yml -f docker-compose.local.yml"

# Editors
## edit in emacs client mode
alias e='emacsclient -n -s spacemacs'
alias en='emacsclient -c'
alias emacsnc='emacsclient -nc &'
alias nvv='nvim -S'
alias vv='vim -S'

# workaround so watch command supports alias
alias watch='watch '

# git
[ -f ~/.aliases_git ] && source ~/.aliases_git
alias ga="git add"
alias gfo="git fetch origin"
alias gd="git diff"
alias ginit='git init && git config user.email "linuxcity.jn@gmail.com" && git config user.name "Zhe Li"'
alias gguser='git config user.email "zhe@gateway.fm" && git config user.name "Zhe Li"'
alias gst="git status"
alias gsta="git stash"

# i3
alias move_left="i3-msg move workspace to output left"
alias move_right="i3-msg move workspace to output right"

# GCloud
alias gal="gcloud auth login"
alias gaal="gcloud auth application-default login"
alias gcdev="gcloud --account='zhe@minna.tech'"

# kubernetes
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
## kubectx
alias kctx="kubectx"
alias kns="kubens"

# Terraform
# To install: mkdir -p ~/.aliases && cd ~/.aliases && git clone https://github.com/zer0beat/terraform-aliases.git
[ -f ~/.aliases/terraform-aliases/.terraform_aliases ] && source ~/.aliases/terraform-aliases/.terraform_aliases
[ -f ~/.aliases/terraform-aliases/.terragrunt_aliases ] && source ~/.aliases/terraform-aliases/.terragrunt_aliases

# irssi
alias irssi="TERM=screen-256color irssi"
alias irssid="docker start -i $(docker ps -a|grep irssi|awk '{print $1}')"
alias irssidrm="docker rm $(docker ps -a|grep irssi|awk '{print $1}')"
alias start_irssi="docker run -it --name irssi jess/irssi"

# Python
alias agpy='ag -inr --py'
alias rmpyc='find . -name *.pyc -exec rm -rf {} \;'
## Django
alias dman='./manage.py'

# Scala
alias scalakata="docker start scalakata"
alias stop_scalakata="docker stop scalakata"
alias amm="/usr/libexec/java_home -v 1.8 --exec java -jar /usr/local/bin/amm-2.12"

# Tmux
alias tm='tmux -S ~/tmux-default.socket'
alias tmux="TERM=xterm-256color tmux"
alias tmuxa="tmux a -d"

# Zsh config editing
alias src='source ~/.zshrc'
alias tmuxconfig='nvim ~/.tmux.conf'
alias aliasconfig='e ~/.aliases'
alias zshconfig="e ~/.zshrc"
alias envconfig="nvim ~/.config/zshenv/env.sh"

# Others
# only needed for macs
# alias free="vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf(\"%-16s % 16.2f Mi\n\", \"$1:\", $2 * $size / 1048576);'"
alias ctrl_escape="setxkbmap -layout us,se -option grp:alt_shift_toggle -option ctrl:nocaps"
## Launch minidlna in debug mode
alias launch_minidland="minidlnad -d -P /tmp/minidlna.pid -L"
# alias samba_here="docker run --name samba -p 139:139 -p 445:445 -v \`pwd\`:/share -d dperson/samba -p -s \"public;/share\""
alias samba_here="docker run --name samba -e USERID=1000 -e GROUPID=1000 -p 139:139 -p 445:445 -v \`pwd\`:/share -d dperson/samba -s \"public;/share\""
alias start_vncserver="x0vncserver -display :0 -passwordFile ~/.vnc/passwd"
alias debug_pod="kubectl run -i --rm --tty debug --image=alpine/httpie --restart=Never --command -- sh"
alias spacemacs="emacs --with-profile=spacemacs"

# macos

if [[ $(uname -s) == "Darwin" ]]; then
    alias xdg-open="open"
fi
