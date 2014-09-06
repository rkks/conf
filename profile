# command interpreter sources ~/.profile for login shells. bash do not read ~/.profile if ~/.bash_profile/~/.bash_login exists.

[ ! -z ${BASH} -a -f ~/.bashrc ] && { source /etc/bashrc; source ~/.bashrc; }

#mesg n
