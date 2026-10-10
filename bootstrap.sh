#!/usr/bin/env bash
set -e

sudo apt update
sudo apt install -y \
    git \
    curl \
    fzf \
    ripgrep \
    nodejs \
    npm

# Neovim
sudo snap install nvim --classic

# Pyright
sudo npm install -g pyright

# Lazygit
sudo snap install lazygit

# Delta
sudo apt install -y git-delta

# Config
mkdir -p ~/.config/nvim ~/.config/lazygit

cp ./nvim/init.lua ~/.config/nvim/init.lua
cp ./lazygit/config.yml ~/.config/lazygit/config.yml
cp ./gitconfig ~/.gitconfig

# Shell additions
cat ./shell.sh >> ~/.bashrc

echo "Done. Restart your shell."
