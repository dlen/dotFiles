# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="true"
ZSH_TMUX_AUTOCONNECT="false"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode rbenv docker)
#plugins=(git )

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/java/jre/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/diego/.gem/ruby/2.1.0/bin"
# export MANPATH="/usr/local/man:$MANPATH"
#GO PATH and yarn
export PATH="$PATH:$HOME/go/bin:$HOME/.yarn/bin"
# # Preferred editor for local and remote sessions
export EDITOR='vim'
export VISUAL='vim'

export TERM='xterm-256color'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
##Reverse incremental search
bindkey '^R' history-incremental-search-backward
####aliases
#source $HOME/.aliases_priv
#source $HOME/.kubernetes_shortcuts/shortcuts.zsh
#source $HOME/.gce_shortcuts/shortcuts.zsh
#####Rspec alias
alias rspec="rspec --color"
#source ~/.amazon_shortcuts.zsh
#servername for vim
alias vim='vim --servername VIM'
source /usr/share/zsh/plugins/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh
source ~/code/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT
alias k8s_context="kubectl config view --minify -o jsonpath='{.contexts[].name}'"
alias tls='echo -n "--tls --tls-cert $(helm home)/tls/$(k8s_context)/cert.pem --tls-key $(helm home)/tls/$(k8s_context)/key.pem"'
