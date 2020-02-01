export PS1='$ '
export TERM=xterm-256color
export PAGER="less"
# export PAGER="most"
export VISUAL="/usr/local/Cellar/macvim/8.1-161/bin/mvim"
export EDITOR="/usr/local/bin/vim"
# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

[ -s "/usr/local/etc/bash_completion.d/pass" ] && \. "/usr/local/etc/bash_completion.d/pass" # This loads pass bash_completion

# tmp set default profile to kev. turn it off when having cochlear
#export AWS_DEFAULT_PROFILE=kev

# enable aws cli auto complete
complete -C '/Users/kevlee/Library/Python/3.7/bin/aws_completer' aws

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2>/dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

HISTSIZE=500000
HISTFILESIZE=5000000

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2>/dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2>/dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2>/dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars
# Examples:
# export dotfiles="$HOME/dotfiles"
# export projects="$HOME/projects"
# export documents="$HOME/Documents"
# export dropbox="$HOME/Dropbox"

# alias
# alias diff="diff-so-fancy"
alias rm="rm -i"
alias sls="sls --region ap-southeast-2 "
alias n="nvim "
alias v="vim "
alias vs="vim -S"
alias m="mvim "
alias g="git "
alias b="brew "
#History search (use: hs sometext)
alias hs='history | grep $1'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias fzfp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"
alias config='/usr/bin/git --git-dir=/Users/kevlee/git/cameljava_github/dotfiles --work-tree=/Users/kevlee'
# search all files in current folder including hidden and git ignore, except .rgignore
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden --follow --glob '!.git'"

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

config config --local status.showUntrackedFiles no

eval $(thefuck --alias)

# Applications env setting
export SLS_DEBUG=true

# customized function

tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }

function dirdiff() {
  # Shell-escape each path:
  DIR1=$(printf '%q' "$1")
  shift
  DIR2=$(printf '%q' "$1")
  shift
  vim $@ -c "DirDiff $DIR1 $DIR2"
}
