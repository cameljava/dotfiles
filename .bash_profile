########## include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

########### start ssh agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

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
############## add brew autocomplete
#HOMEBREW_PREFIX=$(brew --prefix)
#if type brew &>/dev/null; then
#  for COMPLETION in "$HOMEBREW_PREFIX"/etc/bash_completion.d/*
#  do
#    [[ -f $COMPLETION ]] && source "$COMPLETION"
#  done
#  if [[ -f ${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh ]];
#  then
#    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
#  fi
#fi


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
# add alias

alias ls='ls -GFhl'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias l='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; l; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# kadd function to clean update brew

fullBrewUpdate(){
            brew update

#            casks=( $(brew cask list) )
#
#            for cask in ${casks[@]}
#            do
#                # in the first line there is version
#                    current="$(brew cask info $cask | sed -n '1p' | sed -n 's/^.*: \(.*\)$/\1/p')"
#
#                    installed=( $(ls /opt/homebrew-cask/Caskroom/$cask))
#                    if (! [[ " ${installed[@]} " == *" $current "* ]]); then
#                            (set -x; brew cask install $cask --force;)
#                    fi
#            done

            brew upgrade
            brew cleanup
    }
