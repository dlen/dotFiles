# Load zplug package manager for zsh
source ~/.zplug/init.zsh
# Load plugins and theme
source ~/.zsh/plugins/plugins.zsh
source ~/.zsh/config/env.zsh

#zstyle ':prezto:module:tmux:auto-start' local 'yes'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zplug load

# Setup fzf install directory
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/diego/.zshrc'

autoload -Uz compinit; colors; colors
compinit

alias slack="XDG_CURRENT_DESKTOP=Unity slack"
#asdf version manager source
. $HOME/.asdf/asdf.sh
