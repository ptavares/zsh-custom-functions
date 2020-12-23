#!/bin/zsh
# Custom plugin for zsh
#
# Personal custom functions
#
# Author : Patrick Tavares <tavarespatrick01@gmail.com>
#

### Commons ###
echoArg() {
  echo "> $1"
}


### Command enhancement functions ###
.1() { cd ../ ; }                                  # Go back 1 directory level
.2() { cd ../../ ; }                               # Go back 2 directory levels
.3() { cd ../../../ ; }                            # Go back 3 directory levels
.4() { cd ../../../../ ; }                         # Go back 4 directory levels
.5() { cd ../../../../../ ; }                      # Go back 5 directory levels
.6() { cd ../../../../../../ ; }                   # Go back 6 directory levels
root() { sudo su - ; }                             # root         : Switch to root user using sudo
nHere() { nautilus . ; }                           # nHere        : Opens current directory in Nautilus
n() { nautilus ; }                                 # n            : Opens a Nautilus
c() { clear ; }                                    # c            : Clear terminal display
path() { echo -e ${PATH//:/\\n} ; }                # path         : Echo all executable Paths
show_options() { shopt ; }                         # Show_options : Display bash options settings
ducks() { du -cksh * | sort -hr | head -n 15}      # ducks        : List by size directories
mkdirCd() {                                        # mkdirCd      : Makes new Dir and jumps inside
    if (( $# != 1 ))
      then
        echoArg "Usage:  $0 [dirName]"
    else
        mkdir -p "$1" && cd "$1" ;
    fi
}

extract() {i                                       # extract      : Extract common arch files
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1       ;;
      *.tar.gz)    tar xvzf $1       ;;
      *.bz2)       bunzip2 -v $1     ;;
      *.rar)       unrar x $1        ;;
      *.gz)        gunzip -v $1      ;;
      *.tar)       tar xvf $1        ;;
      *.tbz2)      tar xvjf $1       ;;
      *.tgz)       tar xvzf $1       ;;
      *.zip)       unzip -v $1       ;;
      *.Z)         uncompress -v $1  ;;
      *.7z)        7z x $1           ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### Functions (network) ###
# Public ip
myip() { curl -s ifconfig.me }
# Private ip
ipLocal() {
  for i in $(hostname -I); do
    name=$(ip a | grep $i | grep -oE '[^ ]+$')
    mac=$(ip -o link | grep $name | awk '$2 != "lo:" {print $(NF-2)}')
    echo "$name - ip : $i - mac : $mac"
  done
}
httpDebug() { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

### Functions (system) ###
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }
infos() {
  echo -e "Currently logged on        : ${HOST}"
  echo -e "Additional information:    : $(uname -a)"
  echo -e "Current date:              : $(date)"
  echo -e "Machine stats:             : $(uptime)"
  echo -e "Public facing IP Address   : $(myip)"
  echo -e "Users logged on:           : \n$(w -h|sed "s/^/\t\t\t     /")"
  echo
}


### Functions (Git) ###
gitStoreCredentials() {
  git config credential.helper store
}

initLocalGitConfig() {
  if (( $# != 2 ))
    then
      echoArg "Usage:  $0 [GitUserName] [GitUserPassword]"
  else
      git config user.name $1 ; git config user.email $2;
  fi
}


### Custom Alias
alias l.='/usr/bin/ls -d .*'
alias lsd='/usr/bin/ls -l | grep "^d"'
alias lr='/usr/bin/ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
