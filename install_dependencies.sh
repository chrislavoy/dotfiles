#!/bin/bash
# May use this later
#declare package_manager

if uname -v | grep Ubuntu > /dev/null || command -v apt-get > /dev/null; then
	echo "Detected Ubuntu"
	#package_manager="apt-get install"
	# TODO: Add to this list if needed

	# Add neovim ppa if needed
	if ! grep -q "^deb .*neovim-ppa/stable" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
		echo "Adding neovim-ppa/stable"
		sudo add-apt-repository ppa:neovim-ppa/stable
	else
		echo "Skipping neovim repository"
	fi

	# Install apt-fast
	if ! grep -q "^deb .*apt-fast/stable" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
		echo "Addomg apt-fast/stable"
		sudo add-apt-repository ppa:apt-fast/stable
	else
		echo "Skipping apt-fast repository"
	fi

	echo "Updating and installing packages"
	sudo apt-get -qq update
	sudo apt-get -qq upgrade
	sudo apt-get -qq install git git-core wget curl gcc python python3 vim zsh software-properties-common python-dev python-pip python3-dev python3-pip fonts-powerline neovim apt-fast

	if [[ $SHELL != "/usr/bin/zsh" ]]; then
		echo "Changing shell to zsh"
		chsh -s $(which zsh)
	else
		echo "Skipping changing shell"
	fi

	# Install Oh-my-zsh
	if [[ -d .oh-my-zsh ]]; then
		echo "Installing oh-my-zsh"
		cd
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		cd ~/.oh-my-zsh/custom/plugins
		git clone https://github.com/zsh-users/zsh-syntax-highlighting
		git clone https://github.com/zsh-users/zsh-autosuggestions
	else
		echo "Skipping install oh-my-zsh"
	fi

elif uname -v | grep ARCH > /dev/null; then
	#package_manager="pacman -S"
	sudo pacman -S pacaur xorg-minimal xorg-fonts xf86-input-synaptics xf86-video-intel base-devel xinit xorg-server rxvt-unicode feh ffmpeg arandr mpv wget curl rofi python-pip python-netifaces python-psutil NetworkManager network-manager-applet vim nvim w3m ranger mediainfo poppler highlight tmux calcurse htop newsbeuter moc firefox qutebrowser ImageMagick transmission-gtk transmission atool libcaca compton transset blender gimp texlive MultiMarkdown mupdf evince audacity rsync youtube-dl openssh syncthing noto-fonts-cjk noto-fonts-emoji cups screenFetch neofetch scrot unzip git lmms p7zip font-tamsyn speedometer neomutt font-awesome mypaint pandoc xdotool unclutter-xfixes zsh
	# TODO: Add more here if needed
fi

if [[ -z `git config --global user.email` ]] || [[ -z `git config --global user.name` ]]; then
	echo "Enter email for git config: "
	read email
	echo "Enter name for git config: "
	read name

	git config --global push.default simple
	git config --global user.email "$email"
	git config --global user.name "$name"

fi

. deploy.sh

exit 0
