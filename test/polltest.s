	.file	"polltest.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 288
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #288
	ldr	sl, .L16
.L15:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	bl	buffer_init(PLT)
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	mvn	r3, #-16777216
	str	r3, [fp, #-32]
	mvn	r0, #-16777216
	bl	set_timer(PLT)
	ldr	r3, .L16+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #1024]
	ldr	r3, .L16+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #1028]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r1, .L16+8
	bl	setspeed(PLT)
	mov	r0, #1
	mov	r1, #0
	bl	setfifo(PLT)
	mov	r0, #0
	mov	r1, #2400
	bl	setspeed(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	setfifo(PLT)
	mov	r0, #1
	mov	r1, #97
	bl	putch(PLT)
	b	.L14
.L2:
.L14:
	sub	r3, fp, #45
	mov	r0, #1
	mov	r1, r3
	bl	getch(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L3
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L5
	mov	r3, #1
	str	r3, [fp, #-28]
	ldr	r3, .L16+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #1024]
	ldr	r3, .L16+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #1028]
.L5:
	mov	r3, #1
	str	r3, [fp, #-20]
.L3:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L7
	mov	r0, #1
	bl	cts(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L7
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	mov	r0, #1
	mov	r1, r3
	bl	putch(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L7
	mov	r3, #0
	str	r3, [fp, #-20]
.L7:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L2
	mov	r3, #0
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-301]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	and	r2, r3, #255
	ldrb	r3, [fp, #-300]	@ zero_extendqisi2
	and	r3, r3, #255
	add	r3, r2, r3
	and	r1, r3, #255
	mov	r3, #16
	mov	r2, r3
	mov	r3, r1
	rsb	r3, r2, r3
	and	r3, r3, #255
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]
	strb	r3, [fp, #-45]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L2
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	screen_buffer(GOT)
	.word	115200
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
