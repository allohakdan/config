#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(whoami)" == "root" ]; then
    echo "Please do not run this script as root."
    exit 1
fi

echo "Type Platform names to be installed, most generic first. Use exact name.\n"
$DIR/installer.sh $DIR/packages.yml list
read pnames
sudo $DIR/installer.sh $DIR/packages.yml install $pnames


# if [[ `uname` == "Linux" ]]; then
#     echo "Installing git,vim,tmux,ssh,pylint,flake8 from apt"
#     sudo apt-get install git-core vim tmux ssh exuberant-ctags pylint python-flake8 python-pip
# elif [[ `uname` == "Darwin" ]]; then
#     # Test if at least these things are installed, python and vim report more then once...
#     if [[ `port installed active | cut -d @ -f 1 | egrep -c " wget | tmux | python27 | py27-pylint | watch | htop | iftop | vim | gnupg | py27-flake8 | py27-pip"` -ge 11 ]]; then
#         echo "Macport packages already installed, skipping"
#     else
#         echo "Installing wget,tmux,python,pylint,watch,htop,iftop,vim,gnupg,flake8 from macports"
#         sudo port install wget tmux python27 py27-pylint watch htop iftop vim gnupg py27-flake8 py27-pip
#         sudo port install vim +python27
#         sudo port select --set python python27
#         sudo port select --set pylint pylint27
#         sudo port select --set flake8 flake827
#         sudo port select --set pip pip27
#     fi
# fi

if grep -Fq chdan ~/.bashrc; then
    echo "chdan command already installed, skipping"
    cat ~/.bashrc
else
    echo "Installing chdan into .bashrc"
    echo "alias chdan='source ~/.dan/.bashrc'" >> ~/.bashrc
fi


if command -v dl >/dev/null 2>&1; then
    echo "dl has already been installed, skipping"
else
    echo "Installing dl script"
    sudo pip install dl
#     cd /usr/local/bin
#     sudo -E wget --no-check-certificate http://raw.github.com/allohakdan/dl/master/dl
#     sudo chmod 755 dl
fi

# Install Vim Scripts
# These are now housed in the .dan directory
# if [ ! -d ~/.vim ]; then
#     echo "Creating .vim directory"
#     mkdir ~/.vim
# fi
# if [ ! -d ~/.vim/plugin ]; then
#     echo "Creating .vim/plugin directory"
#     mkdir ~/.vim/plugin
# fi
# if [[ `ls ~/.vim/plugin | egrep -c "NERD_tree.vim|gnupg.vim|taglist.vim|diffchanges.vim|minibufexpl.vim"` == 5 ]]; then
#     echo "vim scripts already installed, skipping"
# else
#     echo "Installing vim scripts"
#     cp ~/.dan/scripts/setup/.vim/plugin/* ~/.vim/plugin/
# fi

# Install SSH Configuration
# [db] removed from use - this can be done manually for each key desired
echo "To Install SSH Keys, open a new terminal. Run chdan. Then run ssh-key-decrypt .dan/.ssh/id_rsa.keyname.asc"
#~/.dan/scripts/setup/ssh_config.sh
