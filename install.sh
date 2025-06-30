#!/usr/bin/env zsh
if [ ! -e $HOME/.config ]; then
    mkdir $HOME/.config
fi
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/.config/mise $HOME/.config/mise
ln -s $HOME/dotfiles/.powerline-shell.json $HOME/.powerline-shell.json
ln -s $HOME/dotfiles/.gitmessage.txt $HOME/.gitmessage.txt
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.zsh $HOME/.zsh
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.zimrc $HOME/.zimrc
source $HOME/.zshrc
