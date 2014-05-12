#include <buffers.h>
#include <terminal.h>
#include <polio.h>
#include <timer.h>
#include <time.h>

int q;

char switch_states_changed = 0;
char sensor_states_changed = 0;
char switch_states[23];
char sensor_states[88];

static int sensor_state_position = 0;

static void set_all_switches_to_straight(void)
{
	int k;
	for (k = 1; k <= 18; k++)
	{
		switch_states[k] = 'S';
		put_on_buffer(&train_buffer, 33);
		put_on_buffer(&train_buffer, k);
		put_on_buffer(&train_buffer, 32);
	}
	for (k = 0x99; k <= 0x9C; k++)
	{
		switch_states[(k - 0x99) + 19] = 'S';
		put_on_buffer(&train_buffer, 33);
		put_on_buffer(&train_buffer, k);
		put_on_buffer(&train_buffer, 32);

	} 
}

static void pretty_print_switch_stuff(void)
{
	int k;
	polprintf(COM2, "\033[10;0H");
	for (k = 1; k <= 18; k++)
	{
		polprintf(COM2, "\033[%d;0HSW %d :", k + 10, k);
	}
	for (k = 0x99; k <= 0x9C; k++)
	{
		polprintf(COM2, "\033[%d;0HSW %x :", (k - 0x99) + 19 + 10, k);
	}
}

static void print_switch_states(void)
{
	int k;
	polprintf(COM2, "\033[10;0H");
	for (k = 1; k <= 22; k++)
	{
		polprintf(COM2, "\033[%d;12H%c", k + 10,  switch_states[k]);
	}
	switch_states_changed = 0;
}



int main(void)
{
	unsigned int prev;
	char c;
	linepos = 3;
	execute = 0;
	write = 1;
	got_command = 0;
	time_struct time;
	time.minutes = time.seconds = time.deciseconds = 0;
	time.prev = prev = 0xffffff;
	q = 0;
	buffer_init();
	setspeed(COM1, 2400);
	setspeed(COM2, 115200);
	setfifo(COM1, OFF);
	setfifo(COM2, OFF);
	set_timer(0xffffff);
	time = get_curtime(time);
	polprintf(COM2, "\033[?25l");
	polprintf(COM2, "\033[2J");
	polprintf(COM2, "\033[5;0H>>");
	polprintf(COM2, "\033[7;0HLast command: ");
	put_on_buffer(&train_buffer, 96);
	execute = 1;
	set_all_switches_to_straight();
	pretty_print_switch_stuff();
	switch_states_changed = 1;
	sensor_states_changed = 0;
	init_terminal();
	do	
	{
		time = get_curtime(time);
		if (time.prev != prev)
		{
		
			polprintf(COM2, "\033[H");
			polprintf(COM2, "%u.%u.%u", time.minutes, time.seconds, time.deciseconds);
			prev = time.prev;
		}
		get_char_from_keyboard();
		if (write)
		{
			send_char_to_screen();
		}
		execute_command();
		if (switch_states_changed)
		{
			print_switch_states();
		}
		query_sensor();
	}while(!q);
	polprintf(COM2, "\033[2J");
	do
	{
		send_char_to_screen();
	}while (buffer_peek(&screen_buffer, &c));

	return 0;
}
	
