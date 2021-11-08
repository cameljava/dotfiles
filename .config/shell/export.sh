# shellcheck shell=bash
################################# terminal config ####################
export PS1='$ '
# export TERM=xterm-256color
export TERM=screen-256color

export PAGER="less"
# export PAGER="most"
export VISUAL="MacVim"
export EDITOR="vim"

################################# set ROOT/HOME ########################
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# pyenv for python
export PYENV_ROOT="$HOME/.pyenv"

export NVM_DIR="$HOME/.nvm"

################################ set PATH ##############################
# export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/kdata/kbin:$PATH"
# export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# use  GNU versions coreutils instead of macos version
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export PATH="/usr/local/opt/openssl/bin:$PATH"
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
# export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
# If you need to have gettext first in your PATH run:
# export PATH="/usr/local/opt/gettext/bin:$PATH"

#brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# rust
export PATH="$HOME/.cargo/bin:$PATH"

eval "$(rbenv init -)"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

######### add vsCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export GEM_HOME="$HOME/.gem"
