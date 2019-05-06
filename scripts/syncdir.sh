syncdir() {
    REPO=$1
    DIR=$2
    FILETYPE=$3

    GITCMD="git -c user.name=$HOSTNAME -c user.email=$(whoami)@$HOSTNAME.com"

    # Turns on command echoing, for debugging
    # set -x # Echo On

    # Initialize the directory if it doesn't already exist
    if [[ ! -e $DIR ]]; then
        echo ".:. Initializing Sync Directory: $DIR"
        mkdir -p $DIR
    fi

    pushd $DIR

    # Check if DIR is a git repo
    if [[ ! -d .git ]]; then
        echo ".:. Initializing Git Repo: $REPO"
        $GITCMD clone $REPO .
    fi

    # Hide any local changes
    echo ".:. Stashing local changes"
#    $GITCMD stash
    $GITCMD stash create 3d25c51cbd5a1469c32f88100dcc9446
    # Check if stash stashed anything
    $GITCMD stash list | grep -q "3d25c51cbd5a1469c32f88100dcc9446"
    STASHED_DATA=$?
    if [ $STASHED_DATA -eq 0 ]; then
        echo ".:. FOUND local changes, saved"
    else
        echo ".:. no local changes found"
    fi


    # Update the Repo
    echo ".:. Retreiving Updates"
    $GITCMD pull origin master
    # Check that pull succeded
    if [ `$GITCMD rev-parse master` != `$GITCMD rev-parse origin/master` ]; then
        echo "ERROR: master and origin/master are out of sync! Please correct manually!"
        popd
        exit 1
    fi

    # Restore local changes
    if [ $STASHED_DATA -eq 0 ]; then
        echo ".:. Recalling local changes"
        $GITCMD stash apply
        $GITCMD stash drop
    fi

    echo ".:. saving local changes"
    # https://stackoverflow.com/a/2855161 - recursively add files
    find . -name "*.$FILETYPE" | xargs $GITCMD add
    $GITCMD commit -am '.'

    # Resync to the cloud
    if [ `$GITCMD rev-parse master` != `$GITCMD rev-parse origin/master` ]; then
        echo ".:. Syncing local changes to cloud"
        git push origin master
    fi

    popd

}
