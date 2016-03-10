#  DETAILS: bash configuration to be sourced.
#  CREATED: 07/01/06 15:24:33 IST
# MODIFIED: 03/09/16 02:40:47 PST
#
#   AUTHOR: Ravikiran K.S., ravikirandotks@gmail.com
#  LICENCE: Copyright (c) 2013, Ravikiran K.S.

[[ $BASH != *bash* ]] && { echo "Not a bash shell "; return $EINVAL; }      # any inconsistency
[[ $- == *i* ]] && { INTERACTIVE=yes; export PS1_SHORT="[\D{%b/%d} \t|\w]$ "; }    # interactive shell.
[[ $0 == -* ]]  && { LOGIN=yes; } || { unset LOGIN; }                       # detect login shell

#======================================= PreLoad =========================================
#set -uvx   # debugging. exec 2> ~/bash.$$.log && exit 0
#xhost +
ulimit -c 100000000 # '-c unlimited' can not be used by non-root user. use 'ulimit -S -c 0' to disable core dumps.
umask 0022          # override default umask in /etc/profile. 0022 is too limiting, 0077 is too liberal.

# Global info. Available to all sub-shells
: ${HOME=~}         # $(echo "/homes/"$(id -nu)) creates problem on machines where users are not mounted on /homes
: ${SHDEBUG=no}     # Debugging is disabled by default
export SHELL=$BASH          # complete path is necessary. otherwise, breaks 'script'./bin/bash
export PS1=$PS1_SHORT       # initial prompt
[[ -f ~/.home ]] && { export HOME=$(cat ~/.home); }     # over-ride home directory
export PATH="/usr/gnu/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH=".:~/csco/scripts/bin:~/scripts/bin:~/tools/$UNAMES/bin:$PATH"
export HOSTNAME=$(uname -n) # hostname setting
export UNAMES=$(uname -s)   # machine type: Linux, FreeBSD, Darwin, SunOS

[[ -e ~/.bashrc.ext ]] && { source ~/.bashrc.ext; }     # External bashrc.
test -n "$INTERACTIVE" && { alias rkks="source ~/.bashrc.dev"; uname -npsr; uptime; } || { source ~/.bashrc.dev; }
