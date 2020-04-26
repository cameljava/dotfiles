# customized function

# check why like this
# tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }

dirdiff()
{
    # Shell-escape each path:
    DIR1=$(printf '%q' "$1"); shift
    DIR2=$(printf '%q' "$1"); shift
    vim "$@" -c "DirDiff $DIR1 $DIR2"
}

cd() {
  builtin cd "$@"
} # Always list directory contents upon 'cd'

mcd() { mkdir -p "$1" && cd "$1"; }       # mcd:          Makes new Dir and jumps inside

# trash() { command mv "$@" ~/.Trash; }     # trash:        Moves a file to the MacOS trash
ql() { qlmanage -p "$*" >&/dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview


