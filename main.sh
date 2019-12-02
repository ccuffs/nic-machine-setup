#!/usr/bin/bash

#######################################################################
#
# Script para configuracao de maquinas novas do curso
# de Ciencia da Computacao da Universidade Federal da Fronteira Sul.
#
# Uso:
#	git clone https://github.com/ccuffs/nic-machine-setup
#	chmod +x ./nic-machine-setup/main.sh
#	sudo ./nic-machine-setup/main.sh
#
# Date: 2019-12-02
# License: MIT
# Author: Fernando Bevilacqua <fernando.bevilacqua@uffs.edu.br>
#
#######################################################################

CURRENT_DIRECTORY=$(cd `dirname $0` && pwd)
APPS_DIR="apps"
LOGS_DIR=$CURRENT_DIRECTORY/logs

mkdir -p $LOGS_DIR

for category_dir in "$CURRENT_DIRECTORY/$APPS_DIR"/*
do
  category_name="$(basename $category_dir)"
  echo "Installing: $category_name"

  for script in "$category_dir"/*.sh
  do
    script_name=$(basename -- "$script")
    script_label="${script_name%.*}"
    
    echo " - $script_label"
    sh "$script" > $LOGS_DIR/$category_name-$script_name.log 2>&1
  done
done

echo "Done!"
