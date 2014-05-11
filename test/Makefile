#
# Makefile for busy-wait IO tests
#
XCC     = gcc
AS	= as
LD      = ld
CFLAGS  = -ffreestanding -nostdlib -nodefaultlibs -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS =  -nostartfiles -nostdlib -nodefaultlibs -init main -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

all: buffertests.elf buffertests.s polltest.elf polltest.s timertest.elf timertest.s iotest.s iotest.elf traintest.s traintest.elf cursor-addressing-test.elf cursor-addressing-test.s

install: all
	cp iotest.elf /u/cs452/tftp/ARM/wwchalme
	cp traintest.elf /u/cs452/tftp/ARM/wwchalme
	cp cursor-addressing-test.elf /u/cs452/tftp/ARM/wwchalme
	cp timertest.elf /u/cs452/tftp/ARM/wwchalme
	cp polltest.elf /u/cs452/tftp/ARM/wwchalme
	cp buffertests.elf /u/cs452/tftp/ARM/wwchalme

buffertests.s : buffertests.c
	${XCC} -S ${CFLAGS} buffertests.c

polltest.s : polltest.c ../include/polio.h
	${XCC} -S ${CFLAGS} polltest.c

timertest.s : timertest.c ../include/timer.h
	${XCC} -S ${CFLAGS} timertest.c

cursor-addressing-test.s : cursor-addressing-test.c ../include/cursor-addressing.h
	$(XCC) -S $(CFLAGS) cursor-addressing-test.c

traintest.s : traintest.c
	$(XCC) -S $(CFLAGS) traintest.c

iotest.s: iotest.c iotest.h
	$(XCC) -S $(CFLAGS) iotest.c


buffertests.o : buffertests.s
	${AS} ${ASFLAGS} -o buffertests.o buffertests.s

polltest.o : polltest.s
	${AS} ${ASFLAGS} -o polltest.o polltest.s

cursor-addressing-test.o : cursor-addressing-test.s
	${AS} ${ASFLAGS} -o cursor-addressing-test.o cursor-addressing-test.s

timertest.o : timertest.s
	${AS} ${ASFLAGS} -o timertest.o timertest.s

traintest.o : traintest.s
	${AS} ${ASFLAGS} -o traintest.o traintest.s

iotest.o: iotest.s
	$(AS) $(ASFLAGS) -o iotest.o iotest.s

buffertests.elf : buffertests.o ../lib/libpolio.a ../lib/libbuffers.a 
	${LD} ${LDFLAGS} -Map buffertests.map -o $@ buffertests.o -lpolio -lbuffers -lgcc

polltest.elf : polltest.o ../lib/libpolio.a ../lib/libbuffers.a
	${LD} ${LDFLAGS} -Map polltest.map -o $@ polltest.o -lpolio -lbuffers -lgcc

timertest.elf : timertest.o
	${LD} ${LDFLAGS} -Map timertest.map -o $@ timertest.o -lbwio -lgcc

cursor-addressing-test.elf : cursor-addressing-test.o
	${LD} ${LDFLAGS} -Map cursor-addressing-test.map -o $@ cursor-addressing-test.o -lbwio -lgcc

iotest.elf: iotest.o
	$(LD) $(LDFLAGS) -Map iotest.map -o $@ iotest.o -lbwio -lgcc


traintest.elf : traintest.o 
	${LD} ${LDFLAGS} -Map traintest.map -o $@ traintest.o -lbwio -lgcc

clean:
	-rm -f iotest.elf *.s *.o *.map
