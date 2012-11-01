# .bashrc

# --- if bash is not your default shell ---
# use this to find out where bash is located
# $ which bash      => /usr/local/bin/bash ...
# change default shell to this path for this user
# $ chsh -s /usr/local/bin/bash dan
# verify that it worked
# grep ^dan /etc/passwd
# and finally, add the following line to .bash_profile
# . .bashrc

# All of my settings are in this directory prefix
MINE=~/.dan

# OS Specific Settings
# OSX is in .bashrc.Darwin and Linux in .bashrc.Linux
if [ -f $MINE/.bashrc.`uname` ]; then
    source $MINE/.bashrc.`uname`
fi

# Global Settings - These seem to work everywhere so far
alias ll='ls -al'
alias la='ls -a'
alias lx='ls -lXB'
alias cd..='cd ..'
alias grep='grep -n --color=always'
alias dl="$MINE/scripts/dl"
alias rm='rm -i'

# Vim editor settings
source $MINE/.bashrc.vim
# Tmux settings
alias tmux="tmux -f$MINE/.tmux.conf"

# Import CLI color names
# Do this first, so that Host specific settings can get at it before we set the fancy terminal
source $MINE/.bashrc.colors

# Machine Specific Settings
# If hostname is "robot-lab3" then put that machines settings in .bashrc.robot-lab3
if [ -f $MINE/.bashrc.`hostname` ]; then
   source $MINE/.bashrc.`hostname`
fi

# Fancy Terminal with pretty colors
# Note that the git terminal stuff is looking for '\n$ ' at the end of the string so
# if you change it you must change it there too
export PS1="\n${USRLOCID}\u@\h ${TIMESTMP}\d \@\n${PATHLINE}\w${NONE}\n$ "

# Super Git Terminal Mode
source $MINE/.bashrc.git
