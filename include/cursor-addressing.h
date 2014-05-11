#ifndef __CURSOR_ADDRESSING_H__
#define __CURSOR_ADDRESSING_H__


/*
 * cursor addressing macros were provided by
 * http://courseweb.stthomas.edu/tpsturm/private/notes/qm300/ANSI.html
 */

#define esc 27

#define cls bwprintf(COM2, "%c[2J",esc)

#define pos(row,col) bwprintf(COM2, "%c[%d;%dH",esc,row,col)


#define hide_cursor bwprintf(COM2, "%c[?25l", esc)

#endif

