# @(#)Cshrc 1.6 91/09/05 SMI
#################################################################
#
#         .cshrc file
#
#         initial setup file for both interactive and noninteractive
#         C-Shells
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

# skip remaining setup if not an interactive shell
if ($?USER == 0 || $?prompt == 0) exit

#Framemaker
#setenv FMHOME "/opt/adobe"
#set path = ($FMHOME/bin $path)

#Code Size Compilation
#set path = ($path /usr/temp/m68k-coff /usr/temp/m68k-coff/bin)

#Adjust Environment
#setenv MANPATH "/usr/man /usr/local/man:/tools/2.5.1/local/man:/tools/local/man:/usr/openwin/man:/usr/share/man:/tools/elvis/SQA/tools/man:/usr/atria/doc/man:/opt/insure/man:/opt/forte/SUNWspro/man:/tools/SUNWspro/man:/tools/visual/SUNWspro/man"
#setenv LD_LIBRARY_PATH "/usr/openwin/lib:/usr/dt/lib:/tools/2.5.1/local/lib:/tools/local/lib:/tools/SUNWspro/lib"

#setenv OPENWINHOME "/usr/openwin"
#setenv PARASOFT "/usr/local/parasoft/"
#setenv LM_LICENSE_FILE ""
#setenv SOLID_USER "$LOGNAME $LOGNAME"

#----------------------------------------------------------------
#         aliases for all shells
#----------------------------------------------------------------
alias ls        'ls --color=auto -F'
alias b         'bash'
alias sx        'screen -x'
alias cp        'cp -i'
alias mv        'mv -i'
alias rm        'rm -i'
alias pwd       'echo $cwd'
alias back      'set back=$old; set old=$cwd; cd $back; pwd; unset back'
alias open      'chmod +w'

#----------------------------------------------------------------
#          settings  for interactive shells
#----------------------------------------------------------------
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

#----------------------------------------------------------------
# set up prompts
#----------------------------------------------------------------
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

# Set up some environment variables
setenv COMPANY_CONFS "$HOME/company/conf"
if ( -e $COMPANY_CONFS/cshrc ) then
    source $COMPANY_CONFS/cshrc
endif

#----------------------------------------------------------------
# more aliases
#----------------------------------------------------------------
alias a         alias
alias "ls"      "ls -F"
alias hist      history
alias lock      xlock
alias cshrc     'source ~/.cshrc'
alias c         'clear'
#alias nms 'tbl \!* | nroff -ms | more'                  # nroff -ms
#alias tms 'tbl \!* | troff -t -ms >! troff.output &'    # troff -ms
#alias tpr 'tbl \!* | troff -t -ms | lpr -t &'           # troff & print
#alias ppr 'lpr -t \!* &'                                # print troffed

#setenv TERM xterm

