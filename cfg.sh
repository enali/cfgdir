#!/bin/bash

cfgdir=`pwd`

# make a symbol link
cfgfile="vimrc gvimrc tmux.conf bash_aliases bash_env"
for cf in $cfgfile; do
  if [ -f ~/.$cf ]; then
    mv ~/.$cf ~/.$cf.bk
  fi
  ln -s $cfgdir/$cf ~/.$cf
done

# add content to ~/.aashrc
echo "if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi" >> ~/.bashrc
echo "if [ -f ~/.bash_env ]; then . ~/.bash_env; fi" >> ~/.bashrc
