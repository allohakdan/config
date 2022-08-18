# Downloading

### On Linux

use from home directory.

```
bash <(wget -qO- http://dbrks.co/installchdan)
```

### Manually with GIT

Checkout the repository in the home directory to a ~/.dan directory

For read-only

```
$ cd
$ git clone https://github.com/allohakdan/config.git .dan
```

For read/write

```
$ cd
$ git clone git@github.com/allohakdan/config.git .dan
```

# Installing

Install other necesities by calling 

```
$ ~/.dan/scripts/setup.sh
```

Restart terminal window, and run ``chdan``

Decrypt SSH Keys

```
$ ssh-key-decrypt .dan/.ssh/id_rsa.keyname.asc
```

Optionally link SSH Directories

```
$ cd ~ && ln -s .dan/.ssh
```

Optionally link vimrc to home directory (for macvim)

```
$ cd ~ && ln -s .dan/.vimrc
```

On Linux - fix caps lock to escape system wide and permently

```
$ ./.dan/scripts/setup/fixcapslock.sh
```
