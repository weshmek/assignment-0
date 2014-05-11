	.file	"cursor-addressing-test.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[2J\000"
	.align	2
.LC1:
	.ascii	"%c[%d;%dH\000"
	.align	2
.LC2:
	.ascii	"Time goes here\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r0, #1
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L4+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #0
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
