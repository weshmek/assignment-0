#include <polio.h>
#include <buffers.h>
#include <ts7200.h>


int chars_to_write = 0;


int uart_init()
{
	
	return 0;
}


int setspeed( int channel, int speed ) {
        int *high, *low;
        switch( channel ) {
        case COM1:
                high = (int *)( UART1_BASE + UART_LCRM_OFFSET );
                low = (int *)( UART1_BASE + UART_LCRL_OFFSET );
                break;
        case COM2:
                high = (int *)( UART2_BASE + UART_LCRM_OFFSET );
                low = (int *)( UART2_BASE + UART_LCRL_OFFSET );
                break;
        default:
                return -1;
                break;
        }
        switch( speed ) {
        case 115200:
                *high = 0x0;
                *low = 0x3;
                return 0;
        case 2400:
                *high = 0x0;
                *low = 191;
                return 0;
        default:
                return -1;
        }
}



int setfifo( int channel, int state ) {
        int *line, buf;
        switch( channel ) {
        case COM1:
                line = (int *)( UART1_BASE + UART_LCRH_OFFSET );
                break;
        case COM2:
                line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
                break;
        default:
                return -1;
                break;
        }
        buf = *line;
        buf = state ? buf | FEN_MASK : buf & ~FEN_MASK;
        *line = buf;
        return 0;
}


int getch(int channel, char *got)
{
	 int *flags;
	 int * data;
	switch (channel)
	{
		case COM1:
			flags =( int*) ( UART1_BASE + UART_FLAG_OFFSET);
			data = ( int *) (UART1_BASE + UART_DATA_OFFSET);
			break;
		case COM2:
			flags = ( int*) (UART2_BASE + UART_FLAG_OFFSET);
			data = ( int*) (UART2_BASE + UART_DATA_OFFSET);
			break;
		default:
			return -1;
	}
	if ((*flags) & RXFF_MASK)
	{
		*got = *data;
		return 0;
	}
	else
	{
		return 1;
	}
}
			
	
int cts(int channel)
{
	int *flags;
	switch (channel)
	{
		case COM1:
			flags = (int *) (UART1_BASE + UART_FLAG_OFFSET);
			break;
		case COM2: 
			flags = (int *) (UART2_BASE + UART_FLAG_OFFSET);
			break;
		default:
			return -1;
	}
	return ((*flags) & CTS_MASK);
}

int putch(int channel, char send)
{
	int * data;
	int *flags;
	switch (channel)
	{
		case COM1:
			data = ( int *) (UART1_BASE + UART_DATA_OFFSET);
			flags = (int *) (UART1_BASE + UART_FLAG_OFFSET); 
			if (!(  (((*flags) & TXBUSY_MASK) == 1) || (((*flags) & CTS_MASK) == 0) || (((*flags) & TXFF_MASK ) == 1)))
			{
				*data = send;
				return 0;
			}
			break;
		case COM2:
			data = ( int *) (UART2_BASE + UART_DATA_OFFSET);
			flags = (int *) (UART2_BASE + UART_FLAG_OFFSET);
			if (!(  (((*flags) & TXBUSY_MASK) == 1) || (((*flags) & TXFF_MASK ) == 1)))
			{
				*data = send;
				return 0;
			}	
			break;
		default:
			return -1;
		return 0;
	}
	return 1;
}


char c2x( char ch ) {
        if ( (ch <= 9) ) return '0' + ch;
        return 'a' + ch - 10;
}

int putx( int channel, char c ) {
        char chh, chl;

        chh = c2x( c / 16 );
        chl = c2x( c % 16 );
	put_on_buffer(&screen_buffer, chh);
        return put_on_buffer(&screen_buffer, chl );
}

int putr( int channel, unsigned int reg ) {
        int byte;
        char *ch = (char *) &reg;

        for( byte = 3; byte >= 0; byte-- ) putx( channel, ch[byte] );
        return put_on_buffer(&screen_buffer, ' ');
}

int putstr( int channel, char *str ) {
        while( *str ) {
                put_on_buffer(&screen_buffer, *str);
                str++;
        }
        return 0;
}

void putw( int channel, int n, char fc, char *bf ) {
        char ch;
        char *p = bf;

        while( *p++ && n > 0 ) n--;
        while( n-- > 0 ) put_on_buffer(&screen_buffer, fc);
        while( ( ch = *bf++ ) ) put_on_buffer(&screen_buffer, ch);
}


int a2d( char ch ) {
        if( ch >= '0' && ch <= '9' ) return ch - '0';
        if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
        if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
        return -1;
}

char a2i( char ch, char **src, int base, int *nump ) {
        int num, digit;
        char *p;

        p = *src; num = 0;
        while( ( digit = a2d( ch ) ) >= 0 ) {
                if ( digit > base ) break;
                num = num*base + digit;
                ch = *p++;
        }
        *src = p; *nump = num;
        return ch;
}

void ui2a( unsigned int num, unsigned int base, char *bf ) {
        int n = 0;
        int dgt;
        unsigned int d = 1;

        while( (num / d) >= base ) d *= base;
        while( d != 0 ) {
                dgt = num / d;
                num %= d;
                d /= base;
                if( n || dgt > 0 || d == 0 ) {
                        *bf++ = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
                        ++n;
                }
        }
        *bf = 0;
}











void i2a( int num, char *bf ) {
        if( num < 0 ) {
                num = -num;
                *bf++ = '-';
        }
        ui2a( num, 10, bf );
}


void format ( int channel, char *fmt, va_list va ) {
        char bf[12];
        char ch, lz;
        int w;


        while ( ( ch = *(fmt++) ) ) {
                if ( ch != '%' )
                       put_on_buffer(&screen_buffer, ch );
                else {
                        lz = 0; w = 0;
                        ch = *(fmt++);
                        switch ( ch ) {
                        case '0':
                                lz = 1; ch = *(fmt++);
                                break;
                        case '1':
                        case '2':
                        case '3':
                        case '4':
                        case '5':
                        case '6':
                        case '7':
                        case '8':
                        case '9':
                                ch = a2i( ch, &fmt, 10, &w );
                                break;
                        }
                        switch( ch ) {
                        case 0: return;
                        case 'c':
                                put_on_buffer( &screen_buffer, va_arg( va, char ) );
                                break;
                        case 's':
                                putw( channel, w, 0, va_arg( va, char* ) );
                                break;
                        case 'u':
                                ui2a( va_arg( va, unsigned int ), 10, bf );
                                putw( channel, w, lz, bf );
                                break;
                        case 'd':
                                i2a( va_arg( va, int ), bf );
                                putw( channel, w, lz, bf );
                                break;
                        case 'x':
                                ui2a( va_arg( va, unsigned int ), 16, bf );
                                putw( channel, w, lz, bf );
                                break;
                        case '%':
                               	put_on_buffer(&screen_buffer, ch );
                                break;
                        }
                }
        }
}


void polprintf( int channel, char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        format( channel, fmt, va );
        va_end(va);
}




