To migrate existing data from a previous major version of PostgreSQL run:
  brew postgresql-upgrade-database
This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /opt/homebrew/var/postgres
For more details, read:
  https://www.postgresql.org/docs/14/app-initdb.html
To restart postgresql after an upgrade:
  brew services restart postgresql
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/postgresql/bin/postgres -D /opt/homebrew/var/postgres
==> Summary
🍺  /opt/homebrew/Cellar/postgresql/14.3: 3,306 files, 45MB
==> Running `brew cleanup postgresql`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
==> Caveats
==> postgresql
To migrate existing data from a previous major version of PostgreSQL run:
  brew postgresql-upgrade-database
This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /opt/homebrew/var/postgres
For more details, read:
  https://www.postgresql.org/docs/14/app-initdb.html
To restart postgresql after an upgrade:
  brew services restart postgresql
Or, if you don't want/need a background service you can just run:
  /opt/homebrew/opt/postgresql/bin/postgres -D /opt/homebrew/var/postgres


for preview markdown , commandline markdown render
brew instal glow

tmux tpm need manually git clone to .config/tmux/plugins and then run prefix + I


Branch out from master to manage work laptop.

principle to manage apps:
1, use sdkman for java related: jdk, maven, etc (preferrable way than brew)
2, use brew for all other app;
3, use cargo for rust apps not covered by brew.

sdkman installation so far:
jdk 17
maven 
springboot
tomcat


hammerspoon
https://github.com/scottwhudson/Lunette

for window Manager keybinding


Manually global npm /yarn installation (eg, for language server, etc)
run script in .config/kManulInstall


github project to checkout:
CS-Notes
JavaGuide
javadesignpatterns
interviews

Happy day got filco minila air.


vim Tips
learn from book: Vi improved
from steve oualine
very good book, learns quite a bit tips.
especially block v,
filter !
crtl-K


ctags for javascript:

ref:
https://medium.com/adorableio/modern-javascript-ctags-configuration-199884dbcc1
https://medium.com/trabe/navigate-es6-projects-with-vim-using-ctags-948d114b94f3

follow: https://github.com/romainl/ctags-patterns-for-javascript


my fancy fonts:
JetBrains Mono
Office Code Pro D
Monaco

set up my dotfile:

Inspired by: https://www.atlassian.com/git/tutorials/dotfiles
and start my vimrc based on: https://bitbucket.org/durdn/cfg/src/master/.vimrc

mkdir $HOME/git/cameljava_github/dotfiles
echo "alias config='/usr/bin/git --git-dir=$HOME/git/cameljava_github/dotfiles --work-tree=$HOME'" >> $HOME/.bashrc
echo "config config --local status.showUntrackedFiles no" >> $HOME/.bashrc

setup remote repo
config remote add origin git@github.com:cameljava/dotfiles.git
config  push --set-upstream origin master

Goals:
1, vim8 as daily text editor;
2, neovim as IDE.

fuzzy refs:
https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf



good vimrc refs:
https://github.com/jesseleite/dotfiles/tree/c5fc4a2569f505960eaa542ce6ec0750a801896e/vim
https://github.com/sodiumjoe/dotfiles/blob/master/vimrc


git mergetool plugin:
https://github.com/samoshkin/vim-mergetool

interesting ready;
terminal:
https://www.freecodecamp.org/news/coding-like-a-hacker-in-the-terminal-79e22954968e/


actions:
20191215
add https://github.com/wfxr/forgit
and inspired by that, also look at https://terminalsare.sexy/
a whole new world.
20200106
installed git-prompt:
https://github.com/magicmonty/bash-git-prompt
install:
colordiff

fix: bat
my default pager is most, however currently bat only support less.
create customized bat bin to wrap bat.

backup brew install using brew bundle dump

1, install homebrew tap:
brew tap Homebrew/bundle

2, dump all installation to Brewfile
brew bundle dump

it will generate file: Brewfile

30052021
1, turn vi mode for inputrc, practice bash default keybinding;
2, install rust by brew.
