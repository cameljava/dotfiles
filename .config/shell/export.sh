################################# terminal config ####################
# export PS1="$ "
export PS1='\[\e[0;$(($?==0?0:91))m\]$ \[\e[0m\]'
export SHELL="/opt/homebrew/bin/bash"

export PAGER="less"
# export PAGER="most"
export VISUAL="nvim"
export EDITOR="vim"

################################# set ROOT/HOME ########################
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

################################ set PATH ##############################
export PATH="$HOME/kdata/kbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"
export PATH="/Applications/WebStorm.app/Contents/MacOS:$PATH"


####### bash
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# rust
# install rust using rustup, instead of brew
. "$HOME/.cargo/env"

#eval "$(rbenv init -)"
#export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
#export GEM_HOME="$HOME/.gem"

# pyenv for python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# fzf settings
# shellcheck source=/dev/null
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias fzfp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"
# search all files in current folder including hidden and git ignore, except .rgignore
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden --follow --glob '!.git'"

######### add vsCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


# setting for forgit
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.sh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.sh
# export forgit_cherry_pick=gccp
# ctrl-e to view the logs in a vim buffer (glo specific)
export FORGIT_LOG_FZF_OPTS=' --bind="ctrl-e:execute(echo {} |grep -Eo [a-f0-9]+ |head -1 |xargs git show |nvim -)"'

# PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
# PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"

[ -f "$HOME/.iterm2_shell_integration.bash" ] && source "$HOME/.iterm2_shell_integration.bash"

source ~/.bash_completion/alacritty
complete -C '/opt/homebrew/bin/aws_completer' aws

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

export MVN_HOME="$HOME/.sdkman/candidates/maven/current"
export M2_HOME="$HOME/.sdkman/candidates/maven/current"

