########## include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

########### start ssh agent
eval "$(keychain --eval --agents ssh --inherit any id_rsa)"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

######### add vsCode
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

######## add awscli
export PATH=~/Library/Python/3.7/bin:$PATH
export PATH="/usr/local/opt/libressl/bin:$PATH"

#### add sqlite as suggested by python brew installation:
#export PATH="/usr/local/opt/sqlite/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/sqlite/lib"
#export CPPFLAGS="-I/usr/local/opt/sqlite/include"
#alias python="/usr/local/bin/python3"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

cd() {
  builtin cd "$@"
} # Always list directory contents upon 'cd'
mcd() { mkdir -p "$1" && cd "$1"; }       # mcd:          Makes new Dir and jumps inside
# trash() { command mv "$@" ~/.Trash; }     # trash:        Moves a file to the MacOS trash
ql() { qlmanage -p "$*" >&/dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview

eval "$(jenv init -)"

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
source ~/git/cameljava_github/configFiles/bash/forgit.plugin.sh

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

