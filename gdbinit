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
set history save on
set history filename ~/.gdb_history
set history size unlimited
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

layout asm
layout reg

set disassembly-flavor intel

# Source scripts
#source ~/scripts/gdb/alias.gdb
#source ~/scripts/gdb/basic.gdb

#handle SIGKILL nopass noprint nostop
#handle SIGTERM nopass noprint nostop

# Color gdb prompt. Doesn't work with --tui
#set prompt \033[\033[31;m\033] gdb $ \033[0m

