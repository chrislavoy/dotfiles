#!/bin/bash
# May use this later
#declare package_manager

if uname -v | grep Ubuntu > /dev/null; then
	#package_manager="apt-get install"
	# TODO: Add to this list if needed
	sudo apt-get install git git-core wget curl gcc python python3 vim zsh software-properties-common python-dev python-pip python3-dev python3-pip fonts-powerline

	chsh -s $(which zsh)

	# Install neovim
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install neovim

	# Install apt-fast
	sudo add-apt-repository ppa:apt-fast/stable
	sudo apt-get update
	sudo apt-get -y install apt-fast

	# Install Oh-my-zsh
	cd
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cd ~/.oh-my-zsh/custom/plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions

elif uname -v | grep ARCH > /dev/null; then
	#package_manager="pacman -S"
	sudo pacman -S pacaur xorg-minimal xorg-fonts xf86-input-synaptics xf86-video-intel base-devel xinit xorg-server rxvt-unicode feh ffmpeg arandr mpv wget curl rofi python-pip python-netifaces python-psutil NetworkManager network-manager-applet vim nvim w3m ranger mediainfo poppler highlight tmux calcurse htop newsbeuter moc firefox qutebrowser ImageMagick transmission-gtk transmission atool libcaca compton transset blender gimp texlive MultiMarkdown mupdf evince audacity rsync youtube-dl openssh syncthing noto-fonts-cjk noto-fonts-emoji cups screenFetch neofetch scrot unzip git lmms p7zip font-tamsyn speedometer neomutt font-awesome mypaint pandoc xdotool unclutter-xfixes zsh
	# TODO: Add more here if needed
fi

echo "Enter email for git config: "
read email
echo "Enter name for git config: "
read name

git config --global push.default simple
git config --global user.email "$email"
git config --global user.name "$name"

. ./deploy.sh

exit 0
