# command interpreter sources ~/.profile for login shells. bash do not read ~/.profile if ~/.bash_profile or ~/.bash_login exists.
[[ ! -z ${BASH} -a -f ~/.bashrc ]] && { source ~/.bashrc; }
#mesg n
