#  DETAILS: bash configuration to be sourced.
#  CREATED: 07/01/06 15:24:33 IST
# MODIFIED: 04/24/16 09:35:13 IST
#
#   AUTHOR: Ravikiran K.S., ravikirandotks@gmail.com
#  LICENCE: Copyright (c) 2013, Ravikiran K.S.

# Always leave the code you're editing a little better than you found it

[[ $BASH != *bash* ]] && { echo "Not a bash shell "; return $EINVAL; }                      # any inconsistency
[[ $- == *i* ]] && { IUSER=yes; export PS1="[\D{%d/%b/%y} \t|\u@\h:\w!$?]\r\n$ "; } || { unset IUSER; }     # interactive shell.
[[ $0 == -* ]]  && { LOGIN=yes; } || { unset LOGIN; }                                       # detect login shell

#======================================= PreLoad =========================================
#set -uvx   # debugging. exec 2> ~/bash.$$.log && exit 0
umask 0022  # override default umask in /etc/profile. 0022 is too limiting, 0077 is too liberal.

# Global info. Available to all sub-shells.
# $(echo "/homes/"$(id -nu)) creates problem on non-cisco machines
[[ -z $HOME ]]      && export HOME=~                # $HOME undefined when bash run with 'env -i'.
: ${SHDEBUG=no}                                     # Debugging is disabled by default
[[ -z $HOSTNAME ]]  && export HOSTNAME=$(uname -n)  # hostname setting
[[ -z $SHELL ]]     && export SHELL=$BASH           # complete path is necessary. otherwise, breaks 'script'./bin/bash
[[ -z $UNAMES ]]    && export UNAMES=$(uname -s)    # machine type: Linux, FreeBSD, Darwin, SunOS
[[ -f ~/.home ]]    && export HOME=$(cat ~/.home);  # over-ride home directory
export PATH=".:~/scripts/bin:~/tools/$UNAMES/bin:~/bin:/usr/gnu/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

[[ -e ~/.bashrc.ext ]] && { source ~/.bashrc.ext; }         # External bashrc.
test -n "$IUSER" && { alias rk="source ~/.bashrc.dev"; }    # Never-ever source bashrc.dev in .bashrc. Breaks external scripts

# Do not print anything on .bashrc end. Because .profile sources this and causes prompt on Ubuntu GUI login
