alias vim="vim -u $MINE/.vimrc"
export EDITOR=vim
# Create the vim backup directory if it does not exist
if [ ! -d $MINE/.vimbkup ]; then
  mkdir $MINE/.vimbkup
fi

