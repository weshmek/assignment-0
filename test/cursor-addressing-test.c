#include <cursor-addressing.h>
#include <bwio.h>


int main()
{
	bwsetfifo(COM2, OFF);
	cls;
	pos(0,0);
	bwprintf(COM2, "Time goes here");
	return 0;
}
