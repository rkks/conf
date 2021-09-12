#  DETAILS: bash configuration to be sourced.
#  CREATED: 07/01/06 15:24:33 IST
# MODIFIED: 12/Sep/2021 11:47:40 IST
#
#   AUTHOR: Ravikiran K.S., ravikirandotks@gmail.com
#  LICENCE: Copyright (c) 2013, Ravikiran K.S.

# Always leave the code you're editing a little better than you found it
[[ $BASH != *bash* ]] && { return $EINVAL; }        # don't echo anything here, spoils ubuntu startup
[[ $- == *i* ]] && { IUSER=yes; export PS1="[\D{%d/%b/%y} \t|\u@\h:\w!$?]\r\n$ "; } || { unset IUSER; } # interactive shell.
[[ $0 == -* ]]  && { LOGIN=yes; } || { unset LOGIN; }                                       # detect login shell

#======================================= PreLoad =========================================
#set -uvx   # debugging. exec 2> ~/bash.$$.log && exit 0
umask 0022  # override default umask in /etc/profile. 0022 is too limiting, 0077 is too liberal.

# Global info. Available to all sub-shells.
[[ -z $TERM || "$TERM" == "dumb" ]] && export TERM=xterm
[[ -z $USER ]]      && export USER=$(id -nu)        # just in case
[[ -f ~/.home ]]    && export HOME=$(cat ~/.home) || { [[ -z $HOME ]] && export HOME=~; }  # Undefined in 'env -i bash'. /home/$(id -nu) is unreliable
[[ -z $HOSTNAME ]]  && export HOSTNAME=$(uname -n)  # hostname setting
[[ -z $SHELL ]]     && export SHELL=$BASH           # complete path is necessary. otherwise, breaks 'script'./bin/bash
[[ -z $UNAMES ]]    && export UNAMES=$(uname -s)    # machine type: Linux, FreeBSD, Darwin, SunOS
export PATH=".:$HOME/scripts/bin:$HOME/tools/$UNAMES/bin:/usr/games:/usr/gnu/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

[[ -e ~/.bashrc.ext ]] && { source ~/.bashrc.ext; }         # External bashrc.
test -z "$IUSER" && return

if [ ! -z $(which toilet) ]; then
    toilet -f wideterm -F border "# -- PLEASE DO NOT USE THIS MACHINE -- ##CONTACT:RAVIKIRANKS@VERSA-NETWORKS.COM#"
else
    printf "##########################################################################\n"
    printf "# PLEASE DO NOT USE THIS MACHINE, CONTACT RAVIKIRANKS@VERSA-NETWORKS.COM #\n"
    printf "##########################################################################\n"
fi

[[ -f $HOME/conf/custom/bashopts ]] && { source $HOME/conf/custom/bashopts; }    # history+term enable always
[[ -f $HOME/.bashrc.dev ]] && alias rk="source ~/.bashrc.dev"   # Never-ever source bashrc.dev in .bashrc. Breaks external scripts
[[ ! -z $SSH_CONNECTION ]] && echo "SSH login details: $SSH_CONNECTION"          # $SSH_CLIENT
[[ ! -z $(which brscan-skey) ]] && sudo brscan-skey
# Do not print anything on .bashrc end. Because .profile sources this and causes prompt on Ubuntu GUI login
