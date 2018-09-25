#   AUTHOR: @AUTHOR@, @AUTHOR_EMAIL@
#  CREATED: @CREATED_DATE@
# MODIFIED: 27/Aug/2018 12:39:24 IST
#  LICENCE: @COPYRIGHT@

OUTPUT=$(shell basename $(shell pwd)).out
SRCS=$(wildcard *.c)		# $(shell ls *.c)
OBJS=$(SRCS:.c=.o)
BINS=$(patsubst %.c,%.out,$(SRCS))

#LIBS  = -lkernel32 -luser32 -lgdi32 -lopengl32
CFLAGS ?= -g -ggdb -Wall
LDFLAGS ?=

all: $(OUTPUT)

$(OUTPUT): $(OBJS)
	gcc $(CFLAGS) -o $@ $(LDFLAGS) $^

bin: $(BINS)

%.bin : %.c
	@echo "Build bin ..."
	gcc $(CFLAGS) -o $@ $(LDFLAGS) $^

%.o : %.c
	@echo "Build obj ..."
	gcc -c $(CFLAGS) -o $@ $<

clean:
	@echo "Clean build artifacts"
	rm -vf *.o $(OUTPUT) $(BINS) *.so *.a *.i

help:
	echo "Useful GNU make debug options:"
	echo "-dk  - print debug information (verbose), continue inspite of errors"
	echo "-pnr - print db (all vars/rules/cmds), dry-run, eliminate implicit rules"

# Very useful debug aid. Usage: 'make print-<var-name>'. Ex. make print-MAKE_VERSION
print-%:
	@echo '$*=$($*)'

.PHONY: all clean bin help
