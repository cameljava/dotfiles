# shellcheck shell=bash
################################# terminal config ####################
export PS1='$ '
export TERM=xterm-256color

export PAGER="less"
# export PAGER="most"
export VISUAL="oni2"
export EDITOR="vim"

################################# set ROOT/HOME ########################
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# pyenv for python
export PYENV_ROOT="$HOME/.pyenv"

export NVM_DIR="$HOME/.nvm"

################################ set PATH ##############################

export PATH="$HOME/kbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# use  GNU versions coreutils instead of macos version
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
# If you need to have gettext first in your PATH run:
export PATH="/usr/local/opt/gettext/bin:$PATH"

# use brew version curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

######### add vsCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export GEM_HOME="$HOME/.gem"
