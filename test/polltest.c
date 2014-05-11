#include <polio.h>
#include <cursor-addressing.h>
#include <timer.h>
#include <time.h>
#include <buffers.h>



int main()
{
	time_struct ts;
	char c;
	int execute;
	char command[256];
	char com;
	int write = 0;
	buffer_init();
	ts.minutes = 0;
	ts.seconds = 0;
	ts.deciseconds = 0;
	ts.prev = 0xffffff;
	set_timer(0xffffff);
	screen_buffer.pos = 0;
	screen_buffer.empty = 1;
	execute = 0;
	setspeed(COM2, 115200);
	setfifo(COM2, OFF);
	setspeed(COM1, 2400);
	setfifo(COM1, OFF);
	putch(COM2, 'a');
	do
	{
		if (!getch(COM2, &c))
		{
			if (c == '\n')
			{
				execute = 1;
				screen_buffer.pos = 0;
				screen_buffer.empty = 1;
			}
			else
			{
			}
			write = 1;
		}
		if (write)
		{
			if (!cts(COM2))
				if (!putch(COM2, c))
					write = 0;
		}
		if (execute)
		{
			execute = 0;
			com = 10 * (command[0] - '0') + (command[1] - '0');
			c = com;
			write = 1;
		}
			
			
						
		
	} while (1);
}
