#
# Loads prompt themes.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zhe Li <linuxcity.jn@gmail.com>
#

# Load and execute the prompt theming system.
autoload -Uz promptinit && promptinit

# Load the prompt theme.
zstyle -a ':prezto:module:zl-prompt' theme 'prompt_argv'
if [[ "$TERM" == (dumb|linux|*bsd*) ]] || (( $#prompt_argv < 1 )); then
  prompt 'off'
else
  prompt "$prompt_argv[@]"
fi
unset prompt_argv
