#include <polio.h>
#include <buffers.h>
#include <parse_instruction.h>

int execute;
int write;

int linepos;
int got_command;

char char_to_write;

enum QUERY_STATE
{IDLE, QUERY_SENT, BYTE_1_RECEIVED, COMPLETE};
static enum QUERY_STATE sensor_query_state = IDLE;


enum SENSOR_MODULE {MOD_A, MOD_B, MOD_C, MOD_D, MOD_E};
static enum SENSOR_MODULE module_being_queried = MOD_A;


static char sensors_on_screen[30];


static int debug_print_line = 50;
//static char prev_command[BUFFER_SIZE];
//static char prev_command_name[2];
//static char prev_command_number_1[3];
//static char prev_command_number_2[3];
void debug_print(char*);

static char query_response[2];
static int line = 0;
void init_terminal()
{
	int k;
	sensor_query_state = IDLE;
	debug_print_line = 50;
	module_being_queried = MOD_A;
	line = 0;
	for (k = 0; k < 16; k++)
	{
		sensors_on_screen[2 * k] = (char) 0;
		sensors_on_screen[(2 * k) + 1] = (char) 0;
	}
}
	

int get_char_from_keyboard(void)
{
	int k;
	int x;
	char c;
	char command[4];
	command[3] = '\0';
	if (!getch(COM2, &c))
	{
		if ((c == '\n') || (c == '\r'))
		{
			polprintf(COM2, "\033[5;3H\033[K");
			put_on_buffer(&keyboard_buffer, c);
			x = parse_instruction(keyboard_buffer.buf, command);
			
			if (x)
			{
				k = 0;
				execute = 1;
				for (k = 0; k < x; k++)
				{
					put_on_buffer(&train_buffer, command[k]);
				
				}
				polprintf(COM2, "\033[7;14H\033[K");
				for (k = 0; k < linepos - 3; k++)
				{
					polprintf(COM2, "%c", keyboard_buffer.buf[k]);
				}
					
			}
			
			polprintf(COM2, "\033[5;3H\033[K");
			keyboard_buffer.pos = 1;
			keyboard_buffer.empty = 1;
			write = 1;
			linepos = 3;
			return 1;
		}
		else if (c == '\b')
		{
			linepos = (linepos == 3) ? 3 : (linepos - 1);
			polprintf(COM2, "\033[5;%dH\033[K", linepos);
			keyboard_buffer.pos = (keyboard_buffer.pos == 1) ? 1 : (keyboard_buffer.pos - 1);
			if (keyboard_buffer.pos == 1)
			{
				keyboard_buffer.empty = 1;
			}
			write = 1;
			return 1;
		}
		else if ((put_on_buffer(&keyboard_buffer, c) > 0) )
		{
		
		
				polprintf(COM2, "\033[5;%dH%c", linepos,  c);
				linepos++;
				write = 1;
				return 1;
		}
		else
		{	
			return 0;
		}
	}
	else
	{
		return 0;
	}
}


int send_char_to_screen(void)
{
	char c;
	if (buffer_peek(&screen_buffer, &c))
	{
		if (!putch(COM2, c))
		{
			buffer_take(&screen_buffer, &c);
			return 1;
		}
	}
	return 0;
}
int parse_command(void)
{
	char c;
	char command[2];
	if (buffer_peek(&keyboard_buffer, &c))
	{
		if (keyboard_buffer.buf[keyboard_buffer.pos - 1] == '\n')
		{
			if (parse_instruction(keyboard_buffer.buf, (char*)command))
			{
				if (put_on_buffer(&train_buffer, command[0]))
				{
					if (put_on_buffer(&train_buffer, command[1]))
					{
						keyboard_buffer.pos = 1;
						keyboard_buffer.empty = 1;
						return 1;
					}
				}
			}
			else if (q == 1)
			{
				return 1;
			}
		}
	}
	return 0;
}
			
