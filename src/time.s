	.file	"time.c"
	.text
	.align	2
	.global	get_curtime
	.type	get_curtime, %function
get_curtime:
	@ args = 16, pretend = 12, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	sub	sp, sp, #12
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #16
	sub	sp, sp, #60
	str	r0, [fp, #-72]
	add	r0, fp, #4
	stmia	r0, {r1, r2, r3}
	ldr	r3, [fp, #8]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #12]
	str	r3, [fp, #-44]
	bl	get_time(PLT)
	mov	r3, r0
	str	r3, [fp, #-52]
	ldr	r2, [fp, #16]
	ldr	r3, [fp, #-52]
	rsb	r3, r3, r2
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-48]
	ldr	r3, .L6
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #6
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L2
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L6+4
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #3
	str	r3, [fp, #-28]
	ldr	r1, [fp, #-24]
	ldr	r3, .L6+4
	umull	r2, r3, r1, r3
	mov	r2, r3, lsr #3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r3, r3, r1
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L6+8
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #5
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r3, .L6+8
	umull	r2, r3, r1, r3
	mov	r2, r3, lsr #5
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r3, r1
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-56]
	b	.L4
.L2:
	ldr	r3, [fp, #16]
	str	r3, [fp, #-56]
.L4:
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-68]
	ldr	ip, [fp, #-72]
	sub	r3, fp, #68
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r0, [fp, #-72]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	1374389535
	.word	-858993459
	.word	-2004318071
	.size	get_curtime, .-get_curtime
	.ident	"GCC: (GNU) 4.0.2"
