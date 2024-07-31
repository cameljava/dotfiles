# shellcheck shell=bash

ulimit -n 65536 200000

########## include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

if [ -r ~/.kNonePublic ]
then
    source ~/.kNonePublic
fi
# section to opt out telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export SAM_CLI_TELEMETRY=0

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

