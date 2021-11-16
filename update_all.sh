#!/usr/bin/sh
echo '[[ Running apt update ]]'
sudo apt -y update;
sudo apt -y upgrade --allow-downgrades;
sudo apt -y autoremove;
sudo apt -y autoclean;

echo
echo '[[ Running brew update ]]'
brew update;
brew upgrade;

 echo
 echo '[[ Running snap refresh ]]'
sudo snap refresh

echo
echo '[[ Running rustup update ]]'
rustup update

echo
echo '[[ Running pip update ]]'
python3 -m pip install --upgrade pip
#pip3 list --outdated --format=freeze | rg -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U 
python2 -m pip install --upgrade pip
#pip2 list --outdated --format=freeze | rg -v '^\-e' | cut -d = -f 1 | xargs -n1 pip2 install -U 

echo
echo '[[ Running npm update ]]'
sudo npm install -g npm

echo
echo '[[ Running flatpak update ]]'
flatpak update -y
