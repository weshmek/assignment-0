	.file	"timer.c"
	.text
	.align	2
	.global	get_time
	.type	get_time, %function
get_time:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	r3, .L3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L4:
	.align	2
.L3:
	.word	-2139029372
	.size	get_time, .-get_time
	.align	2
	.global	set_timer
	.type	set_timer, %function
set_timer:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L7
	str	r3, [fp, #-20]
	ldr	r3, .L7+4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #128
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	-2139029376
	.word	-2139029368
	.size	set_timer, .-set_timer
	.ident	"GCC: (GNU) 4.0.2"
