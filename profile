# default umask is set in /etc/profile; for setting the umask for ssh logins,
# install and configure the libpam-umask package.
#umask 022

# if running bash command interpreter sources ~/.profile for login shells. bash
# does not read ~/.profile if ~/.bash_profile or ~/.bash_login exists.
# see /usr/share/doc/bash/examples/startup-files for examples (bash-doc pkg).

export XDG_SESSION_TYPE=x11
[[ $BASH != *bash* ]] && { return; }    # don't echo anything here, spoils startup
[[ -f ~/.bashrc ]] && { source ~/.bashrc; }
#mesg n
