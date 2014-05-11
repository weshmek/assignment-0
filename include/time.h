#ifndef __TIME_H__
#define __TIME_H__


typedef struct {unsigned int minutes; unsigned int seconds ; unsigned int deciseconds; unsigned int prev;} time_struct;

time_struct get_curtime(time_struct);

#endif
