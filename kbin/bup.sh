### BREW + FZF
# ungrade multiple packages at once, async
# mnemonic [B]rew [U]pgrade [P]lugin (e.g. upgrade)

local upd=$(brew leaves | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[brew:update]'")

if [[ $upd ]]; then
  for prog in $(echo $upd)
  do brew upgrade $prog
  done
fi

