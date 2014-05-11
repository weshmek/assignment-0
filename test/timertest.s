	.file	"timertest.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[2J\000"
	.align	2
.LC1:
	.ascii	"%c[%d;%dH\000"
	.align	2
.LC2:
	.ascii	"THE TIME IS: \000"
	.align	2
.LC3:
	.ascii	"%u.%u.%u\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	ldr	sl, .L8
.L7:
	add	sl, pc, sl
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r0, #1
	ldr	r3, .L8+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	bwprintf(PLT)
	mvn	r3, #-16777216
	str	r3, [fp, #-56]
	mvn	r0, #-16777216
	bl	set_timer(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L8+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #0
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L8+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	b	.L6
.L2:
.L6:
	mov	r3, #14
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L8+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #0
	bl	bwprintf(PLT)
	bl	get_time(PLT)
	mov	r3, r0
	str	r3, [fp, #-60]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-60]
	rsb	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-52]
	ldr	r3, .L8+16
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #6
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L2
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L8+20
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #3
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-24]
	ldr	r3, .L8+20
	umull	r2, r3, r1, r3
	mov	r2, r3, lsr #3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r3, r3, r1
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L8+24
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #5
	str	r3, [fp, #-28]
	ldr	r1, [fp, #-20]
	ldr	r3, .L8+24
	umull	r2, r3, r1, r3
	mov	r2, r3, lsr #5
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r3, r1
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-48]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L8+28
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-44]
	bl	bwprintf(PLT)
	b	.L2
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.L7+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	1374389535
	.word	-858993459
	.word	-2004318071
	.word	.LC3(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
