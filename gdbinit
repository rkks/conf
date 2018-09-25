# GDB settings

#Simple Command
#define <command-name>
#   [gdb commands here]
#end
#document <command-name>
#   <help text>
#end

#Auto Commands
#break <some-point>
#commands
#silent
#   [gdb commands here]
#end

set logging file ~/.gdb.log
set logging on

# history across invocations
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

set disassembly-flavor intel

# Source scripts
#source ~/scripts/gdb/alias.gdb
#source ~/scripts/gdb/basic.gdb

#handle SIGKILL nopass noprint nostop
#handle SIGTERM nopass noprint nostop

# Color gdb prompt. Doesn't work with --tui
#set prompt \033[\033[31;m\033] gdb $ \033[0m
