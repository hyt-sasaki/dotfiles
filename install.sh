#!/usr/bin/env zsh

# .gitconfig.local の存在チェック
if [ ! -e $HOME/.gitconfig.local ]; then
    echo "ERROR: ~/.gitconfig.local が見つかりません。" >&2
    echo "以下のコマンドで作成してください:" >&2
    echo "" >&2
    echo "  git config --file ~/.gitconfig.local user.name \"Your Name\"" >&2
    echo "  git config --file ~/.gitconfig.local user.email \"your@email.com\"" >&2
    exit 1
fi

if [ ! -e $HOME/.config ]; then
    mkdir $HOME/.config
fi
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/.config/mise $HOME/.config/mise
ln -s $HOME/dotfiles/.config/karabiner $HOME/.config/karabiner
ln -s $HOME/dotfiles/.config/tridactyl $HOME/.config/tridactyl
ln -s $HOME/dotfiles/.powerline-shell.json $HOME/.powerline-shell.json
ln -s $HOME/dotfiles/.gitmessage.txt $HOME/.gitmessage.txt
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.zsh $HOME/.zsh
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.zimrc $HOME/.zimrc
source $HOME/.zshrc
