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

# Install SSH Configuration
# [db] removed from use - this can be done manually for each key desired
echo "To Install SSH Keys, open a new terminal. Run chdan. Then run ssh-key-decrypt .dan/.ssh/id_rsa.keyname.asc"
echo "To fix caps lock system wide and permenently on Linux, run ./.dan/scripts/setup/fixcapslock.sh"

#~/.dan/scripts/setup/ssh_config.sh
