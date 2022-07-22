# shellcheck shell=bash
################################# terminal config ####################
export PS1="$ "
export SHELL="/opt/homebrew/bin/bash"
# export TERM=xterm-256color
# export TERM=screen-256color

export PAGER="less"
# export PAGER="most"
export VISUAL="nvim"
export EDITOR="vim"

################################# set ROOT/HOME ########################
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

################################ set PATH ##############################
# export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/kdata/kbin:$PATH"
# export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

#brew
eval "$(/opt/homebrew/bin/brew shellenv)"

########### start ssh agent
# eval "$(keychain --eval --agents ssh --inherit any id_rsa)"
# rust
export PATH="$HOME/.cargo/bin:$PATH"

eval "$(rbenv init -)"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

######### add vsCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export GEM_HOME="$HOME/.gem"

####### bash
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
# [ -f "$HOME/.iterm2_shell_integration.bash" ] && source "$HOME/.iterm2_shell_integration.bash"

# complete -C '/usr/local/bin/aws_completer' aws

######## git
# git+fzf
# source "$HOME/git/cameljava_github/prog/forgit/forgit.plugin.sh"
# [ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# prompt show git status
if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
	source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# pyenv for python

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
