#!/bin/bash 
### DEPRECATED ###
### Please use ``ssh-key-decrypt /path/to/key.asc``
#

# if [ ! -f ~/.ssh/config ]; then
#     echo "Copying ssh config file"
#     cp ~/.dan/scripts/setup/.ssh/config ~/.ssh/config
# fi
cd $MINE/.ssh
if [ -s $MINE/.ssh/id_rsa.home -a -s $MINE/.ssh/id_rsa.home.pub -a -s $MINE/.ssh/id_rsa.work -a -s $MINE/.ssh/id_rsa.work.pub -a -s $MINE/.ssh/id_rsa.code -a -s $MINE/.ssh/id_rsa.code.pub ]; then 
    echo "Looks like you have all the keys setup!"
    exit 0
else
    echo "Passphrase to decrypt gpg protected ssh key files:"
    read -s sekret

    if [ ! -s $MINE/.ssh/id_rsa.home ]; then
        echo "Decrypting id_rsa.home"
        gpg -d --passphrase $sekret --no-use-agent -q id_rsa.home.asc > id_rsa.home
        chmod 700 id_rsa.home
    fi
    if [ -s $MINE/.ssh/id_rsa.home -a ! -s $MINE/.ssh/id_rsa.home.pub ]; then
        echo "Generating public key from id_rsa.home"
        ssh-keygen -y -f id_rsa.home > id_rsa.home.pub
    fi
    if [ ! -s ~/.ssh/id_rsa.work ]; then
        echo "Decrypting id_rsa.work"
        gpg -d --passphrase $sekret --no-use-agent -q id_rsa.work.asc > id_rsa.work
        chmod 700 id_rsa.work
    fi
    if [ -s $MINE/.ssh/id_rsa.work -a ! -s $MINE/.ssh/id_rsa.work.pub ]; then
        echo "Generating public key from id_rsa.work"
        ssh-keygen -y -f id_rsa.work > id_rsa.work.pub
    fi
    if [ ! -s ~/.ssh/id_rsa.code ]; then
        echo "Decrypting id_rsa.code"
        gpg -d --passphrase $sekret --no-use-agent -q id_rsa.code.asc > id_rsa.code
        chmod 700 id_rsa.code
    fi
    if [ -s $MINE/.ssh/id_rsa.code -a ! -s $MINE/.ssh/id_rsa.code.pub ]; then
        echo "Generating public key from id_rsa.code"
        ssh-keygen -y -f id_rsa.code > id_rsa.code.pub
    fi

fi
