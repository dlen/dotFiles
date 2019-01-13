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

