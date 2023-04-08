# GDB settings

# tbreak <file/sym>:[loc]   - Temporary breakpoints
# break <sym>:loc if (cond) - Conditional breakpoint
# rbreak file::<regex>      - Regex match breakpoint

# To log cmds along with output, enable tracing. 'set logging on' is deprecated
set logging file gdb.log
set logging enabled on
set trace-commands on

#show solib-search-path
#set solib-search-path /non/standard/path/to/libs
#info sharedlibrary

# history across invocations. up/down arrows do not work, so disable.
#set history save on
#set history filename ~/.gdb_history
#set history size unlimited
#set history remove-duplicates 10

# Verbosity settings
set confirm off
set verbose off

# Pretty print options.
set print vtbl on
set print pretty on
set print array on
set print null-stop
set print union on
set print object on

# Debug deamon processes that involve fork().
set follow-fork-mode child

# These make gdb never pause in its output
set height 0
set width 0
#set pagination off

# Using tui mode (status line shows: target,pid/tid,func-name,line-num,pc-reg)
# In tui mode, up/down arrows scroll src code, use ctrl-n/p for prev/next cmds
#tui enable|disable                     # ctrl-x a
#layout asm|reg|src|split|next|prev     # enable given window
#focus  asm|reg|src|split|next|prev     # shift ctrl to given window
#tui reg all|vector|system|float|general|prev|next  # display given registers
#update|refersh                         # CTRL-L

#layout asm
#layout reg

# Default is att (AT&T)
set disassembly-flavor intel

# Set default base to hexadecimal
#set input-radix 0x10
#set output-radix 0x10

# Source scripts
#source ~/scripts/gdb/alias.gdb
source ~/scripts/gdb/basic.gdb

#handle SIGKILL nopass noprint nostop
#handle SIGTERM nopass noprint nostop

# Color gdb prompt. Doesn't work with --tui
#set prompt \033[\033[31;m\033] gdb $ \033[0m
