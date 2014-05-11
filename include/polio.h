#ifndef __POLIO_H__
#define __POLIO_H__

typedef char *va_list;

#define __va_argsiz(t)	\
		(((sizeof(t) + sizeof(int) - 1) / sizeof(int)) * sizeof(int))

#define va_start(ap, pN) ((ap) = ((va_list) __builtin_next_arg(pN)))

#define va_end(ap)	((void)0)

#define va_arg(ap, t)	\
		 (((ap) = (ap) + __va_argsiz(t)), *((t*) (void*) ((ap) - __va_argsiz(t))))

#define COM1	0
#define COM2	1

#define ON	1
#define	OFF	0


extern int chars_to_write;
extern int linepos;
extern int execute;
extern int got_command;
extern int write;
extern int q;
extern char char_to_write;
extern char switch_states_changed;
extern char switch_states[];
extern char sensor_states_changed;
extern char sensor_states[];

int getch(int port, char *);

int putch(int port, char);

int setfifo(int, int);

int setspeed(int, int);

int cts(int);

int uart_init(void);

int putx(int channel, char c);

int putstr(int channel, char *str);

int putr(int channel, unsigned int reg);

void putw(int channel, int n, char fc, char *bf);

void polprintf(int channel, char *format, ...);




#endif
