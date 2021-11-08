# shellcheck shell=bash

########## include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

########### start ssh agent
# eval "$(keychain --eval --agents ssh --inherit any id_rsa)"

####### bash
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
# [ -f "$HOME/.iterm2_shell_integration.bash" ] && source "$HOME/.iterm2_shell_integration.bash"

complete -C '/usr/local/bin/aws_completer' aws

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

####### languages
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
