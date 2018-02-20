#!/bin/bash
# Save alacritty
cp ~/.config/alacritty/alacritty.yml alacritty/alacritty.yml
# Save neovim
cp ~/.config/nvim/init.vim vim/.vimrc
# Save zsh
cp ~/.zshrc zsh/.zshrc

git add .
git status
