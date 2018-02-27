# 入力をviのキーバインドに変更
bindkey -v

# ファイル名の大文字小文字の区別をしない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# history設定 参照
export HISTFILE=${HOME}/.zsh_history
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
export PATH=$HOME/.local/bin:$PATH
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
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

autoload -U compinit
compinit -C

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='no=00;38;5;250:rs=0:di=01;38;5;198:ln=01;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:ex=01;38;5;82:*.cmd=00;38;5;82:*.exe=00;38;5;82:*.com=00;38;5;82:*.btm=00;38;5;82:*.bat=00;38;5;82:*.jpg=00;38;5;37:*.jpeg=00;38;5;37:*.png=00;38;5;37:*.gif=00;38;5;37:*.bmp=00;38;5;37:*.xbm=00;38;5;37:*.xpm=00;38;5;37:*.tif=00;38;5;37:*.tiff=00;38;5;37:*.pdf=00;38;5;98:*.odf=00;38;5;98:*.doc=00;38;5;98:*.ppt=00;38;5;98:*.pptx=00;38;5;98:*.db=00;38;5;98:*.aac=00;38;5;208:*.au=00;38;5;208:*.flac=00;38;5;208:*.mid=00;38;5;208:*.midi=00;38;5;208:*.mka=00;38;5;208:*.mp3=00;38;5;208:*.mpc=00;38;5;208:*.ogg=00;38;5;208:*.ra=00;38;5;208:*.wav=00;38;5;208:*.m4a=00;38;5;208:*.axa=00;38;5;208:*.oga=00;38;5;208:*.spx=00;38;5;208:*.xspf=00;38;5;208:*.mov=01;38;5;208:*.mpg=01;38;5;208:*.mpeg=01;38;5;208:*.3gp=01;38;5;208:*.m2v=01;38;5;208:*.mkv=01;38;5;208:*.ogm=01;38;5;208:*.mp4=01;38;5;208:*.m4v=01;38;5;208:*.mp4v=01;38;5;208:*.vob=01;38;5;208:*.qt=01;38;5;208:*.nuv=01;38;5;208:*.wmv=01;38;5;208:*.asf=01;38;5;208:*.rm=01;38;5;208:*.rmvb=01;38;5;208:*.flc=01;38;5;208:*.avi=01;38;5;208:*.fli=01;38;5;208:*.flv=01;38;5;208:*.gl=01;38;5;208:*.m2ts=01;38;5;208:*.divx=01;38;5;208:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:'

zstyle ':completion:*' list-colors 'di=01;38;5;198' 'ln=01;38;5;37' 'so=48;5;230;38;5;136;01' 'ex=01;38;5;82' 'bd=48;5;230;38;5;224;01' 'cd=48;5;230;38;5;244;01'
zstyle ':completion:*:default' menu select=2
VISUAL=""
if [ -x "`which nvim`" ]; then
    alias vim='nvim'
    VISUAL=nvim
else
    VISUAL=vim
fi
export VISUAL="$VISUAL"
export EDITOR="$VISUAL"
case ${OSTYPE} in
    darwin*)
        alias ls="gls --color"
        ;;
    linux*)
        alias ls="ls --color=auto"
        ;;
esac
alias ll="ls -l"
alias la="ls -a"
setopt correct
if [ ! -x "`which pyenv`" ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
if [ -e "$HOME/.zshrc.local" ]; then
    source "$HOME/.zshrc.local"
fi
