export PS1='$ '

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

#History search (use: hs sometext)
alias hs='history | grep $1'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tmp set default profile to kev. turn it off when having cochlear
#export AWS_DEFAULT_PROFILE=kev

# enable aws cli auto complete
complete -C '/Users/kevlee/Library/Python/3.7/bin/aws_completer' aws

# alias

alias sls="sls --region ap-southeast-2 "
alias n="nvim "
alias v="vim "
alias m="mvim "
alias g="git "
alias gs="git status"
alias gc="git commit"
alias ga="git add "
alias g.="git add ."
alias gd="git diff "
alias gd.="git diff ."
alias gdc="git diff --cached"
alias gdc.="git diff --cached ."
alias gb="git branch"
alias gh="git checkout"
alias gp="git push"
alias gl="git lg -15"
alias gm="git merge --no-commit "
export SLS_DEBUG=true

HISTSIZE=500000
HISTFILESIZE=5000000
#export HISTCONTROL=ignoreboth:erasedups

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/kevlee/git/cochlear_gitlab/drx-serverless/auth/node_modules/tabtab/.completions/serverless.bash ] && . /Users/kevlee/git/cochlear_gitlab/drx-serverless/auth/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/kevlee/git/cochlear_gitlab/drx-serverless/auth/node_modules/tabtab/.completions/sls.bash ] && . /Users/kevlee/git/cochlear_gitlab/drx-serverless/auth/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/kevlee/git/cochlear_gitlab/drx-serverless/auth/node_modules/tabtab/.completions/slss.bash ] && . /Users/kevlee/git/cochlear_gitlab/drx-serverless/auth/node_modules/tabtab/.completions/slss.bash
alias config='/usr/bin/git --git-dir=/Users/kevlee/git/cameljava_github/dotfiles --work-tree=/Users/kevlee'
config config --local status.showUntrackedFiles no

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export EDITOR='vim'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
eval $(thefuck --alias)

# https://medium.com/adorableio/modern-javascript-ctags-configuration-199884dbcc1
# alias jtags="ctags -R app config lib && sed -i '' -E '/^(if|switch|function|module\.exports|it|describe).+language:js$/d' tags"
