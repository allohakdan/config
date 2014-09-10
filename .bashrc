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

# To get our .gitconfig file to work, we have to temporarly
# change our home directory location - see .bashrc_git.
# To preemptively avoid weirdness, such as with vim, 
# fix the value of MINE even if HOME is wrong
if [ ${HOME##*/} = ".dan" ]; then
    MINE=$HOME
fi
export MINE=$MINE

source_if_exists() {
# First argument is file to try to source, remaining arguments are passed in
    if [ -f "$1" ]; then
        source $1 ${*:2}
    fi
}

exec_if_exists() {
# Try to execute command, fail silently 
    if [ `type -t $1` ]; then
        $1
    fi
}

# Import CLI color names
# Do this first, so that Host specific settings can get at it before we set the fancy terminal
source_if_exists $MINE/.bashrc_colors $@


# OS Specific Settings
# OSX is in .bashrc.Darwin and Linux in .bashrc.Linux
source_if_exists $MINE/.bashrc_`uname` $@

# Global Settings - These seem to work everywhere so far
alias ll='ls -al'
alias la='ls -a'
alias lx='ls -lXB'
alias cd..='cd ..'
alias grep='grep -n --color=always'
#alias dl="$MINE/scripts/dl"
alias rm='rm -i'

# Vim editor settings
source_if_exists $MINE/.bashrc_vim
# Tmux settings
alias tmux="tmux -f$MINE/.tmux.conf"
# SSH Settings
# alias ssh="echo "hi";ssh -F $MINE/.ssh/config"
alias ssh="$MINE/scripts/ssh"
# Git Settings
source_if_exists $MINE/.bashrc_git $@
# Ros Settings
source_if_exists $MINE/.bashrc_ros

# Machine Specific Settings
# If hostname is "robot-lab3" then put that machines settings in .bashrc.robot-lab3
# source_if_exists $MINE/.bashrc_`hostname`
# edit: it is kind of annoying when you get assigned a new hostname, so I wrote a 
# function that lets me get it using scutil in osx, but still hostname in linux.
# Must come before the export PS1 line
source_if_exists $MINE/.bashrc_$(get_machine_name) $@

# Fancy Terminal with pretty colors
# Note that the git terminal stuff is looking for '\n$ ' at the end of the string so
# if you change it you must change it there too
export PS1="\n${USRLOCID}\u@\h ${TIMESTMP}\d \@\n${PATHLINE}\w${NONE}\n$ "

# Must Come after the export PS1 line
exec_if_exists set-git-prompt
exec_if_exists set-ros-prompt
