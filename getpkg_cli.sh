#!/bin/bash

PKGS="vim cscope exuberant-ctags build-essential cmake htop tree curl wget zip git"

for pkg in $PKGS; do
  sudo apt install -y $pkg >/dev/null 2>&1 && printf "$pkg OK!\n" || printf "$pkg NO!\n"
done
