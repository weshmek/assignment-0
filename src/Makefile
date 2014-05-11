#
# Makefile for busy-wait IO library
#
XCC     = gcc
AS	= as
AR	= ar
CFLAGS  =  -ffreestanding -nodefaultlibs -nostdlib -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings
# -msoft-float: use software for floating point

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs-32: always create a complete stack frame

ARFLAGS = rcs

all:  bwio.a polio.a buffers.a

install : all
	cp bwio.a ../lib/libbwio.a
	cp polio.a ../lib/libpolio.a
	cp buffers.a ../lib/libbuffers.a

parse_instruction.s : parse_instruction.c
	${XCC} -S ${CFLAGS} parse_instruction.c

terminal.s : terminal.c
	${XCC} -S ${CFLAGS} terminal.c

buffers.s : buffers.c
	${XCC} -S ${CFLAGS} buffers.c

polio.s : polio.c time.c timer.c
	${XCC} -S ${CFLAGS} polio.c


bwio.s: bwio.c
	$(XCC) -S $(CFLAGS) bwio.c

time.s: time.c
	${XCC} -S ${CFLAGS} time.c

panic.s : panic.c
	${XCC} -S ${CFLAGS} panic.c


timer.s : timer.c
	${XCC} -S ${CFLAGS} timer.c

parse_instruction.o : parse_instruction.s
	${AS} ${ASFLAGS} -o parse_instruction.o parse_instruction.s

terminal.o : terminal.s
	${AS} ${ASFLAGS} -o terminal.o terminal.s

buffers.o : buffers.s
	${AS} ${ASFLAGS} -o buffers.o buffers.s

polio.o : polio.s
	${AS} ${ASFLAGS} -o polio.o polio.s

bwio.o: bwio.s
	$(AS) $(ASFLAGS) -o bwio.o bwio.s

time.o : time.s
	${AS} ${ASFLAGS} -o time.o time.s

panic.o : panic.s 
	${AS} ${ASFLAGS} -o panic.o panic.s

timer.o : timer.s
	${AS} ${ASFLAGS} -o timer.o timer.s

buffers.a : buffers.o terminal.o parse_instruction.o
	${AR} ${ARFLAGS} $@ buffers.o terminal.o parse_instruction.o

polio.a : polio.o
	${AR} ${ARFLAGS} $@ polio.o timer.o time.o

bwio.a: bwio.o panic.o timer.o time.o
	$(AR) $(ARFLAGS) $@ bwio.o panic.o timer.o time.o


clean:
	-rm -f *.s *.a *.o
