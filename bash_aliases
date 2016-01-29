# alias for apt
alias acs='apt-cache search'
alias acp='apt-cache showpkg'
alias agi='sudo apt-get install'
alias agp='sudo apt-get purge'
alias agu='sudo apt-get update && sudo apt-get -y upgrade'
alias agc='sudo apt-get autoremove && sudo apt-get autoclean'
alias aar='sudo apt-add-repository'
# alias for base
alias ls='ls -F --color=auto'
alias l='ls -lh'
alias ll='ls -alhF'
alias lg='ll | grep'
alias h='history 15'
alias free='free -m'
alias cmount="mount | column -t"
alias tmux='tmux -2'
alias dirs='dirs -p -v'
alias chrome='google-chrome'
# you must install conda and create py2 and py3 environments
alias py2='source activate py2'
alias py-='source deactivate'
alias py3='source activate py3'
# emacs
# "$ emacs -daemon"
alias e="emacsclient -t"  #terminal client
alias ec="emacsclient -c"  #GUI client
# hadoop
alias hls='hdfs dfs -ls'
alias hrm='hdfs dfs -rm'
alias hpt='hdfs dfs -put'
alias hgt='hdfs dfs -get'
alias hct='hdfs dfs -cat'
alias hmv='hdfs dfs -mv'
alias hcp='hdfs dfs -cp'
alias hmd='hdfs dfs -mkdir'
alias hstart="hdfs namenode -format && start-dfs.sh && start-yarn.sh && mr-jobhistory-daemon.sh start historyserver && hdfs dfs -mkdir /user/$USER"
alias hstop="mr-jobhistory-daemon.sh stop historyserver && stop-yarn.sh && stop-dfs.sh"
# functions
mpg() { mvn archetype:generate -B -DarchetypeCatalog=internal -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.1 -DgroupId="$1" -DartifactId="$2" -Dversion=1.0.0;}
mcd() { mkdir -p "$1"; cd "$1";}
rcd() { rm -rf "$1/*"; cd "$1";}
vcd() { cd "$1"; vim; }
lcd() { cd "$1"; ls; }
backup() { cp "$1"{,.bak};}
md5check() { md5sum "$1" | grep "$2"; }
psg() { ps aux | grep "$1" | grep -v "grep"; }
psgk() { ps aux | grep "$1" | grep -v "grep" | awk '{print $2}' | xargs kill -9; }
