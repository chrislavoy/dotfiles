# Reinstall SpaceVim along with useful bunch of tools that work well together with SpaceVim.
# This is for Ubuntu 20.04

sudo apt install -y ctags miscfiles python3-dev python3-pip rsync shellcheck software-properties-common wbritish wbritish-huge ruby ruby-dev nodejs gcc g++ make universal-ctags python3-pygments ripgrep
sudo select-default-wordlist

sudo apt-get update
sudo apt-get install -y --reinstall neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 5
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 5
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 5
sudo update-alternatives --config vi
sudo update-alternatives --config vim
sudo update-alternatives --config editor
sudo pip3 install --upgrade pynvim msgpack flake8 yapf autoflake isort coverage jedi
sudo gem install neovim
sudo npm install -g neovim eslint jsonlint
rm -rf ~/.vim* ~/.config/*vim* ~/.config/*Vim* ~/.SpaceVim ~/.cache/*vim* ~/.cache/*Vim* ~/.cache/neosnippet ~/.local/share/*vim*
mkdir -p ~/.local/share/nvim/shada
curl -sLf https://spacevim.org/install.sh | bash

pushd ~/.SpaceVim
git checkout v1.7.0
popd

# launch neo-vim to download and install plugins

# Patch up outdated deoplete-go so that it will not keep trying to launch the legacy gocode
sed -i '/def gather_candidates/a\        return []' ~/.cache/vimfiles/repos/github.com/zchee/deoplete-go/rplugin/python3/deoplete/sources/deoplete_go.py
sed -i '/def get_complete_result/a\        return []' ~/.cache/vimfiles/repos/github.com/zchee/deoplete-go/rplugin/python3/deoplete/sources/deoplete_go.py
sed -i '/def find_gocode_binary/a\        return "/bin/true"' ~/.cache/vimfiles/repos/github.com/zchee/deoplete-go/rplugin/python3/deoplete/sources/deoplete_go.py
echo 'finish' >  ~/.cache/vimfiles/repos/github.com/zchee/deoplete-go/plugin/deoplete-go.vim

# Launch neo-vim and type :VimProcInstall followed by enter, then :UpdateRemotePlugins followed by enter.
