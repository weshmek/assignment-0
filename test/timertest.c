#include <cursor-addressing.h>

#include <timer.h>
#include <bwio.h>


int main(void)
{
	unsigned int time, prev_time, diff;
	unsigned int deciseconds, seconds, minutes;
	unsigned int deciseconds_passed, deciseconds_leftover, seconds_leftover;
	unsigned int deciseconds_plus_passed, seconds_plus_leftover;
	bwsetfifo(COM2, OFF);
	cls;
	prev_time = 0xffffff;
	set_timer((unsigned int) 0xffffff);
	pos(0,0);
	bwprintf(COM2, "THE TIME IS: ");
	seconds = deciseconds = minutes = 0;
	do
	{
		pos(0,14);
		time = get_time();
		diff = prev_time - time;
		if (diff < 0) 
			diff = - diff;

		deciseconds_passed = diff / CYCLES_PER_DECISECOND;
		if (deciseconds_passed > 0)
		{
			deciseconds_plus_passed = deciseconds + deciseconds_passed;
			deciseconds_leftover = (deciseconds_plus_passed) / 10;
			deciseconds = (deciseconds_plus_passed) % 10;
			seconds_plus_leftover = seconds + deciseconds_leftover;
			seconds_leftover = (seconds_plus_leftover) / 60;
			seconds = (seconds_plus_leftover) % 60;
			minutes = seconds_leftover + minutes;
			prev_time = time;
			bwprintf(COM2, "%u.%u.%u", minutes, seconds, deciseconds);
		}
	} while(1);
	return 0;
}
		
		
