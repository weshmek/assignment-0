#include <buffers.h>

buffer keyboard_buffer;
buffer command_buffer;
buffer screen_buffer;
buffer train_buffer;



void buffer_init(void)
{
	int k;
	
	for (k = 0; k < BUFFER_SIZE; k++)
	{
		keyboard_buffer.buf[k] = command_buffer.buf[k] = screen_buffer.buf[k] = train_buffer.buf[k] = 0;
	}
	
	keyboard_buffer.pos = command_buffer.pos = screen_buffer.pos = train_buffer.pos = 1;
	keyboard_buffer.empty = command_buffer.empty = screen_buffer.empty = train_buffer.empty = 1;
}
		

int put_on_buffer(buffer *b, char c)
{
	if (b->pos == BUFFER_SIZE) return 0;
	b->buf[b->pos - 1] = c;
	b->pos++;
	b->empty = 0;
	return 1;
}


int buffer_take(buffer *b, char *c)
{
	int k;
	if (b->pos == 1) return 0;
	*c = b->buf[0];
	b->buf[BUFFER_SIZE - 1] = 0;
	for (k = 0; k < BUFFER_SIZE - 1; k++)
	{
		b->buf[k] = b->buf[k + 1]; 
	}
	b->pos--;
	if (b->pos == 1) b->empty = 1;
	return 1;
}


int buffer_peek(buffer *b, char *c)
{
	if (b->pos == 1) return 0;
	*c = b->buf[0];
	return 1;
}
