#!/usr/bin/env bash
# Usage: ./javacfg.sh [--add][--rm]

if [ -z $JAVA_HOME ]; then
  echo "Error: $JAVA_HOME is not set!"
  exit 1
fi

if ! $(which update-alternatives >/dev/null 2>&1); then
  echo "Error: Can't find update-alternatives command."
  echo "\tMaybe Your system isn't Ubuntu or Debian"
  exit 2
fi

# Usage: update_java_add cmd priority
update_java_add() {
  echo -n "update-alternatives install java cmd <$1> with priority <$2> ... "
  sudo update-alternatives --install $addr/$1 $1 $JAVA_HOME/bin/$1 $2 >/dev/null 2>&1
  success_or_not
}

# Usage: update_java_rm cmd
update_java_rm() {
  echo -n "update-alternatives remove java cmd <$1> ... "
  sudo update-alternatives --remove $1 $JAVA_HOME/bin/$1 >/dev/null 2>&1
  success_or_not
}

# Usage: success_or_not
success_or_not() {
  if [ $? = 0 ]; then 
    echo "successful"; 
  else 
    echo "something wrong"; 
  fi
}

addr=/usr/local/bin
priority=100

if [ $# != 1 ]; then
  echo "Usage: ./javacfg.sh [--add][--rm]"
  exit 3
fi

if [ $1 = "--add" ]; then
  echo "Will add all java cmd ... "
  echo "========================="
  for cmd in $(ls $JAVA_HOME/bin); do
    update_java_add $cmd $priority
  done
elif [ $1 = "--rm" ]; then
  echo "Will rm all java cmd ... "
  echo "========================="
  for cmd in $(ls $JAVA_HOME/bin); do
    update_java_rm $cmd
  done
fi

echo "========================="
echo -n "All cmd done: "
success_or_not

exit 0
