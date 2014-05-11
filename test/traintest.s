	.file	"traintest.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c[2J\000"
	.align	2
.LC1:
	.ascii	"%c[%d;%dH\000"
	.align	2
.LC2:
	.ascii	"TIME: %u.%u.%u\000"
	.align	2
.LC3:
	.ascii	"Sent signal 96 to track\000"
	.align	2
.LC4:
	.ascii	"Sent speed 10 \000"
	.align	2
.LC5:
	.ascii	"Sent train 51\000"
	.align	2
.LC6:
	.ascii	"Sent speed 0\000"
	.align	2
.LC7:
	.ascii	"%u.%u.%u\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 100
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #104
	ldr	sl, .L37
.L36:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-96]
	mov	r3, #0
	str	r3, [fp, #-100]
	mov	r3, #0
	str	r3, [fp, #-92]
	mov	r0, #0
	mov	r1, #2400
	bl	bwsetspeed(PLT)
	mov	r0, #1
	ldr	r1, .L37+4
	bl	bwsetspeed(PLT)
	mvn	r3, #-16777216
	str	r3, [fp, #-88]
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mvn	r0, #-16777216
	bl	set_timer(PLT)
	mov	r0, #1
	ldr	r3, .L37+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L37+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #0
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-100]
	ldr	ip, [fp, #-96]
	ldr	r3, [fp, #-92]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L37+16
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
.L2:
	ldr	r3, [fp, #-88]
	str	r3, [sp, #0]
	sub	r3, fp, #100
	ldmia	r3, {r1, r2, r3}
	sub	r0, fp, #116
	bl	get_curtime(PLT)
	sub	ip, fp, #100
	sub	r3, fp, #116
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [fp, #-96]
	cmp	r3, #0
	bne	.L3
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L5
.L6:
	ldr	r3, [fp, #-24]
	mvn	r2, #67
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #1
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L5:
	ldr	r3, [fp, #-24]
	cmp	r3, #59
	ble	.L6
	b	.L8
.L3:
	ldr	r3, [fp, #-96]
	cmp	r3, #1
	bne	.L9
	ldrb	r3, [fp, #-83]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L9
	mov	r3, #0
	strb	r3, [fp, #-83]
	mov	r0, #0
	mov	r1, #96
	bl	bwputc(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	bwputc(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L37+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #6
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L37+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L8
.L9:
	ldr	r3, [fp, #-96]
	cmp	r3, #5
	bne	.L12
	ldrb	r3, [fp, #-79]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L12
	mov	r3, #0
	strb	r3, [fp, #-79]
	mov	r0, #0
	mov	r1, #10
	bl	bwputc(PLT)
	mov	r0, #1
	ldr	r3, .L37+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L8
.L12:
	ldr	r3, [fp, #-96]
	cmp	r3, #6
	bne	.L15
	ldrb	r3, [fp, #-78]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L15
	mov	r3, #0
	strb	r3, [fp, #-78]
	mov	r0, #0
	mov	r1, #51
	bl	bwputc(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L37+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #7
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L37+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L8
.L15:
	ldr	r3, [fp, #-96]
	cmp	r3, #10
	bne	.L18
	ldrb	r3, [fp, #-74]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L18
	mov	r3, #0
	strb	r3, [fp, #-74]
	mov	r0, #0
	mov	r1, #0
	bl	bwputc(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L37+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #8
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L37+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L8
.L18:
	ldr	r3, [fp, #-96]
	cmp	r3, #11
	bne	.L21
	ldrb	r3, [fp, #-73]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L21
	mov	r3, #0
	strb	r3, [fp, #-73]
	mov	r0, #0
	mov	r1, #51
	bl	bwputc(PLT)
	b	.L8
.L21:
	ldr	r3, [fp, #-96]
	cmp	r3, #12
	bne	.L24
	ldrb	r3, [fp, #-72]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L24
	mov	r3, #0
	strb	r3, [fp, #-72]
	mov	r0, #0
	mov	r1, #15
	bl	bwputc(PLT)
	b	.L8
.L24:
	ldr	r3, [fp, #-96]
	cmp	r3, #13
	bne	.L27
	ldrb	r3, [fp, #-71]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L27
	mov	r3, #0
	strb	r3, [fp, #-71]
	mov	r0, #0
	mov	r1, #51
	bl	bwputc(PLT)
	b	.L8
.L27:
	ldr	r3, [fp, #-96]
	cmp	r3, #14
	bne	.L30
	ldrb	r3, [fp, #-70]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L30
	mov	r3, #0
	strb	r3, [fp, #-70]
	mov	r0, #0
	mov	r1, #26
	bl	bwputc(PLT)
	b	.L8
.L30:
	ldr	r3, [fp, #-96]
	cmp	r3, #15
	bne	.L8
	ldrb	r3, [fp, #-69]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L8
	mov	r3, #0
	strb	r3, [fp, #-69]
	mov	r0, #0
	mov	r1, #51
	bl	bwputc(PLT)
.L8:
	mov	r3, #7
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L37+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #27
	mov	r3, #0
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-100]
	ldr	ip, [fp, #-96]
	ldr	r3, [fp, #-92]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L37+36
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	bwprintf(PLT)
	b	.L2
.L38:
	.align	2
.L37:
	.word	_GLOBAL_OFFSET_TABLE_-(.L36+8)
	.word	115200
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
