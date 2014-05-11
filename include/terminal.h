#ifndef __TERMINAL_H__
#define __TERMINAL_H__


int get_char_from_keyboard(void);

int send_char_to_screen(void);
int parse_command(void);
int execute_command(void);


int get_sensor_signals(void);

int query_sensor(void);

void init_terminal(void);

#endif
