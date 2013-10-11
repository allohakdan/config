#!/bin/bash
if [[ `uname` == "Linux" ]]; then
    echo "Installing git,vim,tmux,ssh from apt"
    sudo apt-get install git-core vim tmux ssh exuberant-ctags
elif [[ `uname` == "Darwin" ]]; then
    # Test if at least these things are installed, python and vim report more then once...
    if [[ `port installed | cut -d @ -f 1 | egrep -c "wget|tmux|python27|watch|htop|iftop|vim"` > 8 ]]; then
        echo "Macport packages already installed, skipping"
    else
        echo "Installing wget,tmux,python,watch,htop,iftop,and vim from macports"
        sudo port install wget tmux python27 watch htop iftop vim
    fi
fi

if grep -qs chdan ~/.bashrc; then
    echo "chdan command already installed, skipping"
else
    echo "Installing chdan into .bashrc"
    echo "alias chdan='source ~/.dan/.bashrc'" >> ~/.bashrc
fi


if command -v dl >/dev/null 2>&1; then
    echo "dl has already been installed, skipping"
else
    echo "Installing dl script"
    cd /usr/local/bin
    sudo -E wget --no-check-certificate http://raw.github.com/allohakdan/dl/master/dl
    sudo chmod 755 dl
fi

# Install Vim Scripts
if [ ! -d ~/.vim ]; then
    echo "Creating .vim directory"
    mkdir ~/.vim
fi
if [ ! -d ~/.vim/plugin ]; then
    echo "Creating .vim/plugin directory"
    mkdir ~/.vim/plugin
fi
if [[ `ls ~/.vim/plugin | egrep -c "NERD_tree.vim|gnupg.vim|taglist.vim|diffchanges.vim|minibufexpl.vim"` == 5 ]]; then
    echo "vim scripts already installed, skipping"
else
    echo "Installing vim scripts"
fi
