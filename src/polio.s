	.file	"polio.c"
	.global	chars_to_write
	.bss
	.align	2
	.type	chars_to_write, %object
	.size	chars_to_write, 4
chars_to_write:
	.space	4
	.text
	.align	2
	.global	uart_init
	.type	uart_init, %function
uart_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
	.size	uart_init, .-uart_init
	.align	2
	.global	setspeed
	.type	setspeed, %function
setspeed:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L5
	ldr	r2, [fp, #-36]
	cmp	r2, #1
	beq	.L6
	b	.L4
.L5:
	ldr	r3, .L13
	str	r3, [fp, #-20]
	ldr	r3, .L13+4
	str	r3, [fp, #-16]
	b	.L7
.L6:
	ldr	r3, .L13+8
	str	r3, [fp, #-20]
	ldr	r3, .L13+12
	str	r3, [fp, #-16]
	b	.L7
.L4:
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L8
.L7:
	ldr	r2, [fp, #-28]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #2400
	beq	.L10
	ldr	r3, .L13+16
	ldr	r2, [fp, #-40]
	cmp	r2, r3
	beq	.L11
	b	.L9
.L11:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #3
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L8
.L10:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #191
	str	r3, [r2, #0]
	mov	r2, #0
	str	r2, [fp, #-32]
	b	.L8
.L9:
	mvn	r3, #0
	str	r3, [fp, #-32]
.L8:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L14:
	.align	2
.L13:
	.word	-2138308596
	.word	-2138308592
	.word	-2138243060
	.word	-2138243056
	.word	115200
	.size	setspeed, .-setspeed
	.align	2
	.global	setfifo
	.type	setfifo, %function
setfifo:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	beq	.L18
	b	.L16
.L17:
	ldr	r3, .L25
	str	r3, [fp, #-20]
	b	.L19
.L18:
	ldr	r3, .L25+4
	str	r3, [fp, #-20]
	b	.L19
.L16:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L20
.L19:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L21
	ldr	r3, [fp, #-16]
	orr	r3, r3, #16
	str	r3, [fp, #-32]
	b	.L23
.L21:
	ldr	r3, [fp, #-16]
	bic	r3, r3, #16
	str	r3, [fp, #-32]
.L23:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
.L20:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	-2138308600
	.word	-2138243064
	.size	setfifo, .-setfifo
	.align	2
	.global	getch
	.type	getch, %function
getch:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L29
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	beq	.L30
	b	.L28
.L29:
	ldr	r3, .L36
	str	r3, [fp, #-20]
	ldr	r3, .L36+4
	str	r3, [fp, #-16]
	b	.L31
.L30:
	ldr	r3, .L36+8
	str	r3, [fp, #-20]
	ldr	r3, .L36+12
	str	r3, [fp, #-16]
	b	.L31
.L28:
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L32
.L31:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L33
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	ldr	r2, [fp, #-28]
	strb	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L32
.L33:
	mov	r3, #1
	str	r3, [fp, #-32]
.L32:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.size	getch, .-getch
	.align	2
	.global	cts
	.type	cts, %function
cts:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L40
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	beq	.L41
	b	.L39
.L40:
	ldr	r3, .L45
	str	r3, [fp, #-16]
	b	.L42
.L41:
	ldr	r3, .L45+4
	str	r3, [fp, #-16]
	b	.L42
.L39:
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L43
.L42:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	str	r3, [fp, #-24]
.L43:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	-2138308584
	.word	-2138243048
	.size	cts, .-cts
	.align	2
	.global	putch
	.type	putch, %function
putch:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, r1
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L49
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	beq	.L50
	b	.L48
.L49:
	ldr	r3, .L55
	str	r3, [fp, #-20]
	ldr	r3, .L55+4
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	eor	r3, r3, #1
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L51
	ldrb	r2, [fp, #-28]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L53
.L51:
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L53
.L50:
	ldr	r3, .L55+8
	str	r3, [fp, #-20]
	ldr	r3, .L55+12
	str	r3, [fp, #-16]
	ldrb	r2, [fp, #-28]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L53
.L48:
	mvn	r3, #0
	str	r3, [fp, #-32]
.L53:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L56:
	.align	2
.L55:
	.word	-2138308608
	.word	-2138308584
	.word	-2138243072
	.word	-2138243048
	.size	putch, .-putch
	.align	2
	.global	c2x
	.type	c2x, %function
c2x:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #9
	bhi	.L58
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
	b	.L60
.L58:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #87
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
.L60:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	c2x, .-c2x
	.align	2
	.global	putx
	.type	putx, %function
putx:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L65
.L64:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	mov	r3, r1
	strb	r3, [fp, #-28]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #255
	mov	r0, r3
	bl	c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-18]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	and	r3, r3, #15
	mov	r0, r3
	bl	c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-18]	@ zero_extendqisi2
	ldr	r3, .L65+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	ldr	r3, .L65+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L66:
	.align	2
.L65:
	.word	_GLOBAL_OFFSET_TABLE_-(.L64+8)
	.word	screen_buffer(GOT)
	.size	putx, .-putx
	.align	2
	.global	putr
	.type	putr, %function
putr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L73
.L72:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	sub	r3, fp, #32
	str	r3, [fp, #-20]
	mov	r3, #3
	str	r3, [fp, #-24]
	b	.L68
.L69:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	putx(PLT)
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L68:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L69
	ldr	r3, .L73+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #32
	bl	put_on_buffer(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.L72+8)
	.word	screen_buffer(GOT)
	.size	putr, .-putr
	.align	2
	.global	putstr
	.type	putstr, %function
putstr:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L81
.L80:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	b	.L76
.L77:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L81+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L76:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L77
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L82:
	.align	2
.L81:
	.word	_GLOBAL_OFFSET_TABLE_-(.L80+8)
	.word	screen_buffer(GOT)
	.size	putstr, .-putstr
	.align	2
	.global	putw
	.type	putw, %function
putw:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L96
.L95:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r3, [fp, #-40]
	mov	r3, r2
	strb	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-20]
	b	.L84
.L85:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
.L84:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L88
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bgt	.L85
	b	.L88
.L89:
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	ldr	r2, .L96+4
	ldr	r2, [sl, r2]
	mov	r0, r2
	mov	r1, r3
	bl	put_on_buffer(PLT)
.L88:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	cmp	r2, #0
	bne	.L89
	b	.L91
.L92:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldr	r2, .L96+4
	ldr	r2, [sl, r2]
	mov	r0, r2
	mov	r1, r3
	bl	put_on_buffer(PLT)
.L91:
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	cmp	r2, #0
	bne	.L92
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L97:
	.align	2
.L96:
	.word	_GLOBAL_OFFSET_TABLE_-(.L95+8)
	.word	screen_buffer(GOT)
	.size	putw, .-putw
	.align	2
	.global	a2d
	.type	a2d, %function
a2d:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L99
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L99
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L102
.L99:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L103
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L103
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L102
.L103:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L106
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L106
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L102
.L106:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L102:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	a2d, .-a2d
	.align	2
	.global	a2i
	.type	a2i, %function
a2i:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	str	r3, [fp, #-40]
	mov	r3, r0
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L111
.L112:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L113
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L111:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	a2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L112
.L113:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	a2i, .-a2i
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	ui2a
	.type	ui2a, %function
ui2a:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L117
.L118:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L117:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L118
	b	.L130
.L121:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L122
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L122
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L120
.L122:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L125
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L127
.L125:
	mov	r3, #87
	str	r3, [fp, #-40]
.L127:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	ldr	r1, [fp, #-40]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-36]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L120:
.L130:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L121
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	ui2a, .-ui2a
	.align	2
	.global	i2a
	.type	i2a, %function
i2a:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L132
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L132:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #10
	ldr	r2, [fp, #-20]
	bl	ui2a(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	i2a, .-i2a
	.align	2
	.global	format
	.type	format, %function
format:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	ldr	sl, .L156
.L155:
	add	sl, pc, sl
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	b	.L154
.L137:
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L138
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	ldr	r2, .L156+4
	ldr	r2, [sl, r2]
	mov	r0, r2
	mov	r1, r3
	bl	put_on_buffer(PLT)
	b	.L136
.L138:
	mov	r3, #0
	strb	r3, [fp, #-17]
	mov	r3, #0
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-44]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-18]
	add	r3, r2, #1
	str	r3, [fp, #-44]
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	cmp	r3, #48
	beq	.L141
	ldr	r3, [fp, #-56]
	cmp	r3, #48
	blt	.L140
	ldr	r3, [fp, #-56]
	cmp	r3, #57
	bgt	.L140
	b	.L142
.L141:
	mov	r3, #1
	strb	r3, [fp, #-17]
	ldr	r2, [fp, #-44]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-18]
	add	r3, r2, #1
	str	r3, [fp, #-44]
	b	.L140
.L142:
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	sub	r2, fp, #44
	sub	ip, fp, #36
	mov	r0, r3
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	a2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-18]
.L140:
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #115
	beq	.L147
	ldr	r3, [fp, #-52]
	cmp	r3, #115
	bgt	.L150
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	beq	.L145
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	bgt	.L151
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L153
	ldr	r3, [fp, #-52]
	cmp	r3, #37
	beq	.L144
	b	.L136
.L151:
	ldr	r3, [fp, #-52]
	cmp	r3, #100
	beq	.L146
	b	.L136
.L150:
	ldr	r3, [fp, #-52]
	cmp	r3, #117
	beq	.L148
	ldr	r3, [fp, #-52]
	cmp	r3, #120
	beq	.L149
	b	.L136
.L145:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L156+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	put_on_buffer(PLT)
	b	.L136
.L147:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-40]
	mov	r1, r2
	mov	r2, #0
	bl	putw(PLT)
	b	.L136
.L148:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #30
	mov	r0, r3
	mov	r1, #10
	bl	ui2a(PLT)
	ldr	r3, [fp, #-36]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	sub	ip, fp, #30
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r3, ip
	bl	putw(PLT)
	b	.L136
.L146:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #30
	mov	r0, r3
	mov	r1, r2
	bl	i2a(PLT)
	ldr	r3, [fp, #-36]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	sub	ip, fp, #30
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r3, ip
	bl	putw(PLT)
	b	.L136
.L149:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #30
	mov	r0, r3
	mov	r1, #16
	bl	ui2a(PLT)
	ldr	r3, [fp, #-36]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	sub	ip, fp, #30
	ldr	r0, [fp, #-40]
	mov	r1, r3
	mov	r3, ip
	bl	putw(PLT)
	b	.L136
.L144:
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	ldr	r2, .L156+4
	ldr	r2, [sl, r2]
	mov	r0, r2
	mov	r1, r3
	bl	put_on_buffer(PLT)
.L136:
.L154:
	ldr	r1, [fp, #-44]
	ldrb	r3, [r1, #0]
	strb	r3, [fp, #-18]
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-44]
	cmp	r2, #0
	bne	.L137
.L153:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L157:
	.align	2
.L156:
	.word	_GLOBAL_OFFSET_TABLE_-(.L155+8)
	.word	screen_buffer(GOT)
	.size	format, .-format
	.align	2
	.global	polprintf
	.type	polprintf, %function
polprintf:
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3}
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #16
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	add	r3, fp, #8
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #4]
	ldr	r2, [fp, #-16]
	bl	format(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	polprintf, .-polprintf
	.ident	"GCC: (GNU) 4.0.2"
