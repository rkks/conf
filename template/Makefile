#   AUTHOR: @AUTHOR@, @AUTHOR_EMAIL@
#  CREATED: @CREATED_DATE@
# MODIFIED: @CREATED_DATE@
#  LICENCE: @COPYRIGHT@

OUTPUT=$(shell basename $(shell pwd))
SRCS=$(wildcard *.c)		# $(shell ls *.c)
OBJS=$(SRCS:.c=.o)
BINS=$(patsubst %.c,%,$(SRCS))

#LIBS  = -lkernel32 -luser32 -lgdi32 -lopengl32
CFLAGS ?= -g -ggdb -Wall

all: $(OUTPUT)

$(OUTPUT): $(OBJS)
	gcc $(CFLAGS) $(LIBS) -o $@ $^

bin: $(BINS)

%.o : %.c
	gcc -c $(CFLAGS) -o $@ $<

clean:
	rm -vf *.o $(OUTPUT) *.so *.a

help:
	echo "Useful GNU make debug options:"
	echo "-dk  - print debug information (verbose), continue inspite of errors"
	echo "-pnr - print db (all vars/rules/cmds), dry-run, eliminate implicit rules"

# Very useful debug aid. Usage: 'make print-<var-name>'. Ex. make print-MAKE_VERSION
print-%:
	@echo '$*=$($*)'

.PHONY: all clean
