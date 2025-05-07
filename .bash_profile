# shellcheck shell=bash

ulimit -n 65536 200000

ssh-add --apple-use-keychain ~/.ssh/id_ed25519

eval "$(/opt/homebrew/bin/brew shellenv)"

. "$HOME/.config/shell/export.sh"
. "$HOME/.config/shell/alias.sh"
. "$HOME/.config/shell/function.sh"


# shellcheck shell=bash


#if [ -r ~/.kNonePublic ]
#then
#    source ~/.kNonePublic
#fi
# section to opt out telemetry
#export DOTNET_CLI_TELEMETRY_OPTOUT=true
#export SAM_CLI_TELEMETRY=0

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

########## include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

