# 入力をviのキーバインドに変更
bindkey -v

# ファイル名の大文字小文字の区別をしない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# history設定 参照
HISTSIZE=100000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%s'

setopt auto_pushd

#入力途中の履歴補完
bindkey "^P" reverse-menu-complete
bindkey "^N" menu-complete
bindkey "^R" history-incremental-search-backward

peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history
fpath=(/usr/local/share/zsh-completions $fpath)
export PATH=$HOME/Library/Python/2.7/bin:$PATH
function zle-line-init zle-keymap-select {
    L_SEPARATOR=$'\uE0B0'
    VIM_NORMAL="%K{208}%F{black}${L_SEPARATOR}%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}${L_SEPARATOR}%k%f"
    VIM_INSERT="%K{075}%F{black}${L_SEPARATOR}%k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075}${L_SEPARATOR}%k%f"
    RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# powerlineの設定
function powerline_precmd() {
    PS1="$(~/.local/bin/powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
