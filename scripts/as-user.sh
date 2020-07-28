echo "running as: $(id)"

get_notebooks() {
    echo "get_notebooks()"
    # pull the notebooks
    examples_folder="/home/$NB_USER/growth"
    gitpuller https://github.com/growth-astro-school/growth-school-2020 master $examples_folder
}

initialize_conda() {
    echo "initialize_conda()"
    conda init bash

    FILE="/home/$NB_USER/.profile"
    if test -f $FILE; then
      echo "$FILE exists, will not alter it"
    else
      echo "source ~/.bashrc" > $FILE
    fi
}

initialize_desktop() {
    echo "initialize desktop()"
    # add in some desktop icons
    FILE="/nfs/misc/DS9.desktop"
    DEST="/home/$NB_USER/Desktop/DS9.desktop"
    if test -d "/home/$NB_USER/Desktop/"; then
      echo "/home/$NB_USER/Desktop/ exists"
    else
      echo "Creating /home/$NB_USER/Desktop/"
      mkdir /home/$NB_USER/Desktop/
    fi
    if test -f $DEST; then
      echo "$DEST exists, will not alter it"
    else
      cp $FILE $DEST
      echo "Copied $FILE to $DEST"
    fi
}

update_path() {
    BINDIR="/nfs/bin"
    if [[ :$PATH: == *:"$BINDIR":* ]] ; then
      echo "$BINDIR in path"
    else
      echo 'export PATH="/nfs/bin:$PATH"' >> /home/$NB_USER/.bashrc
    fi
}

get_notebooks
initialize_conda
initialize_desktop
update_path
