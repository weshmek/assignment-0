 /*
 * iotest.c
 */

#include <bwio.h>
#include <ts7200.h>

int main( int argc, char* argv[] ) {
	char str[] = "Hello\n\r";
	bwsetfifo( COM2, OFF );
	bwputstr( COM2, str );
	bwputw( COM2, 10, '*', str );
	bwprintf( COM2, "Hello world.\n\r" );
	bwprintf( COM2, "%s world%u.\n\r", "Well, hello", 23 );
	bwprintf( COM2, "%d worlds for %u person.\n\r", -23, 1 );
	bwprintf( COM2, "%x worlds for %d people.\n\r", -23, 723 );
	str[0] = bwgetc( COM2 );
	bwprintf( COM2, "%s", str );
	set_led(LED_NONE);
	set_led(LED_RED);
	str[1] = bwgetc( COM2 );
	set_led(LED_GREEN);
	str[2] = bwgetc( COM2 );
	set_led(LED_BOTH);
	str[3] = bwgetc( COM2 );
	set_led(LED_NONE);
	bwprintf( COM2, "%s", str);
	bwputc(COM1, 0x96);
	bwputc(COM1, 0x47);
	bwputc(COM1, 0x15);
	
	return 0;
}

