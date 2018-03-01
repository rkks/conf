# command interpreter sources ~/.profile for login shells. bash do not read ~/.profile if ~/.bash_profile or ~/.bash_login exists.
[[ $BASH != *bash* ]] && { return; }        # don't echo anything here, spoils ubuntu startup
[[ -f ~/.bashrc ]] && { source ~/.bashrc; }
#mesg n
