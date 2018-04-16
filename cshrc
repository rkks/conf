# @(#)Cshrc 1.6 91/09/05 SMI
#################################################################
#
#   .cshrc file
#
#   initial setup file for interactive & noninteractive C-Shells
#
#################################################################
umask 022

#set up search path
set path = (. ~ /usr/openwin/bin /usr/local/bin /usr/sbin /usr/bin /sbin /bin)
set UNAMES = "`uname -s`"
if ( $UNAMES =~ FreeBSD ) then
    set path = (~/tools/bin/freebsd ~/tools/bin ~/scripts/bin $path)
else if ( $UNAMES =~ Linux ) then
    set path = (~/tools/bin/linux ~/tools/bin ~/scripts/bin $path)
else if ( $UNAMES =~ Darwin ) then
    set path = (~/scripts/bin /usr/bin /bin /usr/sbin /sbin /usr/local/bin /opt/X11/bin $path)
endif
set HOSTNAME = "`hostname`"

#Code Size Compilation
#set path = ($path /usr/temp/m68k-coff /usr/temp/m68k-coff/bin)

# skip remaining setup if not an interactive shell
if ($?USER == 0 || $?prompt == 0) exit

# settings  for interactive shells
unset autologout

if ($?prompt) then
    # An interactive shell -- set some stuff up
    set history=250
    #set savehist = 100
    #set ignoreeof      # Mandates to write 'logout' than Ctrl-D. Says 'Use "logout" to logout'
    set filec
    set fignore=.o
    # prompt could also be set to '[%B%m%b] %B%~%b%# '
    set prompt = "`whoami`@`hostname`[\!]% "
    set autolist
    set mail = (/var/mail/$USER)
    if ( $?tcsh ) then
        bindkey "^W" backward-delete-word
        bindkey -k up history-search-backward
        bindkey -k down history-search-forward
    endif
endif

# set up prompts
#setenv TERM xterm
if ( $TERM =~ xterm ) then
    alias title 'echo ]2\;`whoami`@`hostname`\:$cwd'
    alias fileT 'echo ]2\;\!*'
    alias TI 'echo ]1\;\!*'
    alias cd 'set old=$cwd; chdir \!*;title'
else
    alias cd 'set old=$cwd; chdir \!*'
endif

stty sane
stty erase '^?'     #  causes problem in vim
#biff y

# aliases for all shells
alias ls        'ls --color=auto -F'
alias b         'bash'
alias sx        'screen -x'
alias cp        'cp -i'
alias mv        'mv -i'
alias rm        'rm -i'
alias pwd       'echo $cwd'
alias back      'set back=$old; set old=$cwd; cd $back; pwd; unset back'
alias open      'chmod +w'
alias a         alias
alias "ls"      "ls -F"
alias hist      history
alias lock      xlock
alias cshrc     'source ~/.cshrc'
alias c         'clear'
