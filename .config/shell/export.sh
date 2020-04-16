export PS1='$ '
export TERM=xterm-256color

export PATH=$HOME/kbin:$PATH
export PATH="/usr/local/sbin:$PATH"
# use  GNU versions coreutils instead of macos version
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
# use brew version curl
export PATH="/usr/local/opt/curl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/curl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

export PAGER="less"
# export PAGER="most"
export VISUAL="mvim"
export EDITOR="vim"


# If you need to have gettext first in your PATH run:
export PATH="/usr/local/opt/gettext/bin:$PATH"

# For compilers to find gettext you may need to set:
export LDFLAGS="-L/usr/local/opt/gettext/lib"
export CPPFLAGS="-I/usr/local/opt/gettext/include"

