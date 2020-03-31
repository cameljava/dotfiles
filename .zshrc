# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 5 numeric
zstyle :compinstall filename '/Users/kevlee/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
bindkey -v
# End of lines configured by zsh-newuser-install
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PS1='$ '
export PAGER="less"
# export PAGER="most"
export VISUAL="/usr/local/Cellar/macvim/8.1-161/bin/mvim"
export EDITOR="/usr/local/bin/vim"
. "$HOME/git/cameljava_github/tools/z/z.sh"
alias config='/usr/bin/git --git-dir=/Users/kevlee/git/cameljava_github/dotfiles --work-tree=/Users/kevlee'
