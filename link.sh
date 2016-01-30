#!/bin/bash

cfgdir=`pwd`

cfgfile="vimrc gvimrc tmux.conf bash_aliases bash_env"
for cf in $cfgfile; do
  if [ -f ~/.$cf ]; then
    mv ~/.$cf ~/.$cf.bk
  fi
  ln -s $cfgdir/$cf ~/.$cf
done
