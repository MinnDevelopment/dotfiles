# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme to use (custom theme by someone on github)
ZSH_THEME="bullet-train"

# How many days to wait before updating ZSH
export UPDATE_ZSH_DAYS=14

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(
  git
  gradle-completion
  zsh-url-highlighter
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# History settings
HISTSIZE=1000

# Language settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# alias
alias ls="ls -A --color=auto"
alias ll="ls -laFh"

# special configs
source ~/.bindkeyrc
source ~/.env
