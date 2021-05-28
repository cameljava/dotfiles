# shellcheck shell=bash

########## include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

########### start ssh agent
eval "$(keychain --eval --agents ssh --inherit any id_rsa)"


####### bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[ -f "$HOME/.iterm2_shell_integration.bash" ] && source "$HOME/.iterm2_shell_integration.bash"

complete -C '/usr/local/bin/aws_completer' aws

####### navigate

eval  "$(lua /usr/local/opt/z.lua/share/z.lua/z.lua --init bash)"
# /path/to/z.lua --init bash)"" /path/to/z.lua --init bash)"" . "$HOME/git/cameljava_github/tools/z/z.sh"
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

######## git 
# git+fzf
source "$HOME/git/cameljava_github/prog/forgit/forgit.plugin.sh"
# [ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# prompt show git status
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"  ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
        source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
          fi

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
####### languages
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH" 