int execute_command(void)
{
	char c;
	if(buffer_peek(&train_buffer, &c))
	{
		if (!putch(COM1, c))
		{
			buffer_take(&train_buffer, &c);
			return 1;
		}
	}
	return 0;
}
			


int check_if_sensor_on_screen(char module, char number)
{
	int k;
	for (k = 0; k < 15; k++)
	{
		if ((sensors_on_screen[2 * k] == module) && (sensors_on_screen[(2 * k) + 1] == number))
		{
			return 1;
		}
	}
	return 0;
}
		
void print_query_response(char response[])
{
	char module;
	int k;
	switch(module_being_queried)
	{
		case MOD_A:
			module = 'A';
			break;
		case MOD_B:
			module = 'B';
			break;
		case MOD_C:
			module = 'C';
			break;
		case MOD_D:
			module = 'D';
			break;
		case MOD_E:
			module = 'E';
			break;
		default:
			return;
	}
	for (k = 7; k >= 0; k--)
	{
		if (response[0] & (1 << k))
		{
		
			if (!check_if_sensor_on_screen(module, (char) 8 - k ))
			{
				polprintf(COM2, "\033[%d;40H\033[K%c%d\033[%d;40H\033[K------", line, module, 8 - k, line + 1);
				sensors_on_screen[2 * line] = module;
				sensors_on_screen[(2 * line) + 1] = (char) 8 - k;
				line = (line + 1) % 15;
			}
		}
	}
	for (k = 7; k >= 0; k--)
	{
		if (response[1] & (1 << k))
		{
			if (!check_if_sensor_on_screen(module, (char) 16 - k))
			{
				polprintf(COM2, "\033[%d;40H\033[K%c%d\033[%d;40H\033[K------", line, module, 16 - k, line + 1);
				sensors_on_screen[2 * line] = module;
				sensors_on_screen[(2 * line) + 1] = (char) 16 - k;
				line = (line + 1) % 15;
			
			}
		}
	}
}
	
			
			

int query_sensor()
{
	char c;
	switch (sensor_query_state)
	{
		case IDLE:
			put_on_buffer(&train_buffer, 133);
			sensor_query_state = QUERY_SENT;
			break;
		case QUERY_SENT:
			if (!getch(COM1, &c))
			{
				query_response[0] = c;
				sensor_query_state = BYTE_1_RECEIVED;
			}
			break;
		case BYTE_1_RECEIVED:
			//debug_print("Byte 1 received");
			if (!getch(COM1, &c))
			{
				query_response[1] = c;
				
				switch(module_being_queried)
				{
					case MOD_A:
						print_query_response(query_response);
						module_being_queried = MOD_B;
						sensor_query_state = QUERY_SENT;
						put_on_buffer(&train_buffer, 192);
						break;
					case MOD_B:
						print_query_response(query_response);
						module_being_queried = MOD_C;
						sensor_query_state = QUERY_SENT;
						put_on_buffer(&train_buffer, 192);
						break;
					case MOD_C:
						print_query_response(query_response);
						module_being_queried = MOD_D;
						sensor_query_state = QUERY_SENT;
						put_on_buffer(&train_buffer, 192);
						break;
					case MOD_D:
						print_query_response(query_response);
						module_being_queried = MOD_E;
						sensor_query_state = QUERY_SENT;
						put_on_buffer(&train_buffer, 192);
						break;
					case MOD_E:
						print_query_response(query_response);
						module_being_queried = MOD_A;
						sensor_query_state = IDLE;
						put_on_buffer(&train_buffer, 192);
						break;
					default:
						break;
				}
			}
			break;
		default:
			return 0;
	}
	return 1;
}
				
void debug_print(char *str)
{
	polprintf(COM2, "\033[%d;50H\033[K%s", debug_print_line,  str);
	debug_print_line = (debug_print_line == 60) ? 50 : (debug_print_line + 1);
}
				

