#include <ts7200.h>


void set_led(int status)
{
	int *led = (int*) LED_ADDRESS;

	switch(status)
	{
		case LED_NONE: case LED_RED: case LED_GREEN: case LED_BOTH:
		break;
		default:
		return;
	}
	*led = status;
}
