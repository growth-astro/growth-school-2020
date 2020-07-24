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

get_notebooks
initialize_conda
