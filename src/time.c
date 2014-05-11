#include <time.h>
#include <timer.h>

time_struct get_curtime(time_struct prev)
{
	unsigned int time;
	unsigned int diff;
	unsigned int deciseconds, seconds, minutes;
	unsigned int deciseconds_passed, deciseconds_leftover;
	unsigned int deciseconds_plus_passed;
	unsigned int seconds_plus_leftover, seconds_leftover;
	seconds = prev.seconds;
	minutes = prev.minutes;
	deciseconds = prev.deciseconds;
	time_struct ret;
	
	time = get_time();
	diff = prev.prev - time;

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
		ret.prev = time;
	}
	else
		ret.prev = prev.prev;
	ret.deciseconds = deciseconds;
	ret.seconds = seconds;
	ret.minutes = minutes;
	return ret;
		
}
