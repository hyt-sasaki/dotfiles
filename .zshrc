DOT_DIRS=$HOME/dotfiles

source $DOT_DIRS/.zshrc.install
source $DOT_DIRS/.zshrc.options
source $DOT_DIRS/.zshrc.completion
source $DOT_DIRS/.zshrc.alias
source $DOT_DIRS/.zshrc.powerline
source $DOT_DIRS/.zshrc.env

if [ -e "$HOME/.zshrc.local" ]; then
    source "$HOME/.zshrc.local"
fi
