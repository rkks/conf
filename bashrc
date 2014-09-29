#  DETAILS: bash configuration to be sourced.
#  CREATED: 07/01/06 15:24:33 IST
# MODIFIED: 09/29/14 16:00:23 IST
# REVISION: 1.0
#
#   AUTHOR: Ravikiran K.S., ravikirandotks@gmail.com
#  LICENCE: Copyright (c) 2013, Ravikiran K.S.

[[ $BASH != *bash* ]] && { echo "Not a bash shell "; return $EINVAL; }      # any inconsistency
[[ $- == *i* ]] && { INTERACTIVE=yes; PS1="[\D{%b/%d} \t|\u@\h:\w]$ "; }    # interactive shell.
[[ $0 == -* ]]  && { LOGIN=yes; } || { unset LOGIN; }                       # detect login shell

#======================================= PreLoad =========================================
#set -uvx   # debugging. exec 2> ~/bash.$$.log && exit 0
#xhost +
ulimit -c 100000000 # '-c unlimited' can not be used by non-root user. use 'ulimit -S -c 0' to disable core dumps.
umask 0022          # override default umask in /etc/profile. 0022 is too limiting, 0077 is too liberal.

# Global info. Available to all sub-shells
: ${HOME=~}         # $(echo "/homes/"$(id -nu)) creates problem on machines where users are not mounted on /homes
: ${SHDEBUG=no}     # Debugging is disabled by default
: ${HOSTNAME=$(uname -n)}   # hostname setting
export SHELL=$BASH         # complete path is necessary. otherwise, breaks 'script'./bin/bash
export UNAMES=$(uname -s)  # machine type: Linux, FreeBSD, Darwin, SunOS
export PATH="~/scripts/bin:~/tools/bin:/opt/X11/bin:/usr/gnu/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:."

[[ -f ~/.bashrc.pre ]] && { source ~/.bashrc.pre; }
export SCRIPT_LOGS=$HOME/.logs             # script logs
export CUSTOM_CONFS=$HOME/conf/custom      # user configs (not system recognized)
export COMPANY_CONFS=$HOME/csco/conf       # company specific configs
export UTIL_SCRIPTS=$HOME/scripts/utils/bash    # util scripts to be sourced

#======================================= Basic Utils =========================================
s="$UTIL_SCRIPTS/bash_utils.sh"; test -f $s && { source $s; unset s; } || { echo "[ERROR] $s not found"; exit $ENOENT; }
s="$UTIL_SCRIPTS/log_utils.sh"; test -f $s && { source $s; unset s; } || { echo "[ERROR] $s not found"; exit $ENOENT; }
log_init INFO $SCRIPT_LOGS/bashrc.log         # After sourcing bashrc, user scripts should define their own log-file

log NOTE "[SOURCE] Bash v$BASH_VERSION ($(id -un))";
source_script "$COMPANY_CONFS/bashrc";      # company env specifics
source_script "$CUSTOM_CONFS/toolrc";      # setup right paths
source_script "$UTIL_SCRIPTS/dev_utils.sh";   # Bash Functions. Always sourced prior to .alias
log DEBUG "cmd:$0. Basic Util Scripts Complete"

#======================================= Extended Utils =========================================
[[ -z "$BASH_VERSION" || -z "$PS1" || -z "$INTERACTIVE" ]] && return  # No further sourcing if not interactive shell

# Keep ~/.alias empty to avoid multiple times sourcing. No sourcing of /etc/bash_completion (more problems)
EXTENDED_SCRIPTS+=" $CUSTOM_CONFS/shopts"       # Shell Opts
EXTENDED_SCRIPTS+=" $CUSTOM_CONFS/envopts"      # Environmental Opts
EXTENDED_SCRIPTS+=" $CUSTOM_CONFS/bash.alias"   # Expand alias: '<ctrl><alt>e' OR '<esc><ctrl>e' (readline shortcut)
source_script $EXTENDED_SCRIPTS && unset EXTENDED_SCRIPTS
log DEBUG "[SOURCE] Extended Scripts Complete"

test -n "$INTERACTIVE" -a -n "$LOGIN" && (uname -npsr; uptime)
