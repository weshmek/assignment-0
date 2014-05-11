#ifndef __BUFFERS_H__
#define __BUFFERS_H__


#define BUFFER_SIZE 1024

typedef struct 
{
	char buf[BUFFER_SIZE];
	int pos;
	int empty;
} buffer;


extern buffer keyboard_buffer;
extern buffer command_buffer;
extern buffer screen_buffer;
extern buffer train_buffer;

void buffer_init(void);

int put_on_buffer(buffer*, char);

int buffer_take(buffer*, char*);

int buffer_peek(buffer*, char*);

#endif
