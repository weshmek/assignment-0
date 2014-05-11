	.file	"parse_instruction.c"
	.text
	.align	2
	.type	string_to_int, %function
string_to_int:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L2:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L4
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bls	.L3
.L4:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	string_to_int, .-string_to_int
	.align	2
	.global	parse_instruction
	.type	parse_instruction, %function
parse_instruction:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L126
.L125:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	b	.L8
.L9:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L8:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L9
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L9
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #116
	bne	.L12
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #114
	bne	.L47
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L18
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	bne	.L47
	b	.L18
.L19:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L18:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L19
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L19
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L47
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L47
	ldr	r0, [fp, #-28]
	bl	string_to_int(PLT)
	mov	r3, r0
	strb	r3, [fp, #-24]
	b	.L24
.L25:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L24:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L26
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bls	.L25
.L26:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L30
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	bne	.L47
	b	.L30
.L31:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L30:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L31
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L31
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L47
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L47
	ldr	r0, [fp, #-28]
	bl	string_to_int(PLT)
	mov	r3, r0
	strb	r3, [fp, #-23]
	b	.L36
.L37:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L36:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L40
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bls	.L37
	b	.L40
.L41:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L40:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L41
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L41
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L44
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L47
.L44:
	ldr	r2, [fp, #-32]
	ldrb	r3, [fp, #-23]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	ldrb	r3, [fp, #-24]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r2, r3, #2
	mov	r3, #0
	strb	r3, [r2, #0]
	mov	r3, #2
	str	r3, [fp, #-36]
	b	.L46
.L12:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #114
	bne	.L48
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #118
	bne	.L47
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L54
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	bne	.L47
	b	.L54
.L55:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L54:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L55
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L55
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L47
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L47
	ldr	r0, [fp, #-28]
	bl	string_to_int(PLT)
	mov	r3, r0
	strb	r3, [fp, #-24]
	b	.L60
.L61:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L60:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L64
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bls	.L61
	b	.L64
.L65:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L64:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L65
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L65
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L68
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L47
.L68:
	ldr	r2, [fp, #-32]
	mov	r3, #15
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	ldrb	r3, [fp, #-24]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r2, r3, #2
	mov	r3, #0
	strb	r3, [r2, #0]
	mov	r3, #2
	str	r3, [fp, #-36]
	b	.L46
.L48:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #115
	bne	.L70
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #119
	bne	.L47
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L76
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	bne	.L47
	b	.L76
.L77:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L76:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L77
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L77
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L47
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L47
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #48
	bne	.L82
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #120
	bne	.L82
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bne	.L82
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #57
	cmp	r3, #10
	addls	pc, pc, r3, asl #2
	b	.L86
	.p2align 2
.L91:
	b	.L87
	b	.L86
	b	.L86
	b	.L86
	b	.L86
	b	.L86
	b	.L86
	b	.L86
	b	.L88
	b	.L89
	b	.L90
.L87:
	mvn	r3, #102
	strb	r3, [fp, #-22]
	mov	r3, #19
	str	r3, [fp, #-20]
	b	.L94
.L88:
	mvn	r3, #101
	strb	r3, [fp, #-22]
	mov	r3, #20
	str	r3, [fp, #-20]
	b	.L94
.L89:
	mvn	r3, #100
	strb	r3, [fp, #-22]
	mov	r3, #21
	str	r3, [fp, #-20]
	b	.L94
.L90:
	mvn	r3, #99
	strb	r3, [fp, #-22]
	mov	r3, #22
	str	r3, [fp, #-20]
	b	.L94
.L86:
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L46
.L82:
	ldr	r0, [fp, #-28]
	bl	string_to_int(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	strb	r3, [fp, #-22]
	b	.L94
.L95:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L94:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L96
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bls	.L95
.L96:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #65
	beq	.L95
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #66
	beq	.L95
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #67
	beq	.L95
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #120
	beq	.L95
	b	.L102
.L103:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L102:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L103
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L103
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #83
	bne	.L106
	ldr	r1, [fp, #-20]
	ldr	r3, .L126+4
	ldr	r2, [sl, r3]
	mov	r3, #83
	strb	r3, [r2, r1]
	mov	r3, #33
	strb	r3, [fp, #-21]
	ldr	r3, .L126+8
	ldr	r2, [sl, r3]
	mov	r3, #1
	strb	r3, [r2, #0]
	b	.L108
.L106:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #67
	bne	.L109
	ldr	r1, [fp, #-20]
	ldr	r3, .L126+4
	ldr	r2, [sl, r3]
	mov	r3, #67
	strb	r3, [r2, r1]
	mov	r3, #34
	strb	r3, [fp, #-21]
	ldr	r3, .L126+8
	ldr	r2, [sl, r3]
	mov	r3, #1
	strb	r3, [r2, #0]
	b	.L108
.L109:
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L46
.L108:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	b	.L111
.L112:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L111:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L112
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L112
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L115
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L47
.L115:
	ldr	r2, [fp, #-32]
	ldrb	r3, [fp, #-21]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	ldrb	r3, [fp, #-22]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	add	r2, r3, #2
	mov	r3, #32
	strb	r3, [r2, #0]
	mov	r3, #3
	str	r3, [fp, #-36]
	b	.L46
.L70:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #113
	bne	.L47
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	b	.L118
.L119:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L118:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L119
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #9
	beq	.L119
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L122
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #13
	bne	.L47
.L122:
	ldr	r3, .L126+12
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L46
.L47:
	mov	r3, #0
	str	r3, [fp, #-36]
.L46:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L127:
	.align	2
.L126:
	.word	_GLOBAL_OFFSET_TABLE_-(.L125+8)
	.word	switch_states(GOT)
	.word	switch_states_changed(GOT)
	.word	q(GOT)
	.size	parse_instruction, .-parse_instruction
	.ident	"GCC: (GNU) 4.0.2"
