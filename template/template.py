#!/usr/bin/env python
#  DETAILS: bash configuration to be sourced.
#  CREATED: 07/01/06 15:24:33 IST
# MODIFIED: 03/27/17 08:14:28 IST
#
#   AUTHOR: Ravikiran K.S., ravikirandotks@gmail.com
#  LICENCE: Copyright (c) 2013, Ravikiran K.S.

# Always leave the code you're editing a little better than you found it
import os, sys, signal, fcntl
import struct, argparse
import pexpect, pdb, logging

def dump_python_details():
    print("\n", "sys.path:", sys.path)
    print("\n", "os.__file__", os.__file__)
    print("\n", "sys.version:", sys.version)
    print("\n", "sys.args:", sys.argv)

def log_init():
    
def parse_args():
    global args

    pdb.set_trace()
    parser = argparse.ArgumentParser(usage=__doc__)     # define Parser
    # -h/--help is a built-in argument handler with argparse
    # choices=[0, 1, 2, 3, 4, 5, 6, 7] is -v=0..7, count is -v, -vv, -vvv
    parser.add_argument("-v", "--verbose", action="count",
                        help="increase script output verbosity")
    parser.add_argument("-t", "--trace", action="store_true",
                        help="enable trace mode for script")

    #mandatory = parser.add_argument_group('mandatory arguments')
    #mandatory.add_argument("-a", "--all",
    #                    help="perform default operation of script")

    args = parser.parse_args()

# Standard boilerplate code
def main():
    parse_args()
    if args.verbose >= 2 and args.trace:
        print("args: ", args)
    if args.verbose >= 3:
        dump_python_details()
    print "Hello World"
    sys.exit(0)

if __name__ == '__main__':
    main()

#VIM: ts=4, sw=4
