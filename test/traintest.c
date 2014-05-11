#include <bwio.h>
#include <cursor-addressing.h>
#include <ts7200.h>
#include <timer.h>
#include <time.h>
int main(void)
{
	char b[60];
	int k;
	unsigned int cursec;
	time_struct time;
	time.seconds = 0;
	time.minutes = 0; 
	time.deciseconds = 0;
	bwsetspeed(COM1, 2400);
	bwsetspeed(COM2,115200 );
	time.prev = 0xffffff;
	bwsetfifo(COM2, OFF);
	bwsetfifo(COM1, OFF);
	set_timer((unsigned int) 0xffffff);
	cls;
	pos(0,0);
	bwprintf(COM2, "TIME: %u.%u.%u", time.minutes, time.seconds, time.deciseconds);
	cursec = 0;
	do
	{
		time = get_curtime(time);
		if (time.seconds == 0)
		{
			for (k = 0; k < 60; k++)
			{
				b[k] = 1;
			}
		}
		else if ((time.seconds == 1)  && b[1])
		{
			b[1] = 0;
			bwputc(COM1, 96);
			bwputc(COM1, 0);
			pos(6,0);
			bwprintf(COM2, "Sent signal 96 to track");
		}
		else if ((time.seconds == 5) && b[5])
		{
			b[5] = 0;
			bwputc(COM1, 10);
			bwprintf(COM2, "Sent speed 10 ");
		}
		else if ((time.seconds == 6) && b[6])
		{
			b[6] = 0;
			bwputc(COM1, 51);
			pos(7,0);
			bwprintf(COM2, "Sent train 51");
		}
		else if ((time.seconds == 10) && b[10])
		{
			b[10] = 0;
			bwputc(COM1, 0);
			pos(8, 0);
			bwprintf(COM2, "Sent speed 0");
		}
		else if ((time.seconds == 11) && b[11])
		{
			b[11] = 0;
			bwputc(COM1, 51);
		}
		else if ((time.seconds == 12) && b[12])
		{
			b[12] = 0;
			bwputc(COM1, 15);
		}
		else if ((time.seconds == 13) && b[13])
		{
			b[13] = 0;
			bwputc(COM1, 51);
		}
		else if ((time.seconds == 14) && b[14])
		{
			b[14] = 0;
			bwputc(COM1, 26);
		}
		else if ((time.seconds == 15) && b[15])
		{
			b[15] = 0;
			bwputc(COM1, 51);
		}
		pos(0,7);
		bwprintf(COM2, "%u.%u.%u", time.minutes, time.seconds, time.deciseconds);

		
	}while(1);


	
	
	return 0;

}
	
