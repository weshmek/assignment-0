#include <timer.h>
#include <ts7200.h>

unsigned int get_time(void)
{
	unsigned int t;
	unsigned int *p = (unsigned int*)(TIMER3_BASE + VAL_OFFSET);
	t = *p;
	return t;
}


void set_timer(unsigned int init)
{
	unsigned int *p;
	unsigned int *c;
	*c = 0;
	p = (unsigned int*) (TIMER3_BASE + LDR_OFFSET);
	c = (unsigned int*) (TIMER3_BASE + CRTL_OFFSET);
	*p = init;
	*c = (unsigned int) (ENABLE_MASK); 
}
