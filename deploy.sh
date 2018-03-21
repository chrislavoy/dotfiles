#!/bin/bash
# Deploy Alacritty
if command -v alacritty > /dev/null; then
	cp alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	echo "Deployed alacritty"
fi

# Deploy NeoVim or Vim
if command -v nvim >/dev/null; then
	cp vim/.vimrc ~/.config/nvim/init.vim
	echo "Deployed nvim"
else
	cp vim/.vimrc ~/.vimrc
	echo "Deployed vim"
fi

# Deploy ZSH or Bash
if command -v zsh >/dev/null; then
	cp zsh/.zshrc ~/.zshrc
	echo "Deployed zsh"
else
	cp bash/.bash_profile ~/.bash_profile
	echo "Deployed bash"
fi
