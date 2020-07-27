#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

# Exec the specified command or fall back on bash
if [ $# -eq 0 ]; then
    cmd=( "bash" )
else
    cmd=( "$@" )
fi

run-hooks () {
    # Source scripts or run executable files in a directory
    if [[ ! -d "$1" ]] ; then
        return
    fi
    echo "$0: running hooks in $1"
    for f in "$1/"*; do
        case "$f" in
            *.sh)
                echo "$0: running $f"
                source "$f"
                ;;
            *)
                if [[ -x "$f" ]] ; then
                    echo "$0: running $f"
                    "$f"
                else
                    echo "$0: ignoring $f"
                fi
                ;;
        esac
    done
    echo "$0: done running hooks in $1"
}

run-hooks /usr/local/bin/start-notebook.d

# add group/user, switch to their home directory
echo "=========ADDING GROUP+USER==========" 1>&2
#groupadd -g $NB_GID -o ${NB_GROUP:-${NB_USER}}
#useradd --home "/home/$NB_USER" -u $NB_UID -g $NB_GID -G 100 -l $NB_USER
groupadd -g $NB_UID $NB_USER || echo "groupadd failed"
useradd -m -u $NB_UID -g $NB_USER -G users $NB_USER -s /bin/bash || echo "useradd failed"
tail -n 1 /etc/passwd 1>&2
tail -n 1 /etc/group 1>&2
grep users /etc/group 1>&2
ls -l /home 1>&2
cd "/home/$NB_USER"
echo "=========DONE============" 1>&2

# Add $CONDA_DIR/bin to sudo secure_path
sed -r "s#Defaults\s+secure_path\s*=\s*\"?([^\"]+)\"?#Defaults secure_path=\"\1:$CONDA_DIR/bin\"#" /etc/sudoers | grep secure_path > /etc/sudoers.d/path

# Exec the command as NB_USER with the PATH and the rest of
# the environment preserved
run-hooks /usr/local/bin/before-notebook.d
echo "Executing the command: ${cmd[@]}"
exec sudo -E -H -u $NB_USER PATH=$PATH XDG_CACHE_HOME=/home/$NB_USER/.cache PYTHONPATH=${PYTHONPATH:-} "${cmd[@]}"
