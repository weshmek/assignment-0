	.file	"terminal.c"
	.bss
	.align	2
sensor_query_state:
	.space	4
	.align	2
module_being_queried:
	.space	4
	.data
	.align	2
	.type	debug_print_line, %object
	.size	debug_print_line, 4
debug_print_line:
	.word	50
	.bss
	.align	2
line:
	.space	4
	.text
	.align	2
	.global	init_terminal
	.type	init_terminal, %function
init_terminal:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L7
.L6:
	add	sl, pc, sl
	ldr	r3, .L7+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L7+8
	ldr	r2, [sl, r3]
	mov	r3, #50
	str	r3, [r2, #0]
	ldr	r3, .L7+12
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L7+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L2
.L3:
	ldr	r3, [fp, #-20]
	mov	r1, r3, asl #1
	ldr	r3, .L7+20
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r1, r3, #1
	ldr	r3, .L7+20
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #15
	ble	.L3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L6+8)
	.word	sensor_query_state(GOT)
	.word	debug_print_line(GOT)
	.word	module_being_queried(GOT)
	.word	line(GOT)
	.word	sensors_on_screen(GOT)
	.size	init_terminal, .-init_terminal
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\033[5;3H\033[K\000"
	.align	2
.LC1:
	.ascii	"\033[7;14H\033[K\000"
	.align	2
.LC2:
	.ascii	"%c\000"
	.align	2
.LC3:
	.ascii	"\033[5;%dH\033[K\000"
	.align	2
.LC4:
	.ascii	"\033[5;%dH%c\000"
	.text
	.align	2
	.global	get_char_from_keyboard
	.type	get_char_from_keyboard, %function
get_char_from_keyboard:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L37
.L36:
	add	sl, pc, sl
	mov	r3, #0
	strb	r3, [fp, #-26]
	sub	r3, fp, #25
	mov	r0, #1
	mov	r1, r3
	bl	getch(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L10
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L12
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L14
.L12:
	mov	r0, #1
	ldr	r3, .L37+4
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L37+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	sub	r2, fp, #29
	ldr	r3, .L37+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	parse_instruction(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L15
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, .L37+12
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L17
.L18:
	ldr	r3, [fp, #-24]
	mvn	r2, #12
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L37+16
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L17:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L18
	mov	r0, #1
	ldr	r3, .L37+20
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L20
.L21:
	ldr	r2, [fp, #-24]
	ldr	r3, .L37+8
	ldr	r3, [sl, r3]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L37+24
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L20:
	ldr	r3, .L37+28
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	sub	r2, r3, #3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L21
.L15:
	mov	r0, #1
	ldr	r3, .L37+4
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	ldr	r3, .L37+8
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #1024]
	ldr	r3, .L37+8
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #1028]
	ldr	r3, .L37+32
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L37+28
	ldr	r2, [sl, r3]
	mov	r3, #3
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [fp, #-44]
	b	.L22
.L14:
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L23
	ldr	r3, .L37+28
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L25
	ldr	r3, .L37+28
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	str	r3, [fp, #-40]
	b	.L27
.L25:
	mov	r3, #3
	str	r3, [fp, #-40]
.L27:
	ldr	r3, .L37+28
	ldr	r3, [sl, r3]
	ldr	r1, [fp, #-40]
	str	r1, [r3, #0]
	ldr	r3, .L37+28
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L37+36
	add	r3, sl, r3
	mov	r1, r3
	bl	polprintf(PLT)
	ldr	r3, .L37+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #1024]
	cmp	r3, #1
	beq	.L28
	ldr	r3, .L37+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #1024]
	sub	r3, r3, #1
	str	r3, [fp, #-36]
	b	.L30
.L28:
	mov	r2, #1
	str	r2, [fp, #-36]
.L30:
	ldr	r3, .L37+8
	ldr	r3, [sl, r3]
	ldr	r1, [fp, #-36]
	str	r1, [r3, #1024]
	ldr	r3, .L37+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #1024]
	cmp	r3, #1
	bne	.L31
	ldr	r3, .L37+8
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #1028]
.L31:
	ldr	r3, .L37+32
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [fp, #-44]
	b	.L22
.L23:
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L37+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	ble	.L33
	ldr	r3, .L37+28
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	mov	ip, r3
	mov	r0, #1
	ldr	r3, .L37+40
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	polprintf(PLT)
	ldr	r3, .L37+28
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L37+28
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L37+32
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L22
.L33:
	mov	r1, #0
	str	r1, [fp, #-44]
	b	.L22
.L10:
	mov	r2, #0
	str	r2, [fp, #-44]
.L22:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L38:
	.align	2
.L37:
	.word	_GLOBAL_OFFSET_TABLE_-(.L36+8)
	.word	.LC0(GOTOFF)
	.word	keyboard_buffer(GOT)
	.word	execute(GOT)
	.word	train_buffer(GOT)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	linepos(GOT)
	.word	write(GOT)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.size	get_char_from_keyboard, .-get_char_from_keyboard
	.align	2
	.global	send_char_to_screen
	.type	send_char_to_screen, %function
send_char_to_screen:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L46
.L45:
	add	sl, pc, sl
	sub	r2, fp, #17
	ldr	r3, .L46+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	buffer_peek(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L40
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	mov	r1, r3
	bl	putch(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L40
	sub	r3, fp, #17
	ldr	r2, .L46+4
	ldr	r2, [sl, r2]
	mov	r0, r2
	mov	r1, r3
	bl	buffer_take(PLT)
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L43
.L40:
	mov	r3, #0
	str	r3, [fp, #-24]
.L43:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L47:
	.align	2
.L46:
	.word	_GLOBAL_OFFSET_TABLE_-(.L45+8)
	.word	screen_buffer(GOT)
	.size	send_char_to_screen, .-send_char_to_screen
	.align	2
	.global	parse_command
	.type	parse_command, %function
parse_command:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L61
.L60:
	add	sl, pc, sl
	sub	r2, fp, #17
	ldr	r3, .L61+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	buffer_peek(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L49
	ldr	r3, .L61+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #1024]
	sub	r2, r3, #1
	ldr	r3, .L61+4
	ldr	r3, [sl, r3]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L49
	sub	r2, fp, #19
	ldr	r3, .L61+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	parse_instruction(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L52
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L61+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L49
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L61+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L49
	ldr	r3, .L61+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #1024]
	ldr	r3, .L61+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #1028]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L57
.L52:
	ldr	r3, .L61+12
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #1
	bne	.L49
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L57
.L49:
	mov	r3, #0
	str	r3, [fp, #-24]
.L57:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L62:
	.align	2
.L61:
	.word	_GLOBAL_OFFSET_TABLE_-(.L60+8)
	.word	keyboard_buffer(GOT)
	.word	train_buffer(GOT)
	.word	q(GOT)
	.size	parse_command, .-parse_command
	.align	2
	.global	execute_command
	.type	execute_command, %function
execute_command:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L70
.L69:
	add	sl, pc, sl
	sub	r2, fp, #17
	ldr	r3, .L70+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	buffer_peek(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L64
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	putch(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L64
	sub	r3, fp, #17
	ldr	r2, .L70+4
	ldr	r2, [sl, r2]
	mov	r0, r2
	mov	r1, r3
	bl	buffer_take(PLT)
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L67
.L64:
	mov	r3, #0
	str	r3, [fp, #-24]
.L67:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L71:
	.align	2
.L70:
	.word	_GLOBAL_OFFSET_TABLE_-(.L69+8)
	.word	train_buffer(GOT)
	.size	execute_command, .-execute_command
	.align	2
	.global	check_if_sensor_on_screen
	.type	check_if_sensor_on_screen, %function
check_if_sensor_on_screen:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L82
.L81:
	add	sl, pc, sl
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-24]
	mov	r3, r2
	strb	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L73
.L74:
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #1
	ldr	r3, .L82+4
	ldr	r3, [sl, r3]
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, r2
	bne	.L75
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r2, r3, #1
	ldr	r3, .L82+4
	ldr	r3, [sl, r3]
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	cmp	r3, r2
	bne	.L75
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L78
.L75:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L73:
	ldr	r3, [fp, #-20]
	cmp	r3, #14
	ble	.L74
	mov	r3, #0
	str	r3, [fp, #-32]
.L78:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L83:
	.align	2
.L82:
	.word	_GLOBAL_OFFSET_TABLE_-(.L81+8)
	.word	sensors_on_screen(GOT)
	.size	check_if_sensor_on_screen, .-check_if_sensor_on_screen
	.section	.rodata
	.align	2
.LC5:
	.ascii	"\033[%d;40H\033[K%c%d\033[%d;40H\033[K------\000"
	.text
	.align	2
	.global	print_query_response
	.type	print_query_response, %function
print_query_response:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L107
.L106:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r3, .L107+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L105
	.p2align 2
.L91:
	b	.L86
	b	.L87
	b	.L88
	b	.L89
	b	.L90
.L86:
	mov	r3, #65
	strb	r3, [fp, #-21]
	b	.L92
.L87:
	mov	r3, #66
	strb	r3, [fp, #-21]
	b	.L92
.L88:
	mov	r3, #67
	strb	r3, [fp, #-21]
	b	.L92
.L89:
	mov	r3, #68
	strb	r3, [fp, #-21]
	b	.L92
.L90:
	mov	r3, #69
	strb	r3, [fp, #-21]
.L92:
	mov	r3, #7
	str	r3, [fp, #-20]
	b	.L94
.L95:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L96
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	rsb	r3, r3, #8
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	check_if_sensor_on_screen(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L96
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	ip, [r3, #0]
	ldrb	lr, [fp, #-21]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	rsb	r2, r3, #8
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #1
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r3, .L107+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, ip
	mov	r3, lr
	bl	polprintf(PLT)
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r1, r3, asl #1
	ldr	r3, .L107+16
	ldr	r2, [sl, r3]
	ldrb	r3, [fp, #-21]
	strb	r3, [r2, r1]
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #1
	add	r0, r3, #1
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	rsb	r3, r3, #8
	and	r3, r3, #255
	and	r1, r3, #255
	ldr	r3, .L107+16
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, r0]
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L107+20
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	mov	r1, r3, asr #3
	mov	r3, r2, asr #31
	rsb	r1, r3, r1
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #4
	ldr	r1, [fp, #-36]
	rsb	r3, r1, r3
	rsb	r2, r3, r2
	str	r2, [fp, #-36]
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #0]
.L96:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L94:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L95
	mov	r3, #7
	str	r3, [fp, #-20]
	b	.L100
.L101:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L102
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	rsb	r3, r3, #16
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	check_if_sensor_on_screen(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L102
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	ip, [r3, #0]
	ldrb	lr, [fp, #-21]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	rsb	r2, r3, #16
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #1
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r3, .L107+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, ip
	mov	r3, lr
	bl	polprintf(PLT)
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r1, r3, asl #1
	ldr	r3, .L107+16
	ldr	r2, [sl, r3]
	ldrb	r3, [fp, #-21]
	strb	r3, [r2, r1]
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #1
	add	r0, r3, #1
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	rsb	r3, r3, #16
	and	r3, r3, #255
	and	r1, r3, #255
	ldr	r3, .L107+16
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, r0]
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L107+20
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	mov	r1, r3, asr #3
	mov	r3, r2, asr #31
	rsb	r1, r3, r1
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #4
	ldr	r1, [fp, #-32]
	rsb	r3, r1, r3
	rsb	r2, r3, r2
	str	r2, [fp, #-32]
	ldr	r3, .L107+8
	ldr	r3, [sl, r3]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #0]
.L102:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L100:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L101
.L105:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L108:
	.align	2
.L107:
	.word	_GLOBAL_OFFSET_TABLE_-(.L106+8)
	.word	module_being_queried(GOT)
	.word	line(GOT)
	.word	.LC5(GOTOFF)
	.word	sensors_on_screen(GOT)
	.word	-2004318071
	.size	print_query_response, .-print_query_response
	.align	2
	.global	query_sensor
	.type	query_sensor, %function
query_sensor:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L128
.L127:
	add	sl, pc, sl
	ldr	r3, .L128+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	beq	.L112
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	bcc	.L111
	ldr	r3, [fp, #-28]
	cmp	r3, #2
	beq	.L113
	b	.L110
.L111:
	ldr	r3, .L128+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #133
	bl	put_on_buffer(PLT)
	ldr	r3, .L128+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	b	.L114
.L112:
	sub	r3, fp, #17
	mov	r0, #0
	mov	r1, r3
	bl	getch(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L114
	ldrb	r1, [fp, #-17]	@ zero_extendqisi2
	ldr	r3, .L128+12
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, .L128+4
	ldr	r2, [sl, r3]
	mov	r3, #2
	str	r3, [r2, #0]
	b	.L114
.L113:
	sub	r3, fp, #17
	mov	r0, #0
	mov	r1, r3
	bl	getch(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L114
	ldrb	r1, [fp, #-17]	@ zero_extendqisi2
	ldr	r3, .L128+12
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, #1]
	ldr	r3, .L128+16
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L114
	.p2align 2
.L124:
	b	.L119
	b	.L120
	b	.L121
	b	.L122
	b	.L123
.L119:
	ldr	r3, .L128+12
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	print_query_response(PLT)
	ldr	r3, .L128+16
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L128+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L128+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #192
	bl	put_on_buffer(PLT)
	b	.L114
.L120:
	ldr	r3, .L128+12
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	print_query_response(PLT)
	ldr	r3, .L128+16
	ldr	r2, [sl, r3]
	mov	r3, #2
	str	r3, [r2, #0]
	ldr	r3, .L128+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L128+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #192
	bl	put_on_buffer(PLT)
	b	.L114
.L121:
	ldr	r3, .L128+12
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	print_query_response(PLT)
	ldr	r3, .L128+16
	ldr	r2, [sl, r3]
	mov	r3, #3
	str	r3, [r2, #0]
	ldr	r3, .L128+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L128+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #192
	bl	put_on_buffer(PLT)
	b	.L114
.L122:
	ldr	r3, .L128+12
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	print_query_response(PLT)
	ldr	r3, .L128+16
	ldr	r2, [sl, r3]
	mov	r3, #4
	str	r3, [r2, #0]
	ldr	r3, .L128+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L128+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #192
	bl	put_on_buffer(PLT)
	b	.L114
.L123:
	ldr	r3, .L128+12
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	print_query_response(PLT)
	ldr	r3, .L128+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L128+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L128+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #192
	bl	put_on_buffer(PLT)
	b	.L114
.L110:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L125
.L114:
	mov	r3, #1
	str	r3, [fp, #-24]
.L125:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L129:
	.align	2
.L128:
	.word	_GLOBAL_OFFSET_TABLE_-(.L127+8)
	.word	sensor_query_state(GOT)
	.word	train_buffer(GOT)
	.word	query_response(GOT)
	.word	module_being_queried(GOT)
	.size	query_sensor, .-query_sensor
	.section	.rodata
	.align	2
.LC6:
	.ascii	"\033[%d;50H\033[K%s\000"
	.text
	.align	2
	.global	debug_print
	.type	debug_print, %function
debug_print:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L136
.L135:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, .L136+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L136+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, [fp, #-20]
	bl	polprintf(PLT)
	ldr	r3, .L136+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #60
	beq	.L131
	ldr	r3, .L136+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	b	.L133
.L131:
	mov	r2, #50
	str	r2, [fp, #-24]
.L133:
	ldr	r3, .L136+4
	ldr	r3, [sl, r3]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #0]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L137:
	.align	2
.L136:
	.word	_GLOBAL_OFFSET_TABLE_-(.L135+8)
	.word	debug_print_line(GOT)
	.word	.LC6(GOTOFF)
	.size	debug_print, .-debug_print
	.bss
sensors_on_screen:
	.space	30
query_response:
	.space	2
	.comm	linepos,4,4
	.comm	execute,4,4
	.comm	got_command,4,4
	.comm	write,4,4
	.comm	char_to_write,1,1
	.ident	"GCC: (GNU) 4.0.2"
