#!/usr/bin/env bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# dunst
echo "Installing dunst config..."
ln -sv $SCRIPT_DIR/dunst/dunstrc $HOME/.config/dunst/

# i3
echo "Installing i3 config..."
ln -sv $SCRIPT_DIR/i3/config $HOME/.config/i3/
echo "Installing monitors script"
mkdir $HOME/Dev/Scripts
ln -sv $SCRIPT_DIR/monitors.sh $HOME/Dev/Scripts

# i3blocks
echo "Installing i3blocks config..."
ln -sv $SCRIPT_DIR/i3blocks/ $HOME/.config/

# kitty
echo "Installing kitty config..."
ln -sv $SCRIPT_DIR/kitty/* $HOME/.config/kitty/

# nvim
echo "Installing packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "Installing nvim config..."
ln -sv $SCRIPT_DIR/nvim/init.lua $HOME/.config/nvim/

# ranger
echo "Installing ranger config..."
ln -sv $SCRIPT_DIR/ranger/* $HOME/.config/ranger/
ranger --copy-config=all

# tmux
echo "installing tpm..."
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Installing tmux config..."
ln -sv $SCRIPT_DIR/tmux/.tmux.conf $HOME/

# zsh
echo "Installing oh-mh-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Installing plugins..."
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH/custom/plugins/zsh-vi-mode
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm $HOME/.zshrc
echo "Installing zsh config..."
ln -sv $SCRIPT_DIR/zsh/.zshrc $HOME/
ln -sv $SCRIPT_DIR/zsh/.zsh_aliases $HOME/

# picom
echo "Installing picom config..."
rm $HOME/.config/picom.conf
ln -sv $SCRIPT_DIR/picom/picom.conf $HOME/.config/

# nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# node
NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
echo "Installing node..."
nvm install node
echo "Installing yarn..."
npm i -g yarn
