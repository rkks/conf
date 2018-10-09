#   AUTHOR: @AUTHOR@, @AUTHOR_EMAIL@
#  CREATED: @CREATED_DATE@
# MODIFIED: 09/Oct/2018 13:25:47 IST
#  LICENCE: @COPYRIGHT@

OUTPUT=$(shell basename $(shell pwd)).out
SRCS=$(wildcard *.c)		# $(shell ls *.c)
OBJS=$(SRCS:.c=.o)			# $(patsubst %.c, %.o, $(SRCS))
BINS=$(patsubst %.c,%,$(SRCS))

#LIBS  = -lkernel32 -luser32 -lgdi32 -lopengl32
CFLAGS ?= -g -ggdb -Wall
LDFLAGS ?=

all: $(OUTPUT)

$(OUTPUT): $(OBJS)
	@echo "[LD] $^ => $@"
	@gcc $(CFLAGS) $(LIBS) -o $@ $^

bin: $(BINS)

%: %.o
	@echo "[LD] $< => $@"
	@gcc $(CFLAGS) $(LIBS) -o $@ $<

%.o : %.c
	@echo "[CC] $< => $@"
	@gcc -c $(CFLAGS) -o $@ $<

clean:
	@echo "[CLN] *.o $(OUTPUT) *.so *.a *.i $(BINS)"
	@rm -f *.o $(OUTPUT) *.so *.a *.i $(BINS)

help:
	echo "Useful GNU make debug options:"
	echo "-dk  - print debug information (verbose), continue inspite of errors"
	echo "-pnr - print db (all vars/rules/cmds), dry-run, eliminate implicit rules"

# Very useful debug aid. Usage: 'make print-<var-name>'. Ex. make print-MAKE_VERSION
print-%:
	@echo '$*=$($*)'

.PHONY: all clean bin help
