	.file	"buffers.c"
	.text
	.align	2
	.global	buffer_init
	.type	buffer_init, %function
buffer_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L7
.L6:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L2
.L3:
	ldr	r0, [fp, #-20]
	ldr	ip, [fp, #-20]
	ldr	lr, [fp, #-20]
	ldr	r1, [fp, #-20]
	ldr	r3, .L7+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, r1]
	ldr	r3, .L7+4
	ldr	r3, [sl, r3]
	ldrb	r1, [r3, r1]	@ zero_extendqisi2
	ldr	r3, .L7+8
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, lr]
	ldr	r3, .L7+8
	ldr	r3, [sl, r3]
	ldrb	r1, [r3, lr]	@ zero_extendqisi2
	ldr	r3, .L7+12
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, ip]
	ldr	r3, .L7+12
	ldr	r3, [sl, r3]
	ldrb	r1, [r3, ip]	@ zero_extendqisi2
	ldr	r3, .L7+16
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, r0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r2, [fp, #-20]
	ldr	r3, .L7+20
	cmp	r2, r3
	ble	.L3
	ldr	r3, .L7+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #1024]
	ldr	r3, .L7+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #1024]
	ldr	r3, .L7+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #1024]
	ldr	r3, .L7+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #1024]
	ldr	r3, .L7+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #1024]
	ldr	r3, .L7+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #1024]
	ldr	r3, .L7+16
	ldr	r3, [sl, r3]
	str	r2, [r3, #1024]
	ldr	r3, .L7+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #1028]
	ldr	r3, .L7+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #1028]
	ldr	r3, .L7+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #1028]
	ldr	r3, .L7+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #1028]
	ldr	r3, .L7+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #1028]
	ldr	r3, .L7+12
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #1028]
	ldr	r3, .L7+16
	ldr	r3, [sl, r3]
	str	r2, [r3, #1028]
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L6+8)
	.word	train_buffer(GOT)
	.word	screen_buffer(GOT)
	.word	command_buffer(GOT)
	.word	keyboard_buffer(GOT)
	.word	1023
	.size	buffer_init, .-buffer_init
	.align	2
	.global	put_on_buffer
	.type	put_on_buffer, %function
put_on_buffer:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	cmp	r3, #1024
	bne	.L10
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L12
.L10:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	sub	r1, r3, #1
	ldr	r2, [fp, #-16]
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1024]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #1028]
	mov	r3, #1
	str	r3, [fp, #-24]
.L12:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	put_on_buffer, .-put_on_buffer
	.align	2
	.global	buffer_take
	.type	buffer_take, %function
buffer_take:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1024]
	cmp	r3, #1
	bne	.L15
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L17
.L15:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-24]
	strb	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	strb	r3, [r2, #1023]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L18
.L19:
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L18:
	ldr	r2, [fp, #-16]
	ldr	r3, .L24
	cmp	r2, r3
	ble	.L19
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1024]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1024]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1024]
	cmp	r3, #1
	bne	.L21
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #1028]
.L21:
	mov	r3, #1
	str	r3, [fp, #-28]
.L17:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L25:
	.align	2
.L24:
	.word	1022
	.size	buffer_take, .-buffer_take
	.align	2
	.global	buffer_peek
	.type	buffer_peek, %function
buffer_peek:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	cmp	r3, #1
	bne	.L27
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L29
.L27:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	strb	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-24]
.L29:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	buffer_peek, .-buffer_peek
	.comm	keyboard_buffer,1032,4
	.comm	command_buffer,1032,4
	.comm	screen_buffer,1032,4
	.comm	train_buffer,1032,4
	.ident	"GCC: (GNU) 4.0.2"
