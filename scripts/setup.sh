#!/bin/bash
echo "Installing git,vim,tmux,ssh from apt"
if [[ `uname` == "Linux" ]]; then
    sudo apt-get install git-core vim tmux ssh exuberant-ctags
fi
echo "Installing chdan into .bashrc"
echo "alias chdan='source ~/.dan/.bashrc'" >> ~/.bashrc

echo "Installing dl script"
cd /usr/local/bin
sudo -E wget https://raw.github.com/allohakdan/dl/master/dl
sudo chmod 755 dl


