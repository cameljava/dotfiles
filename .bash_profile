########## include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

########### start ssh agent
eval "$(keychain --eval --agents ssh --inherit any id_rsa)"

export PATH=$HOME/kbin:$PATH
# use  GNU versions coreutils instead of macos version
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

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
# add alias

alias ls='ls -GFhl'
alias cp='cp -iv'                         # Preferred 'cp' implementation
alias mv='mv -iv'                         # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                   # Preferred 'mkdir' implementation
alias l='ls -FGlAhp'                      # Preferred 'ls' implementation
alias less='less -FSRXc'                  # Preferred 'less' implementation
cd() {
  builtin cd "$@"
  l
} # Always list directory contents upon 'cd'
alias cd..='cd ../'                       # Go back 1 directory level (for fast typers)
alias ..='cd ../'                         # Go back 1 directory level
alias ...='cd ../../'                     # Go back 2 directory levels
alias .3='cd ../../../'                   # Go back 3 directory levels
alias .4='cd ../../../../'                # Go back 4 directory levels
alias .5='cd ../../../../../'             # Go back 5 directory levels
alias .6='cd ../../../../../../'          # Go back 6 directory levels
alias f='open -a Finder ./'               # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                            # ~:            Go Home
alias c='clear'                           # c:            Clear terminal display
alias which='type -all'                   # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'       # path:         Echo all executable Paths
alias show_options='shopt'                # Show_options: display bash options settings
alias fix_stty='stty sane'                # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On' # cic:          Make tab-completion case-insensitive
mcd() { mkdir -p "$1" && cd "$1"; }       # mcd:          Makes new Dir and jumps inside
trash() { command mv "$@" ~/.Trash; }     # trash:        Moves a file to the MacOS trash
ql() { qlmanage -p "$*" >&/dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'  # DT:           Pipe content to file on MacOS Desktop

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
source ~/git/cameljava_github/configFiles/bash/forgit.plugin.sh
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
