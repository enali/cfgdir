#!/bin/bash

EDITOR=vim
USER=enali
EMAIL=enalix@163.com
# PUBID=

#=> configure git
git config --global core.editor $EDITOR
git config --global user.name $USER
git config --global user.email $EMAIL
git config --global color.ui true
git config --global credential.helper cache

#=> extra config
# git config --global user.signingkey $PUBID

#=> alias
git config --global alias.cl clone
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.mg merge
git config --global alias.rt remote
