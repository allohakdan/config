#!/bin/bash 
if [ ! -f ~/.ssh/config ]; then
    echo "Copying ssh config file"
    cp ~/.dan/scripts/setup/.ssh/config ~/.ssh/config
fi
cd ~/.ssh
if [ -f ~/.ssh/id_rsa.home -a -f ~/.ssh/id_rsa.work -a -f ~/.ssh/id_rsa.code ]; then 
    echo "Looks like you have all the keys setup!"
else
    echo "Passphrase to decrypt gpg protected ssh key files:"
    read -s sekret
fi
if [ ! -f ~/.ssh/id_rsa.home ]; then
    echo "Decrypting id_rsa.home"
    cp ~/.dan/scripts/setup/.ssh/id_rsa.home.asc .
    gpg -d --passphrase $sekret id_rsa.home.asc > id_rsa.home
    chmod 700 id_rsa.home
    ssh-keygen -y -f id_rsa.home > id_rsa.home.pub
fi
if [ ! -f ~/.ssh/id_rsa.work ]; then
    echo "Decrypting id_rsa.work"
    cp ~/.dan/scripts/setup/.ssh/id_rsa.work.asc .
    gpg -d --passphrase $sekret id_rsa.work.asc > id_rsa.work
    chmod 700 id_rsa.work
    ssh-keygen -y -f id_rsa.work > id_rsa.work.pub
fi
if [ ! -f ~/.ssh/id_rsa.code ]; then
    echo "Decrypting id_rsa.code"
    cp ~/.dan/scripts/setup/.ssh/id_rsa.code.asc .
    gpg -d --passphrase $sekret id_rsa.code.asc > id_rsa.code
    chmod 700 id_rsa.code
    ssh-keygen -y -f id_rsa.code > id_rsa.code.pub
fi
 
