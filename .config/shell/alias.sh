# add alias

# alias bash='/opt/homebrew/bin/bash'

alias s='source '
# alias ls='/bin/ls -GFhl|cat'
# alias ls='exa -alT --git -L 2 -I .git -I node_modules'
alias li='eza -al --git-ignore'
alias cp='cp -iv'               # Preferred 'cp' implementation
alias mv='mv -iv'               # Preferred 'mv' implementation
alias mkdir='mkdir -pv'         # Preferred 'mkdir' implementation
alias l='eza -al -T -L 2 --git' # Preferred 'ls' implementation
alias ll='eza -al --git'        # Preferred 'ls' implementation
# alias l='/bin/ls -FGlAhp|cat'                      # Preferred 'ls' implementation
# alias less='less -FSRXc' # Preferred 'less' implementation
alias fd='fd -H '
alias Rg='rg --hidden '
alias RG='rg --hidden --no-ignore --follow '

# alias diff="diff-so-fancy"
# alias rm="rm -i"
# alias dd='trash '
[ -x "$(command -v trash)" ] && alias rm="trash -F"
# alias sls="sls --region ap-southeast-2 "
alias n="nvim "
alias nn="nvim ."
alias v="vim "
alias vm="vim -u ~/.vimrc-minimal"
alias vs="vim -S "
alias ns="nvim -S "
alias nd="nvim -d "
alias m="oni2"
alias g="git "
alias b="bat "
alias bb="bat -p "
#History search (use: hs sometext)
alias hs='history | grep $1'
alias ..='cd ../'                         # Go back 1 directory level
alias ...='cd ../../'                     # Go back 2 directory levels
alias .3='cd ../../../'                   # Go back 3 directory levels
alias .4='cd ../../../../'                # Go back 4 directory levels
alias .5='cd ../../../../../'             # Go back 5 directory levels
alias .6='cd ../../../../../../'          # Go back 6 directory levels
alias ff='open -a Finder ./'              # ff:            Opens current directory in MacOS Finder
alias ~="cd ~"                            # ~:            Go Home
alias c='clear'                           # c:            Clear terminal display
alias which='type -all'                   # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'       # path:         Echo all executable Paths
alias show_options='shopt'                # Show_options: display bash options settings
alias fix_stty='stty sane'                # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On' # cic:          Make tab-completion case-insensitive
alias DT='tee ~/Desktop/terminalOut.txt'  # DT:           Pipe content to file on MacOS Desktop

#git alias
alias gs='git status'

alias imgcat="tmux split-window -h 'cat > /dev/null; imgcat'"
# alias icat='kitty +kitten icat'

alias python=python3
alias pip=pip3
