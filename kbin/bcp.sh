#!/bin/bash
### BREW + FZF
# mnemonic [B]rew [C]lean [P]lugin

uninst=$(brew leaves | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[brew:clean]'")

if [[ $uninst ]]; then
  for prog in $(echo $uninst)
  do brew uninstall $prog
  done
fi
