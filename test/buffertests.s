	.file	"buffertests.c"
	.global	switch_states_changed
	.bss
	.type	switch_states_changed, %object
	.size	switch_states_changed, 1
switch_states_changed:
	.space	1
	.global	sensor_states_changed
	.type	sensor_states_changed, %object
	.size	sensor_states_changed, 1
sensor_states_changed:
	.space	1
	.align	2
sensor_state_position:
	.space	4
	.text
	.align	2
	.type	set_all_switches_to_straight, %function
set_all_switches_to_straight:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L10
.L9:
	add	sl, pc, sl
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L2
.L3:
	ldr	r1, [fp, #-20]
	ldr	r3, .L10+4
	ldr	r2, [sl, r3]
	mov	r3, #83
	strb	r3, [r2, r1]
	ldr	r3, .L10+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #33
	bl	put_on_buffer(PLT)
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L10+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	ldr	r3, .L10+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #32
	bl	put_on_buffer(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #18
	ble	.L3
	mov	r3, #153
	str	r3, [fp, #-20]
	b	.L5
.L6:
	ldr	r3, [fp, #-20]
	sub	r1, r3, #134
	ldr	r3, .L10+4
	ldr	r2, [sl, r3]
	mov	r3, #83
	strb	r3, [r2, r1]
	ldr	r3, .L10+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #33
	bl	put_on_buffer(PLT)
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L10+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	ldr	r3, .L10+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #32
	bl	put_on_buffer(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L5:
	ldr	r3, [fp, #-20]
	cmp	r3, #156
	ble	.L6
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	_GLOBAL_OFFSET_TABLE_-(.L9+8)
	.word	switch_states(GOT)
	.word	train_buffer(GOT)
	.size	set_all_switches_to_straight, .-set_all_switches_to_straight
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\033[10;0H\000"
	.align	2
.LC1:
	.ascii	"\033[%d;0HSW %d :\000"
	.align	2
.LC2:
	.ascii	"\033[%d;0HSW %x :\000"
	.text
	.align	2
	.type	pretty_print_switch_stuff, %function
pretty_print_switch_stuff:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L21+4
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L13
.L14:
	ldr	r3, [fp, #-20]
	add	r2, r3, #10
	mov	r0, #1
	ldr	r3, .L21+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, [fp, #-20]
	bl	polprintf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L13:
	ldr	r3, [fp, #-20]
	cmp	r3, #18
	ble	.L14
	mov	r3, #153
	str	r3, [fp, #-20]
	b	.L16
.L17:
	ldr	r3, [fp, #-20]
	sub	r2, r3, #124
	mov	r0, #1
	ldr	r3, .L21+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, [fp, #-20]
	bl	polprintf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L16:
	ldr	r3, [fp, #-20]
	cmp	r3, #156
	ble	.L17
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	pretty_print_switch_stuff, .-pretty_print_switch_stuff
	.section	.rodata
	.align	2
.LC3:
	.ascii	"\033[%d;12H%c\000"
	.text
	.align	2
	.type	print_switch_states, %function
print_switch_states:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L29
.L28:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L29+4
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L24
.L25:
	ldr	r3, [fp, #-20]
	add	ip, r3, #10
	ldr	r2, [fp, #-20]
	ldr	r3, .L29+8
	ldr	r3, [sl, r3]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	lr, r3
	mov	r0, #1
	ldr	r3, .L29+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, ip
	mov	r3, lr
	bl	polprintf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L24:
	ldr	r3, [fp, #-20]
	cmp	r3, #22
	ble	.L25
	ldr	r3, .L29+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, #0]
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L30:
	.align	2
.L29:
	.word	_GLOBAL_OFFSET_TABLE_-(.L28+8)
	.word	.LC0(GOTOFF)
	.word	switch_states(GOT)
	.word	.LC3(GOTOFF)
	.word	switch_states_changed(GOT)
	.size	print_switch_states, .-print_switch_states
	.section	.rodata
	.align	2
.LC4:
	.ascii	"\033[?25l\000"
	.align	2
.LC5:
	.ascii	"\033[2J\000"
	.align	2
.LC6:
	.ascii	"\033[5;0H>>\000"
	.align	2
.LC7:
	.ascii	"\033[7;0HLast command: \000"
	.align	2
.LC8:
	.ascii	"\033[H\000"
	.align	2
.LC9:
	.ascii	"%u.%u.%u\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #60
	ldr	sl, .L44
.L43:
	add	sl, pc, sl
	ldr	r3, .L44+4
	ldr	r2, [sl, r3]
	mov	r3, #3
	str	r3, [r2, #0]
	ldr	r3, .L44+8
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L44+12
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L44+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-40]
	mvn	r3, #-16777216
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	ldr	r3, .L44+20
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	bl	buffer_init(PLT)
	mov	r0, #0
	mov	r1, #2400
	bl	setspeed(PLT)
	mov	r0, #1
	ldr	r1, .L44+24
	bl	setspeed(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	setfifo(PLT)
	mov	r0, #1
	mov	r1, #0
	bl	setfifo(PLT)
	mvn	r0, #-16777216
	bl	set_timer(PLT)
	ldr	r3, [fp, #-28]
	str	r3, [sp, #0]
	sub	r3, fp, #40
	ldmia	r3, {r1, r2, r3}
	sub	r0, fp, #56
	bl	get_curtime(PLT)
	sub	ip, fp, #40
	sub	r3, fp, #56
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, #1
	ldr	r3, .L44+28
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	mov	r0, #1
	ldr	r3, .L44+32
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	mov	r0, #1
	ldr	r3, .L44+36
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	mov	r0, #1
	ldr	r3, .L44+40
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	ldr	r3, .L44+44
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #96
	bl	put_on_buffer(PLT)
	ldr	r3, .L44+8
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	bl	set_all_switches_to_straight(PLT)
	bl	pretty_print_switch_stuff(PLT)
	ldr	r3, .L44+48
	ldr	r2, [sl, r3]
	mov	r3, #1
	strb	r3, [r2, #0]
	ldr	r3, .L44+52
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, #0]
	bl	init_terminal(PLT)
.L32:
	ldr	r3, [fp, #-28]
	str	r3, [sp, #0]
	sub	r3, fp, #40
	ldmia	r3, {r1, r2, r3}
	sub	r0, fp, #72
	bl	get_curtime(PLT)
	sub	ip, fp, #40
	sub	r3, fp, #72
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L33
	mov	r0, #1
	ldr	r3, .L44+56
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	ldr	r2, [fp, #-40]
	ldr	ip, [fp, #-36]
	ldr	r3, [fp, #-32]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L44+60
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	polprintf(PLT)
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
.L33:
	bl	get_char_from_keyboard(PLT)
	ldr	r3, .L44+12
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L35
	bl	send_char_to_screen(PLT)
.L35:
	bl	execute_command(PLT)
	ldr	r3, .L44+48
	ldr	r3, [sl, r3]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L37
	bl	print_switch_states(PLT)
.L37:
	bl	query_sensor(PLT)
	ldr	r3, .L44+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L32
	mov	r0, #1
	ldr	r3, .L44+32
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
.L40:
	bl	send_char_to_screen(PLT)
	sub	r2, fp, #21
	ldr	r3, .L44+64
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	buffer_peek(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L40
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L45:
	.align	2
.L44:
	.word	_GLOBAL_OFFSET_TABLE_-(.L43+8)
	.word	linepos(GOT)
	.word	execute(GOT)
	.word	write(GOT)
	.word	got_command(GOT)
	.word	q(GOT)
	.word	115200
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	train_buffer(GOT)
	.word	switch_states_changed(GOT)
	.word	sensor_states_changed(GOT)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	screen_buffer(GOT)
	.size	main, .-main
	.comm	q,4,4
	.comm	switch_states,23,1
	.comm	sensor_states,88,1
	.ident	"GCC: (GNU) 4.0.2"
