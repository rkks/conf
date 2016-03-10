#  DETAILS: bash configuration to be sourced.
#  CREATED: 07/01/06 15:24:33 IST
# MODIFIED: 03/10/16 06:12:27 PST
#
#   AUTHOR: Ravikiran K.S., ravikirandotks@gmail.com
#  LICENCE: Copyright (c) 2013, Ravikiran K.S.

[[ $BASH != *bash* ]] && { echo "Not a bash shell "; return $EINVAL; }      # any inconsistency
[[ $- == *i* ]] && { IUSER=yes; export PS1_SHORT="[\D{%b/%d} \t|\w]$ "; }   # interactive shell.
[[ $0 == -* ]]  && { LOGIN=yes; } || { unset LOGIN; }                       # detect login shell

#======================================= PreLoad =========================================
#set -uvx   # debugging. exec 2> ~/bash.$$.log && exit 0
umask 0022  # override default umask in /etc/profile. 0022 is too limiting, 0077 is too liberal.

# Global info. Available to all sub-shells. HOME always defined.
# [[ -z $HOME ]] && export HOME=~;                  # $(echo "/homes/"$(id -nu)) creates problem on non-cisco machines
: ${SHDEBUG=no}                                     # Debugging is disabled by default
[[ -z $HOSTNAME ]]  && export HOSTNAME=$(uname -n)  # hostname setting
[[ -z $SHELL ]]     && export SHELL=$BASH           # complete path is necessary. otherwise, breaks 'script'./bin/bash
[[ -z $UNAMES ]]    && export UNAMES=$(uname -s)    # machine type: Linux, FreeBSD, Darwin, SunOS
[[ -f ~/.home ]]    && export HOME=$(cat ~/.home);  # over-ride home directory
UPATH="/usr/gnu/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
UPATH=".:~/csco/scripts/bin:~/scripts/bin:~/tools/$UNAMES/bin:~/bin:$UPATH"

[[ -e ~/.bashrc.ext ]] && { source ~/.bashrc.ext; }     # External bashrc.
test -n "$IUSER" && { alias rk=". ~/.bashrc.dev"; export PS1=$PS1_SHORT; export PATH="$UPATH"; uname -npsr; uptime; }
