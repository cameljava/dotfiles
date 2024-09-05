# shellcheck shell=bash

ulimit -n 65536 200000

ssh-add --apple-use-keychain ~/.ssh/id_ed25519

########## include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

#if [ -r ~/.kNonePublic ]
#then
#    source ~/.kNonePublic
#fi
# section to opt out telemetry
#export DOTNET_CLI_TELEMETRY_OPTOUT=true
#export SAM_CLI_TELEMETRY=0

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
