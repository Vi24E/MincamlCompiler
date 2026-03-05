.data
.align	8
.text
.global	min_caml_start
min_caml_start:
	movui	%i1, 28672
	ori	%i1, %i1, 0
	movui	%i2, 4096
	ori	%i2, %i2, 0
	set_label	%i3, fin
	subi	%i1, %i1, 8
	movui	%i31, 263313
	addi	%i31, %i31, -37
	mif	%vf3517, %i31
	sf	%vf3517, 0(%i0)
	movui	%i31, 261265
	addi	%i31, %i31, -37
	mif	%vf3518, %i31
	sf	%vf3518, 4(%i0)
	movui	%i31, 785553
	addi	%i31, %i31, -37
	mif	%vf3519, %i31
	sf	%vf3519, 8(%i0)
	movui	%i31, 787601
	addi	%i31, %i31, -37
	mif	%vf3520, %i31
	sf	%vf3520, 12(%i0)
	movi	%vi3969, 768
	sw	%vi3969, 16(%i0)
	movi	%vi3970, 768
	sw	%vi3970, 20(%i0)
	mov	%vi3971, %i0
	sw	%vi3971, 24(%i0)
	mov	%vi3972, %vi3969
	sw	%vi3972, 28(%i0)
	mov	%vi3973, %vi3970
	sw	%vi3973, 32(%i0)
	mov	%vi3974, %i0
	sw	%vi3974, 36(%i0)
	set_label	%vi3975, min_caml_size
	mov	%vi3976, %i0
	sw	%vi3976, 40(%i0)
	sw	%vi3972, 0(%vi3975)
	set_label	%vi3977, min_caml_size
	sw	%vi3973, 4(%vi3977)
	set_label	%vi3978, min_caml_dbg
	mov	%vi3979, %i0
	sw	%vi3979, 48(%i0)
	sw	%vi3974, 0(%vi3978)
	call_dir	read_parameter.3299
	call_dir	scan_start.4806
fin:
	set_label	%i31, fin
	jmp	%i0, 0(%i31)
	.func_entry
sin.2133:
	fmov	%vf1, %f1
	lf	%vf2, 4(%i0)
	fleq	%i31, %vf1, %vf2
	jzero	%i0, %i31, else.11283
	lf	%vf3, 8(%i0)
	fleq	%i31, %vf3, %vf1
	jzero	%i0, %i31, else.11284
	fmul	%vf4, %vf1, %vf1
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf5, %i31
	fmul	%vf6, %vf5, %vf4
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf7, %i31
	fadd	%vf8, %vf6, %vf7
	fmul	%vf9, %vf8, %vf4
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf10, %i31
	fadd	%vf11, %vf9, %vf10
	fmul	%vf12, %vf11, %vf4
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf13, %i31
	fadd	%vf14, %vf12, %vf13
	fmul	%f1, %vf14, %vf1
	ret
else.11284:
	lf	%vf15, 12(%i0)
	fleq	%i31, %vf1, %vf15
	jzero	%i0, %i31, else.11285
	lf	%vf16, 0(%i0)
	finv	%vf17, %vf16
	fmul	%vf18, %vf1, %vf17
	fmov	%f1, %vf18
	ffloor	%f1, %f1
	fmov	%vf20, %f1
	lf	%vf21, 0(%i0)
	fmul	%vf22, %vf20, %vf21
	fsub	%vf23, %vf1, %vf22
	lf	%vf24, 4(%i0)
	fleq	%i31, %vf23, %vf24
	jzero	%i0, %i31, else.11286
	fmov	%vf26, %vf23
	set_label	%i31, cont.11287
	jmp	%i0, 0(%i31)
else.11286:
	lf	%vf25, 0(%i0)
	fsub	%vf26, %vf25, %vf23
cont.11287:
	fmul	%vf27, %vf26, %vf26
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf28, %i31
	fmul	%vf29, %vf28, %vf27
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf30, %i31
	fadd	%vf31, %vf29, %vf30
	fmul	%vf32, %vf31, %vf27
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf33, %i31
	fadd	%vf34, %vf32, %vf33
	fmul	%vf35, %vf34, %vf27
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf36, %i31
	fadd	%vf37, %vf35, %vf36
	fmul	%f1, %vf37, %vf26
	ret
else.11285:
	lf	%vf38, 12(%i0)
	fsub	%vf39, %vf38, %vf1
	fmul	%vf40, %vf39, %vf39
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf41, %i31
	fmul	%vf42, %vf41, %vf40
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf43, %i31
	fadd	%vf44, %vf42, %vf43
	fmul	%vf45, %vf44, %vf40
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf46, %i31
	fadd	%vf47, %vf45, %vf46
	fmul	%vf48, %vf47, %vf40
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf49, %i31
	fadd	%vf50, %vf48, %vf49
	fmul	%f1, %vf50, %vf39
	ret
else.11283:
	lf	%vf51, 0(%i0)
	fleq	%i31, %vf51, %vf1
	jzero	%i0, %i31, else.11288
	lf	%vf52, 0(%i0)
	finv	%vf53, %vf52
	fmul	%vf54, %vf1, %vf53
	fmov	%f1, %vf54
	ffloor	%f1, %f1
	fmov	%vf56, %f1
	lf	%vf57, 0(%i0)
	fmul	%vf58, %vf56, %vf57
	fsub	%vf59, %vf1, %vf58
	lf	%vf60, 4(%i0)
	fleq	%i31, %vf59, %vf60
	jzero	%i0, %i31, else.11289
	fmov	%vf62, %vf59
	set_label	%i31, cont.11290
	jmp	%i0, 0(%i31)
else.11289:
	lf	%vf61, 0(%i0)
	fsub	%vf62, %vf61, %vf59
cont.11290:
	fmul	%vf63, %vf62, %vf62
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf64, %i31
	fmul	%vf65, %vf64, %vf63
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf66, %i31
	fadd	%vf67, %vf65, %vf66
	fmul	%vf68, %vf67, %vf63
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf69, %i31
	fadd	%vf70, %vf68, %vf69
	fmul	%vf71, %vf70, %vf63
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf72, %i31
	fadd	%vf73, %vf71, %vf72
	fmul	%f1, %vf73, %vf62
	ret
else.11288:
	lf	%vf74, 0(%i0)
	fsub	%vf75, %vf74, %vf1
	fmul	%vf76, %vf75, %vf75
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf77, %i31
	fmul	%vf78, %vf77, %vf76
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf79, %i31
	fadd	%vf80, %vf78, %vf79
	fmul	%vf81, %vf80, %vf76
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf82, %i31
	fsub	%vf83, %vf81, %vf82
	fmul	%vf84, %vf83, %vf76
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf85, %i31
	fadd	%vf86, %vf84, %vf85
	fmul	%f1, %vf86, %vf75
	ret
	.end_function
	.func_entry
cos.2202:
	fmov	%vf87, %f1
	lf	%vf88, 4(%i0)
	fsub	%vf89, %vf88, %vf87
	fmov	%vf90, %vf89
	lf	%vf91, 4(%i0)
	fleq	%i31, %vf90, %vf91
	jzero	%i0, %i31, else.11291
	lf	%vf92, 8(%i0)
	fleq	%i31, %vf92, %vf90
	jzero	%i0, %i31, else.11292
	fmul	%vf93, %vf90, %vf90
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf94, %i31
	fmul	%vf95, %vf94, %vf93
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf96, %i31
	fadd	%vf97, %vf95, %vf96
	fmul	%vf98, %vf97, %vf93
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf99, %i31
	fadd	%vf100, %vf98, %vf99
	fmul	%vf101, %vf100, %vf93
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf102, %i31
	fadd	%vf103, %vf101, %vf102
	fmul	%f1, %vf103, %vf90
	ret
else.11292:
	lf	%vf104, 12(%i0)
	fleq	%i31, %vf90, %vf104
	jzero	%i0, %i31, else.11293
	lf	%vf105, 0(%i0)
	finv	%vf106, %vf105
	fmul	%vf107, %vf90, %vf106
	fmov	%f1, %vf107
	ffloor	%f1, %f1
	fmov	%vf109, %f1
	lf	%vf110, 0(%i0)
	fmul	%vf111, %vf109, %vf110
	fsub	%vf112, %vf90, %vf111
	lf	%vf113, 4(%i0)
	fleq	%i31, %vf112, %vf113
	jzero	%i0, %i31, else.11294
	fmov	%vf115, %vf112
	set_label	%i31, cont.11295
	jmp	%i0, 0(%i31)
else.11294:
	lf	%vf114, 0(%i0)
	fsub	%vf115, %vf114, %vf112
cont.11295:
	fmul	%vf116, %vf115, %vf115
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf117, %i31
	fmul	%vf118, %vf117, %vf116
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf119, %i31
	fadd	%vf120, %vf118, %vf119
	fmul	%vf121, %vf120, %vf116
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf122, %i31
	fadd	%vf123, %vf121, %vf122
	fmul	%vf124, %vf123, %vf116
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf125, %i31
	fadd	%vf126, %vf124, %vf125
	fmul	%f1, %vf126, %vf115
	ret
else.11293:
	lf	%vf127, 12(%i0)
	fsub	%vf128, %vf127, %vf90
	fmul	%vf129, %vf128, %vf128
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf130, %i31
	fmul	%vf131, %vf130, %vf129
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf132, %i31
	fadd	%vf133, %vf131, %vf132
	fmul	%vf134, %vf133, %vf129
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf135, %i31
	fadd	%vf136, %vf134, %vf135
	fmul	%vf137, %vf136, %vf129
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf138, %i31
	fadd	%vf139, %vf137, %vf138
	fmul	%f1, %vf139, %vf128
	ret
else.11291:
	lf	%vf140, 0(%i0)
	fleq	%i31, %vf140, %vf90
	jzero	%i0, %i31, else.11296
	lf	%vf141, 0(%i0)
	finv	%vf142, %vf141
	fmul	%vf143, %vf90, %vf142
	fmov	%f1, %vf143
	ffloor	%f1, %f1
	fmov	%vf145, %f1
	lf	%vf146, 0(%i0)
	fmul	%vf147, %vf145, %vf146
	fsub	%vf148, %vf90, %vf147
	lf	%vf149, 4(%i0)
	fleq	%i31, %vf148, %vf149
	jzero	%i0, %i31, else.11297
	fmov	%vf151, %vf148
	set_label	%i31, cont.11298
	jmp	%i0, 0(%i31)
else.11297:
	lf	%vf150, 0(%i0)
	fsub	%vf151, %vf150, %vf148
cont.11298:
	fmul	%vf152, %vf151, %vf151
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf153, %i31
	fmul	%vf154, %vf153, %vf152
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf155, %i31
	fadd	%vf156, %vf154, %vf155
	fmul	%vf157, %vf156, %vf152
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf158, %i31
	fadd	%vf159, %vf157, %vf158
	fmul	%vf160, %vf159, %vf152
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf161, %i31
	fadd	%vf162, %vf160, %vf161
	fmul	%f1, %vf162, %vf151
	ret
else.11296:
	lf	%vf163, 0(%i0)
	fsub	%vf164, %vf163, %vf90
	fmul	%vf165, %vf164, %vf164
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf166, %i31
	fmul	%vf167, %vf166, %vf165
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf168, %i31
	fadd	%vf169, %vf167, %vf168
	fmul	%vf170, %vf169, %vf165
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf171, %i31
	fsub	%vf172, %vf170, %vf171
	fmul	%vf173, %vf172, %vf165
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf174, %i31
	fadd	%vf175, %vf173, %vf174
	fmul	%f1, %vf175, %vf164
	ret
	.end_function
	.func_entry
atan.2205:
	fmov	%vf176, %f1
	movui	%i31, 260096
	mif	%vf177, %i31
	fleq	%i31, %vf176, %vf177
	jzero	%i0, %i31, else.11299
	movui	%i31, 784384
	mif	%vf178, %i31
	fleq	%i31, %vf178, %vf176
	jzero	%i0, %i31, else.11300
	fmul	%vf179, %vf176, %vf176
	movui	%i31, 245674
	addi	%i31, %i31, -245
	mif	%vf180, %i31
	fmul	%vf181, %vf180, %vf179
	movui	%i31, 774479
	addi	%i31, %i31, -339
	mif	%vf182, %i31
	fadd	%vf183, %vf181, %vf182
	fmul	%vf184, %vf183, %vf179
	movui	%i31, 252580
	addi	%i31, %i31, -460
	mif	%vf185, %i31
	fadd	%vf186, %vf184, %vf185
	fmul	%vf187, %vf186, %vf179
	movui	%i31, 778395
	addi	%i31, %i31, 1221
	mif	%vf188, %i31
	fadd	%vf189, %vf187, %vf188
	fmul	%vf190, %vf189, %vf179
	movui	%i31, 255160
	addi	%i31, %i31, -676
	mif	%vf191, %i31
	fadd	%vf192, %vf190, %vf191
	fmul	%vf193, %vf192, %vf179
	movui	%i31, 780970
	addi	%i31, %i31, 162
	mif	%vf194, %i31
	fadd	%vf195, %vf193, %vf194
	fmul	%vf196, %vf195, %vf179
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf197, %i31
	fadd	%vf198, %vf196, %vf197
	fmul	%f1, %vf198, %vf176
	ret
else.11300:
	movui	%i31, 260096
	mif	%vf199, %i31
	finv	%vf200, %vf176
	fmul	%vf201, %vf199, %vf200
	fmul	%vf202, %vf201, %vf201
	movui	%i31, 769962
	addi	%i31, %i31, -245
	mif	%vf203, %i31
	fmul	%vf204, %vf203, %vf202
	movui	%i31, 250191
	addi	%i31, %i31, -339
	mif	%vf205, %i31
	fadd	%vf206, %vf204, %vf205
	fmul	%vf207, %vf206, %vf202
	movui	%i31, 776868
	addi	%i31, %i31, -460
	mif	%vf208, %i31
	fadd	%vf209, %vf207, %vf208
	fmul	%vf210, %vf209, %vf202
	movui	%i31, 254107
	addi	%i31, %i31, 1221
	mif	%vf211, %i31
	fadd	%vf212, %vf210, %vf211
	fmul	%vf213, %vf212, %vf202
	movui	%i31, 779448
	addi	%i31, %i31, -676
	mif	%vf214, %i31
	fadd	%vf215, %vf213, %vf214
	fmul	%vf216, %vf215, %vf202
	movui	%i31, 256682
	addi	%i31, %i31, 162
	mif	%vf217, %i31
	fadd	%vf218, %vf216, %vf217
	fmul	%vf219, %vf218, %vf202
	movui	%i31, 784384
	addi	%i31, %i31, -13
	mif	%vf220, %i31
	fadd	%vf221, %vf219, %vf220
	fmul	%vf222, %vf221, %vf201
	lf	%vf223, 8(%i0)
	fadd	%f1, %vf222, %vf223
	ret
else.11299:
	movui	%i31, 260096
	mif	%vf224, %i31
	finv	%vf225, %vf176
	fmul	%vf226, %vf224, %vf225
	fmul	%vf227, %vf226, %vf226
	movui	%i31, 769962
	addi	%i31, %i31, -245
	mif	%vf228, %i31
	fmul	%vf229, %vf228, %vf227
	movui	%i31, 250191
	addi	%i31, %i31, -339
	mif	%vf230, %i31
	fadd	%vf231, %vf229, %vf230
	fmul	%vf232, %vf231, %vf227
	movui	%i31, 776868
	addi	%i31, %i31, -460
	mif	%vf233, %i31
	fadd	%vf234, %vf232, %vf233
	fmul	%vf235, %vf234, %vf227
	movui	%i31, 254107
	addi	%i31, %i31, 1221
	mif	%vf236, %i31
	fadd	%vf237, %vf235, %vf236
	fmul	%vf238, %vf237, %vf227
	movui	%i31, 779448
	addi	%i31, %i31, -676
	mif	%vf239, %i31
	fadd	%vf240, %vf238, %vf239
	fmul	%vf241, %vf240, %vf227
	movui	%i31, 256682
	addi	%i31, %i31, 162
	mif	%vf242, %i31
	fadd	%vf243, %vf241, %vf242
	fmul	%vf244, %vf243, %vf227
	movui	%i31, 784384
	addi	%i31, %i31, -13
	mif	%vf245, %i31
	fadd	%vf246, %vf244, %vf245
	fmul	%vf247, %vf246, %vf226
	lf	%vf248, 4(%i0)
	fadd	%f1, %vf247, %vf248
	ret
	.end_function
	.func_entry
sqrt.2275:
	fmov	%vf249, %f1
	fmov	%f1, %vf249
	frsqrt	%f1, %f1
	fmov	%vf251, %f1
	movui	%i31, 260096
	mif	%vf252, %i31
	finv	%vf253, %vf251
	fmul	%f1, %vf252, %vf253
	ret
	.end_function
	.func_entry
print_int.2281:
	mov	%vi1, %i4
	movi	%vi2, 100
	jleq	%vi2, %vi1, then.11301
	movi	%vi6, 48
	mov	%i4, %vi6
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%vi7, %vi1
	set_label	%i31, cont.11302
	jmp	%i0, 0(%i31)
then.11301:
	movi	%vi3, 200
	jleq	%vi3, %vi1, then.11303
	movi	%vi5, 49
	mov	%i4, %vi5
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi7, %vi1, 100
	set_label	%i31, cont.11304
	jmp	%i0, 0(%i31)
then.11303:
	movi	%vi4, 50
	mov	%i4, %vi4
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi7, %vi1, 200
cont.11304:
cont.11302:
	movi	%vi8, 40
	jleq	%vi8, %vi7, then.11305
	movi	%vi20, 20
	jleq	%vi20, %vi7, then.11307
	movi	%vi24, 10
	jleq	%vi24, %vi7, then.11309
	movi	%vi26, 48
	mov	%i4, %vi26
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%vi27, %vi7
	set_label	%i31, cont.11310
	jmp	%i0, 0(%i31)
then.11309:
	movi	%vi25, 49
	mov	%i4, %vi25
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi27, %vi7, 10
cont.11310:
	set_label	%i31, cont.11308
	jmp	%i0, 0(%i31)
then.11307:
	movi	%vi21, 30
	jleq	%vi21, %vi7, then.11311
	movi	%vi23, 50
	mov	%i4, %vi23
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi27, %vi7, 20
	set_label	%i31, cont.11312
	jmp	%i0, 0(%i31)
then.11311:
	movi	%vi22, 51
	mov	%i4, %vi22
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi27, %vi7, 30
cont.11312:
cont.11308:
	set_label	%i31, cont.11306
	jmp	%i0, 0(%i31)
then.11305:
	movi	%vi9, 60
	jleq	%vi9, %vi7, then.11313
	movi	%vi17, 50
	jleq	%vi17, %vi7, then.11315
	movi	%vi19, 52
	mov	%i4, %vi19
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi27, %vi7, 40
	set_label	%i31, cont.11316
	jmp	%i0, 0(%i31)
then.11315:
	movi	%vi18, 53
	mov	%i4, %vi18
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi27, %vi7, 50
cont.11316:
	set_label	%i31, cont.11314
	jmp	%i0, 0(%i31)
then.11313:
	movi	%vi10, 80
	jleq	%vi10, %vi7, then.11317
	movi	%vi14, 70
	jleq	%vi14, %vi7, then.11319
	movi	%vi16, 54
	mov	%i4, %vi16
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi27, %vi7, 60
	set_label	%i31, cont.11320
	jmp	%i0, 0(%i31)
then.11319:
	movi	%vi15, 55
	mov	%i4, %vi15
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi27, %vi7, 70
cont.11320:
	set_label	%i31, cont.11318
	jmp	%i0, 0(%i31)
then.11317:
	movi	%vi11, 90
	jleq	%vi11, %vi7, then.11321
	movi	%vi13, 56
	mov	%i4, %vi13
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi27, %vi7, 80
	set_label	%i31, cont.11322
	jmp	%i0, 0(%i31)
then.11321:
	movi	%vi12, 57
	mov	%i4, %vi12
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi27, %vi7, 90
cont.11322:
cont.11318:
cont.11314:
cont.11306:
	movi	%vi28, 4
	jleq	%vi28, %vi27, then.11323
	movi	%vi40, 2
	jleq	%vi40, %vi27, then.11324
	movi	%vi44, 1
	jleq	%vi44, %vi27, then.11325
	movi	%vi46, 48
	mov	%i4, %vi46
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
then.11325:
	movi	%vi45, 49
	mov	%i4, %vi45
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
then.11324:
	movi	%vi41, 3
	jleq	%vi41, %vi27, then.11326
	movi	%vi43, 50
	mov	%i4, %vi43
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
then.11326:
	movi	%vi42, 51
	mov	%i4, %vi42
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
then.11323:
	movi	%vi29, 6
	jleq	%vi29, %vi27, then.11327
	movi	%vi37, 5
	jleq	%vi37, %vi27, then.11328
	movi	%vi39, 52
	mov	%i4, %vi39
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
then.11328:
	movi	%vi38, 53
	mov	%i4, %vi38
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
then.11327:
	movi	%vi30, 8
	jleq	%vi30, %vi27, then.11329
	movi	%vi34, 7
	jleq	%vi34, %vi27, then.11330
	movi	%vi36, 54
	mov	%i4, %vi36
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
then.11330:
	movi	%vi35, 55
	mov	%i4, %vi35
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
then.11329:
	movi	%vi31, 9
	jleq	%vi31, %vi27, then.11331
	movi	%vi33, 56
	mov	%i4, %vi33
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
then.11331:
	movi	%vi32, 57
	mov	%i4, %vi32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	ret
	.end_function
	.func_entry
xor.2381:
	mov	%vi47, %i4
	mov	%vi48, %i5
	mov	%vi49, %i0
	jeq	%vi47, %i0, then.11332
	mov	%vi50, %i0
	jeq	%vi48, %i0, then.11333
	mov	%i4, %i0
	ret
then.11333:
	movi	%i4, 1
	ret
then.11332:
	mov	%i4, %vi48
	ret
	.end_function
	.func_entry
fsqr.2386:
	fmov	%vf254, %f1
	fmul	%f1, %vf254, %vf254
	ret
	.end_function
	.func_entry
fhalf.2388:
	fmov	%vf255, %f1
	movui	%i31, 262144
	mif	%vf256, %i31
	finv	%vf257, %vf256
	fmul	%f1, %vf255, %vf257
	ret
	.end_function
	.func_entry
o_texturetype.2391:
	mov	%vi51, %i4
	mov	%vi52, %i5
	mov	%vi53, %i6
	mov	%vi54, %i7
	mov	%vi55, %i8
	mov	%vi56, %i9
	mov	%vi57, %i10
	mov	%vi58, %i11
	mov	%vi59, %i12
	mov	%vi60, %i13
	mov	%i4, %vi51
	ret
	.end_function
	.func_entry
o_form.2403:
	mov	%vi61, %i4
	mov	%vi62, %i5
	mov	%vi63, %i6
	mov	%vi64, %i7
	mov	%vi65, %i8
	mov	%vi66, %i9
	mov	%vi67, %i10
	mov	%vi68, %i11
	mov	%vi69, %i12
	mov	%vi70, %i13
	mov	%i4, %vi62
	ret
	.end_function
	.func_entry
o_reflectiontype.2415:
	mov	%vi71, %i4
	mov	%vi72, %i5
	mov	%vi73, %i6
	mov	%vi74, %i7
	mov	%vi75, %i8
	mov	%vi76, %i9
	mov	%vi77, %i10
	mov	%vi78, %i11
	mov	%vi79, %i12
	mov	%vi80, %i13
	mov	%i4, %vi73
	ret
	.end_function
	.func_entry
o_isinvert.2427:
	mov	%vi81, %i4
	mov	%vi82, %i5
	mov	%vi83, %i6
	mov	%vi84, %i7
	mov	%vi85, %i8
	mov	%vi86, %i9
	mov	%vi87, %i10
	mov	%vi88, %i11
	mov	%vi89, %i12
	mov	%vi90, %i13
	mov	%i4, %vi87
	ret
	.end_function
	.func_entry
o_isrot.2439:
	mov	%vi91, %i4
	mov	%vi92, %i5
	mov	%vi93, %i6
	mov	%vi94, %i7
	mov	%vi95, %i8
	mov	%vi96, %i9
	mov	%vi97, %i10
	mov	%vi98, %i11
	mov	%vi99, %i12
	mov	%vi100, %i13
	mov	%i4, %vi94
	ret
	.end_function
	.func_entry
o_param_a.2451:
	mov	%vi101, %i4
	mov	%vi102, %i5
	mov	%vi103, %i6
	mov	%vi104, %i7
	mov	%vi105, %i8
	mov	%vi106, %i9
	mov	%vi107, %i10
	mov	%vi108, %i11
	mov	%vi109, %i12
	mov	%vi110, %i13
	mov	%vi111, %i0
	lf	%vf258, 0(%vi105)
	mov	%vi112, %i0
	fmov	%f1, %vf258
	ret
	.end_function
	.func_entry
o_param_b.2464:
	mov	%vi113, %i4
	mov	%vi114, %i5
	mov	%vi115, %i6
	mov	%vi116, %i7
	mov	%vi117, %i8
	mov	%vi118, %i9
	mov	%vi119, %i10
	mov	%vi120, %i11
	mov	%vi121, %i12
	mov	%vi122, %i13
	lf	%vf259, 4(%vi117)
	fmov	%f1, %vf259
	ret
	.end_function
	.func_entry
o_param_c.2477:
	mov	%vi123, %i4
	mov	%vi124, %i5
	mov	%vi125, %i6
	mov	%vi126, %i7
	mov	%vi127, %i8
	mov	%vi128, %i9
	mov	%vi129, %i10
	mov	%vi130, %i11
	mov	%vi131, %i12
	mov	%vi132, %i13
	lf	%vf260, 8(%vi127)
	fmov	%f1, %vf260
	ret
	.end_function
	.func_entry
o_param_x.2490:
	mov	%vi133, %i4
	mov	%vi134, %i5
	mov	%vi135, %i6
	mov	%vi136, %i7
	mov	%vi137, %i8
	mov	%vi138, %i9
	mov	%vi139, %i10
	mov	%vi140, %i11
	mov	%vi141, %i12
	mov	%vi142, %i13
	mov	%vi143, %i0
	lf	%vf261, 0(%vi138)
	mov	%vi144, %i0
	fmov	%f1, %vf261
	ret
	.end_function
	.func_entry
o_param_y.2503:
	mov	%vi145, %i4
	mov	%vi146, %i5
	mov	%vi147, %i6
	mov	%vi148, %i7
	mov	%vi149, %i8
	mov	%vi150, %i9
	mov	%vi151, %i10
	mov	%vi152, %i11
	mov	%vi153, %i12
	mov	%vi154, %i13
	lf	%vf262, 4(%vi150)
	fmov	%f1, %vf262
	ret
	.end_function
	.func_entry
o_param_z.2516:
	mov	%vi155, %i4
	mov	%vi156, %i5
	mov	%vi157, %i6
	mov	%vi158, %i7
	mov	%vi159, %i8
	mov	%vi160, %i9
	mov	%vi161, %i10
	mov	%vi162, %i11
	mov	%vi163, %i12
	mov	%vi164, %i13
	lf	%vf263, 8(%vi160)
	fmov	%f1, %vf263
	ret
	.end_function
	.func_entry
o_diffuse.2529:
	mov	%vi165, %i4
	mov	%vi166, %i5
	mov	%vi167, %i6
	mov	%vi168, %i7
	mov	%vi169, %i8
	mov	%vi170, %i9
	mov	%vi171, %i10
	mov	%vi172, %i11
	mov	%vi173, %i12
	mov	%vi174, %i13
	mov	%vi175, %i0
	lf	%vf264, 0(%vi172)
	mov	%vi176, %i0
	fmov	%f1, %vf264
	ret
	.end_function
	.func_entry
o_hilight.2542:
	mov	%vi177, %i4
	mov	%vi178, %i5
	mov	%vi179, %i6
	mov	%vi180, %i7
	mov	%vi181, %i8
	mov	%vi182, %i9
	mov	%vi183, %i10
	mov	%vi184, %i11
	mov	%vi185, %i12
	mov	%vi186, %i13
	lf	%vf265, 4(%vi184)
	fmov	%f1, %vf265
	ret
	.end_function
	.func_entry
o_color_red.2555:
	mov	%vi187, %i4
	mov	%vi188, %i5
	mov	%vi189, %i6
	mov	%vi190, %i7
	mov	%vi191, %i8
	mov	%vi192, %i9
	mov	%vi193, %i10
	mov	%vi194, %i11
	mov	%vi195, %i12
	mov	%vi196, %i13
	mov	%vi197, %i0
	lf	%vf266, 0(%vi195)
	mov	%vi198, %i0
	fmov	%f1, %vf266
	ret
	.end_function
	.func_entry
o_color_green.2568:
	mov	%vi199, %i4
	mov	%vi200, %i5
	mov	%vi201, %i6
	mov	%vi202, %i7
	mov	%vi203, %i8
	mov	%vi204, %i9
	mov	%vi205, %i10
	mov	%vi206, %i11
	mov	%vi207, %i12
	mov	%vi208, %i13
	lf	%vf267, 4(%vi207)
	fmov	%f1, %vf267
	ret
	.end_function
	.func_entry
o_color_blue.2581:
	mov	%vi209, %i4
	mov	%vi210, %i5
	mov	%vi211, %i6
	mov	%vi212, %i7
	mov	%vi213, %i8
	mov	%vi214, %i9
	mov	%vi215, %i10
	mov	%vi216, %i11
	mov	%vi217, %i12
	mov	%vi218, %i13
	lf	%vf268, 8(%vi217)
	fmov	%f1, %vf268
	ret
	.end_function
	.func_entry
o_param_r1.2594:
	mov	%vi219, %i4
	mov	%vi220, %i5
	mov	%vi221, %i6
	mov	%vi222, %i7
	mov	%vi223, %i8
	mov	%vi224, %i9
	mov	%vi225, %i10
	mov	%vi226, %i11
	mov	%vi227, %i12
	mov	%vi228, %i13
	mov	%vi229, %i0
	lf	%vf269, 0(%vi228)
	mov	%vi230, %i0
	fmov	%f1, %vf269
	ret
	.end_function
	.func_entry
o_param_r2.2607:
	mov	%vi231, %i4
	mov	%vi232, %i5
	mov	%vi233, %i6
	mov	%vi234, %i7
	mov	%vi235, %i8
	mov	%vi236, %i9
	mov	%vi237, %i10
	mov	%vi238, %i11
	mov	%vi239, %i12
	mov	%vi240, %i13
	lf	%vf270, 4(%vi240)
	fmov	%f1, %vf270
	ret
	.end_function
	.func_entry
o_param_r3.2620:
	mov	%vi241, %i4
	mov	%vi242, %i5
	mov	%vi243, %i6
	mov	%vi244, %i7
	mov	%vi245, %i8
	mov	%vi246, %i9
	mov	%vi247, %i10
	mov	%vi248, %i11
	mov	%vi249, %i12
	mov	%vi250, %i13
	lf	%vf271, 8(%vi250)
	fmov	%f1, %vf271
	ret
	.end_function
	.func_entry
normalize_vector.2633:
	mov	%vi251, %i4
	mov	%vi252, %i5
	mov	%vi253, %i0
	lf	%vf272, 0(%vi251)
	fmov	%vf273, %vf272
	fmul	%vf274, %vf273, %vf273
	lf	%vf275, 4(%vi251)
	fmov	%vf276, %vf275
	fmul	%vf277, %vf276, %vf276
	fadd	%vf278, %vf274, %vf277
	lf	%vf279, 8(%vi251)
	fmov	%vf280, %vf279
	fmul	%vf281, %vf280, %vf280
	fadd	%vf282, %vf278, %vf281
	fmov	%vf283, %vf282
	fmov	%f1, %vf283
	frsqrt	%f1, %f1
	fmov	%vf285, %f1
	movui	%i31, 260096
	mif	%vf286, %i31
	finv	%vf287, %vf285
	fmul	%vf288, %vf286, %vf287
	mov	%vi254, %i0
	jeq	%vi252, %i0, then.11334
	fneg	%vf289, %vf288
	set_label	%i31, cont.11335
	jmp	%i0, 0(%i31)
then.11334:
	fmov	%vf289, %vf288
cont.11335:
	mov	%vi255, %i0
	mov	%vi256, %i0
	lf	%vf290, 0(%vi251)
	finv	%vf291, %vf289
	fmul	%vf292, %vf290, %vf291
	sf	%vf292, 0(%vi251)
	lf	%vf293, 4(%vi251)
	finv	%vf294, %vf289
	fmul	%vf295, %vf293, %vf294
	sf	%vf295, 4(%vi251)
	lf	%vf296, 8(%vi251)
	finv	%vf297, %vf289
	fmul	%vf298, %vf296, %vf297
	sf	%vf298, 8(%vi251)
	ret
	.end_function
	.func_entry
sgn.2664:
	fmov	%vf299, %f1
	fmov	%vf300, %f0
	fleq	%i31, %vf299, %f0
	jzero	%i0, %i31, else.11337
	movui	%i31, 784384
	mif	%f1, %i31
	ret
else.11337:
	movui	%i31, 260096
	mif	%f1, %i31
	ret
	.end_function
	.func_entry
rad.2667:
	fmov	%vf301, %f1
	movui	%i31, 248048
	addi	%i31, %i31, -1483
	mif	%vf302, %i31
	fmul	%f1, %vf301, %vf302
	ret
	.end_function
	.func_entry
read_environ.2670:
	set_label	%vi257, min_caml_screen
	mov	%vi258, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf304, %f1
	sf	%vf304, 0(%vi257)
	set_label	%vi259, min_caml_screen
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf306, %f1
	sf	%vf306, 4(%vi259)
	set_label	%vi260, min_caml_screen
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf308, %f1
	sf	%vf308, 8(%vi260)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf310, %f1
	fmov	%vf311, %vf310
	movui	%i31, 248048
	addi	%i31, %i31, -1483
	mif	%vf312, %i31
	fmul	%vf313, %vf311, %vf312
	set_label	%vi261, min_caml_cos_v
	mov	%vi262, %i0
	fmov	%vf314, %vf313
	lf	%vf315, 4(%i0)
	fsub	%vf316, %vf315, %vf314
	fmov	%f1, %vf316
	call_dir	sin.2133
	fmov	%vf318, %f1
	sf	%vf318, 0(%vi261)
	set_label	%vi263, min_caml_sin_v
	mov	%vi264, %i0
	fmov	%vf319, %vf313
	lf	%vf320, 4(%i0)
	fleq	%i31, %vf319, %vf320
	jzero	%i0, %i31, else.11338
	lf	%vf321, 8(%i0)
	fleq	%i31, %vf321, %vf319
	jzero	%i0, %i31, else.11340
	fmul	%vf322, %vf319, %vf319
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf323, %i31
	fmul	%vf324, %vf323, %vf322
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf325, %i31
	fadd	%vf326, %vf324, %vf325
	fmul	%vf327, %vf326, %vf322
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf328, %i31
	fadd	%vf329, %vf327, %vf328
	fmul	%vf330, %vf329, %vf322
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf331, %i31
	fadd	%vf332, %vf330, %vf331
	fmul	%vf405, %vf332, %vf319
	set_label	%i31, cont.11341
	jmp	%i0, 0(%i31)
else.11340:
	lf	%vf333, 12(%i0)
	fleq	%i31, %vf319, %vf333
	jzero	%i0, %i31, else.11342
	lf	%vf334, 0(%i0)
	finv	%vf335, %vf334
	fmul	%vf336, %vf319, %vf335
	fmov	%f1, %vf336
	ffloor	%f1, %f1
	fmov	%vf338, %f1
	lf	%vf339, 0(%i0)
	fmul	%vf340, %vf338, %vf339
	fsub	%vf341, %vf319, %vf340
	lf	%vf342, 4(%i0)
	fleq	%i31, %vf341, %vf342
	jzero	%i0, %i31, else.11344
	fmov	%vf344, %vf341
	set_label	%i31, cont.11345
	jmp	%i0, 0(%i31)
else.11344:
	lf	%vf343, 0(%i0)
	fsub	%vf344, %vf343, %vf341
cont.11345:
	fmul	%vf345, %vf344, %vf344
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf346, %i31
	fmul	%vf347, %vf346, %vf345
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf348, %i31
	fadd	%vf349, %vf347, %vf348
	fmul	%vf350, %vf349, %vf345
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf351, %i31
	fadd	%vf352, %vf350, %vf351
	fmul	%vf353, %vf352, %vf345
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf354, %i31
	fadd	%vf355, %vf353, %vf354
	fmul	%vf405, %vf355, %vf344
	set_label	%i31, cont.11343
	jmp	%i0, 0(%i31)
else.11342:
	lf	%vf356, 12(%i0)
	fsub	%vf357, %vf356, %vf319
	fmul	%vf358, %vf357, %vf357
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf359, %i31
	fmul	%vf360, %vf359, %vf358
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf361, %i31
	fadd	%vf362, %vf360, %vf361
	fmul	%vf363, %vf362, %vf358
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf364, %i31
	fadd	%vf365, %vf363, %vf364
	fmul	%vf366, %vf365, %vf358
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf367, %i31
	fadd	%vf368, %vf366, %vf367
	fmul	%vf405, %vf368, %vf357
cont.11343:
cont.11341:
	set_label	%i31, cont.11339
	jmp	%i0, 0(%i31)
else.11338:
	lf	%vf369, 0(%i0)
	fleq	%i31, %vf369, %vf319
	jzero	%i0, %i31, else.11346
	lf	%vf370, 0(%i0)
	finv	%vf371, %vf370
	fmul	%vf372, %vf319, %vf371
	fmov	%f1, %vf372
	ffloor	%f1, %f1
	fmov	%vf374, %f1
	lf	%vf375, 0(%i0)
	fmul	%vf376, %vf374, %vf375
	fsub	%vf377, %vf319, %vf376
	lf	%vf378, 4(%i0)
	fleq	%i31, %vf377, %vf378
	jzero	%i0, %i31, else.11348
	fmov	%vf380, %vf377
	set_label	%i31, cont.11349
	jmp	%i0, 0(%i31)
else.11348:
	lf	%vf379, 0(%i0)
	fsub	%vf380, %vf379, %vf377
cont.11349:
	fmul	%vf381, %vf380, %vf380
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf382, %i31
	fmul	%vf383, %vf382, %vf381
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf384, %i31
	fadd	%vf385, %vf383, %vf384
	fmul	%vf386, %vf385, %vf381
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf387, %i31
	fadd	%vf388, %vf386, %vf387
	fmul	%vf389, %vf388, %vf381
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf390, %i31
	fadd	%vf391, %vf389, %vf390
	fmul	%vf405, %vf391, %vf380
	set_label	%i31, cont.11347
	jmp	%i0, 0(%i31)
else.11346:
	lf	%vf392, 0(%i0)
	fsub	%vf393, %vf392, %vf319
	fmul	%vf394, %vf393, %vf393
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf395, %i31
	fmul	%vf396, %vf395, %vf394
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf397, %i31
	fadd	%vf398, %vf396, %vf397
	fmul	%vf399, %vf398, %vf394
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf400, %i31
	fsub	%vf401, %vf399, %vf400
	fmul	%vf402, %vf401, %vf394
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf403, %i31
	fadd	%vf404, %vf402, %vf403
	fmul	%vf405, %vf404, %vf393
cont.11347:
cont.11339:
	sf	%vf405, 0(%vi263)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf407, %f1
	fmov	%vf408, %vf407
	movui	%i31, 248048
	addi	%i31, %i31, -1483
	mif	%vf409, %i31
	fmul	%vf410, %vf408, %vf409
	set_label	%vi265, min_caml_cos_v
	fmov	%vf411, %vf410
	lf	%vf412, 4(%i0)
	fsub	%vf413, %vf412, %vf411
	fmov	%f1, %vf413
	call_dir	sin.2133
	fmov	%vf415, %f1
	sf	%vf415, 4(%vi265)
	set_label	%vi266, min_caml_sin_v
	fmov	%vf416, %vf410
	lf	%vf417, 4(%i0)
	fleq	%i31, %vf416, %vf417
	jzero	%i0, %i31, else.11350
	lf	%vf418, 8(%i0)
	fleq	%i31, %vf418, %vf416
	jzero	%i0, %i31, else.11352
	fmul	%vf419, %vf416, %vf416
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf420, %i31
	fmul	%vf421, %vf420, %vf419
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf422, %i31
	fadd	%vf423, %vf421, %vf422
	fmul	%vf424, %vf423, %vf419
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf425, %i31
	fadd	%vf426, %vf424, %vf425
	fmul	%vf427, %vf426, %vf419
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf428, %i31
	fadd	%vf429, %vf427, %vf428
	fmul	%vf502, %vf429, %vf416
	set_label	%i31, cont.11353
	jmp	%i0, 0(%i31)
else.11352:
	lf	%vf430, 12(%i0)
	fleq	%i31, %vf416, %vf430
	jzero	%i0, %i31, else.11354
	lf	%vf431, 0(%i0)
	finv	%vf432, %vf431
	fmul	%vf433, %vf416, %vf432
	fmov	%f1, %vf433
	ffloor	%f1, %f1
	fmov	%vf435, %f1
	lf	%vf436, 0(%i0)
	fmul	%vf437, %vf435, %vf436
	fsub	%vf438, %vf416, %vf437
	lf	%vf439, 4(%i0)
	fleq	%i31, %vf438, %vf439
	jzero	%i0, %i31, else.11356
	fmov	%vf441, %vf438
	set_label	%i31, cont.11357
	jmp	%i0, 0(%i31)
else.11356:
	lf	%vf440, 0(%i0)
	fsub	%vf441, %vf440, %vf438
cont.11357:
	fmul	%vf442, %vf441, %vf441
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf443, %i31
	fmul	%vf444, %vf443, %vf442
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf445, %i31
	fadd	%vf446, %vf444, %vf445
	fmul	%vf447, %vf446, %vf442
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf448, %i31
	fadd	%vf449, %vf447, %vf448
	fmul	%vf450, %vf449, %vf442
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf451, %i31
	fadd	%vf452, %vf450, %vf451
	fmul	%vf502, %vf452, %vf441
	set_label	%i31, cont.11355
	jmp	%i0, 0(%i31)
else.11354:
	lf	%vf453, 12(%i0)
	fsub	%vf454, %vf453, %vf416
	fmul	%vf455, %vf454, %vf454
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf456, %i31
	fmul	%vf457, %vf456, %vf455
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf458, %i31
	fadd	%vf459, %vf457, %vf458
	fmul	%vf460, %vf459, %vf455
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf461, %i31
	fadd	%vf462, %vf460, %vf461
	fmul	%vf463, %vf462, %vf455
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf464, %i31
	fadd	%vf465, %vf463, %vf464
	fmul	%vf502, %vf465, %vf454
cont.11355:
cont.11353:
	set_label	%i31, cont.11351
	jmp	%i0, 0(%i31)
else.11350:
	lf	%vf466, 0(%i0)
	fleq	%i31, %vf466, %vf416
	jzero	%i0, %i31, else.11358
	lf	%vf467, 0(%i0)
	finv	%vf468, %vf467
	fmul	%vf469, %vf416, %vf468
	fmov	%f1, %vf469
	ffloor	%f1, %f1
	fmov	%vf471, %f1
	lf	%vf472, 0(%i0)
	fmul	%vf473, %vf471, %vf472
	fsub	%vf474, %vf416, %vf473
	lf	%vf475, 4(%i0)
	fleq	%i31, %vf474, %vf475
	jzero	%i0, %i31, else.11360
	fmov	%vf477, %vf474
	set_label	%i31, cont.11361
	jmp	%i0, 0(%i31)
else.11360:
	lf	%vf476, 0(%i0)
	fsub	%vf477, %vf476, %vf474
cont.11361:
	fmul	%vf478, %vf477, %vf477
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf479, %i31
	fmul	%vf480, %vf479, %vf478
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf481, %i31
	fadd	%vf482, %vf480, %vf481
	fmul	%vf483, %vf482, %vf478
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf484, %i31
	fadd	%vf485, %vf483, %vf484
	fmul	%vf486, %vf485, %vf478
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf487, %i31
	fadd	%vf488, %vf486, %vf487
	fmul	%vf502, %vf488, %vf477
	set_label	%i31, cont.11359
	jmp	%i0, 0(%i31)
else.11358:
	lf	%vf489, 0(%i0)
	fsub	%vf490, %vf489, %vf416
	fmul	%vf491, %vf490, %vf490
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf492, %i31
	fmul	%vf493, %vf492, %vf491
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf494, %i31
	fadd	%vf495, %vf493, %vf494
	fmul	%vf496, %vf495, %vf491
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf497, %i31
	fsub	%vf498, %vf496, %vf497
	fmul	%vf499, %vf498, %vf491
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf500, %i31
	fadd	%vf501, %vf499, %vf500
	fmul	%vf502, %vf501, %vf490
cont.11359:
cont.11351:
	sf	%vf502, 4(%vi266)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf504, %f1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf506, %f1
	fmov	%vf507, %vf506
	movui	%i31, 248048
	addi	%i31, %i31, -1483
	mif	%vf508, %i31
	fmul	%vf509, %vf507, %vf508
	fmov	%vf510, %vf509
	lf	%vf511, 4(%i0)
	fleq	%i31, %vf510, %vf511
	jzero	%i0, %i31, else.11362
	lf	%vf512, 8(%i0)
	fleq	%i31, %vf512, %vf510
	jzero	%i0, %i31, else.11364
	fmul	%vf513, %vf510, %vf510
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf514, %i31
	fmul	%vf515, %vf514, %vf513
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf516, %i31
	fadd	%vf517, %vf515, %vf516
	fmul	%vf518, %vf517, %vf513
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf519, %i31
	fadd	%vf520, %vf518, %vf519
	fmul	%vf521, %vf520, %vf513
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf522, %i31
	fadd	%vf523, %vf521, %vf522
	fmul	%vf596, %vf523, %vf510
	set_label	%i31, cont.11365
	jmp	%i0, 0(%i31)
else.11364:
	lf	%vf524, 12(%i0)
	fleq	%i31, %vf510, %vf524
	jzero	%i0, %i31, else.11366
	lf	%vf525, 0(%i0)
	finv	%vf526, %vf525
	fmul	%vf527, %vf510, %vf526
	fmov	%f1, %vf527
	ffloor	%f1, %f1
	fmov	%vf529, %f1
	lf	%vf530, 0(%i0)
	fmul	%vf531, %vf529, %vf530
	fsub	%vf532, %vf510, %vf531
	lf	%vf533, 4(%i0)
	fleq	%i31, %vf532, %vf533
	jzero	%i0, %i31, else.11368
	fmov	%vf535, %vf532
	set_label	%i31, cont.11369
	jmp	%i0, 0(%i31)
else.11368:
	lf	%vf534, 0(%i0)
	fsub	%vf535, %vf534, %vf532
cont.11369:
	fmul	%vf536, %vf535, %vf535
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf537, %i31
	fmul	%vf538, %vf537, %vf536
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf539, %i31
	fadd	%vf540, %vf538, %vf539
	fmul	%vf541, %vf540, %vf536
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf542, %i31
	fadd	%vf543, %vf541, %vf542
	fmul	%vf544, %vf543, %vf536
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf545, %i31
	fadd	%vf546, %vf544, %vf545
	fmul	%vf596, %vf546, %vf535
	set_label	%i31, cont.11367
	jmp	%i0, 0(%i31)
else.11366:
	lf	%vf547, 12(%i0)
	fsub	%vf548, %vf547, %vf510
	fmul	%vf549, %vf548, %vf548
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf550, %i31
	fmul	%vf551, %vf550, %vf549
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf552, %i31
	fadd	%vf553, %vf551, %vf552
	fmul	%vf554, %vf553, %vf549
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf555, %i31
	fadd	%vf556, %vf554, %vf555
	fmul	%vf557, %vf556, %vf549
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf558, %i31
	fadd	%vf559, %vf557, %vf558
	fmul	%vf596, %vf559, %vf548
cont.11367:
cont.11365:
	set_label	%i31, cont.11363
	jmp	%i0, 0(%i31)
else.11362:
	lf	%vf560, 0(%i0)
	fleq	%i31, %vf560, %vf510
	jzero	%i0, %i31, else.11370
	lf	%vf561, 0(%i0)
	finv	%vf562, %vf561
	fmul	%vf563, %vf510, %vf562
	fmov	%f1, %vf563
	ffloor	%f1, %f1
	fmov	%vf565, %f1
	lf	%vf566, 0(%i0)
	fmul	%vf567, %vf565, %vf566
	fsub	%vf568, %vf510, %vf567
	lf	%vf569, 4(%i0)
	fleq	%i31, %vf568, %vf569
	jzero	%i0, %i31, else.11372
	fmov	%vf571, %vf568
	set_label	%i31, cont.11373
	jmp	%i0, 0(%i31)
else.11372:
	lf	%vf570, 0(%i0)
	fsub	%vf571, %vf570, %vf568
cont.11373:
	fmul	%vf572, %vf571, %vf571
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf573, %i31
	fmul	%vf574, %vf573, %vf572
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf575, %i31
	fadd	%vf576, %vf574, %vf575
	fmul	%vf577, %vf576, %vf572
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf578, %i31
	fadd	%vf579, %vf577, %vf578
	fmul	%vf580, %vf579, %vf572
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf581, %i31
	fadd	%vf582, %vf580, %vf581
	fmul	%vf596, %vf582, %vf571
	set_label	%i31, cont.11371
	jmp	%i0, 0(%i31)
else.11370:
	lf	%vf583, 0(%i0)
	fsub	%vf584, %vf583, %vf510
	fmul	%vf585, %vf584, %vf584
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf586, %i31
	fmul	%vf587, %vf586, %vf585
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf588, %i31
	fadd	%vf589, %vf587, %vf588
	fmul	%vf590, %vf589, %vf585
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf591, %i31
	fsub	%vf592, %vf590, %vf591
	fmul	%vf593, %vf592, %vf585
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf594, %i31
	fadd	%vf595, %vf593, %vf594
	fmul	%vf596, %vf595, %vf584
cont.11371:
cont.11363:
	set_label	%vi267, min_caml_light
	fneg	%vf597, %vf596
	sf	%vf597, 4(%vi267)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf599, %f1
	fmov	%vf600, %vf599
	movui	%i31, 248048
	addi	%i31, %i31, -1483
	mif	%vf601, %i31
	fmul	%vf602, %vf600, %vf601
	fmov	%vf603, %vf509
	lf	%vf604, 4(%i0)
	fsub	%vf605, %vf604, %vf603
	fmov	%f1, %vf605
	call_dir	sin.2133
	fmov	%vf607, %f1
	fmov	%vf608, %vf602
	lf	%vf609, 4(%i0)
	fleq	%i31, %vf608, %vf609
	jzero	%i0, %i31, else.11374
	lf	%vf610, 8(%i0)
	fleq	%i31, %vf610, %vf608
	jzero	%i0, %i31, else.11376
	fmul	%vf611, %vf608, %vf608
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf612, %i31
	fmul	%vf613, %vf612, %vf611
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf614, %i31
	fadd	%vf615, %vf613, %vf614
	fmul	%vf616, %vf615, %vf611
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf617, %i31
	fadd	%vf618, %vf616, %vf617
	fmul	%vf619, %vf618, %vf611
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf620, %i31
	fadd	%vf621, %vf619, %vf620
	fmul	%vf694, %vf621, %vf608
	set_label	%i31, cont.11377
	jmp	%i0, 0(%i31)
else.11376:
	lf	%vf622, 12(%i0)
	fleq	%i31, %vf608, %vf622
	jzero	%i0, %i31, else.11378
	lf	%vf623, 0(%i0)
	finv	%vf624, %vf623
	fmul	%vf625, %vf608, %vf624
	fmov	%f1, %vf625
	ffloor	%f1, %f1
	fmov	%vf627, %f1
	lf	%vf628, 0(%i0)
	fmul	%vf629, %vf627, %vf628
	fsub	%vf630, %vf608, %vf629
	lf	%vf631, 4(%i0)
	fleq	%i31, %vf630, %vf631
	jzero	%i0, %i31, else.11380
	fmov	%vf633, %vf630
	set_label	%i31, cont.11381
	jmp	%i0, 0(%i31)
else.11380:
	lf	%vf632, 0(%i0)
	fsub	%vf633, %vf632, %vf630
cont.11381:
	fmul	%vf634, %vf633, %vf633
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf635, %i31
	fmul	%vf636, %vf635, %vf634
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf637, %i31
	fadd	%vf638, %vf636, %vf637
	fmul	%vf639, %vf638, %vf634
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf640, %i31
	fadd	%vf641, %vf639, %vf640
	fmul	%vf642, %vf641, %vf634
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf643, %i31
	fadd	%vf644, %vf642, %vf643
	fmul	%vf694, %vf644, %vf633
	set_label	%i31, cont.11379
	jmp	%i0, 0(%i31)
else.11378:
	lf	%vf645, 12(%i0)
	fsub	%vf646, %vf645, %vf608
	fmul	%vf647, %vf646, %vf646
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf648, %i31
	fmul	%vf649, %vf648, %vf647
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf650, %i31
	fadd	%vf651, %vf649, %vf650
	fmul	%vf652, %vf651, %vf647
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf653, %i31
	fadd	%vf654, %vf652, %vf653
	fmul	%vf655, %vf654, %vf647
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf656, %i31
	fadd	%vf657, %vf655, %vf656
	fmul	%vf694, %vf657, %vf646
cont.11379:
cont.11377:
	set_label	%i31, cont.11375
	jmp	%i0, 0(%i31)
else.11374:
	lf	%vf658, 0(%i0)
	fleq	%i31, %vf658, %vf608
	jzero	%i0, %i31, else.11382
	lf	%vf659, 0(%i0)
	finv	%vf660, %vf659
	fmul	%vf661, %vf608, %vf660
	fmov	%f1, %vf661
	ffloor	%f1, %f1
	fmov	%vf663, %f1
	lf	%vf664, 0(%i0)
	fmul	%vf665, %vf663, %vf664
	fsub	%vf666, %vf608, %vf665
	lf	%vf667, 4(%i0)
	fleq	%i31, %vf666, %vf667
	jzero	%i0, %i31, else.11384
	fmov	%vf669, %vf666
	set_label	%i31, cont.11385
	jmp	%i0, 0(%i31)
else.11384:
	lf	%vf668, 0(%i0)
	fsub	%vf669, %vf668, %vf666
cont.11385:
	fmul	%vf670, %vf669, %vf669
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf671, %i31
	fmul	%vf672, %vf671, %vf670
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf673, %i31
	fadd	%vf674, %vf672, %vf673
	fmul	%vf675, %vf674, %vf670
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf676, %i31
	fadd	%vf677, %vf675, %vf676
	fmul	%vf678, %vf677, %vf670
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf679, %i31
	fadd	%vf680, %vf678, %vf679
	fmul	%vf694, %vf680, %vf669
	set_label	%i31, cont.11383
	jmp	%i0, 0(%i31)
else.11382:
	lf	%vf681, 0(%i0)
	fsub	%vf682, %vf681, %vf608
	fmul	%vf683, %vf682, %vf682
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf684, %i31
	fmul	%vf685, %vf684, %vf683
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf686, %i31
	fadd	%vf687, %vf685, %vf686
	fmul	%vf688, %vf687, %vf683
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf689, %i31
	fsub	%vf690, %vf688, %vf689
	fmul	%vf691, %vf690, %vf683
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf692, %i31
	fadd	%vf693, %vf691, %vf692
	fmul	%vf694, %vf693, %vf682
cont.11383:
cont.11375:
	set_label	%vi268, min_caml_light
	mov	%vi269, %i0
	fmul	%vf695, %vf607, %vf694
	sf	%vf695, 0(%vi268)
	fmov	%vf696, %vf602
	lf	%vf697, 4(%i0)
	fsub	%vf698, %vf697, %vf696
	fmov	%f1, %vf698
	call_dir	sin.2133
	fmov	%vf700, %f1
	set_label	%vi270, min_caml_light
	fmul	%vf701, %vf607, %vf700
	sf	%vf701, 8(%vi270)
	set_label	%vi271, min_caml_beam
	mov	%vi272, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf703, %f1
	sf	%vf703, 0(%vi271)
	set_label	%vi273, min_caml_vp
	mov	%vi274, %i0
	set_label	%vi275, min_caml_cos_v
	mov	%vi276, %i0
	lf	%vf704, 0(%vi275)
	set_label	%vi277, min_caml_sin_v
	lf	%vf705, 4(%vi277)
	fmul	%vf706, %vf704, %vf705
	movui	%i31, 799872
	mif	%vf707, %i31
	fmul	%vf708, %vf706, %vf707
	sf	%vf708, 0(%vi273)
	set_label	%vi278, min_caml_vp
	set_label	%vi279, min_caml_sin_v
	mov	%vi280, %i0
	lf	%vf709, 0(%vi279)
	fneg	%vf710, %vf709
	movui	%i31, 799872
	mif	%vf711, %i31
	fmul	%vf712, %vf710, %vf711
	sf	%vf712, 4(%vi278)
	set_label	%vi281, min_caml_vp
	set_label	%vi282, min_caml_cos_v
	mov	%vi283, %i0
	lf	%vf713, 0(%vi282)
	set_label	%vi284, min_caml_cos_v
	lf	%vf714, 4(%vi284)
	fmul	%vf715, %vf713, %vf714
	movui	%i31, 799872
	mif	%vf716, %i31
	fmul	%vf717, %vf715, %vf716
	sf	%vf717, 8(%vi281)
	set_label	%vi285, min_caml_view
	mov	%vi286, %i0
	set_label	%vi287, min_caml_vp
	mov	%vi288, %i0
	lf	%vf718, 0(%vi287)
	set_label	%vi289, min_caml_screen
	mov	%vi290, %i0
	lf	%vf719, 0(%vi289)
	fadd	%vf720, %vf718, %vf719
	sf	%vf720, 0(%vi285)
	set_label	%vi291, min_caml_view
	set_label	%vi292, min_caml_vp
	lf	%vf721, 4(%vi292)
	set_label	%vi293, min_caml_screen
	lf	%vf722, 4(%vi293)
	fadd	%vf723, %vf721, %vf722
	sf	%vf723, 4(%vi291)
	set_label	%vi294, min_caml_view
	set_label	%vi295, min_caml_vp
	lf	%vf724, 8(%vi295)
	set_label	%vi296, min_caml_screen
	lf	%vf725, 8(%vi296)
	fadd	%vf726, %vf724, %vf725
	sf	%vf726, 8(%vi294)
	ret
	.end_function
	.func_entry
read_nth_object.2800:
	mov	%vi297, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mov	%vi299, %i4
	movi	%vi300, 1
	sub	%vi301, %i0, %vi300
	jeq	%vi299, %vi301, then.11387
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mov	%vi303, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mov	%vi305, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mov	%vi307, %i4
	movi	%vi308, 3
	fmov	%vf727, %f0
	mov	%i4, %vi308
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%vi310, %i4
	mov	%vi311, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf729, %f1
	sf	%vf729, 0(%vi310)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf731, %f1
	sf	%vf731, 4(%vi310)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf733, %f1
	sf	%vf733, 8(%vi310)
	movi	%vi312, 3
	fmov	%vf734, %f0
	mov	%i4, %vi312
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%vi314, %i4
	mov	%vi315, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf736, %f1
	sf	%vf736, 0(%vi314)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf738, %f1
	sf	%vf738, 4(%vi314)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf740, %f1
	sf	%vf740, 8(%vi314)
	fmov	%vf741, %f0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf743, %f1
	fleq	%i31, %f0, %vf743
	jzero	%i0, %i31, else.11388
	mov	%vi316, %i0
	set_label	%i31, cont.11389
	jmp	%i0, 0(%i31)
else.11388:
	movi	%vi316, 1
cont.11389:
	movi	%vi317, 2
	fmov	%vf744, %f0
	mov	%i4, %vi317
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 8
	mov	%vi319, %i4
	mov	%vi320, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf746, %f1
	sf	%vf746, 0(%vi319)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf748, %f1
	sf	%vf748, 4(%vi319)
	movi	%vi321, 3
	fmov	%vf749, %f0
	mov	%i4, %vi321
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%vi323, %i4
	mov	%vi324, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf751, %f1
	sf	%vf751, 0(%vi323)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf753, %f1
	sf	%vf753, 4(%vi323)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf755, %f1
	sf	%vf755, 8(%vi323)
	movi	%vi325, 3
	fmov	%vf756, %f0
	mov	%i4, %vi325
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%vi327, %i4
	mov	%vi328, %i0
	jeq	%vi307, %i0, cont.11390
	mov	%vi329, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf758, %f1
	fmov	%vf759, %vf758
	movui	%i31, 248048
	addi	%i31, %i31, -1483
	mif	%vf760, %i31
	fmul	%vf761, %vf759, %vf760
	sf	%vf761, 0(%vi327)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf763, %f1
	fmov	%vf764, %vf763
	movui	%i31, 248048
	addi	%i31, %i31, -1483
	mif	%vf765, %i31
	fmul	%vf766, %vf764, %vf765
	sf	%vf766, 4(%vi327)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf768, %f1
	fmov	%vf769, %vf768
	movui	%i31, 248048
	addi	%i31, %i31, -1483
	mif	%vf770, %i31
	fmul	%vf771, %vf769, %vf770
	sf	%vf771, 8(%vi327)
cont.11390:
	movi	%i31, 2
	jeq	%vi303, %i31, then.11391
	mov	%vi330, %vi316
	set_label	%i31, cont.11392
	jmp	%i0, 0(%i31)
then.11391:
	movi	%vi330, 1
cont.11392:
	mov	%vi331, %i2
	addi	%i2, %i2, 40
	sw	%vi327, 36(%vi331)
	sw	%vi323, 32(%vi331)
	sw	%vi319, 28(%vi331)
	sw	%vi330, 24(%vi331)
	sw	%vi314, 20(%vi331)
	sw	%vi310, 16(%vi331)
	sw	%vi307, 12(%vi331)
	sw	%vi305, 8(%vi331)
	sw	%vi303, 4(%vi331)
	sw	%vi299, 0(%vi331)
	mov	%vi332, %vi331
	set_label	%vi333, min_caml_objects
	slli	%vi334, %vi297, 2
	add	%i31, %vi333, %vi334
	sw	%vi332, 0(%i31)
	movi	%i31, 3
	jeq	%vi303, %i31, then.11393
	ceqi	%i31, %vi303, 2
	jzero	%i0, %i31, cont.11395
	mov	%vi337, %i0
	jeq	%vi316, %i0, then.11396
	mov	%vi338, %i0
	set_label	%i31, cont.11397
	jmp	%i0, 0(%i31)
then.11396:
	movi	%vi338, 1
cont.11397:
	mov	%vi339, %vi310
	mov	%vi340, %vi338
	mov	%vi341, %i0
	lf	%vf799, 0(%vi339)
	fmov	%f1, %vf799
	call_dir	fsqr.2386
	fmov	%vf801, %f1
	lf	%vf802, 4(%vi339)
	fmov	%f1, %vf802
	call_dir	fsqr.2386
	fmov	%vf804, %f1
	fadd	%vf805, %vf801, %vf804
	lf	%vf806, 8(%vi339)
	fmov	%f1, %vf806
	call_dir	fsqr.2386
	fmov	%vf808, %f1
	fadd	%vf809, %vf805, %vf808
	fmov	%f1, %vf809
	call_dir	sqrt.2275
	fmov	%vf811, %f1
	mov	%vi342, %i0
	jeq	%vi340, %i0, then.11398
	fneg	%vf812, %vf811
	set_label	%i31, cont.11399
	jmp	%i0, 0(%i31)
then.11398:
	fmov	%vf812, %vf811
cont.11399:
	mov	%vi343, %i0
	mov	%vi344, %i0
	lf	%vf813, 0(%vi339)
	finv	%vf814, %vf812
	fmul	%vf815, %vf813, %vf814
	sf	%vf815, 0(%vi339)
	lf	%vf816, 4(%vi339)
	finv	%vf817, %vf812
	fmul	%vf818, %vf816, %vf817
	sf	%vf818, 4(%vi339)
	lf	%vf819, 8(%vi339)
	finv	%vf820, %vf812
	fmul	%vf821, %vf819, %vf820
	sf	%vf821, 8(%vi339)
cont.11395:
	set_label	%i31, cont.11394
	jmp	%i0, 0(%i31)
then.11393:
	mov	%vi335, %i0
	lf	%vf772, 0(%vi310)
	mov	%vi336, %i0
	fmov	%vf773, %f0
	feq	%i31, %f0, %vf772
	jzero	%i0, %i31, else.11400
	fmov	%vf780, %f0
	set_label	%i31, cont.11401
	jmp	%i0, 0(%i31)
else.11400:
	fmov	%vf774, %vf772
	fmov	%vf775, %f0
	fleq	%i31, %vf774, %f0
	jzero	%i0, %i31, else.11402
	movui	%i31, 784384
	mif	%vf776, %i31
	set_label	%i31, cont.11403
	jmp	%i0, 0(%i31)
else.11402:
	movui	%i31, 260096
	mif	%vf776, %i31
cont.11403:
	fmov	%vf777, %vf772
	fmul	%vf778, %vf777, %vf777
	finv	%vf779, %vf778
	fmul	%vf780, %vf776, %vf779
cont.11401:
	sf	%vf780, 0(%vi310)
	lf	%vf781, 4(%vi310)
	fmov	%vf782, %f0
	feq	%i31, %f0, %vf781
	jzero	%i0, %i31, else.11404
	fmov	%vf789, %f0
	set_label	%i31, cont.11405
	jmp	%i0, 0(%i31)
else.11404:
	fmov	%vf783, %vf781
	fmov	%vf784, %f0
	fleq	%i31, %vf783, %f0
	jzero	%i0, %i31, else.11406
	movui	%i31, 784384
	mif	%vf785, %i31
	set_label	%i31, cont.11407
	jmp	%i0, 0(%i31)
else.11406:
	movui	%i31, 260096
	mif	%vf785, %i31
cont.11407:
	fmov	%vf786, %vf781
	fmul	%vf787, %vf786, %vf786
	finv	%vf788, %vf787
	fmul	%vf789, %vf785, %vf788
cont.11405:
	sf	%vf789, 4(%vi310)
	lf	%vf790, 8(%vi310)
	fmov	%vf791, %f0
	feq	%i31, %f0, %vf790
	jzero	%i0, %i31, else.11408
	fmov	%vf798, %f0
	set_label	%i31, cont.11409
	jmp	%i0, 0(%i31)
else.11408:
	fmov	%vf792, %vf790
	fmov	%vf793, %f0
	fleq	%i31, %vf792, %f0
	jzero	%i0, %i31, else.11410
	movui	%i31, 784384
	mif	%vf794, %i31
	set_label	%i31, cont.11411
	jmp	%i0, 0(%i31)
else.11410:
	movui	%i31, 260096
	mif	%vf794, %i31
cont.11411:
	fmov	%vf795, %vf790
	fmul	%vf796, %vf795, %vf795
	finv	%vf797, %vf796
	fmul	%vf798, %vf794, %vf797
cont.11409:
	sf	%vf798, 8(%vi310)
cont.11394:
	mov	%vi345, %i0
	jeq	%vi307, %i0, cont.11412
	set_label	%vi346, min_caml_cs_temp
	mov	%vi347, %i0
	lf	%vf822, 0(%vi327)
	fmov	%vf823, %vf822
	lf	%vf824, 4(%i0)
	fsub	%vf825, %vf824, %vf823
	fmov	%f1, %vf825
	call_dir	sin.2133
	fmov	%vf827, %f1
	sf	%vf827, 40(%vi346)
	set_label	%vi348, min_caml_cs_temp
	mov	%vi349, %i0
	lf	%vf828, 0(%vi327)
	fmov	%vf829, %vf828
	lf	%vf830, 4(%i0)
	fleq	%i31, %vf829, %vf830
	jzero	%i0, %i31, else.11413
	lf	%vf831, 8(%i0)
	fleq	%i31, %vf831, %vf829
	jzero	%i0, %i31, else.11415
	fmul	%vf832, %vf829, %vf829
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf833, %i31
	fmul	%vf834, %vf833, %vf832
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf835, %i31
	fadd	%vf836, %vf834, %vf835
	fmul	%vf837, %vf836, %vf832
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf838, %i31
	fadd	%vf839, %vf837, %vf838
	fmul	%vf840, %vf839, %vf832
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf841, %i31
	fadd	%vf842, %vf840, %vf841
	fmul	%vf915, %vf842, %vf829
	set_label	%i31, cont.11416
	jmp	%i0, 0(%i31)
else.11415:
	lf	%vf843, 12(%i0)
	fleq	%i31, %vf829, %vf843
	jzero	%i0, %i31, else.11417
	lf	%vf844, 0(%i0)
	finv	%vf845, %vf844
	fmul	%vf846, %vf829, %vf845
	fmov	%f1, %vf846
	ffloor	%f1, %f1
	fmov	%vf848, %f1
	lf	%vf849, 0(%i0)
	fmul	%vf850, %vf848, %vf849
	fsub	%vf851, %vf829, %vf850
	lf	%vf852, 4(%i0)
	fleq	%i31, %vf851, %vf852
	jzero	%i0, %i31, else.11419
	fmov	%vf854, %vf851
	set_label	%i31, cont.11420
	jmp	%i0, 0(%i31)
else.11419:
	lf	%vf853, 0(%i0)
	fsub	%vf854, %vf853, %vf851
cont.11420:
	fmul	%vf855, %vf854, %vf854
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf856, %i31
	fmul	%vf857, %vf856, %vf855
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf858, %i31
	fadd	%vf859, %vf857, %vf858
	fmul	%vf860, %vf859, %vf855
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf861, %i31
	fadd	%vf862, %vf860, %vf861
	fmul	%vf863, %vf862, %vf855
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf864, %i31
	fadd	%vf865, %vf863, %vf864
	fmul	%vf915, %vf865, %vf854
	set_label	%i31, cont.11418
	jmp	%i0, 0(%i31)
else.11417:
	lf	%vf866, 12(%i0)
	fsub	%vf867, %vf866, %vf829
	fmul	%vf868, %vf867, %vf867
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf869, %i31
	fmul	%vf870, %vf869, %vf868
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf871, %i31
	fadd	%vf872, %vf870, %vf871
	fmul	%vf873, %vf872, %vf868
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf874, %i31
	fadd	%vf875, %vf873, %vf874
	fmul	%vf876, %vf875, %vf868
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf877, %i31
	fadd	%vf878, %vf876, %vf877
	fmul	%vf915, %vf878, %vf867
cont.11418:
cont.11416:
	set_label	%i31, cont.11414
	jmp	%i0, 0(%i31)
else.11413:
	lf	%vf879, 0(%i0)
	fleq	%i31, %vf879, %vf829
	jzero	%i0, %i31, else.11421
	lf	%vf880, 0(%i0)
	finv	%vf881, %vf880
	fmul	%vf882, %vf829, %vf881
	fmov	%f1, %vf882
	ffloor	%f1, %f1
	fmov	%vf884, %f1
	lf	%vf885, 0(%i0)
	fmul	%vf886, %vf884, %vf885
	fsub	%vf887, %vf829, %vf886
	lf	%vf888, 4(%i0)
	fleq	%i31, %vf887, %vf888
	jzero	%i0, %i31, else.11423
	fmov	%vf890, %vf887
	set_label	%i31, cont.11424
	jmp	%i0, 0(%i31)
else.11423:
	lf	%vf889, 0(%i0)
	fsub	%vf890, %vf889, %vf887
cont.11424:
	fmul	%vf891, %vf890, %vf890
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf892, %i31
	fmul	%vf893, %vf892, %vf891
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf894, %i31
	fadd	%vf895, %vf893, %vf894
	fmul	%vf896, %vf895, %vf891
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf897, %i31
	fadd	%vf898, %vf896, %vf897
	fmul	%vf899, %vf898, %vf891
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf900, %i31
	fadd	%vf901, %vf899, %vf900
	fmul	%vf915, %vf901, %vf890
	set_label	%i31, cont.11422
	jmp	%i0, 0(%i31)
else.11421:
	lf	%vf902, 0(%i0)
	fsub	%vf903, %vf902, %vf829
	fmul	%vf904, %vf903, %vf903
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf905, %i31
	fmul	%vf906, %vf905, %vf904
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf907, %i31
	fadd	%vf908, %vf906, %vf907
	fmul	%vf909, %vf908, %vf904
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf910, %i31
	fsub	%vf911, %vf909, %vf910
	fmul	%vf912, %vf911, %vf904
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf913, %i31
	fadd	%vf914, %vf912, %vf913
	fmul	%vf915, %vf914, %vf903
cont.11422:
cont.11414:
	sf	%vf915, 44(%vi348)
	set_label	%vi350, min_caml_cs_temp
	lf	%vf916, 4(%vi327)
	fmov	%vf917, %vf916
	lf	%vf918, 4(%i0)
	fsub	%vf919, %vf918, %vf917
	fmov	%f1, %vf919
	call_dir	sin.2133
	fmov	%vf921, %f1
	sf	%vf921, 48(%vi350)
	set_label	%vi351, min_caml_cs_temp
	lf	%vf922, 4(%vi327)
	fmov	%vf923, %vf922
	lf	%vf924, 4(%i0)
	fleq	%i31, %vf923, %vf924
	jzero	%i0, %i31, else.11425
	lf	%vf925, 8(%i0)
	fleq	%i31, %vf925, %vf923
	jzero	%i0, %i31, else.11427
	fmul	%vf926, %vf923, %vf923
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf927, %i31
	fmul	%vf928, %vf927, %vf926
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf929, %i31
	fadd	%vf930, %vf928, %vf929
	fmul	%vf931, %vf930, %vf926
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf932, %i31
	fadd	%vf933, %vf931, %vf932
	fmul	%vf934, %vf933, %vf926
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf935, %i31
	fadd	%vf936, %vf934, %vf935
	fmul	%vf1009, %vf936, %vf923
	set_label	%i31, cont.11428
	jmp	%i0, 0(%i31)
else.11427:
	lf	%vf937, 12(%i0)
	fleq	%i31, %vf923, %vf937
	jzero	%i0, %i31, else.11429
	lf	%vf938, 0(%i0)
	finv	%vf939, %vf938
	fmul	%vf940, %vf923, %vf939
	fmov	%f1, %vf940
	ffloor	%f1, %f1
	fmov	%vf942, %f1
	lf	%vf943, 0(%i0)
	fmul	%vf944, %vf942, %vf943
	fsub	%vf945, %vf923, %vf944
	lf	%vf946, 4(%i0)
	fleq	%i31, %vf945, %vf946
	jzero	%i0, %i31, else.11431
	fmov	%vf948, %vf945
	set_label	%i31, cont.11432
	jmp	%i0, 0(%i31)
else.11431:
	lf	%vf947, 0(%i0)
	fsub	%vf948, %vf947, %vf945
cont.11432:
	fmul	%vf949, %vf948, %vf948
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf950, %i31
	fmul	%vf951, %vf950, %vf949
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf952, %i31
	fadd	%vf953, %vf951, %vf952
	fmul	%vf954, %vf953, %vf949
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf955, %i31
	fadd	%vf956, %vf954, %vf955
	fmul	%vf957, %vf956, %vf949
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf958, %i31
	fadd	%vf959, %vf957, %vf958
	fmul	%vf1009, %vf959, %vf948
	set_label	%i31, cont.11430
	jmp	%i0, 0(%i31)
else.11429:
	lf	%vf960, 12(%i0)
	fsub	%vf961, %vf960, %vf923
	fmul	%vf962, %vf961, %vf961
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf963, %i31
	fmul	%vf964, %vf963, %vf962
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf965, %i31
	fadd	%vf966, %vf964, %vf965
	fmul	%vf967, %vf966, %vf962
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf968, %i31
	fadd	%vf969, %vf967, %vf968
	fmul	%vf970, %vf969, %vf962
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf971, %i31
	fadd	%vf972, %vf970, %vf971
	fmul	%vf1009, %vf972, %vf961
cont.11430:
cont.11428:
	set_label	%i31, cont.11426
	jmp	%i0, 0(%i31)
else.11425:
	lf	%vf973, 0(%i0)
	fleq	%i31, %vf973, %vf923
	jzero	%i0, %i31, else.11433
	lf	%vf974, 0(%i0)
	finv	%vf975, %vf974
	fmul	%vf976, %vf923, %vf975
	fmov	%f1, %vf976
	ffloor	%f1, %f1
	fmov	%vf978, %f1
	lf	%vf979, 0(%i0)
	fmul	%vf980, %vf978, %vf979
	fsub	%vf981, %vf923, %vf980
	lf	%vf982, 4(%i0)
	fleq	%i31, %vf981, %vf982
	jzero	%i0, %i31, else.11435
	fmov	%vf984, %vf981
	set_label	%i31, cont.11436
	jmp	%i0, 0(%i31)
else.11435:
	lf	%vf983, 0(%i0)
	fsub	%vf984, %vf983, %vf981
cont.11436:
	fmul	%vf985, %vf984, %vf984
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf986, %i31
	fmul	%vf987, %vf986, %vf985
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf988, %i31
	fadd	%vf989, %vf987, %vf988
	fmul	%vf990, %vf989, %vf985
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf991, %i31
	fadd	%vf992, %vf990, %vf991
	fmul	%vf993, %vf992, %vf985
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf994, %i31
	fadd	%vf995, %vf993, %vf994
	fmul	%vf1009, %vf995, %vf984
	set_label	%i31, cont.11434
	jmp	%i0, 0(%i31)
else.11433:
	lf	%vf996, 0(%i0)
	fsub	%vf997, %vf996, %vf923
	fmul	%vf998, %vf997, %vf997
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf999, %i31
	fmul	%vf1000, %vf999, %vf998
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf1001, %i31
	fadd	%vf1002, %vf1000, %vf1001
	fmul	%vf1003, %vf1002, %vf998
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf1004, %i31
	fsub	%vf1005, %vf1003, %vf1004
	fmul	%vf1006, %vf1005, %vf998
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf1007, %i31
	fadd	%vf1008, %vf1006, %vf1007
	fmul	%vf1009, %vf1008, %vf997
cont.11434:
cont.11426:
	sf	%vf1009, 52(%vi351)
	set_label	%vi352, min_caml_cs_temp
	lf	%vf1010, 8(%vi327)
	fmov	%vf1011, %vf1010
	lf	%vf1012, 4(%i0)
	fsub	%vf1013, %vf1012, %vf1011
	fmov	%f1, %vf1013
	call_dir	sin.2133
	fmov	%vf1015, %f1
	sf	%vf1015, 56(%vi352)
	set_label	%vi353, min_caml_cs_temp
	lf	%vf1016, 8(%vi327)
	fmov	%vf1017, %vf1016
	lf	%vf1018, 4(%i0)
	fleq	%i31, %vf1017, %vf1018
	jzero	%i0, %i31, else.11437
	lf	%vf1019, 8(%i0)
	fleq	%i31, %vf1019, %vf1017
	jzero	%i0, %i31, else.11439
	fmul	%vf1020, %vf1017, %vf1017
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf1021, %i31
	fmul	%vf1022, %vf1021, %vf1020
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf1023, %i31
	fadd	%vf1024, %vf1022, %vf1023
	fmul	%vf1025, %vf1024, %vf1020
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf1026, %i31
	fadd	%vf1027, %vf1025, %vf1026
	fmul	%vf1028, %vf1027, %vf1020
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf1029, %i31
	fadd	%vf1030, %vf1028, %vf1029
	fmul	%vf1103, %vf1030, %vf1017
	set_label	%i31, cont.11440
	jmp	%i0, 0(%i31)
else.11439:
	lf	%vf1031, 12(%i0)
	fleq	%i31, %vf1017, %vf1031
	jzero	%i0, %i31, else.11441
	lf	%vf1032, 0(%i0)
	finv	%vf1033, %vf1032
	fmul	%vf1034, %vf1017, %vf1033
	fmov	%f1, %vf1034
	ffloor	%f1, %f1
	fmov	%vf1036, %f1
	lf	%vf1037, 0(%i0)
	fmul	%vf1038, %vf1036, %vf1037
	fsub	%vf1039, %vf1017, %vf1038
	lf	%vf1040, 4(%i0)
	fleq	%i31, %vf1039, %vf1040
	jzero	%i0, %i31, else.11443
	fmov	%vf1042, %vf1039
	set_label	%i31, cont.11444
	jmp	%i0, 0(%i31)
else.11443:
	lf	%vf1041, 0(%i0)
	fsub	%vf1042, %vf1041, %vf1039
cont.11444:
	fmul	%vf1043, %vf1042, %vf1042
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf1044, %i31
	fmul	%vf1045, %vf1044, %vf1043
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf1046, %i31
	fadd	%vf1047, %vf1045, %vf1046
	fmul	%vf1048, %vf1047, %vf1043
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf1049, %i31
	fadd	%vf1050, %vf1048, %vf1049
	fmul	%vf1051, %vf1050, %vf1043
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf1052, %i31
	fadd	%vf1053, %vf1051, %vf1052
	fmul	%vf1103, %vf1053, %vf1042
	set_label	%i31, cont.11442
	jmp	%i0, 0(%i31)
else.11441:
	lf	%vf1054, 12(%i0)
	fsub	%vf1055, %vf1054, %vf1017
	fmul	%vf1056, %vf1055, %vf1055
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf1057, %i31
	fmul	%vf1058, %vf1057, %vf1056
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf1059, %i31
	fadd	%vf1060, %vf1058, %vf1059
	fmul	%vf1061, %vf1060, %vf1056
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf1062, %i31
	fadd	%vf1063, %vf1061, %vf1062
	fmul	%vf1064, %vf1063, %vf1056
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf1065, %i31
	fadd	%vf1066, %vf1064, %vf1065
	fmul	%vf1103, %vf1066, %vf1055
cont.11442:
cont.11440:
	set_label	%i31, cont.11438
	jmp	%i0, 0(%i31)
else.11437:
	lf	%vf1067, 0(%i0)
	fleq	%i31, %vf1067, %vf1017
	jzero	%i0, %i31, else.11445
	lf	%vf1068, 0(%i0)
	finv	%vf1069, %vf1068
	fmul	%vf1070, %vf1017, %vf1069
	fmov	%f1, %vf1070
	ffloor	%f1, %f1
	fmov	%vf1072, %f1
	lf	%vf1073, 0(%i0)
	fmul	%vf1074, %vf1072, %vf1073
	fsub	%vf1075, %vf1017, %vf1074
	lf	%vf1076, 4(%i0)
	fleq	%i31, %vf1075, %vf1076
	jzero	%i0, %i31, else.11447
	fmov	%vf1078, %vf1075
	set_label	%i31, cont.11448
	jmp	%i0, 0(%i31)
else.11447:
	lf	%vf1077, 0(%i0)
	fsub	%vf1078, %vf1077, %vf1075
cont.11448:
	fmul	%vf1079, %vf1078, %vf1078
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf1080, %i31
	fmul	%vf1081, %vf1080, %vf1079
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf1082, %i31
	fadd	%vf1083, %vf1081, %vf1082
	fmul	%vf1084, %vf1083, %vf1079
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf1085, %i31
	fadd	%vf1086, %vf1084, %vf1085
	fmul	%vf1087, %vf1086, %vf1079
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf1088, %i31
	fadd	%vf1089, %vf1087, %vf1088
	fmul	%vf1103, %vf1089, %vf1078
	set_label	%i31, cont.11446
	jmp	%i0, 0(%i31)
else.11445:
	lf	%vf1090, 0(%i0)
	fsub	%vf1091, %vf1090, %vf1017
	fmul	%vf1092, %vf1091, %vf1091
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf1093, %i31
	fmul	%vf1094, %vf1093, %vf1092
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf1095, %i31
	fadd	%vf1096, %vf1094, %vf1095
	fmul	%vf1097, %vf1096, %vf1092
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf1098, %i31
	fsub	%vf1099, %vf1097, %vf1098
	fmul	%vf1100, %vf1099, %vf1092
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf1101, %i31
	fadd	%vf1102, %vf1100, %vf1101
	fmul	%vf1103, %vf1102, %vf1091
cont.11446:
cont.11438:
	sf	%vf1103, 60(%vi353)
	set_label	%vi354, min_caml_cs_temp
	mov	%vi355, %i0
	set_label	%vi356, min_caml_cs_temp
	lf	%vf1104, 48(%vi356)
	set_label	%vi357, min_caml_cs_temp
	lf	%vf1105, 56(%vi357)
	fmul	%vf1106, %vf1104, %vf1105
	sf	%vf1106, 0(%vi354)
	set_label	%vi358, min_caml_cs_temp
	set_label	%vi359, min_caml_cs_temp
	lf	%vf1107, 44(%vi359)
	set_label	%vi360, min_caml_cs_temp
	lf	%vf1108, 52(%vi360)
	fmul	%vf1109, %vf1107, %vf1108
	set_label	%vi361, min_caml_cs_temp
	lf	%vf1110, 56(%vi361)
	fmul	%vf1111, %vf1109, %vf1110
	set_label	%vi362, min_caml_cs_temp
	lf	%vf1112, 40(%vi362)
	set_label	%vi363, min_caml_cs_temp
	lf	%vf1113, 60(%vi363)
	fmul	%vf1114, %vf1112, %vf1113
	fsub	%vf1115, %vf1111, %vf1114
	sf	%vf1115, 4(%vi358)
	set_label	%vi364, min_caml_cs_temp
	set_label	%vi365, min_caml_cs_temp
	lf	%vf1116, 40(%vi365)
	set_label	%vi366, min_caml_cs_temp
	lf	%vf1117, 52(%vi366)
	fmul	%vf1118, %vf1116, %vf1117
	set_label	%vi367, min_caml_cs_temp
	lf	%vf1119, 56(%vi367)
	fmul	%vf1120, %vf1118, %vf1119
	set_label	%vi368, min_caml_cs_temp
	lf	%vf1121, 44(%vi368)
	set_label	%vi369, min_caml_cs_temp
	lf	%vf1122, 60(%vi369)
	fmul	%vf1123, %vf1121, %vf1122
	fadd	%vf1124, %vf1120, %vf1123
	sf	%vf1124, 8(%vi364)
	set_label	%vi370, min_caml_cs_temp
	set_label	%vi371, min_caml_cs_temp
	lf	%vf1125, 48(%vi371)
	set_label	%vi372, min_caml_cs_temp
	lf	%vf1126, 60(%vi372)
	fmul	%vf1127, %vf1125, %vf1126
	sf	%vf1127, 12(%vi370)
	set_label	%vi373, min_caml_cs_temp
	set_label	%vi374, min_caml_cs_temp
	lf	%vf1128, 44(%vi374)
	set_label	%vi375, min_caml_cs_temp
	lf	%vf1129, 52(%vi375)
	fmul	%vf1130, %vf1128, %vf1129
	set_label	%vi376, min_caml_cs_temp
	lf	%vf1131, 60(%vi376)
	fmul	%vf1132, %vf1130, %vf1131
	set_label	%vi377, min_caml_cs_temp
	lf	%vf1133, 40(%vi377)
	set_label	%vi378, min_caml_cs_temp
	lf	%vf1134, 56(%vi378)
	fmul	%vf1135, %vf1133, %vf1134
	fadd	%vf1136, %vf1132, %vf1135
	sf	%vf1136, 16(%vi373)
	set_label	%vi379, min_caml_cs_temp
	set_label	%vi380, min_caml_cs_temp
	lf	%vf1137, 40(%vi380)
	set_label	%vi381, min_caml_cs_temp
	lf	%vf1138, 52(%vi381)
	fmul	%vf1139, %vf1137, %vf1138
	set_label	%vi382, min_caml_cs_temp
	lf	%vf1140, 60(%vi382)
	fmul	%vf1141, %vf1139, %vf1140
	set_label	%vi383, min_caml_cs_temp
	lf	%vf1142, 44(%vi383)
	set_label	%vi384, min_caml_cs_temp
	lf	%vf1143, 56(%vi384)
	fmul	%vf1144, %vf1142, %vf1143
	fsub	%vf1145, %vf1141, %vf1144
	sf	%vf1145, 20(%vi379)
	set_label	%vi385, min_caml_cs_temp
	set_label	%vi386, min_caml_cs_temp
	lf	%vf1146, 52(%vi386)
	fneg	%vf1147, %vf1146
	sf	%vf1147, 24(%vi385)
	set_label	%vi387, min_caml_cs_temp
	set_label	%vi388, min_caml_cs_temp
	lf	%vf1148, 44(%vi388)
	set_label	%vi389, min_caml_cs_temp
	lf	%vf1149, 48(%vi389)
	fmul	%vf1150, %vf1148, %vf1149
	sf	%vf1150, 28(%vi387)
	set_label	%vi390, min_caml_cs_temp
	set_label	%vi391, min_caml_cs_temp
	lf	%vf1151, 40(%vi391)
	set_label	%vi392, min_caml_cs_temp
	lf	%vf1152, 48(%vi392)
	fmul	%vf1153, %vf1151, %vf1152
	sf	%vf1153, 32(%vi390)
	mov	%vi393, %i0
	lf	%vf1154, 0(%vi310)
	lf	%vf1155, 4(%vi310)
	lf	%vf1156, 8(%vi310)
	mov	%vi394, %i0
	set_label	%vi395, min_caml_cs_temp
	mov	%vi396, %i0
	lf	%vf1157, 0(%vi395)
	fmov	%vf1158, %vf1157
	fmul	%vf1159, %vf1158, %vf1158
	fmul	%vf1160, %vf1154, %vf1159
	set_label	%vi397, min_caml_cs_temp
	lf	%vf1161, 12(%vi397)
	fmov	%vf1162, %vf1161
	fmul	%vf1163, %vf1162, %vf1162
	fmul	%vf1164, %vf1155, %vf1163
	fadd	%vf1165, %vf1160, %vf1164
	set_label	%vi398, min_caml_cs_temp
	lf	%vf1166, 24(%vi398)
	fmov	%vf1167, %vf1166
	fmul	%vf1168, %vf1167, %vf1167
	fmul	%vf1169, %vf1156, %vf1168
	fadd	%vf1170, %vf1165, %vf1169
	sf	%vf1170, 0(%vi310)
	set_label	%vi399, min_caml_cs_temp
	lf	%vf1171, 4(%vi399)
	fmov	%vf1172, %vf1171
	fmul	%vf1173, %vf1172, %vf1172
	fmul	%vf1174, %vf1154, %vf1173
	set_label	%vi400, min_caml_cs_temp
	lf	%vf1175, 16(%vi400)
	fmov	%vf1176, %vf1175
	fmul	%vf1177, %vf1176, %vf1176
	fmul	%vf1178, %vf1155, %vf1177
	fadd	%vf1179, %vf1174, %vf1178
	set_label	%vi401, min_caml_cs_temp
	lf	%vf1180, 28(%vi401)
	fmov	%vf1181, %vf1180
	fmul	%vf1182, %vf1181, %vf1181
	fmul	%vf1183, %vf1156, %vf1182
	fadd	%vf1184, %vf1179, %vf1183
	sf	%vf1184, 4(%vi310)
	set_label	%vi402, min_caml_cs_temp
	lf	%vf1185, 8(%vi402)
	fmov	%vf1186, %vf1185
	fmul	%vf1187, %vf1186, %vf1186
	fmul	%vf1188, %vf1154, %vf1187
	set_label	%vi403, min_caml_cs_temp
	lf	%vf1189, 20(%vi403)
	fmov	%vf1190, %vf1189
	fmul	%vf1191, %vf1190, %vf1190
	fmul	%vf1192, %vf1155, %vf1191
	fadd	%vf1193, %vf1188, %vf1192
	set_label	%vi404, min_caml_cs_temp
	lf	%vf1194, 32(%vi404)
	fmov	%vf1195, %vf1194
	fmul	%vf1196, %vf1195, %vf1195
	fmul	%vf1197, %vf1156, %vf1196
	fadd	%vf1198, %vf1193, %vf1197
	sf	%vf1198, 8(%vi310)
	mov	%vi405, %i0
	movui	%i31, 262144
	mif	%vf1199, %i31
	set_label	%vi406, min_caml_cs_temp
	lf	%vf1200, 4(%vi406)
	fmul	%vf1201, %vf1154, %vf1200
	set_label	%vi407, min_caml_cs_temp
	lf	%vf1202, 8(%vi407)
	fmul	%vf1203, %vf1201, %vf1202
	set_label	%vi408, min_caml_cs_temp
	lf	%vf1204, 16(%vi408)
	fmul	%vf1205, %vf1155, %vf1204
	set_label	%vi409, min_caml_cs_temp
	lf	%vf1206, 20(%vi409)
	fmul	%vf1207, %vf1205, %vf1206
	fadd	%vf1208, %vf1203, %vf1207
	set_label	%vi410, min_caml_cs_temp
	lf	%vf1209, 28(%vi410)
	fmul	%vf1210, %vf1156, %vf1209
	set_label	%vi411, min_caml_cs_temp
	lf	%vf1211, 32(%vi411)
	fmul	%vf1212, %vf1210, %vf1211
	fadd	%vf1213, %vf1208, %vf1212
	fmul	%vf1214, %vf1199, %vf1213
	sf	%vf1214, 0(%vi327)
	movui	%i31, 262144
	mif	%vf1215, %i31
	set_label	%vi412, min_caml_cs_temp
	mov	%vi413, %i0
	lf	%vf1216, 0(%vi412)
	fmul	%vf1217, %vf1154, %vf1216
	set_label	%vi414, min_caml_cs_temp
	lf	%vf1218, 8(%vi414)
	fmul	%vf1219, %vf1217, %vf1218
	set_label	%vi415, min_caml_cs_temp
	lf	%vf1220, 12(%vi415)
	fmul	%vf1221, %vf1155, %vf1220
	set_label	%vi416, min_caml_cs_temp
	lf	%vf1222, 20(%vi416)
	fmul	%vf1223, %vf1221, %vf1222
	fadd	%vf1224, %vf1219, %vf1223
	set_label	%vi417, min_caml_cs_temp
	lf	%vf1225, 24(%vi417)
	fmul	%vf1226, %vf1156, %vf1225
	set_label	%vi418, min_caml_cs_temp
	lf	%vf1227, 32(%vi418)
	fmul	%vf1228, %vf1226, %vf1227
	fadd	%vf1229, %vf1224, %vf1228
	fmul	%vf1230, %vf1215, %vf1229
	sf	%vf1230, 4(%vi327)
	movui	%i31, 262144
	mif	%vf1231, %i31
	set_label	%vi419, min_caml_cs_temp
	mov	%vi420, %i0
	lf	%vf1232, 0(%vi419)
	fmul	%vf1233, %vf1154, %vf1232
	set_label	%vi421, min_caml_cs_temp
	lf	%vf1234, 4(%vi421)
	fmul	%vf1235, %vf1233, %vf1234
	set_label	%vi422, min_caml_cs_temp
	lf	%vf1236, 12(%vi422)
	fmul	%vf1237, %vf1155, %vf1236
	set_label	%vi423, min_caml_cs_temp
	lf	%vf1238, 16(%vi423)
	fmul	%vf1239, %vf1237, %vf1238
	fadd	%vf1240, %vf1235, %vf1239
	set_label	%vi424, min_caml_cs_temp
	lf	%vf1241, 24(%vi424)
	fmul	%vf1242, %vf1156, %vf1241
	set_label	%vi425, min_caml_cs_temp
	lf	%vf1243, 28(%vi425)
	fmul	%vf1244, %vf1242, %vf1243
	fadd	%vf1245, %vf1240, %vf1244
	fmul	%vf1246, %vf1231, %vf1245
	sf	%vf1246, 8(%vi327)
cont.11412:
	movi	%i4, 1
	ret
then.11387:
	mov	%i4, %i0
	ret
	.end_function
	.func_entry
read_object.3249:
	mov	%vi426, %i4
	movi	%vi427, 61
loop_start.10974:
	jleq	%vi427, %vi426, then.11450
	mov	%vi428, %vi426
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mov	%vi430, %i4
	movi	%vi431, 1
	sub	%vi432, %i0, %vi431
	jeq	%vi430, %vi432, then.11452
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mov	%vi434, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mov	%vi436, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mov	%vi438, %i4
	movi	%vi439, 3
	fmov	%vf1247, %f0
	mov	%i4, %vi439
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%vi441, %i4
	mov	%vi442, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1249, %f1
	sf	%vf1249, 0(%vi441)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1251, %f1
	sf	%vf1251, 4(%vi441)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1253, %f1
	sf	%vf1253, 8(%vi441)
	movi	%vi443, 3
	fmov	%vf1254, %f0
	mov	%i4, %vi443
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%vi445, %i4
	mov	%vi446, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1256, %f1
	sf	%vf1256, 0(%vi445)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1258, %f1
	sf	%vf1258, 4(%vi445)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1260, %f1
	sf	%vf1260, 8(%vi445)
	fmov	%vf1261, %f0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1263, %f1
	fleq	%i31, %f0, %vf1263
	jzero	%i0, %i31, else.11454
	mov	%vi447, %i0
	set_label	%i31, cont.11455
	jmp	%i0, 0(%i31)
else.11454:
	movi	%vi447, 1
cont.11455:
	movi	%vi448, 2
	fmov	%vf1264, %f0
	mov	%i4, %vi448
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 8
	mov	%vi450, %i4
	mov	%vi451, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1266, %f1
	sf	%vf1266, 0(%vi450)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1268, %f1
	sf	%vf1268, 4(%vi450)
	movi	%vi452, 3
	fmov	%vf1269, %f0
	mov	%i4, %vi452
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%vi454, %i4
	mov	%vi455, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1271, %f1
	sf	%vf1271, 0(%vi454)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1273, %f1
	sf	%vf1273, 4(%vi454)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1275, %f1
	sf	%vf1275, 8(%vi454)
	movi	%vi456, 3
	fmov	%vf1276, %f0
	mov	%i4, %vi456
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%vi458, %i4
	mov	%vi459, %i0
	jeq	%vi438, %i0, cont.11456
	mov	%vi460, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1278, %f1
	fmov	%f1, %vf1278
	call_dir	rad.2667
	fmov	%vf1280, %f1
	sf	%vf1280, 0(%vi458)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1282, %f1
	fmov	%f1, %vf1282
	call_dir	rad.2667
	fmov	%vf1284, %f1
	sf	%vf1284, 4(%vi458)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1286, %f1
	fmov	%f1, %vf1286
	call_dir	rad.2667
	fmov	%vf1288, %f1
	sf	%vf1288, 8(%vi458)
cont.11456:
	movi	%i31, 2
	jeq	%vi434, %i31, then.11457
	mov	%vi461, %vi447
	set_label	%i31, cont.11458
	jmp	%i0, 0(%i31)
then.11457:
	movi	%vi461, 1
cont.11458:
	mov	%vi462, %i2
	addi	%i2, %i2, 40
	sw	%vi458, 36(%vi462)
	sw	%vi454, 32(%vi462)
	sw	%vi450, 28(%vi462)
	sw	%vi461, 24(%vi462)
	sw	%vi445, 20(%vi462)
	sw	%vi441, 16(%vi462)
	sw	%vi438, 12(%vi462)
	sw	%vi436, 8(%vi462)
	sw	%vi434, 4(%vi462)
	sw	%vi430, 0(%vi462)
	mov	%vi463, %vi462
	set_label	%vi464, min_caml_objects
	slli	%vi465, %vi428, 2
	add	%i31, %vi464, %vi465
	sw	%vi463, 0(%i31)
	movi	%i31, 3
	jeq	%vi434, %i31, then.11459
	ceqi	%i31, %vi434, 2
	jzero	%i0, %i31, cont.11461
	mov	%vi468, %i0
	jeq	%vi447, %i0, then.11462
	mov	%vi469, %i0
	set_label	%i31, cont.11463
	jmp	%i0, 0(%i31)
then.11462:
	movi	%vi469, 1
cont.11463:
	mov	%i4, %vi441
	mov	%i5, %vi469
	call_dir	normalize_vector.2633
cont.11461:
	set_label	%i31, cont.11460
	jmp	%i0, 0(%i31)
then.11459:
	mov	%vi466, %i0
	lf	%vf1289, 0(%vi441)
	mov	%vi467, %i0
	fmov	%vf1290, %f0
	feq	%i31, %f0, %vf1289
	jzero	%i0, %i31, else.11464
	fmov	%vf1296, %f0
	set_label	%i31, cont.11465
	jmp	%i0, 0(%i31)
else.11464:
	fmov	%f1, %vf1289
	call_dir	sgn.2664
	fmov	%vf1292, %f1
	fmov	%f1, %vf1289
	call_dir	fsqr.2386
	fmov	%vf1294, %f1
	finv	%vf1295, %vf1294
	fmul	%vf1296, %vf1292, %vf1295
cont.11465:
	sf	%vf1296, 0(%vi441)
	lf	%vf1297, 4(%vi441)
	fmov	%vf1298, %f0
	feq	%i31, %f0, %vf1297
	jzero	%i0, %i31, else.11466
	fmov	%vf1304, %f0
	set_label	%i31, cont.11467
	jmp	%i0, 0(%i31)
else.11466:
	fmov	%f1, %vf1297
	call_dir	sgn.2664
	fmov	%vf1300, %f1
	fmov	%f1, %vf1297
	call_dir	fsqr.2386
	fmov	%vf1302, %f1
	finv	%vf1303, %vf1302
	fmul	%vf1304, %vf1300, %vf1303
cont.11467:
	sf	%vf1304, 4(%vi441)
	lf	%vf1305, 8(%vi441)
	fmov	%vf1306, %f0
	feq	%i31, %f0, %vf1305
	jzero	%i0, %i31, else.11468
	fmov	%vf1312, %f0
	set_label	%i31, cont.11469
	jmp	%i0, 0(%i31)
else.11468:
	fmov	%f1, %vf1305
	call_dir	sgn.2664
	fmov	%vf1308, %f1
	fmov	%f1, %vf1305
	call_dir	fsqr.2386
	fmov	%vf1310, %f1
	finv	%vf1311, %vf1310
	fmul	%vf1312, %vf1308, %vf1311
cont.11469:
	sf	%vf1312, 8(%vi441)
cont.11460:
	mov	%vi470, %i0
	jeq	%vi438, %i0, cont.11470
	set_label	%vi471, min_caml_cs_temp
	mov	%vi472, %i0
	lf	%vf1313, 0(%vi458)
	fmov	%f1, %vf1313
	call_dir	cos.2202
	fmov	%vf1315, %f1
	sf	%vf1315, 40(%vi471)
	set_label	%vi473, min_caml_cs_temp
	mov	%vi474, %i0
	lf	%vf1316, 0(%vi458)
	fmov	%f1, %vf1316
	call_dir	sin.2133
	fmov	%vf1318, %f1
	sf	%vf1318, 44(%vi473)
	set_label	%vi475, min_caml_cs_temp
	lf	%vf1319, 4(%vi458)
	fmov	%f1, %vf1319
	call_dir	cos.2202
	fmov	%vf1321, %f1
	sf	%vf1321, 48(%vi475)
	set_label	%vi476, min_caml_cs_temp
	lf	%vf1322, 4(%vi458)
	fmov	%f1, %vf1322
	call_dir	sin.2133
	fmov	%vf1324, %f1
	sf	%vf1324, 52(%vi476)
	set_label	%vi477, min_caml_cs_temp
	lf	%vf1325, 8(%vi458)
	fmov	%f1, %vf1325
	call_dir	cos.2202
	fmov	%vf1327, %f1
	sf	%vf1327, 56(%vi477)
	set_label	%vi478, min_caml_cs_temp
	lf	%vf1328, 8(%vi458)
	fmov	%f1, %vf1328
	call_dir	sin.2133
	fmov	%vf1330, %f1
	sf	%vf1330, 60(%vi478)
	set_label	%vi479, min_caml_cs_temp
	mov	%vi480, %i0
	set_label	%vi481, min_caml_cs_temp
	lf	%vf1331, 48(%vi481)
	set_label	%vi482, min_caml_cs_temp
	lf	%vf1332, 56(%vi482)
	fmul	%vf1333, %vf1331, %vf1332
	sf	%vf1333, 0(%vi479)
	set_label	%vi483, min_caml_cs_temp
	set_label	%vi484, min_caml_cs_temp
	lf	%vf1334, 44(%vi484)
	set_label	%vi485, min_caml_cs_temp
	lf	%vf1335, 52(%vi485)
	fmul	%vf1336, %vf1334, %vf1335
	set_label	%vi486, min_caml_cs_temp
	lf	%vf1337, 56(%vi486)
	fmul	%vf1338, %vf1336, %vf1337
	set_label	%vi487, min_caml_cs_temp
	lf	%vf1339, 40(%vi487)
	set_label	%vi488, min_caml_cs_temp
	lf	%vf1340, 60(%vi488)
	fmul	%vf1341, %vf1339, %vf1340
	fsub	%vf1342, %vf1338, %vf1341
	sf	%vf1342, 4(%vi483)
	set_label	%vi489, min_caml_cs_temp
	set_label	%vi490, min_caml_cs_temp
	lf	%vf1343, 40(%vi490)
	set_label	%vi491, min_caml_cs_temp
	lf	%vf1344, 52(%vi491)
	fmul	%vf1345, %vf1343, %vf1344
	set_label	%vi492, min_caml_cs_temp
	lf	%vf1346, 56(%vi492)
	fmul	%vf1347, %vf1345, %vf1346
	set_label	%vi493, min_caml_cs_temp
	lf	%vf1348, 44(%vi493)
	set_label	%vi494, min_caml_cs_temp
	lf	%vf1349, 60(%vi494)
	fmul	%vf1350, %vf1348, %vf1349
	fadd	%vf1351, %vf1347, %vf1350
	sf	%vf1351, 8(%vi489)
	set_label	%vi495, min_caml_cs_temp
	set_label	%vi496, min_caml_cs_temp
	lf	%vf1352, 48(%vi496)
	set_label	%vi497, min_caml_cs_temp
	lf	%vf1353, 60(%vi497)
	fmul	%vf1354, %vf1352, %vf1353
	sf	%vf1354, 12(%vi495)
	set_label	%vi498, min_caml_cs_temp
	set_label	%vi499, min_caml_cs_temp
	lf	%vf1355, 44(%vi499)
	set_label	%vi500, min_caml_cs_temp
	lf	%vf1356, 52(%vi500)
	fmul	%vf1357, %vf1355, %vf1356
	set_label	%vi501, min_caml_cs_temp
	lf	%vf1358, 60(%vi501)
	fmul	%vf1359, %vf1357, %vf1358
	set_label	%vi502, min_caml_cs_temp
	lf	%vf1360, 40(%vi502)
	set_label	%vi503, min_caml_cs_temp
	lf	%vf1361, 56(%vi503)
	fmul	%vf1362, %vf1360, %vf1361
	fadd	%vf1363, %vf1359, %vf1362
	sf	%vf1363, 16(%vi498)
	set_label	%vi504, min_caml_cs_temp
	set_label	%vi505, min_caml_cs_temp
	lf	%vf1364, 40(%vi505)
	set_label	%vi506, min_caml_cs_temp
	lf	%vf1365, 52(%vi506)
	fmul	%vf1366, %vf1364, %vf1365
	set_label	%vi507, min_caml_cs_temp
	lf	%vf1367, 60(%vi507)
	fmul	%vf1368, %vf1366, %vf1367
	set_label	%vi508, min_caml_cs_temp
	lf	%vf1369, 44(%vi508)
	set_label	%vi509, min_caml_cs_temp
	lf	%vf1370, 56(%vi509)
	fmul	%vf1371, %vf1369, %vf1370
	fsub	%vf1372, %vf1368, %vf1371
	sf	%vf1372, 20(%vi504)
	set_label	%vi510, min_caml_cs_temp
	set_label	%vi511, min_caml_cs_temp
	lf	%vf1373, 52(%vi511)
	fneg	%vf1374, %vf1373
	sf	%vf1374, 24(%vi510)
	set_label	%vi512, min_caml_cs_temp
	set_label	%vi513, min_caml_cs_temp
	lf	%vf1375, 44(%vi513)
	set_label	%vi514, min_caml_cs_temp
	lf	%vf1376, 48(%vi514)
	fmul	%vf1377, %vf1375, %vf1376
	sf	%vf1377, 28(%vi512)
	set_label	%vi515, min_caml_cs_temp
	set_label	%vi516, min_caml_cs_temp
	lf	%vf1378, 40(%vi516)
	set_label	%vi517, min_caml_cs_temp
	lf	%vf1379, 48(%vi517)
	fmul	%vf1380, %vf1378, %vf1379
	sf	%vf1380, 32(%vi515)
	mov	%vi518, %i0
	lf	%vf1381, 0(%vi441)
	lf	%vf1382, 4(%vi441)
	lf	%vf1383, 8(%vi441)
	mov	%vi519, %i0
	set_label	%vi520, min_caml_cs_temp
	mov	%vi521, %i0
	lf	%vf1384, 0(%vi520)
	fmov	%f1, %vf1384
	call_dir	fsqr.2386
	fmov	%vf1386, %f1
	fmul	%vf1387, %vf1381, %vf1386
	set_label	%vi522, min_caml_cs_temp
	lf	%vf1388, 12(%vi522)
	fmov	%f1, %vf1388
	call_dir	fsqr.2386
	fmov	%vf1390, %f1
	fmul	%vf1391, %vf1382, %vf1390
	fadd	%vf1392, %vf1387, %vf1391
	set_label	%vi523, min_caml_cs_temp
	lf	%vf1393, 24(%vi523)
	fmov	%f1, %vf1393
	call_dir	fsqr.2386
	fmov	%vf1395, %f1
	fmul	%vf1396, %vf1383, %vf1395
	fadd	%vf1397, %vf1392, %vf1396
	sf	%vf1397, 0(%vi441)
	set_label	%vi524, min_caml_cs_temp
	lf	%vf1398, 4(%vi524)
	fmov	%f1, %vf1398
	call_dir	fsqr.2386
	fmov	%vf1400, %f1
	fmul	%vf1401, %vf1381, %vf1400
	set_label	%vi525, min_caml_cs_temp
	lf	%vf1402, 16(%vi525)
	fmov	%f1, %vf1402
	call_dir	fsqr.2386
	fmov	%vf1404, %f1
	fmul	%vf1405, %vf1382, %vf1404
	fadd	%vf1406, %vf1401, %vf1405
	set_label	%vi526, min_caml_cs_temp
	lf	%vf1407, 28(%vi526)
	fmov	%f1, %vf1407
	call_dir	fsqr.2386
	fmov	%vf1409, %f1
	fmul	%vf1410, %vf1383, %vf1409
	fadd	%vf1411, %vf1406, %vf1410
	sf	%vf1411, 4(%vi441)
	set_label	%vi527, min_caml_cs_temp
	lf	%vf1412, 8(%vi527)
	fmov	%f1, %vf1412
	call_dir	fsqr.2386
	fmov	%vf1414, %f1
	fmul	%vf1415, %vf1381, %vf1414
	set_label	%vi528, min_caml_cs_temp
	lf	%vf1416, 20(%vi528)
	fmov	%f1, %vf1416
	call_dir	fsqr.2386
	fmov	%vf1418, %f1
	fmul	%vf1419, %vf1382, %vf1418
	fadd	%vf1420, %vf1415, %vf1419
	set_label	%vi529, min_caml_cs_temp
	lf	%vf1421, 32(%vi529)
	fmov	%f1, %vf1421
	call_dir	fsqr.2386
	fmov	%vf1423, %f1
	fmul	%vf1424, %vf1383, %vf1423
	fadd	%vf1425, %vf1420, %vf1424
	sf	%vf1425, 8(%vi441)
	mov	%vi530, %i0
	movui	%i31, 262144
	mif	%vf1426, %i31
	set_label	%vi531, min_caml_cs_temp
	lf	%vf1427, 4(%vi531)
	fmul	%vf1428, %vf1381, %vf1427
	set_label	%vi532, min_caml_cs_temp
	lf	%vf1429, 8(%vi532)
	fmul	%vf1430, %vf1428, %vf1429
	set_label	%vi533, min_caml_cs_temp
	lf	%vf1431, 16(%vi533)
	fmul	%vf1432, %vf1382, %vf1431
	set_label	%vi534, min_caml_cs_temp
	lf	%vf1433, 20(%vi534)
	fmul	%vf1434, %vf1432, %vf1433
	fadd	%vf1435, %vf1430, %vf1434
	set_label	%vi535, min_caml_cs_temp
	lf	%vf1436, 28(%vi535)
	fmul	%vf1437, %vf1383, %vf1436
	set_label	%vi536, min_caml_cs_temp
	lf	%vf1438, 32(%vi536)
	fmul	%vf1439, %vf1437, %vf1438
	fadd	%vf1440, %vf1435, %vf1439
	fmul	%vf1441, %vf1426, %vf1440
	sf	%vf1441, 0(%vi458)
	movui	%i31, 262144
	mif	%vf1442, %i31
	set_label	%vi537, min_caml_cs_temp
	mov	%vi538, %i0
	lf	%vf1443, 0(%vi537)
	fmul	%vf1444, %vf1381, %vf1443
	set_label	%vi539, min_caml_cs_temp
	lf	%vf1445, 8(%vi539)
	fmul	%vf1446, %vf1444, %vf1445
	set_label	%vi540, min_caml_cs_temp
	lf	%vf1447, 12(%vi540)
	fmul	%vf1448, %vf1382, %vf1447
	set_label	%vi541, min_caml_cs_temp
	lf	%vf1449, 20(%vi541)
	fmul	%vf1450, %vf1448, %vf1449
	fadd	%vf1451, %vf1446, %vf1450
	set_label	%vi542, min_caml_cs_temp
	lf	%vf1452, 24(%vi542)
	fmul	%vf1453, %vf1383, %vf1452
	set_label	%vi543, min_caml_cs_temp
	lf	%vf1454, 32(%vi543)
	fmul	%vf1455, %vf1453, %vf1454
	fadd	%vf1456, %vf1451, %vf1455
	fmul	%vf1457, %vf1442, %vf1456
	sf	%vf1457, 4(%vi458)
	movui	%i31, 262144
	mif	%vf1458, %i31
	set_label	%vi544, min_caml_cs_temp
	mov	%vi545, %i0
	lf	%vf1459, 0(%vi544)
	fmul	%vf1460, %vf1381, %vf1459
	set_label	%vi546, min_caml_cs_temp
	lf	%vf1461, 4(%vi546)
	fmul	%vf1462, %vf1460, %vf1461
	set_label	%vi547, min_caml_cs_temp
	lf	%vf1463, 12(%vi547)
	fmul	%vf1464, %vf1382, %vf1463
	set_label	%vi548, min_caml_cs_temp
	lf	%vf1465, 16(%vi548)
	fmul	%vf1466, %vf1464, %vf1465
	fadd	%vf1467, %vf1462, %vf1466
	set_label	%vi549, min_caml_cs_temp
	lf	%vf1468, 24(%vi549)
	fmul	%vf1469, %vf1383, %vf1468
	set_label	%vi550, min_caml_cs_temp
	lf	%vf1470, 28(%vi550)
	fmul	%vf1471, %vf1469, %vf1470
	fadd	%vf1472, %vf1467, %vf1471
	fmul	%vf1473, %vf1458, %vf1472
	sf	%vf1473, 8(%vi458)
cont.11470:
	movi	%vi551, 1
	set_label	%i31, cont.11453
	jmp	%i0, 0(%i31)
then.11452:
	mov	%vi551, %i0
cont.11453:
	mov	%vi552, %i0
	jeq	%vi551, %i0, then.11471
	addi	%vi553, %vi426, 1
	mov	%vi554, %vi553
	mov	%vi426, %vi554
	set_label	%i31, cont.11472
	jmp	%i0, 0(%i31)
then.11471:
	mov	%i31, %i0
	set_label	%i30, loop_end.10975
	jmp	%i0, 0(%i30)
cont.11472:
	set_label	%i31, cont.11451
	jmp	%i0, 0(%i31)
then.11450:
	mov	%i31, %i0
	set_label	%i30, loop_end.10975
	jmp	%i0, 0(%i30)
cont.11451:
	set_label	%i30, loop_start.10974
	jmp	%i0, 0(%i30)
loop_end.10975:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
read_all_object.3256:
	mov	%vi555, %i0
	mov	%vi556, %i0
	movi	%vi557, 61
loop_start.10992:
	jleq	%vi557, %vi556, then.11474
	mov	%i4, %vi556
	call_dir	read_nth_object.2800
	mov	%vi559, %i4
	mov	%vi560, %i0
	jeq	%vi559, %i0, then.11476
	addi	%vi561, %vi556, 1
	mov	%vi562, %vi561
	mov	%vi556, %vi562
	set_label	%i31, cont.11477
	jmp	%i0, 0(%i31)
then.11476:
	mov	%i31, %i0
	set_label	%i30, loop_end.10993
	jmp	%i0, 0(%i30)
cont.11477:
	set_label	%i31, cont.11475
	jmp	%i0, 0(%i31)
then.11474:
	mov	%i31, %i0
	set_label	%i30, loop_end.10993
	jmp	%i0, 0(%i30)
cont.11475:
	set_label	%i30, loop_start.10992
	jmp	%i0, 0(%i30)
loop_end.10993:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
read_net_item.3259:
	mov	%vi563, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mov	%vi565, %i4
	movi	%vi566, 1
	sub	%vi567, %i0, %vi566
	jeq	%vi565, %vi567, then.11478
	addi	%vi572, %vi563, 1
	mov	%i4, %vi572
	call_dir	read_net_item.3259
	mov	%vi574, %i4
	slli	%vi575, %vi563, 2
	add	%i31, %vi574, %vi575
	sw	%vi565, 0(%i31)
	mov	%i4, %vi574
	ret
then.11478:
	addi	%vi568, %vi563, 1
	movi	%vi569, 1
	sub	%vi570, %i0, %vi569
	mov	%i4, %vi568
	mov	%i5, %vi570
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.11479:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.11480
	set_label	%i31, ca_done.11481
	jmp	%i0, 0(%i31)
ca_cont.11480:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.11479
	jmp	%i0, 0(%i31)
ca_done.11481:
	ret
	.end_function
	.func_entry
read_or_network.3273:
	mov	%vi576, %i4
	mov	%vi577, %i0
	mov	%i4, %i0
	call_dir	read_net_item.3259
	mov	%vi579, %i4
	mov	%vi580, %i0
	lw	%vi581, 0(%vi579)
	movi	%vi582, 1
	sub	%vi583, %i0, %vi582
	jeq	%vi581, %vi583, then.11482
	addi	%vi586, %vi576, 1
	mov	%i4, %vi586
	call_dir	read_or_network.3273
	mov	%vi588, %i4
	slli	%vi589, %vi576, 2
	add	%i31, %vi588, %vi589
	sw	%vi579, 0(%i31)
	mov	%i4, %vi588
	ret
then.11482:
	addi	%vi584, %vi576, 1
	mov	%i4, %vi584
	mov	%i5, %vi579
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.11483:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.11484
	set_label	%i31, ca_done.11485
	jmp	%i0, 0(%i31)
ca_cont.11484:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.11483
	jmp	%i0, 0(%i31)
ca_done.11485:
	ret
	.end_function
	.func_entry
read_and_network.3287:
	mov	%vi590, %i4
	mov	%vi591, %i0
	mov	%vi592, %i0
	movi	%vi593, 1
	sub	%vi594, %i0, %vi593
loop_start.10997:
	mov	%i4, %i0
	call_dir	read_net_item.3259
	mov	%vi596, %i4
	lw	%vi597, 0(%vi596)
	jeq	%vi597, %vi594, then.11487
	set_label	%vi598, min_caml_and_net
	slli	%vi599, %vi590, 2
	add	%i31, %vi598, %vi599
	sw	%vi596, 0(%i31)
	addi	%vi600, %vi590, 1
	mov	%vi601, %vi600
	mov	%vi590, %vi601
	set_label	%i31, cont.11488
	jmp	%i0, 0(%i31)
then.11487:
	mov	%i31, %i0
	set_label	%i30, loop_end.10998
	jmp	%i0, 0(%i30)
cont.11488:
	set_label	%i30, loop_start.10997
	jmp	%i0, 0(%i30)
loop_end.10998:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
read_parameter.3299:
	set_label	%vi602, min_caml_screen
	mov	%vi603, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1475, %f1
	sf	%vf1475, 0(%vi602)
	set_label	%vi604, min_caml_screen
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1477, %f1
	sf	%vf1477, 4(%vi604)
	set_label	%vi605, min_caml_screen
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1479, %f1
	sf	%vf1479, 8(%vi605)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1481, %f1
	fmov	%f1, %vf1481
	call_dir	rad.2667
	fmov	%vf1483, %f1
	set_label	%vi606, min_caml_cos_v
	mov	%vi607, %i0
	fmov	%f1, %vf1483
	call_dir	cos.2202
	fmov	%vf1485, %f1
	sf	%vf1485, 0(%vi606)
	set_label	%vi608, min_caml_sin_v
	mov	%vi609, %i0
	fmov	%f1, %vf1483
	call_dir	sin.2133
	fmov	%vf1487, %f1
	sf	%vf1487, 0(%vi608)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1489, %f1
	fmov	%f1, %vf1489
	call_dir	rad.2667
	fmov	%vf1491, %f1
	set_label	%vi610, min_caml_cos_v
	fmov	%f1, %vf1491
	call_dir	cos.2202
	fmov	%vf1493, %f1
	sf	%vf1493, 4(%vi610)
	set_label	%vi611, min_caml_sin_v
	fmov	%f1, %vf1491
	call_dir	sin.2133
	fmov	%vf1495, %f1
	sf	%vf1495, 4(%vi611)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1497, %f1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1499, %f1
	fmov	%f1, %vf1499
	call_dir	rad.2667
	fmov	%vf1501, %f1
	fmov	%f1, %vf1501
	call_dir	sin.2133
	fmov	%vf1503, %f1
	set_label	%vi612, min_caml_light
	fneg	%vf1504, %vf1503
	sf	%vf1504, 4(%vi612)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1506, %f1
	fmov	%f1, %vf1506
	call_dir	rad.2667
	fmov	%vf1508, %f1
	fmov	%f1, %vf1501
	call_dir	cos.2202
	fmov	%vf1510, %f1
	fmov	%f1, %vf1508
	call_dir	sin.2133
	fmov	%vf1512, %f1
	set_label	%vi613, min_caml_light
	mov	%vi614, %i0
	fmul	%vf1513, %vf1510, %vf1512
	sf	%vf1513, 0(%vi613)
	fmov	%f1, %vf1508
	call_dir	cos.2202
	fmov	%vf1515, %f1
	set_label	%vi615, min_caml_light
	fmul	%vf1516, %vf1510, %vf1515
	sf	%vf1516, 8(%vi615)
	set_label	%vi616, min_caml_beam
	mov	%vi617, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	slli	%i4, %i4, 8
	lb	%i31, 0(%i5)
	or	%i4, %i31, %i4
	mif	%f1, %i4
	fmov	%vf1518, %f1
	sf	%vf1518, 0(%vi616)
	set_label	%vi618, min_caml_vp
	mov	%vi619, %i0
	set_label	%vi620, min_caml_cos_v
	mov	%vi621, %i0
	lf	%vf1519, 0(%vi620)
	set_label	%vi622, min_caml_sin_v
	lf	%vf1520, 4(%vi622)
	fmul	%vf1521, %vf1519, %vf1520
	movui	%i31, 799872
	mif	%vf1522, %i31
	fmul	%vf1523, %vf1521, %vf1522
	sf	%vf1523, 0(%vi618)
	set_label	%vi623, min_caml_vp
	set_label	%vi624, min_caml_sin_v
	mov	%vi625, %i0
	lf	%vf1524, 0(%vi624)
	fneg	%vf1525, %vf1524
	movui	%i31, 799872
	mif	%vf1526, %i31
	fmul	%vf1527, %vf1525, %vf1526
	sf	%vf1527, 4(%vi623)
	set_label	%vi626, min_caml_vp
	set_label	%vi627, min_caml_cos_v
	mov	%vi628, %i0
	lf	%vf1528, 0(%vi627)
	set_label	%vi629, min_caml_cos_v
	lf	%vf1529, 4(%vi629)
	fmul	%vf1530, %vf1528, %vf1529
	movui	%i31, 799872
	mif	%vf1531, %i31
	fmul	%vf1532, %vf1530, %vf1531
	sf	%vf1532, 8(%vi626)
	set_label	%vi630, min_caml_view
	mov	%vi631, %i0
	set_label	%vi632, min_caml_vp
	mov	%vi633, %i0
	lf	%vf1533, 0(%vi632)
	set_label	%vi634, min_caml_screen
	mov	%vi635, %i0
	lf	%vf1534, 0(%vi634)
	fadd	%vf1535, %vf1533, %vf1534
	sf	%vf1535, 0(%vi630)
	set_label	%vi636, min_caml_view
	set_label	%vi637, min_caml_vp
	lf	%vf1536, 4(%vi637)
	set_label	%vi638, min_caml_screen
	lf	%vf1537, 4(%vi638)
	fadd	%vf1538, %vf1536, %vf1537
	sf	%vf1538, 4(%vi636)
	set_label	%vi639, min_caml_view
	set_label	%vi640, min_caml_vp
	lf	%vf1539, 8(%vi640)
	set_label	%vi641, min_caml_screen
	lf	%vf1540, 8(%vi641)
	fadd	%vf1541, %vf1539, %vf1540
	sf	%vf1541, 8(%vi639)
	mov	%vi642, %i0
	mov	%i4, %i0
	call_dir	read_object.3249
	mov	%vi643, %i0
	mov	%vi644, %i0
	mov	%vi645, %i0
	mov	%vi646, %i0
	movi	%vi647, 1
	sub	%vi648, %i0, %vi647
loop_start.11001:
	mov	%i4, %i0
	call_dir	read_net_item.3259
	mov	%vi650, %i4
	lw	%vi651, 0(%vi650)
	jeq	%vi651, %vi648, then.11490
	set_label	%vi652, min_caml_and_net
	slli	%vi653, %vi644, 2
	add	%i31, %vi652, %vi653
	sw	%vi650, 0(%i31)
	addi	%vi654, %vi644, 1
	mov	%vi655, %vi654
	mov	%vi644, %vi655
	set_label	%i31, cont.11491
	jmp	%i0, 0(%i31)
then.11490:
	mov	%i31, %i0
	set_label	%i30, loop_end.11002
	jmp	%i0, 0(%i30)
cont.11491:
	set_label	%i30, loop_start.11001
	jmp	%i0, 0(%i30)
loop_end.11002:
	mov	%i0, %i31
	set_label	%vi656, min_caml_or_net
	mov	%vi657, %i0
	mov	%vi658, %i0
	mov	%i4, %i0
	call_dir	read_or_network.3273
	mov	%vi660, %i4
	sw	%vi660, 0(%vi656)
	ret
	.end_function
	.func_entry
solver_rect.3311:
	mov	%vi661, %i4
	mov	%vi662, %i5
	mov	%vi663, %i6
	mov	%vi664, %i7
	mov	%vi665, %i8
	mov	%vi666, %i9
	mov	%vi667, %i10
	mov	%vi668, %i11
	mov	%vi669, %i12
	mov	%vi670, %i13
	mov	%vi671, %i14
	mov	%vi672, %i0
	lf	%vf1542, 0(%vi671)
	lf	%vf1543, 4(%vi671)
	lf	%vf1544, 8(%vi671)
	fmov	%vf1545, %f0
	mov	%vi673, %i0
	fmov	%vf1546, %vf1542
	feq	%i31, %f0, %vf1546
	jzero	%i0, %i31, else.11493
	mov	%vi742, %i0
	set_label	%i31, cont.11494
	jmp	%i0, 0(%i31)
else.11493:
	mov	%vi674, %vi661
	mov	%vi675, %vi662
	mov	%vi676, %vi663
	mov	%vi677, %vi664
	mov	%vi678, %vi665
	mov	%vi679, %vi666
	mov	%vi680, %vi667
	mov	%vi681, %vi668
	mov	%vi682, %vi669
	mov	%vi683, %vi670
	mov	%vi684, %vi680
	fmov	%vf1547, %f0
	mov	%vi685, %i0
	fmov	%vf1548, %vf1542
	fleq	%i31, %f0, %vf1548
	jzero	%i0, %i31, else.11495
	mov	%vi686, %i0
	set_label	%i31, cont.11496
	jmp	%i0, 0(%i31)
else.11495:
	movi	%vi686, 1
cont.11496:
	mov	%vi687, %vi684
	mov	%vi688, %vi686
	mov	%vi689, %i0
	jeq	%vi687, %i0, then.11497
	mov	%vi690, %i0
	jeq	%vi688, %i0, then.11499
	mov	%vi691, %i0
	set_label	%i31, cont.11500
	jmp	%i0, 0(%i31)
then.11499:
	movi	%vi691, 1
cont.11500:
	set_label	%i31, cont.11498
	jmp	%i0, 0(%i31)
then.11497:
	mov	%vi691, %vi688
cont.11498:
	mov	%vi692, %i0
	jeq	%vi691, %i0, then.11501
	mov	%vi704, %vi661
	mov	%vi705, %vi662
	mov	%vi706, %vi663
	mov	%vi707, %vi664
	mov	%vi708, %vi665
	mov	%vi709, %vi666
	mov	%vi710, %vi667
	mov	%vi711, %vi668
	mov	%vi712, %vi669
	mov	%vi713, %vi670
	mov	%vi714, %i0
	lf	%vf1550, 0(%vi708)
	set_label	%i31, cont.11502
	jmp	%i0, 0(%i31)
then.11501:
	mov	%vi693, %vi661
	mov	%vi694, %vi662
	mov	%vi695, %vi663
	mov	%vi696, %vi664
	mov	%vi697, %vi665
	mov	%vi698, %vi666
	mov	%vi699, %vi667
	mov	%vi700, %vi668
	mov	%vi701, %vi669
	mov	%vi702, %vi670
	mov	%vi703, %i0
	lf	%vf1549, 0(%vi697)
	fneg	%vf1550, %vf1549
cont.11502:
	set_label	%vi715, min_caml_solver_w_vec
	mov	%vi716, %i0
	lf	%vf1551, 0(%vi715)
	fsub	%vf1552, %vf1550, %vf1551
	mov	%vi717, %i0
	fmov	%vf1553, %vf1542
	finv	%vf1554, %vf1553
	fmul	%vf1555, %vf1552, %vf1554
	mov	%vi718, %vi661
	mov	%vi719, %vi662
	mov	%vi720, %vi663
	mov	%vi721, %vi664
	mov	%vi722, %vi665
	mov	%vi723, %vi666
	mov	%vi724, %vi667
	mov	%vi725, %vi668
	mov	%vi726, %vi669
	mov	%vi727, %vi670
	lf	%vf1556, 4(%vi722)
	fmov	%vf1557, %vf1543
	fmul	%vf1558, %vf1555, %vf1557
	set_label	%vi728, min_caml_solver_w_vec
	lf	%vf1559, 4(%vi728)
	fadd	%vf1560, %vf1558, %vf1559
	fmov	%f1, %vf1560
	call_dir	min_caml_abs_float
	fmov	%vf1562, %f1
	fleq	%i31, %vf1556, %vf1562
	jzero	%i0, %i31, else.11503
	mov	%vi742, %i0
	set_label	%i31, cont.11504
	jmp	%i0, 0(%i31)
else.11503:
	mov	%vi729, %vi661
	mov	%vi730, %vi662
	mov	%vi731, %vi663
	mov	%vi732, %vi664
	mov	%vi733, %vi665
	mov	%vi734, %vi666
	mov	%vi735, %vi667
	mov	%vi736, %vi668
	mov	%vi737, %vi669
	mov	%vi738, %vi670
	lf	%vf1563, 8(%vi733)
	fmov	%vf1564, %vf1544
	fmul	%vf1565, %vf1555, %vf1564
	set_label	%vi739, min_caml_solver_w_vec
	lf	%vf1566, 8(%vi739)
	fadd	%vf1567, %vf1565, %vf1566
	fmov	%f1, %vf1567
	call_dir	min_caml_abs_float
	fmov	%vf1569, %f1
	fleq	%i31, %vf1563, %vf1569
	jzero	%i0, %i31, else.11505
	mov	%vi742, %i0
	set_label	%i31, cont.11506
	jmp	%i0, 0(%i31)
else.11505:
	set_label	%vi740, min_caml_solver_dist
	mov	%vi741, %i0
	sf	%vf1555, 0(%vi740)
	movi	%vi742, 1
cont.11506:
cont.11504:
cont.11494:
	mov	%vi743, %i0
	jeq	%vi742, %i0, then.11507
	movi	%i4, 1
	ret
then.11507:
	fmov	%vf1570, %f0
	fmov	%vf1571, %vf1543
	feq	%i31, %f0, %vf1571
	jzero	%i0, %i31, else.11508
	mov	%vi810, %i0
	set_label	%i31, cont.11509
	jmp	%i0, 0(%i31)
else.11508:
	mov	%vi744, %vi661
	mov	%vi745, %vi662
	mov	%vi746, %vi663
	mov	%vi747, %vi664
	mov	%vi748, %vi665
	mov	%vi749, %vi666
	mov	%vi750, %vi667
	mov	%vi751, %vi668
	mov	%vi752, %vi669
	mov	%vi753, %vi670
	mov	%vi754, %vi750
	fmov	%vf1572, %f0
	fmov	%vf1573, %vf1543
	fleq	%i31, %f0, %vf1573
	jzero	%i0, %i31, else.11510
	mov	%vi755, %i0
	set_label	%i31, cont.11511
	jmp	%i0, 0(%i31)
else.11510:
	movi	%vi755, 1
cont.11511:
	mov	%vi756, %vi754
	mov	%vi757, %vi755
	mov	%vi758, %i0
	jeq	%vi756, %i0, then.11512
	mov	%vi759, %i0
	jeq	%vi757, %i0, then.11514
	mov	%vi760, %i0
	set_label	%i31, cont.11515
	jmp	%i0, 0(%i31)
then.11514:
	movi	%vi760, 1
cont.11515:
	set_label	%i31, cont.11513
	jmp	%i0, 0(%i31)
then.11512:
	mov	%vi760, %vi757
cont.11513:
	mov	%vi761, %i0
	jeq	%vi760, %i0, then.11516
	mov	%vi772, %vi661
	mov	%vi773, %vi662
	mov	%vi774, %vi663
	mov	%vi775, %vi664
	mov	%vi776, %vi665
	mov	%vi777, %vi666
	mov	%vi778, %vi667
	mov	%vi779, %vi668
	mov	%vi780, %vi669
	mov	%vi781, %vi670
	lf	%vf1575, 4(%vi776)
	set_label	%i31, cont.11517
	jmp	%i0, 0(%i31)
then.11516:
	mov	%vi762, %vi661
	mov	%vi763, %vi662
	mov	%vi764, %vi663
	mov	%vi765, %vi664
	mov	%vi766, %vi665
	mov	%vi767, %vi666
	mov	%vi768, %vi667
	mov	%vi769, %vi668
	mov	%vi770, %vi669
	mov	%vi771, %vi670
	lf	%vf1574, 4(%vi766)
	fneg	%vf1575, %vf1574
cont.11517:
	set_label	%vi782, min_caml_solver_w_vec
	lf	%vf1576, 4(%vi782)
	fsub	%vf1577, %vf1575, %vf1576
	fmov	%vf1578, %vf1543
	finv	%vf1579, %vf1578
	fmul	%vf1580, %vf1577, %vf1579
	mov	%vi783, %vi661
	mov	%vi784, %vi662
	mov	%vi785, %vi663
	mov	%vi786, %vi664
	mov	%vi787, %vi665
	mov	%vi788, %vi666
	mov	%vi789, %vi667
	mov	%vi790, %vi668
	mov	%vi791, %vi669
	mov	%vi792, %vi670
	lf	%vf1581, 8(%vi787)
	fmov	%vf1582, %vf1544
	fmul	%vf1583, %vf1580, %vf1582
	set_label	%vi793, min_caml_solver_w_vec
	lf	%vf1584, 8(%vi793)
	fadd	%vf1585, %vf1583, %vf1584
	fmov	%f1, %vf1585
	call_dir	min_caml_abs_float
	fmov	%vf1587, %f1
	fleq	%i31, %vf1581, %vf1587
	jzero	%i0, %i31, else.11518
	mov	%vi810, %i0
	set_label	%i31, cont.11519
	jmp	%i0, 0(%i31)
else.11518:
	mov	%vi794, %vi661
	mov	%vi795, %vi662
	mov	%vi796, %vi663
	mov	%vi797, %vi664
	mov	%vi798, %vi665
	mov	%vi799, %vi666
	mov	%vi800, %vi667
	mov	%vi801, %vi668
	mov	%vi802, %vi669
	mov	%vi803, %vi670
	mov	%vi804, %i0
	lf	%vf1588, 0(%vi798)
	mov	%vi805, %i0
	fmov	%vf1589, %vf1542
	fmul	%vf1590, %vf1580, %vf1589
	set_label	%vi806, min_caml_solver_w_vec
	mov	%vi807, %i0
	lf	%vf1591, 0(%vi806)
	fadd	%vf1592, %vf1590, %vf1591
	fmov	%f1, %vf1592
	call_dir	min_caml_abs_float
	fmov	%vf1594, %f1
	fleq	%i31, %vf1588, %vf1594
	jzero	%i0, %i31, else.11520
	mov	%vi810, %i0
	set_label	%i31, cont.11521
	jmp	%i0, 0(%i31)
else.11520:
	set_label	%vi808, min_caml_solver_dist
	mov	%vi809, %i0
	sf	%vf1580, 0(%vi808)
	movi	%vi810, 1
cont.11521:
cont.11519:
cont.11509:
	mov	%vi811, %i0
	jeq	%vi810, %i0, then.11522
	movi	%i4, 2
	ret
then.11522:
	fmov	%vf1595, %f0
	fmov	%vf1596, %vf1544
	feq	%i31, %f0, %vf1596
	jzero	%i0, %i31, else.11523
	mov	%vi878, %i0
	set_label	%i31, cont.11524
	jmp	%i0, 0(%i31)
else.11523:
	mov	%vi812, %vi661
	mov	%vi813, %vi662
	mov	%vi814, %vi663
	mov	%vi815, %vi664
	mov	%vi816, %vi665
	mov	%vi817, %vi666
	mov	%vi818, %vi667
	mov	%vi819, %vi668
	mov	%vi820, %vi669
	mov	%vi821, %vi670
	mov	%vi822, %vi818
	fmov	%vf1597, %f0
	fmov	%vf1598, %vf1544
	fleq	%i31, %f0, %vf1598
	jzero	%i0, %i31, else.11525
	mov	%vi823, %i0
	set_label	%i31, cont.11526
	jmp	%i0, 0(%i31)
else.11525:
	movi	%vi823, 1
cont.11526:
	mov	%vi824, %vi822
	mov	%vi825, %vi823
	mov	%vi826, %i0
	jeq	%vi824, %i0, then.11527
	mov	%vi827, %i0
	jeq	%vi825, %i0, then.11529
	mov	%vi828, %i0
	set_label	%i31, cont.11530
	jmp	%i0, 0(%i31)
then.11529:
	movi	%vi828, 1
cont.11530:
	set_label	%i31, cont.11528
	jmp	%i0, 0(%i31)
then.11527:
	mov	%vi828, %vi825
cont.11528:
	mov	%vi829, %i0
	jeq	%vi828, %i0, then.11531
	mov	%vi840, %vi661
	mov	%vi841, %vi662
	mov	%vi842, %vi663
	mov	%vi843, %vi664
	mov	%vi844, %vi665
	mov	%vi845, %vi666
	mov	%vi846, %vi667
	mov	%vi847, %vi668
	mov	%vi848, %vi669
	mov	%vi849, %vi670
	lf	%vf1600, 8(%vi844)
	set_label	%i31, cont.11532
	jmp	%i0, 0(%i31)
then.11531:
	mov	%vi830, %vi661
	mov	%vi831, %vi662
	mov	%vi832, %vi663
	mov	%vi833, %vi664
	mov	%vi834, %vi665
	mov	%vi835, %vi666
	mov	%vi836, %vi667
	mov	%vi837, %vi668
	mov	%vi838, %vi669
	mov	%vi839, %vi670
	lf	%vf1599, 8(%vi834)
	fneg	%vf1600, %vf1599
cont.11532:
	set_label	%vi850, min_caml_solver_w_vec
	lf	%vf1601, 8(%vi850)
	fsub	%vf1602, %vf1600, %vf1601
	fmov	%vf1603, %vf1544
	finv	%vf1604, %vf1603
	fmul	%vf1605, %vf1602, %vf1604
	mov	%vi851, %vi661
	mov	%vi852, %vi662
	mov	%vi853, %vi663
	mov	%vi854, %vi664
	mov	%vi855, %vi665
	mov	%vi856, %vi666
	mov	%vi857, %vi667
	mov	%vi858, %vi668
	mov	%vi859, %vi669
	mov	%vi860, %vi670
	mov	%vi861, %i0
	lf	%vf1606, 0(%vi855)
	mov	%vi862, %i0
	fmov	%vf1607, %vf1542
	fmul	%vf1608, %vf1605, %vf1607
	set_label	%vi863, min_caml_solver_w_vec
	mov	%vi864, %i0
	lf	%vf1609, 0(%vi863)
	fadd	%vf1610, %vf1608, %vf1609
	fmov	%f1, %vf1610
	call_dir	min_caml_abs_float
	fmov	%vf1612, %f1
	fleq	%i31, %vf1606, %vf1612
	jzero	%i0, %i31, else.11533
	mov	%vi878, %i0
	set_label	%i31, cont.11534
	jmp	%i0, 0(%i31)
else.11533:
	mov	%vi865, %vi661
	mov	%vi866, %vi662
	mov	%vi867, %vi663
	mov	%vi868, %vi664
	mov	%vi869, %vi665
	mov	%vi870, %vi666
	mov	%vi871, %vi667
	mov	%vi872, %vi668
	mov	%vi873, %vi669
	mov	%vi874, %vi670
	lf	%vf1613, 4(%vi869)
	fmov	%vf1614, %vf1543
	fmul	%vf1615, %vf1605, %vf1614
	set_label	%vi875, min_caml_solver_w_vec
	lf	%vf1616, 4(%vi875)
	fadd	%vf1617, %vf1615, %vf1616
	fmov	%f1, %vf1617
	call_dir	min_caml_abs_float
	fmov	%vf1619, %f1
	fleq	%i31, %vf1613, %vf1619
	jzero	%i0, %i31, else.11535
	mov	%vi878, %i0
	set_label	%i31, cont.11536
	jmp	%i0, 0(%i31)
else.11535:
	set_label	%vi876, min_caml_solver_dist
	mov	%vi877, %i0
	sf	%vf1605, 0(%vi876)
	movi	%vi878, 1
cont.11536:
cont.11534:
cont.11524:
	mov	%vi879, %i0
	jeq	%vi878, %i0, then.11537
	movi	%i4, 3
	ret
then.11537:
	mov	%i4, %i0
	ret
	.end_function
	.func_entry
solver_surface.3440:
	mov	%vi880, %i4
	mov	%vi881, %i5
	mov	%vi882, %i6
	mov	%vi883, %i7
	mov	%vi884, %i8
	mov	%vi885, %i9
	mov	%vi886, %i10
	mov	%vi887, %i11
	mov	%vi888, %i12
	mov	%vi889, %i13
	mov	%vi890, %i14
	mov	%vi891, %i0
	lf	%vf1620, 0(%vi890)
	lf	%vf1621, 4(%vi890)
	lf	%vf1622, 8(%vi890)
	mov	%vi892, %i0
	fmov	%vf1623, %vf1620
	mov	%vi893, %vi880
	mov	%vi894, %vi881
	mov	%vi895, %vi882
	mov	%vi896, %vi883
	mov	%vi897, %vi884
	mov	%vi898, %vi885
	mov	%vi899, %vi886
	mov	%vi900, %vi887
	mov	%vi901, %vi888
	mov	%vi902, %vi889
	mov	%vi903, %i0
	lf	%vf1624, 0(%vi897)
	fmul	%vf1625, %vf1623, %vf1624
	fmov	%vf1626, %vf1621
	mov	%vi904, %vi880
	mov	%vi905, %vi881
	mov	%vi906, %vi882
	mov	%vi907, %vi883
	mov	%vi908, %vi884
	mov	%vi909, %vi885
	mov	%vi910, %vi886
	mov	%vi911, %vi887
	mov	%vi912, %vi888
	mov	%vi913, %vi889
	lf	%vf1627, 4(%vi908)
	fmul	%vf1628, %vf1626, %vf1627
	fadd	%vf1629, %vf1625, %vf1628
	fmov	%vf1630, %vf1622
	mov	%vi914, %vi880
	mov	%vi915, %vi881
	mov	%vi916, %vi882
	mov	%vi917, %vi883
	mov	%vi918, %vi884
	mov	%vi919, %vi885
	mov	%vi920, %vi886
	mov	%vi921, %vi887
	mov	%vi922, %vi888
	mov	%vi923, %vi889
	lf	%vf1631, 8(%vi918)
	fmul	%vf1632, %vf1630, %vf1631
	fadd	%vf1633, %vf1629, %vf1632
	fmov	%vf1634, %f0
	fleq	%i31, %vf1633, %f0
	jzero	%i0, %i31, else.11538
	mov	%i4, %i0
	ret
else.11538:
	set_label	%vi924, min_caml_solver_w_vec
	mov	%vi925, %i0
	lf	%vf1635, 0(%vi924)
	mov	%vi926, %vi880
	mov	%vi927, %vi881
	mov	%vi928, %vi882
	mov	%vi929, %vi883
	mov	%vi930, %vi884
	mov	%vi931, %vi885
	mov	%vi932, %vi886
	mov	%vi933, %vi887
	mov	%vi934, %vi888
	mov	%vi935, %vi889
	mov	%vi936, %i0
	lf	%vf1636, 0(%vi930)
	fmul	%vf1637, %vf1635, %vf1636
	set_label	%vi937, min_caml_solver_w_vec
	lf	%vf1638, 4(%vi937)
	mov	%vi938, %vi880
	mov	%vi939, %vi881
	mov	%vi940, %vi882
	mov	%vi941, %vi883
	mov	%vi942, %vi884
	mov	%vi943, %vi885
	mov	%vi944, %vi886
	mov	%vi945, %vi887
	mov	%vi946, %vi888
	mov	%vi947, %vi889
	lf	%vf1639, 4(%vi942)
	fmul	%vf1640, %vf1638, %vf1639
	fadd	%vf1641, %vf1637, %vf1640
	set_label	%vi948, min_caml_solver_w_vec
	lf	%vf1642, 8(%vi948)
	mov	%vi949, %vi880
	mov	%vi950, %vi881
	mov	%vi951, %vi882
	mov	%vi952, %vi883
	mov	%vi953, %vi884
	mov	%vi954, %vi885
	mov	%vi955, %vi886
	mov	%vi956, %vi887
	mov	%vi957, %vi888
	mov	%vi958, %vi889
	lf	%vf1643, 8(%vi953)
	fmul	%vf1644, %vf1642, %vf1643
	fadd	%vf1645, %vf1641, %vf1644
	finv	%vf1646, %vf1633
	fmul	%vf1647, %vf1645, %vf1646
	set_label	%vi959, min_caml_solver_dist
	mov	%vi960, %i0
	fneg	%vf1648, %vf1647
	sf	%vf1648, 0(%vi959)
	movi	%i4, 1
	ret
	.end_function
	.func_entry
in_prod_sqr_obj.3480:
	mov	%vi961, %i4
	mov	%vi962, %i5
	mov	%vi963, %i6
	mov	%vi964, %i7
	mov	%vi965, %i8
	mov	%vi966, %i9
	mov	%vi967, %i10
	mov	%vi968, %i11
	mov	%vi969, %i12
	mov	%vi970, %i13
	mov	%vi971, %i14
	mov	%vi972, %i0
	lf	%vf1649, 0(%vi971)
	lf	%vf1650, 4(%vi971)
	lf	%vf1651, 8(%vi971)
	mov	%vi973, %i0
	fmov	%vf1652, %vf1649
	fmov	%vf1653, %vf1652
	fmul	%vf1654, %vf1653, %vf1653
	mov	%vi974, %vi961
	mov	%vi975, %vi962
	mov	%vi976, %vi963
	mov	%vi977, %vi964
	mov	%vi978, %vi965
	mov	%vi979, %vi966
	mov	%vi980, %vi967
	mov	%vi981, %vi968
	mov	%vi982, %vi969
	mov	%vi983, %vi970
	mov	%vi984, %i0
	lf	%vf1655, 0(%vi978)
	fmul	%vf1656, %vf1654, %vf1655
	fmov	%vf1657, %vf1650
	fmov	%vf1658, %vf1657
	fmul	%vf1659, %vf1658, %vf1658
	mov	%vi985, %vi961
	mov	%vi986, %vi962
	mov	%vi987, %vi963
	mov	%vi988, %vi964
	mov	%vi989, %vi965
	mov	%vi990, %vi966
	mov	%vi991, %vi967
	mov	%vi992, %vi968
	mov	%vi993, %vi969
	mov	%vi994, %vi970
	lf	%vf1660, 4(%vi989)
	fmul	%vf1661, %vf1659, %vf1660
	fadd	%vf1662, %vf1656, %vf1661
	fmov	%vf1663, %vf1651
	fmov	%vf1664, %vf1663
	fmul	%vf1665, %vf1664, %vf1664
	mov	%vi995, %vi961
	mov	%vi996, %vi962
	mov	%vi997, %vi963
	mov	%vi998, %vi964
	mov	%vi999, %vi965
	mov	%vi1000, %vi966
	mov	%vi1001, %vi967
	mov	%vi1002, %vi968
	mov	%vi1003, %vi969
	mov	%vi1004, %vi970
	lf	%vf1666, 8(%vi999)
	fmul	%vf1667, %vf1665, %vf1666
	fadd	%f1, %vf1662, %vf1667
	ret
	.end_function
	.func_entry
in_prod_co_objrot.3499:
	mov	%vi1005, %i4
	mov	%vi1006, %i5
	mov	%vi1007, %i6
	mov	%vi1008, %i7
	mov	%vi1009, %i8
	mov	%vi1010, %i9
	mov	%vi1011, %i10
	mov	%vi1012, %i11
	mov	%vi1013, %i12
	mov	%vi1014, %i13
	mov	%vi1015, %i14
	mov	%vi1016, %i0
	lf	%vf1668, 0(%vi1015)
	lf	%vf1669, 4(%vi1015)
	lf	%vf1670, 8(%vi1015)
	fmov	%vf1671, %vf1669
	fmov	%vf1672, %vf1670
	fmul	%vf1673, %vf1671, %vf1672
	mov	%vi1017, %vi1005
	mov	%vi1018, %vi1006
	mov	%vi1019, %vi1007
	mov	%vi1020, %vi1008
	mov	%vi1021, %vi1009
	mov	%vi1022, %vi1010
	mov	%vi1023, %vi1011
	mov	%vi1024, %vi1012
	mov	%vi1025, %vi1013
	mov	%vi1026, %vi1014
	mov	%vi1027, %i0
	lf	%vf1674, 0(%vi1026)
	fmul	%vf1675, %vf1673, %vf1674
	mov	%vi1028, %i0
	fmov	%vf1676, %vf1668
	fmov	%vf1677, %vf1670
	fmul	%vf1678, %vf1676, %vf1677
	mov	%vi1029, %vi1005
	mov	%vi1030, %vi1006
	mov	%vi1031, %vi1007
	mov	%vi1032, %vi1008
	mov	%vi1033, %vi1009
	mov	%vi1034, %vi1010
	mov	%vi1035, %vi1011
	mov	%vi1036, %vi1012
	mov	%vi1037, %vi1013
	mov	%vi1038, %vi1014
	lf	%vf1679, 4(%vi1038)
	fmul	%vf1680, %vf1678, %vf1679
	fadd	%vf1681, %vf1675, %vf1680
	mov	%vi1039, %i0
	fmov	%vf1682, %vf1668
	fmov	%vf1683, %vf1669
	fmul	%vf1684, %vf1682, %vf1683
	mov	%vi1040, %vi1005
	mov	%vi1041, %vi1006
	mov	%vi1042, %vi1007
	mov	%vi1043, %vi1008
	mov	%vi1044, %vi1009
	mov	%vi1045, %vi1010
	mov	%vi1046, %vi1011
	mov	%vi1047, %vi1012
	mov	%vi1048, %vi1013
	mov	%vi1049, %vi1014
	lf	%vf1685, 8(%vi1049)
	fmul	%vf1686, %vf1684, %vf1685
	fadd	%f1, %vf1681, %vf1686
	ret
	.end_function
	.func_entry
solver2nd_mul_b.3524:
	mov	%vi1050, %i4
	mov	%vi1051, %i5
	mov	%vi1052, %i6
	mov	%vi1053, %i7
	mov	%vi1054, %i8
	mov	%vi1055, %i9
	mov	%vi1056, %i10
	mov	%vi1057, %i11
	mov	%vi1058, %i12
	mov	%vi1059, %i13
	mov	%vi1060, %i14
	mov	%vi1061, %i0
	lf	%vf1687, 0(%vi1060)
	lf	%vf1688, 4(%vi1060)
	lf	%vf1689, 8(%vi1060)
	set_label	%vi1062, min_caml_solver_w_vec
	mov	%vi1063, %i0
	lf	%vf1690, 0(%vi1062)
	mov	%vi1064, %i0
	fmov	%vf1691, %vf1687
	fmul	%vf1692, %vf1690, %vf1691
	mov	%vi1065, %vi1050
	mov	%vi1066, %vi1051
	mov	%vi1067, %vi1052
	mov	%vi1068, %vi1053
	mov	%vi1069, %vi1054
	mov	%vi1070, %vi1055
	mov	%vi1071, %vi1056
	mov	%vi1072, %vi1057
	mov	%vi1073, %vi1058
	mov	%vi1074, %vi1059
	mov	%vi1075, %i0
	lf	%vf1693, 0(%vi1069)
	fmul	%vf1694, %vf1692, %vf1693
	set_label	%vi1076, min_caml_solver_w_vec
	lf	%vf1695, 4(%vi1076)
	fmov	%vf1696, %vf1688
	fmul	%vf1697, %vf1695, %vf1696
	mov	%vi1077, %vi1050
	mov	%vi1078, %vi1051
	mov	%vi1079, %vi1052
	mov	%vi1080, %vi1053
	mov	%vi1081, %vi1054
	mov	%vi1082, %vi1055
	mov	%vi1083, %vi1056
	mov	%vi1084, %vi1057
	mov	%vi1085, %vi1058
	mov	%vi1086, %vi1059
	lf	%vf1698, 4(%vi1081)
	fmul	%vf1699, %vf1697, %vf1698
	fadd	%vf1700, %vf1694, %vf1699
	set_label	%vi1087, min_caml_solver_w_vec
	lf	%vf1701, 8(%vi1087)
	fmov	%vf1702, %vf1689
	fmul	%vf1703, %vf1701, %vf1702
	mov	%vi1088, %vi1050
	mov	%vi1089, %vi1051
	mov	%vi1090, %vi1052
	mov	%vi1091, %vi1053
	mov	%vi1092, %vi1054
	mov	%vi1093, %vi1055
	mov	%vi1094, %vi1056
	mov	%vi1095, %vi1057
	mov	%vi1096, %vi1058
	mov	%vi1097, %vi1059
	lf	%vf1704, 8(%vi1092)
	fmul	%vf1705, %vf1703, %vf1704
	fadd	%f1, %vf1700, %vf1705
	ret
	.end_function
	.func_entry
solver2nd_rot_b.3552:
	mov	%vi1098, %i4
	mov	%vi1099, %i5
	mov	%vi1100, %i6
	mov	%vi1101, %i7
	mov	%vi1102, %i8
	mov	%vi1103, %i9
	mov	%vi1104, %i10
	mov	%vi1105, %i11
	mov	%vi1106, %i12
	mov	%vi1107, %i13
	mov	%vi1108, %i14
	mov	%vi1109, %i0
	lf	%vf1706, 0(%vi1108)
	lf	%vf1707, 4(%vi1108)
	lf	%vf1708, 8(%vi1108)
	set_label	%vi1110, min_caml_solver_w_vec
	lf	%vf1709, 8(%vi1110)
	fmov	%vf1710, %vf1707
	fmul	%vf1711, %vf1709, %vf1710
	set_label	%vi1111, min_caml_solver_w_vec
	lf	%vf1712, 4(%vi1111)
	fmov	%vf1713, %vf1708
	fmul	%vf1714, %vf1712, %vf1713
	fadd	%vf1715, %vf1711, %vf1714
	mov	%vi1112, %vi1098
	mov	%vi1113, %vi1099
	mov	%vi1114, %vi1100
	mov	%vi1115, %vi1101
	mov	%vi1116, %vi1102
	mov	%vi1117, %vi1103
	mov	%vi1118, %vi1104
	mov	%vi1119, %vi1105
	mov	%vi1120, %vi1106
	mov	%vi1121, %vi1107
	mov	%vi1122, %i0
	lf	%vf1716, 0(%vi1121)
	fmul	%vf1717, %vf1715, %vf1716
	set_label	%vi1123, min_caml_solver_w_vec
	mov	%vi1124, %i0
	lf	%vf1718, 0(%vi1123)
	fmov	%vf1719, %vf1708
	fmul	%vf1720, %vf1718, %vf1719
	set_label	%vi1125, min_caml_solver_w_vec
	lf	%vf1721, 8(%vi1125)
	mov	%vi1126, %i0
	fmov	%vf1722, %vf1706
	fmul	%vf1723, %vf1721, %vf1722
	fadd	%vf1724, %vf1720, %vf1723
	mov	%vi1127, %vi1098
	mov	%vi1128, %vi1099
	mov	%vi1129, %vi1100
	mov	%vi1130, %vi1101
	mov	%vi1131, %vi1102
	mov	%vi1132, %vi1103
	mov	%vi1133, %vi1104
	mov	%vi1134, %vi1105
	mov	%vi1135, %vi1106
	mov	%vi1136, %vi1107
	lf	%vf1725, 4(%vi1136)
	fmul	%vf1726, %vf1724, %vf1725
	fadd	%vf1727, %vf1717, %vf1726
	set_label	%vi1137, min_caml_solver_w_vec
	mov	%vi1138, %i0
	lf	%vf1728, 0(%vi1137)
	fmov	%vf1729, %vf1707
	fmul	%vf1730, %vf1728, %vf1729
	set_label	%vi1139, min_caml_solver_w_vec
	lf	%vf1731, 4(%vi1139)
	mov	%vi1140, %i0
	fmov	%vf1732, %vf1706
	fmul	%vf1733, %vf1731, %vf1732
	fadd	%vf1734, %vf1730, %vf1733
	mov	%vi1141, %vi1098
	mov	%vi1142, %vi1099
	mov	%vi1143, %vi1100
	mov	%vi1144, %vi1101
	mov	%vi1145, %vi1102
	mov	%vi1146, %vi1103
	mov	%vi1147, %vi1104
	mov	%vi1148, %vi1105
	mov	%vi1149, %vi1106
	mov	%vi1150, %vi1107
	lf	%vf1735, 8(%vi1150)
	fmul	%vf1736, %vf1734, %vf1735
	fadd	%f1, %vf1727, %vf1736
	ret
	.end_function
	.func_entry
solver_second.3601:
	mov	%vi1151, %i4
	mov	%vi1152, %i5
	mov	%vi1153, %i6
	mov	%vi1154, %i7
	mov	%vi1155, %i8
	mov	%vi1156, %i9
	mov	%vi1157, %i10
	mov	%vi1158, %i11
	mov	%vi1159, %i12
	mov	%vi1160, %i13
	mov	%vi1161, %i14
	mov	%vi1162, %vi1151
	mov	%vi1163, %vi1152
	mov	%vi1164, %vi1153
	mov	%vi1165, %vi1154
	mov	%vi1166, %vi1155
	mov	%vi1167, %vi1156
	mov	%vi1168, %vi1157
	mov	%vi1169, %vi1158
	mov	%vi1170, %vi1159
	mov	%vi1171, %vi1160
	mov	%vi1172, %vi1161
	mov	%vi1173, %i0
	lf	%vf1737, 0(%vi1172)
	fmov	%f1, %vf1737
	call_dir	fsqr.2386
	fmov	%vf1739, %f1
	mov	%i4, %vi1162
	mov	%i5, %vi1163
	mov	%i6, %vi1164
	mov	%i7, %vi1165
	mov	%i8, %vi1166
	mov	%i9, %vi1167
	mov	%i10, %vi1168
	mov	%i11, %vi1169
	mov	%i12, %vi1170
	mov	%i13, %vi1171
	call_dir	o_param_a.2451
	fmov	%vf1741, %f1
	fmul	%vf1742, %vf1739, %vf1741
	lf	%vf1743, 4(%vi1172)
	fmov	%f1, %vf1743
	call_dir	fsqr.2386
	fmov	%vf1745, %f1
	mov	%i4, %vi1162
	mov	%i5, %vi1163
	mov	%i6, %vi1164
	mov	%i7, %vi1165
	mov	%i8, %vi1166
	mov	%i9, %vi1167
	mov	%i10, %vi1168
	mov	%i11, %vi1169
	mov	%i12, %vi1170
	mov	%i13, %vi1171
	call_dir	o_param_b.2464
	fmov	%vf1747, %f1
	fmul	%vf1748, %vf1745, %vf1747
	fadd	%vf1749, %vf1742, %vf1748
	lf	%vf1750, 8(%vi1172)
	fmov	%f1, %vf1750
	call_dir	fsqr.2386
	fmov	%vf1752, %f1
	mov	%i4, %vi1162
	mov	%i5, %vi1163
	mov	%i6, %vi1164
	mov	%i7, %vi1165
	mov	%i8, %vi1166
	mov	%i9, %vi1167
	mov	%i10, %vi1168
	mov	%i11, %vi1169
	mov	%i12, %vi1170
	mov	%i13, %vi1171
	call_dir	o_param_c.2477
	fmov	%vf1754, %f1
	fmul	%vf1755, %vf1752, %vf1754
	fadd	%vf1756, %vf1749, %vf1755
	mov	%vi1174, %vi1151
	mov	%vi1175, %vi1152
	mov	%vi1176, %vi1153
	mov	%vi1177, %vi1154
	mov	%vi1178, %vi1155
	mov	%vi1179, %vi1156
	mov	%vi1180, %vi1157
	mov	%vi1181, %vi1158
	mov	%vi1182, %vi1159
	mov	%vi1183, %vi1160
	mov	%vi1184, %vi1177
	mov	%vi1185, %i0
	jeq	%vi1184, %i0, then.11539
	mov	%vi1186, %vi1151
	mov	%vi1187, %vi1152
	mov	%vi1188, %vi1153
	mov	%vi1189, %vi1154
	mov	%vi1190, %vi1155
	mov	%vi1191, %vi1156
	mov	%vi1192, %vi1157
	mov	%vi1193, %vi1158
	mov	%vi1194, %vi1159
	mov	%vi1195, %vi1160
	mov	%vi1196, %vi1161
	lf	%vf1757, 4(%vi1196)
	lf	%vf1758, 8(%vi1196)
	fmul	%vf1759, %vf1757, %vf1758
	mov	%i4, %vi1186
	mov	%i5, %vi1187
	mov	%i6, %vi1188
	mov	%i7, %vi1189
	mov	%i8, %vi1190
	mov	%i9, %vi1191
	mov	%i10, %vi1192
	mov	%i11, %vi1193
	mov	%i12, %vi1194
	mov	%i13, %vi1195
	call_dir	o_param_r1.2594
	fmov	%vf1761, %f1
	fmul	%vf1762, %vf1759, %vf1761
	mov	%vi1197, %i0
	lf	%vf1763, 0(%vi1196)
	lf	%vf1764, 8(%vi1196)
	fmul	%vf1765, %vf1763, %vf1764
	mov	%i4, %vi1186
	mov	%i5, %vi1187
	mov	%i6, %vi1188
	mov	%i7, %vi1189
	mov	%i8, %vi1190
	mov	%i9, %vi1191
	mov	%i10, %vi1192
	mov	%i11, %vi1193
	mov	%i12, %vi1194
	mov	%i13, %vi1195
	call_dir	o_param_r2.2607
	fmov	%vf1767, %f1
	fmul	%vf1768, %vf1765, %vf1767
	fadd	%vf1769, %vf1762, %vf1768
	mov	%vi1198, %i0
	lf	%vf1770, 0(%vi1196)
	lf	%vf1771, 4(%vi1196)
	fmul	%vf1772, %vf1770, %vf1771
	mov	%i4, %vi1186
	mov	%i5, %vi1187
	mov	%i6, %vi1188
	mov	%i7, %vi1189
	mov	%i8, %vi1190
	mov	%i9, %vi1191
	mov	%i10, %vi1192
	mov	%i11, %vi1193
	mov	%i12, %vi1194
	mov	%i13, %vi1195
	call_dir	o_param_r3.2620
	fmov	%vf1774, %f1
	fmul	%vf1775, %vf1772, %vf1774
	fadd	%vf1776, %vf1769, %vf1775
	fadd	%vf1777, %vf1756, %vf1776
	set_label	%i31, cont.11540
	jmp	%i0, 0(%i31)
then.11539:
	fmov	%vf1777, %vf1756
cont.11540:
	fmov	%vf1778, %f0
	feq	%i31, %f0, %vf1777
	jzero	%i0, %i31, else.11541
	mov	%i4, %i0
	ret
else.11541:
	movui	%i31, 262144
	mif	%vf1779, %i31
	mov	%vi1199, %vi1151
	mov	%vi1200, %vi1152
	mov	%vi1201, %vi1153
	mov	%vi1202, %vi1154
	mov	%vi1203, %vi1155
	mov	%vi1204, %vi1156
	mov	%vi1205, %vi1157
	mov	%vi1206, %vi1158
	mov	%vi1207, %vi1159
	mov	%vi1208, %vi1160
	mov	%vi1209, %vi1161
	set_label	%vi1210, min_caml_solver_w_vec
	mov	%vi1211, %i0
	lf	%vf1780, 0(%vi1210)
	mov	%vi1212, %i0
	lf	%vf1781, 0(%vi1209)
	fmul	%vf1782, %vf1780, %vf1781
	mov	%i4, %vi1199
	mov	%i5, %vi1200
	mov	%i6, %vi1201
	mov	%i7, %vi1202
	mov	%i8, %vi1203
	mov	%i9, %vi1204
	mov	%i10, %vi1205
	mov	%i11, %vi1206
	mov	%i12, %vi1207
	mov	%i13, %vi1208
	call_dir	o_param_a.2451
	fmov	%vf1784, %f1
	fmul	%vf1785, %vf1782, %vf1784
	set_label	%vi1213, min_caml_solver_w_vec
	lf	%vf1786, 4(%vi1213)
	lf	%vf1787, 4(%vi1209)
	fmul	%vf1788, %vf1786, %vf1787
	mov	%i4, %vi1199
	mov	%i5, %vi1200
	mov	%i6, %vi1201
	mov	%i7, %vi1202
	mov	%i8, %vi1203
	mov	%i9, %vi1204
	mov	%i10, %vi1205
	mov	%i11, %vi1206
	mov	%i12, %vi1207
	mov	%i13, %vi1208
	call_dir	o_param_b.2464
	fmov	%vf1790, %f1
	fmul	%vf1791, %vf1788, %vf1790
	fadd	%vf1792, %vf1785, %vf1791
	set_label	%vi1214, min_caml_solver_w_vec
	lf	%vf1793, 8(%vi1214)
	lf	%vf1794, 8(%vi1209)
	fmul	%vf1795, %vf1793, %vf1794
	mov	%i4, %vi1199
	mov	%i5, %vi1200
	mov	%i6, %vi1201
	mov	%i7, %vi1202
	mov	%i8, %vi1203
	mov	%i9, %vi1204
	mov	%i10, %vi1205
	mov	%i11, %vi1206
	mov	%i12, %vi1207
	mov	%i13, %vi1208
	call_dir	o_param_c.2477
	fmov	%vf1797, %f1
	fmul	%vf1798, %vf1795, %vf1797
	fadd	%vf1799, %vf1792, %vf1798
	fmul	%vf1800, %vf1779, %vf1799
	mov	%vi1215, %vi1151
	mov	%vi1216, %vi1152
	mov	%vi1217, %vi1153
	mov	%vi1218, %vi1154
	mov	%vi1219, %vi1155
	mov	%vi1220, %vi1156
	mov	%vi1221, %vi1157
	mov	%vi1222, %vi1158
	mov	%vi1223, %vi1159
	mov	%vi1224, %vi1160
	mov	%vi1225, %vi1218
	mov	%vi1226, %i0
	jeq	%vi1225, %i0, then.11542
	mov	%vi1227, %vi1151
	mov	%vi1228, %vi1152
	mov	%vi1229, %vi1153
	mov	%vi1230, %vi1154
	mov	%vi1231, %vi1155
	mov	%vi1232, %vi1156
	mov	%vi1233, %vi1157
	mov	%vi1234, %vi1158
	mov	%vi1235, %vi1159
	mov	%vi1236, %vi1160
	mov	%vi1237, %vi1161
	set_label	%vi1238, min_caml_solver_w_vec
	lf	%vf1801, 8(%vi1238)
	lf	%vf1802, 4(%vi1237)
	fmul	%vf1803, %vf1801, %vf1802
	set_label	%vi1239, min_caml_solver_w_vec
	lf	%vf1804, 4(%vi1239)
	lf	%vf1805, 8(%vi1237)
	fmul	%vf1806, %vf1804, %vf1805
	fadd	%vf1807, %vf1803, %vf1806
	mov	%i4, %vi1227
	mov	%i5, %vi1228
	mov	%i6, %vi1229
	mov	%i7, %vi1230
	mov	%i8, %vi1231
	mov	%i9, %vi1232
	mov	%i10, %vi1233
	mov	%i11, %vi1234
	mov	%i12, %vi1235
	mov	%i13, %vi1236
	call_dir	o_param_r1.2594
	fmov	%vf1809, %f1
	fmul	%vf1810, %vf1807, %vf1809
	set_label	%vi1240, min_caml_solver_w_vec
	mov	%vi1241, %i0
	lf	%vf1811, 0(%vi1240)
	lf	%vf1812, 8(%vi1237)
	fmul	%vf1813, %vf1811, %vf1812
	set_label	%vi1242, min_caml_solver_w_vec
	lf	%vf1814, 8(%vi1242)
	mov	%vi1243, %i0
	lf	%vf1815, 0(%vi1237)
	fmul	%vf1816, %vf1814, %vf1815
	fadd	%vf1817, %vf1813, %vf1816
	mov	%i4, %vi1227
	mov	%i5, %vi1228
	mov	%i6, %vi1229
	mov	%i7, %vi1230
	mov	%i8, %vi1231
	mov	%i9, %vi1232
	mov	%i10, %vi1233
	mov	%i11, %vi1234
	mov	%i12, %vi1235
	mov	%i13, %vi1236
	call_dir	o_param_r2.2607
	fmov	%vf1819, %f1
	fmul	%vf1820, %vf1817, %vf1819
	fadd	%vf1821, %vf1810, %vf1820
	set_label	%vi1244, min_caml_solver_w_vec
	mov	%vi1245, %i0
	lf	%vf1822, 0(%vi1244)
	lf	%vf1823, 4(%vi1237)
	fmul	%vf1824, %vf1822, %vf1823
	set_label	%vi1246, min_caml_solver_w_vec
	lf	%vf1825, 4(%vi1246)
	mov	%vi1247, %i0
	lf	%vf1826, 0(%vi1237)
	fmul	%vf1827, %vf1825, %vf1826
	fadd	%vf1828, %vf1824, %vf1827
	mov	%i4, %vi1227
	mov	%i5, %vi1228
	mov	%i6, %vi1229
	mov	%i7, %vi1230
	mov	%i8, %vi1231
	mov	%i9, %vi1232
	mov	%i10, %vi1233
	mov	%i11, %vi1234
	mov	%i12, %vi1235
	mov	%i13, %vi1236
	call_dir	o_param_r3.2620
	fmov	%vf1830, %f1
	fmul	%vf1831, %vf1828, %vf1830
	fadd	%vf1832, %vf1821, %vf1831
	fadd	%vf1833, %vf1800, %vf1832
	set_label	%i31, cont.11543
	jmp	%i0, 0(%i31)
then.11542:
	fmov	%vf1833, %vf1800
cont.11543:
	set_label	%vi1248, min_caml_solver_w_vec
	mov	%vi1249, %vi1151
	mov	%vi1250, %vi1152
	mov	%vi1251, %vi1153
	mov	%vi1252, %vi1154
	mov	%vi1253, %vi1155
	mov	%vi1254, %vi1156
	mov	%vi1255, %vi1157
	mov	%vi1256, %vi1158
	mov	%vi1257, %vi1159
	mov	%vi1258, %vi1160
	mov	%vi1259, %vi1248
	mov	%vi1260, %i0
	lf	%vf1834, 0(%vi1259)
	fmov	%f1, %vf1834
	call_dir	fsqr.2386
	fmov	%vf1836, %f1
	mov	%i4, %vi1249
	mov	%i5, %vi1250
	mov	%i6, %vi1251
	mov	%i7, %vi1252
	mov	%i8, %vi1253
	mov	%i9, %vi1254
	mov	%i10, %vi1255
	mov	%i11, %vi1256
	mov	%i12, %vi1257
	mov	%i13, %vi1258
	call_dir	o_param_a.2451
	fmov	%vf1838, %f1
	fmul	%vf1839, %vf1836, %vf1838
	lf	%vf1840, 4(%vi1259)
	fmov	%f1, %vf1840
	call_dir	fsqr.2386
	fmov	%vf1842, %f1
	mov	%i4, %vi1249
	mov	%i5, %vi1250
	mov	%i6, %vi1251
	mov	%i7, %vi1252
	mov	%i8, %vi1253
	mov	%i9, %vi1254
	mov	%i10, %vi1255
	mov	%i11, %vi1256
	mov	%i12, %vi1257
	mov	%i13, %vi1258
	call_dir	o_param_b.2464
	fmov	%vf1844, %f1
	fmul	%vf1845, %vf1842, %vf1844
	fadd	%vf1846, %vf1839, %vf1845
	lf	%vf1847, 8(%vi1259)
	fmov	%f1, %vf1847
	call_dir	fsqr.2386
	fmov	%vf1849, %f1
	mov	%i4, %vi1249
	mov	%i5, %vi1250
	mov	%i6, %vi1251
	mov	%i7, %vi1252
	mov	%i8, %vi1253
	mov	%i9, %vi1254
	mov	%i10, %vi1255
	mov	%i11, %vi1256
	mov	%i12, %vi1257
	mov	%i13, %vi1258
	call_dir	o_param_c.2477
	fmov	%vf1851, %f1
	fmul	%vf1852, %vf1849, %vf1851
	fadd	%vf1853, %vf1846, %vf1852
	mov	%vi1261, %vi1151
	mov	%vi1262, %vi1152
	mov	%vi1263, %vi1153
	mov	%vi1264, %vi1154
	mov	%vi1265, %vi1155
	mov	%vi1266, %vi1156
	mov	%vi1267, %vi1157
	mov	%vi1268, %vi1158
	mov	%vi1269, %vi1159
	mov	%vi1270, %vi1160
	mov	%vi1271, %vi1264
	mov	%vi1272, %i0
	jeq	%vi1271, %i0, then.11544
	set_label	%vi1273, min_caml_solver_w_vec
	mov	%vi1274, %vi1151
	mov	%vi1275, %vi1152
	mov	%vi1276, %vi1153
	mov	%vi1277, %vi1154
	mov	%vi1278, %vi1155
	mov	%vi1279, %vi1156
	mov	%vi1280, %vi1157
	mov	%vi1281, %vi1158
	mov	%vi1282, %vi1159
	mov	%vi1283, %vi1160
	mov	%vi1284, %vi1273
	lf	%vf1854, 4(%vi1284)
	lf	%vf1855, 8(%vi1284)
	fmul	%vf1856, %vf1854, %vf1855
	mov	%i4, %vi1274
	mov	%i5, %vi1275
	mov	%i6, %vi1276
	mov	%i7, %vi1277
	mov	%i8, %vi1278
	mov	%i9, %vi1279
	mov	%i10, %vi1280
	mov	%i11, %vi1281
	mov	%i12, %vi1282
	mov	%i13, %vi1283
	call_dir	o_param_r1.2594
	fmov	%vf1858, %f1
	fmul	%vf1859, %vf1856, %vf1858
	mov	%vi1285, %i0
	lf	%vf1860, 0(%vi1284)
	lf	%vf1861, 8(%vi1284)
	fmul	%vf1862, %vf1860, %vf1861
	mov	%i4, %vi1274
	mov	%i5, %vi1275
	mov	%i6, %vi1276
	mov	%i7, %vi1277
	mov	%i8, %vi1278
	mov	%i9, %vi1279
	mov	%i10, %vi1280
	mov	%i11, %vi1281
	mov	%i12, %vi1282
	mov	%i13, %vi1283
	call_dir	o_param_r2.2607
	fmov	%vf1864, %f1
	fmul	%vf1865, %vf1862, %vf1864
	fadd	%vf1866, %vf1859, %vf1865
	mov	%vi1286, %i0
	lf	%vf1867, 0(%vi1284)
	lf	%vf1868, 4(%vi1284)
	fmul	%vf1869, %vf1867, %vf1868
	mov	%i4, %vi1274
	mov	%i5, %vi1275
	mov	%i6, %vi1276
	mov	%i7, %vi1277
	mov	%i8, %vi1278
	mov	%i9, %vi1279
	mov	%i10, %vi1280
	mov	%i11, %vi1281
	mov	%i12, %vi1282
	mov	%i13, %vi1283
	call_dir	o_param_r3.2620
	fmov	%vf1871, %f1
	fmul	%vf1872, %vf1869, %vf1871
	fadd	%vf1873, %vf1866, %vf1872
	fadd	%vf1874, %vf1853, %vf1873
	set_label	%i31, cont.11545
	jmp	%i0, 0(%i31)
then.11544:
	fmov	%vf1874, %vf1853
cont.11545:
	mov	%vi1287, %vi1151
	mov	%vi1288, %vi1152
	mov	%vi1289, %vi1153
	mov	%vi1290, %vi1154
	mov	%vi1291, %vi1155
	mov	%vi1292, %vi1156
	mov	%vi1293, %vi1157
	mov	%vi1294, %vi1158
	mov	%vi1295, %vi1159
	mov	%vi1296, %vi1160
	mov	%vi1297, %vi1288
	movi	%i31, 3
	jeq	%vi1297, %i31, then.11546
	fmov	%vf1876, %vf1874
	set_label	%i31, cont.11547
	jmp	%i0, 0(%i31)
then.11546:
	movui	%i31, 260096
	mif	%vf1875, %i31
	fsub	%vf1876, %vf1874, %vf1875
cont.11547:
	movui	%i31, 264192
	mif	%vf1877, %i31
	fmul	%vf1878, %vf1877, %vf1777
	fmul	%vf1879, %vf1878, %vf1876
	fmov	%vf1880, %vf1833
	fmul	%vf1881, %vf1880, %vf1880
	fsub	%vf1882, %vf1881, %vf1879
	fmov	%vf1883, %f0
	fleq	%i31, %vf1882, %f0
	jzero	%i0, %i31, else.11548
	mov	%i4, %i0
	ret
else.11548:
	fmov	%vf1884, %vf1882
	fmov	%f1, %vf1884
	frsqrt	%f1, %f1
	fmov	%vf1886, %f1
	movui	%i31, 260096
	mif	%vf1887, %i31
	finv	%vf1888, %vf1886
	fmul	%vf1889, %vf1887, %vf1888
	mov	%vi1298, %vi1151
	mov	%vi1299, %vi1152
	mov	%vi1300, %vi1153
	mov	%vi1301, %vi1154
	mov	%vi1302, %vi1155
	mov	%vi1303, %vi1156
	mov	%vi1304, %vi1157
	mov	%vi1305, %vi1158
	mov	%vi1306, %vi1159
	mov	%vi1307, %vi1160
	mov	%vi1308, %vi1304
	mov	%vi1309, %i0
	jeq	%vi1308, %i0, then.11549
	fmov	%vf1890, %vf1889
	set_label	%i31, cont.11550
	jmp	%i0, 0(%i31)
then.11549:
	fneg	%vf1890, %vf1889
cont.11550:
	set_label	%vi1310, min_caml_solver_dist
	mov	%vi1311, %i0
	fsub	%vf1891, %vf1890, %vf1833
	movui	%i31, 262144
	mif	%vf1892, %i31
	finv	%vf1893, %vf1892
	fmul	%vf1894, %vf1891, %vf1893
	finv	%vf1895, %vf1777
	fmul	%vf1896, %vf1894, %vf1895
	sf	%vf1896, 0(%vi1310)
	movi	%i4, 1
	ret
	.end_function
	.func_entry
solver.3645:
	mov	%vi1312, %i4
	mov	%vi1313, %i5
	mov	%vi1314, %i6
	mov	%vi1315, %i0
	lf	%vf1897, 0(%vi1314)
	lf	%vf1898, 4(%vi1314)
	lf	%vf1899, 8(%vi1314)
	set_label	%vi1316, min_caml_objects
	slli	%vi1317, %vi1312, 2
	add	%i31, %vi1316, %vi1317
	lw	%vi1318, 0(%i31)
	lw	%vi1319, 36(%vi1318)
	lw	%vi1320, 32(%vi1318)
	lw	%vi1321, 28(%vi1318)
	lw	%vi1322, 24(%vi1318)
	lw	%vi1323, 20(%vi1318)
	lw	%vi1324, 16(%vi1318)
	lw	%vi1325, 12(%vi1318)
	lw	%vi1326, 8(%vi1318)
	lw	%vi1327, 4(%vi1318)
	lw	%vi1328, 0(%vi1318)
	mov	%vi1329, %vi1328
	mov	%vi1330, %vi1327
	mov	%vi1331, %vi1326
	mov	%vi1332, %vi1325
	mov	%vi1333, %vi1324
	mov	%vi1334, %vi1323
	mov	%vi1335, %vi1322
	mov	%vi1336, %vi1321
	mov	%vi1337, %vi1320
	mov	%vi1338, %vi1319
	set_label	%vi1339, min_caml_solver_w_vec
	mov	%vi1340, %i0
	mov	%vi1341, %i0
	fmov	%vf1900, %vf1897
	mov	%vi1342, %vi1329
	mov	%vi1343, %vi1330
	mov	%vi1344, %vi1331
	mov	%vi1345, %vi1332
	mov	%vi1346, %vi1333
	mov	%vi1347, %vi1334
	mov	%vi1348, %vi1335
	mov	%vi1349, %vi1336
	mov	%vi1350, %vi1337
	mov	%vi1351, %vi1338
	mov	%vi1352, %i0
	lf	%vf1901, 0(%vi1347)
	fsub	%vf1902, %vf1900, %vf1901
	sf	%vf1902, 0(%vi1339)
	set_label	%vi1353, min_caml_solver_w_vec
	fmov	%vf1903, %vf1898
	mov	%vi1354, %vi1329
	mov	%vi1355, %vi1330
	mov	%vi1356, %vi1331
	mov	%vi1357, %vi1332
	mov	%vi1358, %vi1333
	mov	%vi1359, %vi1334
	mov	%vi1360, %vi1335
	mov	%vi1361, %vi1336
	mov	%vi1362, %vi1337
	mov	%vi1363, %vi1338
	lf	%vf1904, 4(%vi1359)
	fsub	%vf1905, %vf1903, %vf1904
	sf	%vf1905, 4(%vi1353)
	set_label	%vi1364, min_caml_solver_w_vec
	fmov	%vf1906, %vf1899
	mov	%vi1365, %vi1329
	mov	%vi1366, %vi1330
	mov	%vi1367, %vi1331
	mov	%vi1368, %vi1332
	mov	%vi1369, %vi1333
	mov	%vi1370, %vi1334
	mov	%vi1371, %vi1335
	mov	%vi1372, %vi1336
	mov	%vi1373, %vi1337
	mov	%vi1374, %vi1338
	lf	%vf1907, 8(%vi1370)
	fsub	%vf1908, %vf1906, %vf1907
	sf	%vf1908, 8(%vi1364)
	mov	%vi1375, %vi1329
	mov	%vi1376, %vi1330
	mov	%vi1377, %vi1331
	mov	%vi1378, %vi1332
	mov	%vi1379, %vi1333
	mov	%vi1380, %vi1334
	mov	%vi1381, %vi1335
	mov	%vi1382, %vi1336
	mov	%vi1383, %vi1337
	mov	%vi1384, %vi1338
	mov	%vi1385, %vi1376
	movi	%i31, 1
	jeq	%vi1385, %i31, then.11551
	movi	%i31, 2
	jeq	%vi1385, %i31, then.11552
	mov	%vi1462, %vi1329
	mov	%vi1463, %vi1330
	mov	%vi1464, %vi1331
	mov	%vi1465, %vi1332
	mov	%vi1466, %vi1333
	mov	%vi1467, %vi1334
	mov	%vi1468, %vi1335
	mov	%vi1469, %vi1336
	mov	%vi1470, %vi1337
	mov	%vi1471, %vi1338
	mov	%vi1472, %vi1313
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	mov	%i14, %vi1472
	call_dir	in_prod_sqr_obj.3480
	fmov	%vf2029, %f1
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	call_dir	o_isrot.2439
	mov	%vi1474, %i4
	mov	%vi1475, %i0
	jeq	%vi1474, %i0, then.11553
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	mov	%i14, %vi1472
	call_dir	in_prod_co_objrot.3499
	fmov	%vf2031, %f1
	fadd	%vf2032, %vf2029, %vf2031
	set_label	%i31, cont.11554
	jmp	%i0, 0(%i31)
then.11553:
	fmov	%vf2032, %vf2029
cont.11554:
	fmov	%vf2033, %f0
	feq	%i31, %f0, %vf2032
	jzero	%i0, %i31, else.11555
	mov	%i4, %i0
	ret
else.11555:
	movui	%i31, 262144
	mif	%vf2034, %i31
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	mov	%i14, %vi1472
	call_dir	solver2nd_mul_b.3524
	fmov	%vf2036, %f1
	fmul	%vf2037, %vf2034, %vf2036
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	call_dir	o_isrot.2439
	mov	%vi1477, %i4
	mov	%vi1478, %i0
	jeq	%vi1477, %i0, then.11556
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	mov	%i14, %vi1472
	call_dir	solver2nd_rot_b.3552
	fmov	%vf2039, %f1
	fadd	%vf2040, %vf2037, %vf2039
	set_label	%i31, cont.11557
	jmp	%i0, 0(%i31)
then.11556:
	fmov	%vf2040, %vf2037
cont.11557:
	set_label	%vi1479, min_caml_solver_w_vec
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	mov	%i14, %vi1479
	call_dir	in_prod_sqr_obj.3480
	fmov	%vf2042, %f1
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	call_dir	o_isrot.2439
	mov	%vi1481, %i4
	mov	%vi1482, %i0
	jeq	%vi1481, %i0, then.11558
	set_label	%vi1483, min_caml_solver_w_vec
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	mov	%i14, %vi1483
	call_dir	in_prod_co_objrot.3499
	fmov	%vf2044, %f1
	fadd	%vf2045, %vf2042, %vf2044
	set_label	%i31, cont.11559
	jmp	%i0, 0(%i31)
then.11558:
	fmov	%vf2045, %vf2042
cont.11559:
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	call_dir	o_form.2403
	mov	%vi1485, %i4
	movi	%i31, 3
	jeq	%vi1485, %i31, then.11560
	fmov	%vf2047, %vf2045
	set_label	%i31, cont.11561
	jmp	%i0, 0(%i31)
then.11560:
	movui	%i31, 260096
	mif	%vf2046, %i31
	fsub	%vf2047, %vf2045, %vf2046
cont.11561:
	movui	%i31, 264192
	mif	%vf2048, %i31
	fmul	%vf2049, %vf2048, %vf2032
	fmul	%vf2050, %vf2049, %vf2047
	fmov	%f1, %vf2040
	call_dir	fsqr.2386
	fmov	%vf2052, %f1
	fsub	%vf2053, %vf2052, %vf2050
	fmov	%vf2054, %f0
	fleq	%i31, %vf2053, %f0
	jzero	%i0, %i31, else.11562
	mov	%i4, %i0
	ret
else.11562:
	fmov	%f1, %vf2053
	call_dir	sqrt.2275
	fmov	%vf2056, %f1
	mov	%i4, %vi1462
	mov	%i5, %vi1463
	mov	%i6, %vi1464
	mov	%i7, %vi1465
	mov	%i8, %vi1466
	mov	%i9, %vi1467
	mov	%i10, %vi1468
	mov	%i11, %vi1469
	mov	%i12, %vi1470
	mov	%i13, %vi1471
	call_dir	o_isinvert.2427
	mov	%vi1487, %i4
	mov	%vi1488, %i0
	jeq	%vi1487, %i0, then.11563
	fmov	%vf2057, %vf2056
	set_label	%i31, cont.11564
	jmp	%i0, 0(%i31)
then.11563:
	fneg	%vf2057, %vf2056
cont.11564:
	set_label	%vi1489, min_caml_solver_dist
	mov	%vi1490, %i0
	fsub	%vf2058, %vf2057, %vf2040
	movui	%i31, 262144
	mif	%vf2059, %i31
	finv	%vf2060, %vf2059
	fmul	%vf2061, %vf2058, %vf2060
	finv	%vf2062, %vf2032
	fmul	%vf2063, %vf2061, %vf2062
	sf	%vf2063, 0(%vi1489)
	movi	%i4, 1
	ret
then.11552:
	mov	%vi1444, %vi1329
	mov	%vi1445, %vi1330
	mov	%vi1446, %vi1331
	mov	%vi1447, %vi1332
	mov	%vi1448, %vi1333
	mov	%vi1449, %vi1334
	mov	%vi1450, %vi1335
	mov	%vi1451, %vi1336
	mov	%vi1452, %vi1337
	mov	%vi1453, %vi1338
	mov	%vi1454, %vi1313
	mov	%vi1455, %i0
	lf	%vf1996, 0(%vi1454)
	mov	%i4, %vi1444
	mov	%i5, %vi1445
	mov	%i6, %vi1446
	mov	%i7, %vi1447
	mov	%i8, %vi1448
	mov	%i9, %vi1449
	mov	%i10, %vi1450
	mov	%i11, %vi1451
	mov	%i12, %vi1452
	mov	%i13, %vi1453
	call_dir	o_param_a.2451
	fmov	%vf1998, %f1
	fmul	%vf1999, %vf1996, %vf1998
	lf	%vf2000, 4(%vi1454)
	mov	%i4, %vi1444
	mov	%i5, %vi1445
	mov	%i6, %vi1446
	mov	%i7, %vi1447
	mov	%i8, %vi1448
	mov	%i9, %vi1449
	mov	%i10, %vi1450
	mov	%i11, %vi1451
	mov	%i12, %vi1452
	mov	%i13, %vi1453
	call_dir	o_param_b.2464
	fmov	%vf2002, %f1
	fmul	%vf2003, %vf2000, %vf2002
	fadd	%vf2004, %vf1999, %vf2003
	lf	%vf2005, 8(%vi1454)
	mov	%i4, %vi1444
	mov	%i5, %vi1445
	mov	%i6, %vi1446
	mov	%i7, %vi1447
	mov	%i8, %vi1448
	mov	%i9, %vi1449
	mov	%i10, %vi1450
	mov	%i11, %vi1451
	mov	%i12, %vi1452
	mov	%i13, %vi1453
	call_dir	o_param_c.2477
	fmov	%vf2007, %f1
	fmul	%vf2008, %vf2005, %vf2007
	fadd	%vf2009, %vf2004, %vf2008
	fmov	%vf2010, %f0
	fleq	%i31, %vf2009, %f0
	jzero	%i0, %i31, else.11565
	mov	%i4, %i0
	ret
else.11565:
	set_label	%vi1456, min_caml_solver_w_vec
	mov	%vi1457, %i0
	lf	%vf2011, 0(%vi1456)
	mov	%i4, %vi1444
	mov	%i5, %vi1445
	mov	%i6, %vi1446
	mov	%i7, %vi1447
	mov	%i8, %vi1448
	mov	%i9, %vi1449
	mov	%i10, %vi1450
	mov	%i11, %vi1451
	mov	%i12, %vi1452
	mov	%i13, %vi1453
	call_dir	o_param_a.2451
	fmov	%vf2013, %f1
	fmul	%vf2014, %vf2011, %vf2013
	set_label	%vi1458, min_caml_solver_w_vec
	lf	%vf2015, 4(%vi1458)
	mov	%i4, %vi1444
	mov	%i5, %vi1445
	mov	%i6, %vi1446
	mov	%i7, %vi1447
	mov	%i8, %vi1448
	mov	%i9, %vi1449
	mov	%i10, %vi1450
	mov	%i11, %vi1451
	mov	%i12, %vi1452
	mov	%i13, %vi1453
	call_dir	o_param_b.2464
	fmov	%vf2017, %f1
	fmul	%vf2018, %vf2015, %vf2017
	fadd	%vf2019, %vf2014, %vf2018
	set_label	%vi1459, min_caml_solver_w_vec
	lf	%vf2020, 8(%vi1459)
	mov	%i4, %vi1444
	mov	%i5, %vi1445
	mov	%i6, %vi1446
	mov	%i7, %vi1447
	mov	%i8, %vi1448
	mov	%i9, %vi1449
	mov	%i10, %vi1450
	mov	%i11, %vi1451
	mov	%i12, %vi1452
	mov	%i13, %vi1453
	call_dir	o_param_c.2477
	fmov	%vf2022, %f1
	fmul	%vf2023, %vf2020, %vf2022
	fadd	%vf2024, %vf2019, %vf2023
	finv	%vf2025, %vf2009
	fmul	%vf2026, %vf2024, %vf2025
	set_label	%vi1460, min_caml_solver_dist
	mov	%vi1461, %i0
	fneg	%vf2027, %vf2026
	sf	%vf2027, 0(%vi1460)
	movi	%i4, 1
	ret
then.11551:
	mov	%vi1386, %vi1329
	mov	%vi1387, %vi1330
	mov	%vi1388, %vi1331
	mov	%vi1389, %vi1332
	mov	%vi1390, %vi1333
	mov	%vi1391, %vi1334
	mov	%vi1392, %vi1335
	mov	%vi1393, %vi1336
	mov	%vi1394, %vi1337
	mov	%vi1395, %vi1338
	mov	%vi1396, %vi1313
	fmov	%vf1909, %f0
	mov	%vi1397, %i0
	lf	%vf1910, 0(%vi1396)
	feq	%i31, %f0, %vf1910
	jzero	%i0, %i31, else.11566
	mov	%vi1412, %i0
	set_label	%i31, cont.11567
	jmp	%i0, 0(%i31)
else.11566:
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_isinvert.2427
	mov	%vi1399, %i4
	fmov	%vf1911, %f0
	mov	%vi1400, %i0
	lf	%vf1912, 0(%vi1396)
	fleq	%i31, %f0, %vf1912
	jzero	%i0, %i31, else.11568
	mov	%vi1401, %i0
	set_label	%i31, cont.11569
	jmp	%i0, 0(%i31)
else.11568:
	movi	%vi1401, 1
cont.11569:
	mov	%i4, %vi1399
	mov	%i5, %vi1401
	call_dir	xor.2381
	mov	%vi1403, %i4
	mov	%vi1404, %i0
	jeq	%vi1403, %i0, then.11570
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_a.2451
	fmov	%vf1916, %f1
	set_label	%i31, cont.11571
	jmp	%i0, 0(%i31)
then.11570:
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_a.2451
	fmov	%vf1914, %f1
	fneg	%vf1916, %vf1914
cont.11571:
	set_label	%vi1405, min_caml_solver_w_vec
	mov	%vi1406, %i0
	lf	%vf1917, 0(%vi1405)
	fsub	%vf1918, %vf1916, %vf1917
	mov	%vi1407, %i0
	lf	%vf1919, 0(%vi1396)
	finv	%vf1920, %vf1919
	fmul	%vf1921, %vf1918, %vf1920
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_b.2464
	fmov	%vf1923, %f1
	lf	%vf1924, 4(%vi1396)
	fmul	%vf1925, %vf1921, %vf1924
	set_label	%vi1408, min_caml_solver_w_vec
	lf	%vf1926, 4(%vi1408)
	fadd	%vf1927, %vf1925, %vf1926
	fmov	%f1, %vf1927
	call_dir	min_caml_abs_float
	fmov	%vf1929, %f1
	fleq	%i31, %vf1923, %vf1929
	jzero	%i0, %i31, else.11572
	mov	%vi1412, %i0
	set_label	%i31, cont.11573
	jmp	%i0, 0(%i31)
else.11572:
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_c.2477
	fmov	%vf1931, %f1
	lf	%vf1932, 8(%vi1396)
	fmul	%vf1933, %vf1921, %vf1932
	set_label	%vi1409, min_caml_solver_w_vec
	lf	%vf1934, 8(%vi1409)
	fadd	%vf1935, %vf1933, %vf1934
	fmov	%f1, %vf1935
	call_dir	min_caml_abs_float
	fmov	%vf1937, %f1
	fleq	%i31, %vf1931, %vf1937
	jzero	%i0, %i31, else.11574
	mov	%vi1412, %i0
	set_label	%i31, cont.11575
	jmp	%i0, 0(%i31)
else.11574:
	set_label	%vi1410, min_caml_solver_dist
	mov	%vi1411, %i0
	sf	%vf1921, 0(%vi1410)
	movi	%vi1412, 1
cont.11575:
cont.11573:
cont.11567:
	mov	%vi1413, %i0
	jeq	%vi1412, %i0, then.11576
	movi	%i4, 1
	ret
then.11576:
	fmov	%vf1938, %f0
	lf	%vf1939, 4(%vi1396)
	feq	%i31, %f0, %vf1939
	jzero	%i0, %i31, else.11577
	mov	%vi1427, %i0
	set_label	%i31, cont.11578
	jmp	%i0, 0(%i31)
else.11577:
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_isinvert.2427
	mov	%vi1415, %i4
	fmov	%vf1940, %f0
	lf	%vf1941, 4(%vi1396)
	fleq	%i31, %f0, %vf1941
	jzero	%i0, %i31, else.11579
	mov	%vi1416, %i0
	set_label	%i31, cont.11580
	jmp	%i0, 0(%i31)
else.11579:
	movi	%vi1416, 1
cont.11580:
	mov	%i4, %vi1415
	mov	%i5, %vi1416
	call_dir	xor.2381
	mov	%vi1418, %i4
	mov	%vi1419, %i0
	jeq	%vi1418, %i0, then.11581
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_b.2464
	fmov	%vf1945, %f1
	set_label	%i31, cont.11582
	jmp	%i0, 0(%i31)
then.11581:
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_b.2464
	fmov	%vf1943, %f1
	fneg	%vf1945, %vf1943
cont.11582:
	set_label	%vi1420, min_caml_solver_w_vec
	lf	%vf1946, 4(%vi1420)
	fsub	%vf1947, %vf1945, %vf1946
	lf	%vf1948, 4(%vi1396)
	finv	%vf1949, %vf1948
	fmul	%vf1950, %vf1947, %vf1949
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_c.2477
	fmov	%vf1952, %f1
	lf	%vf1953, 8(%vi1396)
	fmul	%vf1954, %vf1950, %vf1953
	set_label	%vi1421, min_caml_solver_w_vec
	lf	%vf1955, 8(%vi1421)
	fadd	%vf1956, %vf1954, %vf1955
	fmov	%f1, %vf1956
	call_dir	min_caml_abs_float
	fmov	%vf1958, %f1
	fleq	%i31, %vf1952, %vf1958
	jzero	%i0, %i31, else.11583
	mov	%vi1427, %i0
	set_label	%i31, cont.11584
	jmp	%i0, 0(%i31)
else.11583:
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_a.2451
	fmov	%vf1960, %f1
	mov	%vi1422, %i0
	lf	%vf1961, 0(%vi1396)
	fmul	%vf1962, %vf1950, %vf1961
	set_label	%vi1423, min_caml_solver_w_vec
	mov	%vi1424, %i0
	lf	%vf1963, 0(%vi1423)
	fadd	%vf1964, %vf1962, %vf1963
	fmov	%f1, %vf1964
	call_dir	min_caml_abs_float
	fmov	%vf1966, %f1
	fleq	%i31, %vf1960, %vf1966
	jzero	%i0, %i31, else.11585
	mov	%vi1427, %i0
	set_label	%i31, cont.11586
	jmp	%i0, 0(%i31)
else.11585:
	set_label	%vi1425, min_caml_solver_dist
	mov	%vi1426, %i0
	sf	%vf1950, 0(%vi1425)
	movi	%vi1427, 1
cont.11586:
cont.11584:
cont.11578:
	mov	%vi1428, %i0
	jeq	%vi1427, %i0, then.11587
	movi	%i4, 2
	ret
then.11587:
	fmov	%vf1967, %f0
	lf	%vf1968, 8(%vi1396)
	feq	%i31, %f0, %vf1968
	jzero	%i0, %i31, else.11588
	mov	%vi1442, %i0
	set_label	%i31, cont.11589
	jmp	%i0, 0(%i31)
else.11588:
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_isinvert.2427
	mov	%vi1430, %i4
	fmov	%vf1969, %f0
	lf	%vf1970, 8(%vi1396)
	fleq	%i31, %f0, %vf1970
	jzero	%i0, %i31, else.11590
	mov	%vi1431, %i0
	set_label	%i31, cont.11591
	jmp	%i0, 0(%i31)
else.11590:
	movi	%vi1431, 1
cont.11591:
	mov	%i4, %vi1430
	mov	%i5, %vi1431
	call_dir	xor.2381
	mov	%vi1433, %i4
	mov	%vi1434, %i0
	jeq	%vi1433, %i0, then.11592
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_c.2477
	fmov	%vf1974, %f1
	set_label	%i31, cont.11593
	jmp	%i0, 0(%i31)
then.11592:
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_c.2477
	fmov	%vf1972, %f1
	fneg	%vf1974, %vf1972
cont.11593:
	set_label	%vi1435, min_caml_solver_w_vec
	lf	%vf1975, 8(%vi1435)
	fsub	%vf1976, %vf1974, %vf1975
	lf	%vf1977, 8(%vi1396)
	finv	%vf1978, %vf1977
	fmul	%vf1979, %vf1976, %vf1978
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_a.2451
	fmov	%vf1981, %f1
	mov	%vi1436, %i0
	lf	%vf1982, 0(%vi1396)
	fmul	%vf1983, %vf1979, %vf1982
	set_label	%vi1437, min_caml_solver_w_vec
	mov	%vi1438, %i0
	lf	%vf1984, 0(%vi1437)
	fadd	%vf1985, %vf1983, %vf1984
	fmov	%f1, %vf1985
	call_dir	min_caml_abs_float
	fmov	%vf1987, %f1
	fleq	%i31, %vf1981, %vf1987
	jzero	%i0, %i31, else.11594
	mov	%vi1442, %i0
	set_label	%i31, cont.11595
	jmp	%i0, 0(%i31)
else.11594:
	mov	%i4, %vi1386
	mov	%i5, %vi1387
	mov	%i6, %vi1388
	mov	%i7, %vi1389
	mov	%i8, %vi1390
	mov	%i9, %vi1391
	mov	%i10, %vi1392
	mov	%i11, %vi1393
	mov	%i12, %vi1394
	mov	%i13, %vi1395
	call_dir	o_param_b.2464
	fmov	%vf1989, %f1
	lf	%vf1990, 4(%vi1396)
	fmul	%vf1991, %vf1979, %vf1990
	set_label	%vi1439, min_caml_solver_w_vec
	lf	%vf1992, 4(%vi1439)
	fadd	%vf1993, %vf1991, %vf1992
	fmov	%f1, %vf1993
	call_dir	min_caml_abs_float
	fmov	%vf1995, %f1
	fleq	%i31, %vf1989, %vf1995
	jzero	%i0, %i31, else.11596
	mov	%vi1442, %i0
	set_label	%i31, cont.11597
	jmp	%i0, 0(%i31)
else.11596:
	set_label	%vi1440, min_caml_solver_dist
	mov	%vi1441, %i0
	sf	%vf1979, 0(%vi1440)
	movi	%vi1442, 1
cont.11597:
cont.11595:
cont.11589:
	mov	%vi1443, %i0
	jeq	%vi1442, %i0, then.11598
	movi	%i4, 3
	ret
then.11598:
	mov	%i4, %i0
	ret
	.end_function
	.func_entry
is_rect_outside.3675:
	mov	%vi1491, %i4
	mov	%vi1492, %i5
	mov	%vi1493, %i6
	mov	%vi1494, %i7
	mov	%vi1495, %i8
	mov	%vi1496, %i9
	mov	%vi1497, %i10
	mov	%vi1498, %i11
	mov	%vi1499, %i12
	mov	%vi1500, %i13
	mov	%vi1501, %vi1491
	mov	%vi1502, %vi1492
	mov	%vi1503, %vi1493
	mov	%vi1504, %vi1494
	mov	%vi1505, %vi1495
	mov	%vi1506, %vi1496
	mov	%vi1507, %vi1497
	mov	%vi1508, %vi1498
	mov	%vi1509, %vi1499
	mov	%vi1510, %vi1500
	mov	%vi1511, %i0
	lf	%vf2064, 0(%vi1505)
	set_label	%vi1512, min_caml_isoutside_q
	mov	%vi1513, %i0
	lf	%vf2065, 0(%vi1512)
	fmov	%f1, %vf2065
	call_dir	min_caml_abs_float
	fmov	%vf2067, %f1
	fleq	%i31, %vf2064, %vf2067
	jzero	%i0, %i31, else.11599
	mov	%vi1536, %i0
	set_label	%i31, cont.11600
	jmp	%i0, 0(%i31)
else.11599:
	mov	%vi1514, %vi1491
	mov	%vi1515, %vi1492
	mov	%vi1516, %vi1493
	mov	%vi1517, %vi1494
	mov	%vi1518, %vi1495
	mov	%vi1519, %vi1496
	mov	%vi1520, %vi1497
	mov	%vi1521, %vi1498
	mov	%vi1522, %vi1499
	mov	%vi1523, %vi1500
	lf	%vf2068, 4(%vi1518)
	set_label	%vi1524, min_caml_isoutside_q
	lf	%vf2069, 4(%vi1524)
	fmov	%f1, %vf2069
	call_dir	min_caml_abs_float
	fmov	%vf2071, %f1
	fleq	%i31, %vf2068, %vf2071
	jzero	%i0, %i31, else.11601
	mov	%vi1536, %i0
	set_label	%i31, cont.11602
	jmp	%i0, 0(%i31)
else.11601:
	mov	%vi1525, %vi1491
	mov	%vi1526, %vi1492
	mov	%vi1527, %vi1493
	mov	%vi1528, %vi1494
	mov	%vi1529, %vi1495
	mov	%vi1530, %vi1496
	mov	%vi1531, %vi1497
	mov	%vi1532, %vi1498
	mov	%vi1533, %vi1499
	mov	%vi1534, %vi1500
	lf	%vf2072, 8(%vi1529)
	set_label	%vi1535, min_caml_isoutside_q
	lf	%vf2073, 8(%vi1535)
	fmov	%f1, %vf2073
	call_dir	min_caml_abs_float
	fmov	%vf2075, %f1
	fleq	%i31, %vf2072, %vf2075
	jzero	%i0, %i31, else.11603
	mov	%vi1536, %i0
	set_label	%i31, cont.11604
	jmp	%i0, 0(%i31)
else.11603:
	movi	%vi1536, 1
cont.11604:
cont.11602:
cont.11600:
	mov	%vi1537, %i0
	jeq	%vi1536, %i0, then.11605
	mov	%vi1550, %vi1491
	mov	%vi1551, %vi1492
	mov	%vi1552, %vi1493
	mov	%vi1553, %vi1494
	mov	%vi1554, %vi1495
	mov	%vi1555, %vi1496
	mov	%vi1556, %vi1497
	mov	%vi1557, %vi1498
	mov	%vi1558, %vi1499
	mov	%vi1559, %vi1500
	mov	%i4, %vi1556
	ret
then.11605:
	mov	%vi1538, %vi1491
	mov	%vi1539, %vi1492
	mov	%vi1540, %vi1493
	mov	%vi1541, %vi1494
	mov	%vi1542, %vi1495
	mov	%vi1543, %vi1496
	mov	%vi1544, %vi1497
	mov	%vi1545, %vi1498
	mov	%vi1546, %vi1499
	mov	%vi1547, %vi1500
	mov	%vi1548, %vi1544
	mov	%vi1549, %i0
	jeq	%vi1548, %i0, then.11606
	mov	%i4, %i0
	ret
then.11606:
	movi	%i4, 1
	ret
	.end_function
	.func_entry
is_plane_outside.3696:
	mov	%vi1560, %i4
	mov	%vi1561, %i5
	mov	%vi1562, %i6
	mov	%vi1563, %i7
	mov	%vi1564, %i8
	mov	%vi1565, %i9
	mov	%vi1566, %i10
	mov	%vi1567, %i11
	mov	%vi1568, %i12
	mov	%vi1569, %i13
	mov	%vi1570, %vi1560
	mov	%vi1571, %vi1561
	mov	%vi1572, %vi1562
	mov	%vi1573, %vi1563
	mov	%vi1574, %vi1564
	mov	%vi1575, %vi1565
	mov	%vi1576, %vi1566
	mov	%vi1577, %vi1567
	mov	%vi1578, %vi1568
	mov	%vi1579, %vi1569
	mov	%vi1580, %i0
	lf	%vf2076, 0(%vi1574)
	set_label	%vi1581, min_caml_isoutside_q
	mov	%vi1582, %i0
	lf	%vf2077, 0(%vi1581)
	fmul	%vf2078, %vf2076, %vf2077
	mov	%vi1583, %vi1560
	mov	%vi1584, %vi1561
	mov	%vi1585, %vi1562
	mov	%vi1586, %vi1563
	mov	%vi1587, %vi1564
	mov	%vi1588, %vi1565
	mov	%vi1589, %vi1566
	mov	%vi1590, %vi1567
	mov	%vi1591, %vi1568
	mov	%vi1592, %vi1569
	lf	%vf2079, 4(%vi1587)
	set_label	%vi1593, min_caml_isoutside_q
	lf	%vf2080, 4(%vi1593)
	fmul	%vf2081, %vf2079, %vf2080
	fadd	%vf2082, %vf2078, %vf2081
	mov	%vi1594, %vi1560
	mov	%vi1595, %vi1561
	mov	%vi1596, %vi1562
	mov	%vi1597, %vi1563
	mov	%vi1598, %vi1564
	mov	%vi1599, %vi1565
	mov	%vi1600, %vi1566
	mov	%vi1601, %vi1567
	mov	%vi1602, %vi1568
	mov	%vi1603, %vi1569
	lf	%vf2083, 8(%vi1598)
	set_label	%vi1604, min_caml_isoutside_q
	lf	%vf2084, 8(%vi1604)
	fmul	%vf2085, %vf2083, %vf2084
	fadd	%vf2086, %vf2082, %vf2085
	fmov	%vf2087, %f0
	fleq	%i31, %f0, %vf2086
	jzero	%i0, %i31, else.11607
	mov	%vi1605, %i0
	set_label	%i31, cont.11608
	jmp	%i0, 0(%i31)
else.11607:
	movi	%vi1605, 1
cont.11608:
	mov	%vi1606, %vi1560
	mov	%vi1607, %vi1561
	mov	%vi1608, %vi1562
	mov	%vi1609, %vi1563
	mov	%vi1610, %vi1564
	mov	%vi1611, %vi1565
	mov	%vi1612, %vi1566
	mov	%vi1613, %vi1567
	mov	%vi1614, %vi1568
	mov	%vi1615, %vi1569
	mov	%vi1616, %vi1612
	mov	%vi1617, %vi1616
	mov	%vi1618, %vi1605
	mov	%vi1619, %i0
	jeq	%vi1617, %i0, then.11609
	mov	%vi1620, %i0
	jeq	%vi1618, %i0, then.11611
	mov	%vi1621, %i0
	set_label	%i31, cont.11612
	jmp	%i0, 0(%i31)
then.11611:
	movi	%vi1621, 1
cont.11612:
	set_label	%i31, cont.11610
	jmp	%i0, 0(%i31)
then.11609:
	mov	%vi1621, %vi1618
cont.11610:
	mov	%vi1622, %i0
	jeq	%vi1621, %i0, then.11613
	mov	%i4, %i0
	ret
then.11613:
	movi	%i4, 1
	ret
	.end_function
	.func_entry
is_second_outside.3720:
	mov	%vi1623, %i4
	mov	%vi1624, %i5
	mov	%vi1625, %i6
	mov	%vi1626, %i7
	mov	%vi1627, %i8
	mov	%vi1628, %i9
	mov	%vi1629, %i10
	mov	%vi1630, %i11
	mov	%vi1631, %i12
	mov	%vi1632, %i13
	set_label	%vi1633, min_caml_isoutside_q
	mov	%vi1634, %vi1623
	mov	%vi1635, %vi1624
	mov	%vi1636, %vi1625
	mov	%vi1637, %vi1626
	mov	%vi1638, %vi1627
	mov	%vi1639, %vi1628
	mov	%vi1640, %vi1629
	mov	%vi1641, %vi1630
	mov	%vi1642, %vi1631
	mov	%vi1643, %vi1632
	mov	%vi1644, %vi1633
	mov	%vi1645, %i0
	lf	%vf2088, 0(%vi1644)
	fmov	%f1, %vf2088
	call_dir	fsqr.2386
	fmov	%vf2090, %f1
	mov	%i4, %vi1634
	mov	%i5, %vi1635
	mov	%i6, %vi1636
	mov	%i7, %vi1637
	mov	%i8, %vi1638
	mov	%i9, %vi1639
	mov	%i10, %vi1640
	mov	%i11, %vi1641
	mov	%i12, %vi1642
	mov	%i13, %vi1643
	call_dir	o_param_a.2451
	fmov	%vf2092, %f1
	fmul	%vf2093, %vf2090, %vf2092
	lf	%vf2094, 4(%vi1644)
	fmov	%f1, %vf2094
	call_dir	fsqr.2386
	fmov	%vf2096, %f1
	mov	%i4, %vi1634
	mov	%i5, %vi1635
	mov	%i6, %vi1636
	mov	%i7, %vi1637
	mov	%i8, %vi1638
	mov	%i9, %vi1639
	mov	%i10, %vi1640
	mov	%i11, %vi1641
	mov	%i12, %vi1642
	mov	%i13, %vi1643
	call_dir	o_param_b.2464
	fmov	%vf2098, %f1
	fmul	%vf2099, %vf2096, %vf2098
	fadd	%vf2100, %vf2093, %vf2099
	lf	%vf2101, 8(%vi1644)
	fmov	%f1, %vf2101
	call_dir	fsqr.2386
	fmov	%vf2103, %f1
	mov	%i4, %vi1634
	mov	%i5, %vi1635
	mov	%i6, %vi1636
	mov	%i7, %vi1637
	mov	%i8, %vi1638
	mov	%i9, %vi1639
	mov	%i10, %vi1640
	mov	%i11, %vi1641
	mov	%i12, %vi1642
	mov	%i13, %vi1643
	call_dir	o_param_c.2477
	fmov	%vf2105, %f1
	fmul	%vf2106, %vf2103, %vf2105
	fadd	%vf2107, %vf2100, %vf2106
	mov	%vi1646, %vi1623
	mov	%vi1647, %vi1624
	mov	%vi1648, %vi1625
	mov	%vi1649, %vi1626
	mov	%vi1650, %vi1627
	mov	%vi1651, %vi1628
	mov	%vi1652, %vi1629
	mov	%vi1653, %vi1630
	mov	%vi1654, %vi1631
	mov	%vi1655, %vi1632
	mov	%vi1656, %vi1647
	movi	%i31, 3
	jeq	%vi1656, %i31, then.11614
	fmov	%vf2109, %vf2107
	set_label	%i31, cont.11615
	jmp	%i0, 0(%i31)
then.11614:
	movui	%i31, 260096
	mif	%vf2108, %i31
	fsub	%vf2109, %vf2107, %vf2108
cont.11615:
	mov	%vi1657, %vi1623
	mov	%vi1658, %vi1624
	mov	%vi1659, %vi1625
	mov	%vi1660, %vi1626
	mov	%vi1661, %vi1627
	mov	%vi1662, %vi1628
	mov	%vi1663, %vi1629
	mov	%vi1664, %vi1630
	mov	%vi1665, %vi1631
	mov	%vi1666, %vi1632
	mov	%vi1667, %vi1660
	mov	%vi1668, %i0
	jeq	%vi1667, %i0, then.11616
	set_label	%vi1669, min_caml_isoutside_q
	mov	%vi1670, %vi1623
	mov	%vi1671, %vi1624
	mov	%vi1672, %vi1625
	mov	%vi1673, %vi1626
	mov	%vi1674, %vi1627
	mov	%vi1675, %vi1628
	mov	%vi1676, %vi1629
	mov	%vi1677, %vi1630
	mov	%vi1678, %vi1631
	mov	%vi1679, %vi1632
	mov	%vi1680, %vi1669
	lf	%vf2110, 4(%vi1680)
	lf	%vf2111, 8(%vi1680)
	fmul	%vf2112, %vf2110, %vf2111
	mov	%i4, %vi1670
	mov	%i5, %vi1671
	mov	%i6, %vi1672
	mov	%i7, %vi1673
	mov	%i8, %vi1674
	mov	%i9, %vi1675
	mov	%i10, %vi1676
	mov	%i11, %vi1677
	mov	%i12, %vi1678
	mov	%i13, %vi1679
	call_dir	o_param_r1.2594
	fmov	%vf2114, %f1
	fmul	%vf2115, %vf2112, %vf2114
	mov	%vi1681, %i0
	lf	%vf2116, 0(%vi1680)
	lf	%vf2117, 8(%vi1680)
	fmul	%vf2118, %vf2116, %vf2117
	mov	%i4, %vi1670
	mov	%i5, %vi1671
	mov	%i6, %vi1672
	mov	%i7, %vi1673
	mov	%i8, %vi1674
	mov	%i9, %vi1675
	mov	%i10, %vi1676
	mov	%i11, %vi1677
	mov	%i12, %vi1678
	mov	%i13, %vi1679
	call_dir	o_param_r2.2607
	fmov	%vf2120, %f1
	fmul	%vf2121, %vf2118, %vf2120
	fadd	%vf2122, %vf2115, %vf2121
	mov	%vi1682, %i0
	lf	%vf2123, 0(%vi1680)
	lf	%vf2124, 4(%vi1680)
	fmul	%vf2125, %vf2123, %vf2124
	mov	%i4, %vi1670
	mov	%i5, %vi1671
	mov	%i6, %vi1672
	mov	%i7, %vi1673
	mov	%i8, %vi1674
	mov	%i9, %vi1675
	mov	%i10, %vi1676
	mov	%i11, %vi1677
	mov	%i12, %vi1678
	mov	%i13, %vi1679
	call_dir	o_param_r3.2620
	fmov	%vf2127, %f1
	fmul	%vf2128, %vf2125, %vf2127
	fadd	%vf2129, %vf2122, %vf2128
	fadd	%vf2130, %vf2109, %vf2129
	set_label	%i31, cont.11617
	jmp	%i0, 0(%i31)
then.11616:
	fmov	%vf2130, %vf2109
cont.11617:
	fmov	%vf2131, %f0
	fleq	%i31, %f0, %vf2130
	jzero	%i0, %i31, else.11618
	mov	%vi1683, %i0
	set_label	%i31, cont.11619
	jmp	%i0, 0(%i31)
else.11618:
	movi	%vi1683, 1
cont.11619:
	mov	%vi1684, %vi1623
	mov	%vi1685, %vi1624
	mov	%vi1686, %vi1625
	mov	%vi1687, %vi1626
	mov	%vi1688, %vi1627
	mov	%vi1689, %vi1628
	mov	%vi1690, %vi1629
	mov	%vi1691, %vi1630
	mov	%vi1692, %vi1631
	mov	%vi1693, %vi1632
	mov	%vi1694, %vi1690
	mov	%vi1695, %vi1694
	mov	%vi1696, %vi1683
	mov	%vi1697, %i0
	jeq	%vi1695, %i0, then.11620
	mov	%vi1698, %i0
	jeq	%vi1696, %i0, then.11622
	mov	%vi1699, %i0
	set_label	%i31, cont.11623
	jmp	%i0, 0(%i31)
then.11622:
	movi	%vi1699, 1
cont.11623:
	set_label	%i31, cont.11621
	jmp	%i0, 0(%i31)
then.11620:
	mov	%vi1699, %vi1696
cont.11621:
	mov	%vi1700, %i0
	jeq	%vi1699, %i0, then.11624
	mov	%i4, %i0
	ret
then.11624:
	movi	%i4, 1
	ret
	.end_function
	.func_entry
is_outside.3738:
	mov	%vi1701, %i4
	mov	%vi1702, %i5
	mov	%vi1703, %i6
	mov	%vi1704, %i7
	mov	%vi1705, %i8
	mov	%vi1706, %i9
	mov	%vi1707, %i10
	mov	%vi1708, %i11
	mov	%vi1709, %i12
	mov	%vi1710, %i13
	set_label	%vi1711, min_caml_isoutside_q
	mov	%vi1712, %i0
	set_label	%vi1713, min_caml_chkinside_p
	mov	%vi1714, %i0
	lf	%vf2132, 0(%vi1713)
	mov	%vi1715, %vi1701
	mov	%vi1716, %vi1702
	mov	%vi1717, %vi1703
	mov	%vi1718, %vi1704
	mov	%vi1719, %vi1705
	mov	%vi1720, %vi1706
	mov	%vi1721, %vi1707
	mov	%vi1722, %vi1708
	mov	%vi1723, %vi1709
	mov	%vi1724, %vi1710
	mov	%vi1725, %i0
	lf	%vf2133, 0(%vi1720)
	fsub	%vf2134, %vf2132, %vf2133
	sf	%vf2134, 0(%vi1711)
	set_label	%vi1726, min_caml_isoutside_q
	set_label	%vi1727, min_caml_chkinside_p
	lf	%vf2135, 4(%vi1727)
	mov	%vi1728, %vi1701
	mov	%vi1729, %vi1702
	mov	%vi1730, %vi1703
	mov	%vi1731, %vi1704
	mov	%vi1732, %vi1705
	mov	%vi1733, %vi1706
	mov	%vi1734, %vi1707
	mov	%vi1735, %vi1708
	mov	%vi1736, %vi1709
	mov	%vi1737, %vi1710
	lf	%vf2136, 4(%vi1733)
	fsub	%vf2137, %vf2135, %vf2136
	sf	%vf2137, 4(%vi1726)
	set_label	%vi1738, min_caml_isoutside_q
	set_label	%vi1739, min_caml_chkinside_p
	lf	%vf2138, 8(%vi1739)
	mov	%vi1740, %vi1701
	mov	%vi1741, %vi1702
	mov	%vi1742, %vi1703
	mov	%vi1743, %vi1704
	mov	%vi1744, %vi1705
	mov	%vi1745, %vi1706
	mov	%vi1746, %vi1707
	mov	%vi1747, %vi1708
	mov	%vi1748, %vi1709
	mov	%vi1749, %vi1710
	lf	%vf2139, 8(%vi1745)
	fsub	%vf2140, %vf2138, %vf2139
	sf	%vf2140, 8(%vi1738)
	mov	%vi1750, %vi1701
	mov	%vi1751, %vi1702
	mov	%vi1752, %vi1703
	mov	%vi1753, %vi1704
	mov	%vi1754, %vi1705
	mov	%vi1755, %vi1706
	mov	%vi1756, %vi1707
	mov	%vi1757, %vi1708
	mov	%vi1758, %vi1709
	mov	%vi1759, %vi1710
	mov	%vi1760, %vi1751
	movi	%i31, 1
	jeq	%vi1760, %i31, then.11625
	movi	%i31, 2
	jeq	%vi1760, %i31, then.11626
	mov	%vi1801, %vi1701
	mov	%vi1802, %vi1702
	mov	%vi1803, %vi1703
	mov	%vi1804, %vi1704
	mov	%vi1805, %vi1705
	mov	%vi1806, %vi1706
	mov	%vi1807, %vi1707
	mov	%vi1808, %vi1708
	mov	%vi1809, %vi1709
	mov	%vi1810, %vi1710
	set_label	%vi1811, min_caml_isoutside_q
	mov	%i4, %vi1801
	mov	%i5, %vi1802
	mov	%i6, %vi1803
	mov	%i7, %vi1804
	mov	%i8, %vi1805
	mov	%i9, %vi1806
	mov	%i10, %vi1807
	mov	%i11, %vi1808
	mov	%i12, %vi1809
	mov	%i13, %vi1810
	mov	%i14, %vi1811
	call_dir	in_prod_sqr_obj.3480
	fmov	%vf2172, %f1
	mov	%i4, %vi1801
	mov	%i5, %vi1802
	mov	%i6, %vi1803
	mov	%i7, %vi1804
	mov	%i8, %vi1805
	mov	%i9, %vi1806
	mov	%i10, %vi1807
	mov	%i11, %vi1808
	mov	%i12, %vi1809
	mov	%i13, %vi1810
	call_dir	o_form.2403
	mov	%vi1813, %i4
	movi	%i31, 3
	jeq	%vi1813, %i31, then.11627
	fmov	%vf2174, %vf2172
	set_label	%i31, cont.11628
	jmp	%i0, 0(%i31)
then.11627:
	movui	%i31, 260096
	mif	%vf2173, %i31
	fsub	%vf2174, %vf2172, %vf2173
cont.11628:
	mov	%i4, %vi1801
	mov	%i5, %vi1802
	mov	%i6, %vi1803
	mov	%i7, %vi1804
	mov	%i8, %vi1805
	mov	%i9, %vi1806
	mov	%i10, %vi1807
	mov	%i11, %vi1808
	mov	%i12, %vi1809
	mov	%i13, %vi1810
	call_dir	o_isrot.2439
	mov	%vi1815, %i4
	mov	%vi1816, %i0
	jeq	%vi1815, %i0, then.11629
	set_label	%vi1817, min_caml_isoutside_q
	mov	%i4, %vi1801
	mov	%i5, %vi1802
	mov	%i6, %vi1803
	mov	%i7, %vi1804
	mov	%i8, %vi1805
	mov	%i9, %vi1806
	mov	%i10, %vi1807
	mov	%i11, %vi1808
	mov	%i12, %vi1809
	mov	%i13, %vi1810
	mov	%i14, %vi1817
	call_dir	in_prod_co_objrot.3499
	fmov	%vf2176, %f1
	fadd	%vf2177, %vf2174, %vf2176
	set_label	%i31, cont.11630
	jmp	%i0, 0(%i31)
then.11629:
	fmov	%vf2177, %vf2174
cont.11630:
	fmov	%vf2178, %f0
	fleq	%i31, %f0, %vf2177
	jzero	%i0, %i31, else.11631
	mov	%vi1818, %i0
	set_label	%i31, cont.11632
	jmp	%i0, 0(%i31)
else.11631:
	movi	%vi1818, 1
cont.11632:
	mov	%i4, %vi1801
	mov	%i5, %vi1802
	mov	%i6, %vi1803
	mov	%i7, %vi1804
	mov	%i8, %vi1805
	mov	%i9, %vi1806
	mov	%i10, %vi1807
	mov	%i11, %vi1808
	mov	%i12, %vi1809
	mov	%i13, %vi1810
	call_dir	o_isinvert.2427
	mov	%vi1820, %i4
	mov	%i4, %vi1820
	mov	%i5, %vi1818
	call_dir	xor.2381
	mov	%vi1822, %i4
	mov	%vi1823, %i0
	jeq	%vi1822, %i0, then.11633
	mov	%i4, %i0
	ret
then.11633:
	movi	%i4, 1
	ret
then.11626:
	mov	%vi1781, %vi1701
	mov	%vi1782, %vi1702
	mov	%vi1783, %vi1703
	mov	%vi1784, %vi1704
	mov	%vi1785, %vi1705
	mov	%vi1786, %vi1706
	mov	%vi1787, %vi1707
	mov	%vi1788, %vi1708
	mov	%vi1789, %vi1709
	mov	%vi1790, %vi1710
	mov	%i4, %vi1781
	mov	%i5, %vi1782
	mov	%i6, %vi1783
	mov	%i7, %vi1784
	mov	%i8, %vi1785
	mov	%i9, %vi1786
	mov	%i10, %vi1787
	mov	%i11, %vi1788
	mov	%i12, %vi1789
	mov	%i13, %vi1790
	call_dir	o_param_a.2451
	fmov	%vf2157, %f1
	set_label	%vi1791, min_caml_isoutside_q
	mov	%vi1792, %i0
	lf	%vf2158, 0(%vi1791)
	fmul	%vf2159, %vf2157, %vf2158
	mov	%i4, %vi1781
	mov	%i5, %vi1782
	mov	%i6, %vi1783
	mov	%i7, %vi1784
	mov	%i8, %vi1785
	mov	%i9, %vi1786
	mov	%i10, %vi1787
	mov	%i11, %vi1788
	mov	%i12, %vi1789
	mov	%i13, %vi1790
	call_dir	o_param_b.2464
	fmov	%vf2161, %f1
	set_label	%vi1793, min_caml_isoutside_q
	lf	%vf2162, 4(%vi1793)
	fmul	%vf2163, %vf2161, %vf2162
	fadd	%vf2164, %vf2159, %vf2163
	mov	%i4, %vi1781
	mov	%i5, %vi1782
	mov	%i6, %vi1783
	mov	%i7, %vi1784
	mov	%i8, %vi1785
	mov	%i9, %vi1786
	mov	%i10, %vi1787
	mov	%i11, %vi1788
	mov	%i12, %vi1789
	mov	%i13, %vi1790
	call_dir	o_param_c.2477
	fmov	%vf2166, %f1
	set_label	%vi1794, min_caml_isoutside_q
	lf	%vf2167, 8(%vi1794)
	fmul	%vf2168, %vf2166, %vf2167
	fadd	%vf2169, %vf2164, %vf2168
	fmov	%vf2170, %f0
	fleq	%i31, %f0, %vf2169
	jzero	%i0, %i31, else.11634
	mov	%vi1795, %i0
	set_label	%i31, cont.11635
	jmp	%i0, 0(%i31)
else.11634:
	movi	%vi1795, 1
cont.11635:
	mov	%i4, %vi1781
	mov	%i5, %vi1782
	mov	%i6, %vi1783
	mov	%i7, %vi1784
	mov	%i8, %vi1785
	mov	%i9, %vi1786
	mov	%i10, %vi1787
	mov	%i11, %vi1788
	mov	%i12, %vi1789
	mov	%i13, %vi1790
	call_dir	o_isinvert.2427
	mov	%vi1797, %i4
	mov	%i4, %vi1797
	mov	%i5, %vi1795
	call_dir	xor.2381
	mov	%vi1799, %i4
	mov	%vi1800, %i0
	jeq	%vi1799, %i0, then.11636
	mov	%i4, %i0
	ret
then.11636:
	movi	%i4, 1
	ret
then.11625:
	mov	%vi1761, %vi1701
	mov	%vi1762, %vi1702
	mov	%vi1763, %vi1703
	mov	%vi1764, %vi1704
	mov	%vi1765, %vi1705
	mov	%vi1766, %vi1706
	mov	%vi1767, %vi1707
	mov	%vi1768, %vi1708
	mov	%vi1769, %vi1709
	mov	%vi1770, %vi1710
	mov	%i4, %vi1761
	mov	%i5, %vi1762
	mov	%i6, %vi1763
	mov	%i7, %vi1764
	mov	%i8, %vi1765
	mov	%i9, %vi1766
	mov	%i10, %vi1767
	mov	%i11, %vi1768
	mov	%i12, %vi1769
	mov	%i13, %vi1770
	call_dir	o_param_a.2451
	fmov	%vf2142, %f1
	set_label	%vi1771, min_caml_isoutside_q
	mov	%vi1772, %i0
	lf	%vf2143, 0(%vi1771)
	fmov	%f1, %vf2143
	call_dir	min_caml_abs_float
	fmov	%vf2145, %f1
	fleq	%i31, %vf2142, %vf2145
	jzero	%i0, %i31, else.11637
	mov	%vi1775, %i0
	set_label	%i31, cont.11638
	jmp	%i0, 0(%i31)
else.11637:
	mov	%i4, %vi1761
	mov	%i5, %vi1762
	mov	%i6, %vi1763
	mov	%i7, %vi1764
	mov	%i8, %vi1765
	mov	%i9, %vi1766
	mov	%i10, %vi1767
	mov	%i11, %vi1768
	mov	%i12, %vi1769
	mov	%i13, %vi1770
	call_dir	o_param_b.2464
	fmov	%vf2147, %f1
	set_label	%vi1773, min_caml_isoutside_q
	lf	%vf2148, 4(%vi1773)
	fmov	%f1, %vf2148
	call_dir	min_caml_abs_float
	fmov	%vf2150, %f1
	fleq	%i31, %vf2147, %vf2150
	jzero	%i0, %i31, else.11639
	mov	%vi1775, %i0
	set_label	%i31, cont.11640
	jmp	%i0, 0(%i31)
else.11639:
	mov	%i4, %vi1761
	mov	%i5, %vi1762
	mov	%i6, %vi1763
	mov	%i7, %vi1764
	mov	%i8, %vi1765
	mov	%i9, %vi1766
	mov	%i10, %vi1767
	mov	%i11, %vi1768
	mov	%i12, %vi1769
	mov	%i13, %vi1770
	call_dir	o_param_c.2477
	fmov	%vf2152, %f1
	set_label	%vi1774, min_caml_isoutside_q
	lf	%vf2153, 8(%vi1774)
	fmov	%f1, %vf2153
	call_dir	min_caml_abs_float
	fmov	%vf2155, %f1
	fleq	%i31, %vf2152, %vf2155
	jzero	%i0, %i31, else.11641
	mov	%vi1775, %i0
	set_label	%i31, cont.11642
	jmp	%i0, 0(%i31)
else.11641:
	movi	%vi1775, 1
cont.11642:
cont.11640:
cont.11638:
	mov	%vi1776, %i0
	jeq	%vi1775, %i0, then.11643
	mov	%i4, %vi1761
	mov	%i5, %vi1762
	mov	%i6, %vi1763
	mov	%i7, %vi1764
	mov	%i8, %vi1765
	mov	%i9, %vi1766
	mov	%i10, %vi1767
	mov	%i11, %vi1768
	mov	%i12, %vi1769
	mov	%i13, %vi1770
	call_dir	o_isinvert.2427
	ret
then.11643:
	mov	%i4, %vi1761
	mov	%i5, %vi1762
	mov	%i6, %vi1763
	mov	%i7, %vi1764
	mov	%i8, %vi1765
	mov	%i9, %vi1766
	mov	%i10, %vi1767
	mov	%i11, %vi1768
	mov	%i12, %vi1769
	mov	%i13, %vi1770
	call_dir	o_isinvert.2427
	mov	%vi1778, %i4
	mov	%vi1779, %i0
	jeq	%vi1778, %i0, then.11644
	mov	%i4, %i0
	ret
then.11644:
	movi	%i4, 1
	ret
	.end_function
	.func_entry
check_all_inside.3767:
	mov	%vi1824, %i4
	mov	%vi1825, %i5
	movi	%vi1826, 1
	sub	%vi1827, %i0, %vi1826
loop_start.11019:
	slli	%vi1828, %vi1824, 2
	add	%i31, %vi1825, %vi1828
	lw	%vi1829, 0(%i31)
	jeq	%vi1829, %vi1827, then.11646
	set_label	%vi1831, min_caml_objects
	slli	%vi1832, %vi1829, 2
	add	%i31, %vi1831, %vi1832
	lw	%vi1833, 0(%i31)
	lw	%vi1834, 36(%vi1833)
	lw	%vi1835, 32(%vi1833)
	lw	%vi1836, 28(%vi1833)
	lw	%vi1837, 24(%vi1833)
	lw	%vi1838, 20(%vi1833)
	lw	%vi1839, 16(%vi1833)
	lw	%vi1840, 12(%vi1833)
	lw	%vi1841, 8(%vi1833)
	lw	%vi1842, 4(%vi1833)
	lw	%vi1843, 0(%vi1833)
	mov	%vi1844, %vi1843
	mov	%vi1845, %vi1842
	mov	%vi1846, %vi1841
	mov	%vi1847, %vi1840
	mov	%vi1848, %vi1839
	mov	%vi1849, %vi1838
	mov	%vi1850, %vi1837
	mov	%vi1851, %vi1836
	mov	%vi1852, %vi1835
	mov	%vi1853, %vi1834
	mov	%vi1854, %vi1844
	mov	%vi1855, %vi1845
	mov	%vi1856, %vi1846
	mov	%vi1857, %vi1847
	mov	%vi1858, %vi1848
	mov	%vi1859, %vi1849
	mov	%vi1860, %vi1850
	mov	%vi1861, %vi1851
	mov	%vi1862, %vi1852
	mov	%vi1863, %vi1853
	set_label	%vi1864, min_caml_isoutside_q
	mov	%vi1865, %i0
	set_label	%vi1866, min_caml_chkinside_p
	mov	%vi1867, %i0
	lf	%vf2179, 0(%vi1866)
	mov	%i4, %vi1854
	mov	%i5, %vi1855
	mov	%i6, %vi1856
	mov	%i7, %vi1857
	mov	%i8, %vi1858
	mov	%i9, %vi1859
	mov	%i10, %vi1860
	mov	%i11, %vi1861
	mov	%i12, %vi1862
	mov	%i13, %vi1863
	call_dir	o_param_x.2490
	fmov	%vf2181, %f1
	fsub	%vf2182, %vf2179, %vf2181
	sf	%vf2182, 0(%vi1864)
	set_label	%vi1868, min_caml_isoutside_q
	set_label	%vi1869, min_caml_chkinside_p
	lf	%vf2183, 4(%vi1869)
	mov	%i4, %vi1854
	mov	%i5, %vi1855
	mov	%i6, %vi1856
	mov	%i7, %vi1857
	mov	%i8, %vi1858
	mov	%i9, %vi1859
	mov	%i10, %vi1860
	mov	%i11, %vi1861
	mov	%i12, %vi1862
	mov	%i13, %vi1863
	call_dir	o_param_y.2503
	fmov	%vf2185, %f1
	fsub	%vf2186, %vf2183, %vf2185
	sf	%vf2186, 4(%vi1868)
	set_label	%vi1870, min_caml_isoutside_q
	set_label	%vi1871, min_caml_chkinside_p
	lf	%vf2187, 8(%vi1871)
	mov	%i4, %vi1854
	mov	%i5, %vi1855
	mov	%i6, %vi1856
	mov	%i7, %vi1857
	mov	%i8, %vi1858
	mov	%i9, %vi1859
	mov	%i10, %vi1860
	mov	%i11, %vi1861
	mov	%i12, %vi1862
	mov	%i13, %vi1863
	call_dir	o_param_z.2516
	fmov	%vf2189, %f1
	fsub	%vf2190, %vf2187, %vf2189
	sf	%vf2190, 8(%vi1870)
	mov	%i4, %vi1854
	mov	%i5, %vi1855
	mov	%i6, %vi1856
	mov	%i7, %vi1857
	mov	%i8, %vi1858
	mov	%i9, %vi1859
	mov	%i10, %vi1860
	mov	%i11, %vi1861
	mov	%i12, %vi1862
	mov	%i13, %vi1863
	call_dir	o_form.2403
	mov	%vi1873, %i4
	movi	%i31, 1
	jeq	%vi1873, %i31, then.11648
	movi	%i31, 2
	jeq	%vi1873, %i31, then.11650
	mov	%i4, %vi1854
	mov	%i5, %vi1855
	mov	%i6, %vi1856
	mov	%i7, %vi1857
	mov	%i8, %vi1858
	mov	%i9, %vi1859
	mov	%i10, %vi1860
	mov	%i11, %vi1861
	mov	%i12, %vi1862
	mov	%i13, %vi1863
	call_dir	is_second_outside.3720
	mov	%vi1877, %i4
	set_label	%i31, cont.11651
	jmp	%i0, 0(%i31)
then.11650:
	mov	%i4, %vi1854
	mov	%i5, %vi1855
	mov	%i6, %vi1856
	mov	%i7, %vi1857
	mov	%i8, %vi1858
	mov	%i9, %vi1859
	mov	%i10, %vi1860
	mov	%i11, %vi1861
	mov	%i12, %vi1862
	mov	%i13, %vi1863
	call_dir	is_plane_outside.3696
	mov	%vi1877, %i4
cont.11651:
	set_label	%i31, cont.11649
	jmp	%i0, 0(%i31)
then.11648:
	mov	%i4, %vi1854
	mov	%i5, %vi1855
	mov	%i6, %vi1856
	mov	%i7, %vi1857
	mov	%i8, %vi1858
	mov	%i9, %vi1859
	mov	%i10, %vi1860
	mov	%i11, %vi1861
	mov	%i12, %vi1862
	mov	%i13, %vi1863
	call_dir	is_rect_outside.3675
	mov	%vi1877, %i4
cont.11649:
	mov	%vi1878, %i0
	jeq	%vi1877, %i0, then.11652
	mov	%vi1882, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11020
	jmp	%i0, 0(%i30)
then.11652:
	addi	%vi1879, %vi1824, 1
	mov	%vi1880, %vi1879
	mov	%vi1881, %vi1825
	mov	%vi1824, %vi1880
	mov	%vi1825, %vi1881
cont.11653:
	set_label	%i31, cont.11647
	jmp	%i0, 0(%i31)
then.11646:
	movi	%vi1830, 1
	mov	%i31, %vi1830
	set_label	%i30, loop_end.11020
	jmp	%i0, 0(%i30)
cont.11647:
	set_label	%i30, loop_start.11019
	jmp	%i0, 0(%i30)
loop_end.11020:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
shadow_check_and_group.3779:
	mov	%vi1883, %i4
	mov	%vi1884, %i5
	mov	%vi1885, %i6
	movi	%vi1886, 1
	sub	%vi1887, %i0, %vi1886
loop_start.11025:
	slli	%vi1888, %vi1883, 2
	add	%i31, %vi1884, %vi1888
	lw	%vi1889, 0(%i31)
	jeq	%vi1889, %vi1887, then.11655
	slli	%vi1891, %vi1883, 2
	add	%i31, %vi1884, %vi1891
	lw	%vi1892, 0(%i31)
	set_label	%vi1893, min_caml_light
	mov	%vi1894, %vi1892
	mov	%vi1895, %vi1893
	mov	%vi1896, %vi1885
	set_label	%vi1897, min_caml_objects
	slli	%vi1898, %vi1894, 2
	add	%i31, %vi1897, %vi1898
	lw	%vi1899, 0(%i31)
	lw	%vi1900, 36(%vi1899)
	lw	%vi1901, 32(%vi1899)
	lw	%vi1902, 28(%vi1899)
	lw	%vi1903, 24(%vi1899)
	lw	%vi1904, 20(%vi1899)
	lw	%vi1905, 16(%vi1899)
	lw	%vi1906, 12(%vi1899)
	lw	%vi1907, 8(%vi1899)
	lw	%vi1908, 4(%vi1899)
	lw	%vi1909, 0(%vi1899)
	mov	%vi1910, %vi1909
	mov	%vi1911, %vi1908
	mov	%vi1912, %vi1907
	mov	%vi1913, %vi1906
	mov	%vi1914, %vi1905
	mov	%vi1915, %vi1904
	mov	%vi1916, %vi1903
	mov	%vi1917, %vi1902
	mov	%vi1918, %vi1901
	mov	%vi1919, %vi1900
	set_label	%vi1920, min_caml_solver_w_vec
	mov	%vi1921, %i0
	mov	%vi1922, %i0
	lf	%vf2191, 0(%vi1896)
	mov	%i4, %vi1909
	mov	%i5, %vi1908
	mov	%i6, %vi1907
	mov	%i7, %vi1906
	mov	%i8, %vi1905
	mov	%i9, %vi1904
	mov	%i10, %vi1903
	mov	%i11, %vi1902
	mov	%i12, %vi1901
	mov	%i13, %vi1900
	call_dir	o_param_x.2490
	fmov	%vf2193, %f1
	fsub	%vf2194, %vf2191, %vf2193
	sf	%vf2194, 0(%vi1920)
	set_label	%vi1923, min_caml_solver_w_vec
	lf	%vf2195, 4(%vi1896)
	mov	%i4, %vi1909
	mov	%i5, %vi1908
	mov	%i6, %vi1907
	mov	%i7, %vi1906
	mov	%i8, %vi1905
	mov	%i9, %vi1904
	mov	%i10, %vi1903
	mov	%i11, %vi1902
	mov	%i12, %vi1901
	mov	%i13, %vi1900
	call_dir	o_param_y.2503
	fmov	%vf2197, %f1
	fsub	%vf2198, %vf2195, %vf2197
	sf	%vf2198, 4(%vi1923)
	set_label	%vi1924, min_caml_solver_w_vec
	lf	%vf2199, 8(%vi1896)
	mov	%i4, %vi1909
	mov	%i5, %vi1908
	mov	%i6, %vi1907
	mov	%i7, %vi1906
	mov	%i8, %vi1905
	mov	%i9, %vi1904
	mov	%i10, %vi1903
	mov	%i11, %vi1902
	mov	%i12, %vi1901
	mov	%i13, %vi1900
	call_dir	o_param_z.2516
	fmov	%vf2201, %f1
	fsub	%vf2202, %vf2199, %vf2201
	sf	%vf2202, 8(%vi1924)
	mov	%i4, %vi1909
	mov	%i5, %vi1908
	mov	%i6, %vi1907
	mov	%i7, %vi1906
	mov	%i8, %vi1905
	mov	%i9, %vi1904
	mov	%i10, %vi1903
	mov	%i11, %vi1902
	mov	%i12, %vi1901
	mov	%i13, %vi1900
	call_dir	o_form.2403
	mov	%vi1926, %i4
	movi	%i31, 1
	jeq	%vi1926, %i31, then.11657
	movi	%i31, 2
	jeq	%vi1926, %i31, then.11659
	mov	%i4, %vi1909
	mov	%i5, %vi1908
	mov	%i6, %vi1907
	mov	%i7, %vi1906
	mov	%i8, %vi1905
	mov	%i9, %vi1904
	mov	%i10, %vi1903
	mov	%i11, %vi1902
	mov	%i12, %vi1901
	mov	%i13, %vi1900
	mov	%i14, %vi1895
	call_dir	solver_second.3601
	mov	%vi1930, %i4
	set_label	%i31, cont.11660
	jmp	%i0, 0(%i31)
then.11659:
	mov	%i4, %vi1909
	mov	%i5, %vi1908
	mov	%i6, %vi1907
	mov	%i7, %vi1906
	mov	%i8, %vi1905
	mov	%i9, %vi1904
	mov	%i10, %vi1903
	mov	%i11, %vi1902
	mov	%i12, %vi1901
	mov	%i13, %vi1900
	mov	%i14, %vi1895
	call_dir	solver_surface.3440
	mov	%vi1930, %i4
cont.11660:
	set_label	%i31, cont.11658
	jmp	%i0, 0(%i31)
then.11657:
	mov	%i4, %vi1909
	mov	%i5, %vi1908
	mov	%i6, %vi1907
	mov	%i7, %vi1906
	mov	%i8, %vi1905
	mov	%i9, %vi1904
	mov	%i10, %vi1903
	mov	%i11, %vi1902
	mov	%i12, %vi1901
	mov	%i13, %vi1900
	mov	%i14, %vi1895
	call_dir	solver_rect.3311
	mov	%vi1930, %i4
cont.11658:
	set_label	%vi1931, min_caml_solver_dist
	mov	%vi1932, %i0
	lf	%vf2203, 0(%vi1931)
	mov	%vi1933, %i0
	jeq	%vi1930, %i0, then.11661
	movui	%i31, 779469
	addi	%i31, %i31, -819
	mif	%vf2204, %i31
	fleq	%i31, %vf2204, %vf2203
	jzero	%i0, %i31, else.11663
	mov	%vi1934, %i0
	set_label	%i31, cont.11664
	jmp	%i0, 0(%i31)
else.11663:
	movi	%vi1934, 1
cont.11664:
	set_label	%i31, cont.11662
	jmp	%i0, 0(%i31)
then.11661:
	mov	%vi1934, %i0
cont.11662:
	mov	%vi1935, %i0
	jeq	%vi1934, %i0, then.11665
	movui	%i31, 246333
	addi	%i31, %i31, 1802
	mif	%vf2205, %i31
	fadd	%vf2206, %vf2203, %vf2205
	set_label	%vi1976, min_caml_chkinside_p
	mov	%vi1977, %i0
	set_label	%vi1978, min_caml_light
	mov	%vi1979, %i0
	lf	%vf2207, 0(%vi1978)
	fmul	%vf2208, %vf2207, %vf2206
	mov	%vi1980, %i0
	lf	%vf2209, 0(%vi1885)
	fadd	%vf2210, %vf2208, %vf2209
	sf	%vf2210, 0(%vi1976)
	set_label	%vi1981, min_caml_chkinside_p
	set_label	%vi1982, min_caml_light
	lf	%vf2211, 4(%vi1982)
	fmul	%vf2212, %vf2211, %vf2206
	lf	%vf2213, 4(%vi1885)
	fadd	%vf2214, %vf2212, %vf2213
	sf	%vf2214, 4(%vi1981)
	set_label	%vi1983, min_caml_chkinside_p
	set_label	%vi1984, min_caml_light
	lf	%vf2215, 8(%vi1984)
	fmul	%vf2216, %vf2215, %vf2206
	lf	%vf2217, 8(%vi1885)
	fadd	%vf2218, %vf2216, %vf2217
	sf	%vf2218, 8(%vi1983)
	mov	%vi1985, %i0
	mov	%vi1986, %i0
	mov	%vi1987, %vi1884
	movi	%vi1988, 1
	sub	%vi1989, %i0, %vi1988
loop_start.11030:
	slli	%vi1990, %vi1986, 2
	add	%i31, %vi1987, %vi1990
	lw	%vi1991, 0(%i31)
	jeq	%vi1991, %vi1989, then.11668
	set_label	%vi1993, min_caml_objects
	slli	%vi1994, %vi1991, 2
	add	%i31, %vi1993, %vi1994
	lw	%vi1995, 0(%i31)
	lw	%vi1996, 36(%vi1995)
	lw	%vi1997, 32(%vi1995)
	lw	%vi1998, 28(%vi1995)
	lw	%vi1999, 24(%vi1995)
	lw	%vi2000, 20(%vi1995)
	lw	%vi2001, 16(%vi1995)
	lw	%vi2002, 12(%vi1995)
	lw	%vi2003, 8(%vi1995)
	lw	%vi2004, 4(%vi1995)
	lw	%vi2005, 0(%vi1995)
	mov	%vi2006, %vi2005
	mov	%vi2007, %vi2004
	mov	%vi2008, %vi2003
	mov	%vi2009, %vi2002
	mov	%vi2010, %vi2001
	mov	%vi2011, %vi2000
	mov	%vi2012, %vi1999
	mov	%vi2013, %vi1998
	mov	%vi2014, %vi1997
	mov	%vi2015, %vi1996
	mov	%i4, %vi2005
	mov	%i5, %vi2004
	mov	%i6, %vi2003
	mov	%i7, %vi2002
	mov	%i8, %vi2001
	mov	%i9, %vi2000
	mov	%i10, %vi1999
	mov	%i11, %vi1998
	mov	%i12, %vi1997
	mov	%i13, %vi1996
	call_dir	is_outside.3738
	mov	%vi2017, %i4
	mov	%vi2018, %i0
	jeq	%vi2017, %i0, then.11670
	mov	%vi2022, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11031
	jmp	%i0, 0(%i30)
then.11670:
	addi	%vi2019, %vi1986, 1
	mov	%vi2020, %vi2019
	mov	%vi2021, %vi1987
	mov	%vi1986, %vi2020
	mov	%vi1987, %vi2021
cont.11671:
	set_label	%i31, cont.11669
	jmp	%i0, 0(%i31)
then.11668:
	movi	%vi1992, 1
	mov	%i31, %vi1992
	set_label	%i30, loop_end.11031
	jmp	%i0, 0(%i30)
cont.11669:
	set_label	%i30, loop_start.11030
	jmp	%i0, 0(%i30)
loop_end.11031:
	mov	%vi2023, %i31
	mov	%vi2024, %i0
	jeq	%vi2023, %i0, then.11672
	movi	%vi2029, 1
	mov	%i31, %vi2029
	set_label	%i30, loop_end.11026
	jmp	%i0, 0(%i30)
then.11672:
	addi	%vi2025, %vi1883, 1
	mov	%vi2026, %vi2025
	mov	%vi2027, %vi1884
	mov	%vi2028, %vi1885
	mov	%vi1883, %vi2026
	mov	%vi1884, %vi2027
	mov	%vi1885, %vi2028
cont.11673:
	set_label	%i31, cont.11666
	jmp	%i0, 0(%i31)
then.11665:
	set_label	%vi1936, min_caml_objects
	slli	%vi1937, %vi1892, 2
	add	%i31, %vi1936, %vi1937
	lw	%vi1938, 0(%i31)
	lw	%vi1939, 36(%vi1938)
	lw	%vi1940, 32(%vi1938)
	lw	%vi1941, 28(%vi1938)
	lw	%vi1942, 24(%vi1938)
	lw	%vi1943, 20(%vi1938)
	lw	%vi1944, 16(%vi1938)
	lw	%vi1945, 12(%vi1938)
	lw	%vi1946, 8(%vi1938)
	lw	%vi1947, 4(%vi1938)
	lw	%vi1948, 0(%vi1938)
	mov	%vi1949, %vi1948
	mov	%vi1950, %vi1947
	mov	%vi1951, %vi1946
	mov	%vi1952, %vi1945
	mov	%vi1953, %vi1944
	mov	%vi1954, %vi1943
	mov	%vi1955, %vi1942
	mov	%vi1956, %vi1941
	mov	%vi1957, %vi1940
	mov	%vi1958, %vi1939
	mov	%vi1959, %vi1949
	mov	%vi1960, %vi1950
	mov	%vi1961, %vi1951
	mov	%vi1962, %vi1952
	mov	%vi1963, %vi1953
	mov	%vi1964, %vi1954
	mov	%vi1965, %vi1955
	mov	%vi1966, %vi1956
	mov	%vi1967, %vi1957
	mov	%vi1968, %vi1958
	mov	%vi1969, %vi1965
	mov	%vi1970, %i0
	jeq	%vi1969, %i0, then.11674
	addi	%vi1972, %vi1883, 1
	mov	%vi1973, %vi1972
	mov	%vi1974, %vi1884
	mov	%vi1975, %vi1885
	mov	%vi1883, %vi1973
	mov	%vi1884, %vi1974
	mov	%vi1885, %vi1975
	set_label	%i31, cont.11675
	jmp	%i0, 0(%i31)
then.11674:
	mov	%vi1971, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11026
	jmp	%i0, 0(%i30)
cont.11675:
cont.11666:
	set_label	%i31, cont.11656
	jmp	%i0, 0(%i31)
then.11655:
	mov	%vi1890, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11026
	jmp	%i0, 0(%i30)
cont.11656:
	set_label	%i30, loop_start.11025
	jmp	%i0, 0(%i30)
loop_end.11026:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
shadow_check_one_or_group.3839:
	mov	%vi2030, %i4
	mov	%vi2031, %i5
	mov	%vi2032, %i6
	movi	%vi2033, 1
	sub	%vi2034, %i0, %vi2033
loop_start.11043:
	slli	%vi2035, %vi2030, 2
	add	%i31, %vi2031, %vi2035
	lw	%vi2036, 0(%i31)
	jeq	%vi2036, %vi2034, then.11677
	set_label	%vi2038, min_caml_and_net
	slli	%vi2039, %vi2036, 2
	add	%i31, %vi2038, %vi2039
	lw	%vi2040, 0(%i31)
	mov	%vi2041, %i0
	mov	%vi2042, %i0
	mov	%vi2043, %vi2040
	mov	%vi2044, %vi2032
	movi	%vi2045, 1
	sub	%vi2046, %i0, %vi2045
loop_start.11047:
	slli	%vi2047, %vi2042, 2
	add	%i31, %vi2043, %vi2047
	lw	%vi2048, 0(%i31)
	jeq	%vi2048, %vi2046, then.11680
	slli	%vi2050, %vi2042, 2
	add	%i31, %vi2043, %vi2050
	lw	%vi2051, 0(%i31)
	set_label	%vi2052, min_caml_light
	mov	%i4, %vi2051
	mov	%i5, %vi2052
	mov	%i6, %vi2044
	call_dir	solver.3645
	mov	%vi2054, %i4
	set_label	%vi2055, min_caml_solver_dist
	mov	%vi2056, %i0
	lf	%vf2219, 0(%vi2055)
	mov	%vi2057, %i0
	jeq	%vi2054, %i0, then.11682
	movui	%i31, 779469
	addi	%i31, %i31, -819
	mif	%vf2220, %i31
	fleq	%i31, %vf2220, %vf2219
	jzero	%i0, %i31, else.11684
	mov	%vi2058, %i0
	set_label	%i31, cont.11685
	jmp	%i0, 0(%i31)
else.11684:
	movi	%vi2058, 1
cont.11685:
	set_label	%i31, cont.11683
	jmp	%i0, 0(%i31)
then.11682:
	mov	%vi2058, %i0
cont.11683:
	mov	%vi2059, %i0
	jeq	%vi2058, %i0, then.11686
	movui	%i31, 246333
	addi	%i31, %i31, 1802
	mif	%vf2221, %i31
	fadd	%vf2222, %vf2219, %vf2221
	set_label	%vi2091, min_caml_chkinside_p
	mov	%vi2092, %i0
	set_label	%vi2093, min_caml_light
	mov	%vi2094, %i0
	lf	%vf2223, 0(%vi2093)
	fmul	%vf2224, %vf2223, %vf2222
	mov	%vi2095, %i0
	lf	%vf2225, 0(%vi2044)
	fadd	%vf2226, %vf2224, %vf2225
	sf	%vf2226, 0(%vi2091)
	set_label	%vi2096, min_caml_chkinside_p
	set_label	%vi2097, min_caml_light
	lf	%vf2227, 4(%vi2097)
	fmul	%vf2228, %vf2227, %vf2222
	lf	%vf2229, 4(%vi2044)
	fadd	%vf2230, %vf2228, %vf2229
	sf	%vf2230, 4(%vi2096)
	set_label	%vi2098, min_caml_chkinside_p
	set_label	%vi2099, min_caml_light
	lf	%vf2231, 8(%vi2099)
	fmul	%vf2232, %vf2231, %vf2222
	lf	%vf2233, 8(%vi2044)
	fadd	%vf2234, %vf2232, %vf2233
	sf	%vf2234, 8(%vi2098)
	mov	%vi2100, %i0
	mov	%i4, %i0
	mov	%i5, %vi2043
	call_dir	check_all_inside.3767
	mov	%vi2102, %i4
	mov	%vi2103, %i0
	jeq	%vi2102, %i0, then.11688
	movi	%vi2108, 1
	mov	%i31, %vi2108
	set_label	%i30, loop_end.11048
	jmp	%i0, 0(%i30)
then.11688:
	addi	%vi2104, %vi2042, 1
	mov	%vi2105, %vi2104
	mov	%vi2106, %vi2043
	mov	%vi2107, %vi2044
	mov	%vi2042, %vi2105
	mov	%vi2043, %vi2106
	mov	%vi2044, %vi2107
cont.11689:
	set_label	%i31, cont.11687
	jmp	%i0, 0(%i31)
then.11686:
	set_label	%vi2060, min_caml_objects
	slli	%vi2061, %vi2051, 2
	add	%i31, %vi2060, %vi2061
	lw	%vi2062, 0(%i31)
	lw	%vi2063, 36(%vi2062)
	lw	%vi2064, 32(%vi2062)
	lw	%vi2065, 28(%vi2062)
	lw	%vi2066, 24(%vi2062)
	lw	%vi2067, 20(%vi2062)
	lw	%vi2068, 16(%vi2062)
	lw	%vi2069, 12(%vi2062)
	lw	%vi2070, 8(%vi2062)
	lw	%vi2071, 4(%vi2062)
	lw	%vi2072, 0(%vi2062)
	mov	%vi2073, %vi2072
	mov	%vi2074, %vi2071
	mov	%vi2075, %vi2070
	mov	%vi2076, %vi2069
	mov	%vi2077, %vi2068
	mov	%vi2078, %vi2067
	mov	%vi2079, %vi2066
	mov	%vi2080, %vi2065
	mov	%vi2081, %vi2064
	mov	%vi2082, %vi2063
	mov	%i4, %vi2072
	mov	%i5, %vi2071
	mov	%i6, %vi2070
	mov	%i7, %vi2069
	mov	%i8, %vi2068
	mov	%i9, %vi2067
	mov	%i10, %vi2066
	mov	%i11, %vi2065
	mov	%i12, %vi2064
	mov	%i13, %vi2063
	call_dir	o_isinvert.2427
	mov	%vi2084, %i4
	mov	%vi2085, %i0
	jeq	%vi2084, %i0, then.11690
	addi	%vi2087, %vi2042, 1
	mov	%vi2088, %vi2087
	mov	%vi2089, %vi2043
	mov	%vi2090, %vi2044
	mov	%vi2042, %vi2088
	mov	%vi2043, %vi2089
	mov	%vi2044, %vi2090
	set_label	%i31, cont.11691
	jmp	%i0, 0(%i31)
then.11690:
	mov	%vi2086, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11048
	jmp	%i0, 0(%i30)
cont.11691:
cont.11687:
	set_label	%i31, cont.11681
	jmp	%i0, 0(%i31)
then.11680:
	mov	%vi2049, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11048
	jmp	%i0, 0(%i30)
cont.11681:
	set_label	%i30, loop_start.11047
	jmp	%i0, 0(%i30)
loop_end.11048:
	mov	%vi2109, %i31
	mov	%vi2110, %i0
	jeq	%vi2109, %i0, then.11692
	movi	%vi2115, 1
	mov	%i31, %vi2115
	set_label	%i30, loop_end.11044
	jmp	%i0, 0(%i30)
then.11692:
	addi	%vi2111, %vi2030, 1
	mov	%vi2112, %vi2111
	mov	%vi2113, %vi2031
	mov	%vi2114, %vi2032
	mov	%vi2030, %vi2112
	mov	%vi2031, %vi2113
	mov	%vi2032, %vi2114
cont.11693:
	set_label	%i31, cont.11678
	jmp	%i0, 0(%i31)
then.11677:
	mov	%vi2037, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11044
	jmp	%i0, 0(%i30)
cont.11678:
	set_label	%i30, loop_start.11043
	jmp	%i0, 0(%i30)
loop_end.11044:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
shadow_check_one_or_matrix.3853:
	mov	%vi2116, %i4
	mov	%vi2117, %i5
	mov	%vi2118, %i6
	mov	%vi2119, %i0
	movi	%vi2120, 1
	sub	%vi2121, %i0, %vi2120
loop_start.11061:
	slli	%vi2122, %vi2116, 2
	add	%i31, %vi2117, %vi2122
	lw	%vi2123, 0(%i31)
	lw	%vi2124, 0(%vi2123)
	jeq	%vi2124, %vi2121, then.11695
	movi	%i31, 99
	jeq	%vi2124, %i31, then.11697
	set_label	%vi2154, min_caml_light
	mov	%vi2155, %vi2124
	mov	%vi2156, %vi2154
	mov	%vi2157, %vi2118
	set_label	%vi2158, min_caml_objects
	slli	%vi2159, %vi2155, 2
	add	%i31, %vi2158, %vi2159
	lw	%vi2160, 0(%i31)
	lw	%vi2161, 36(%vi2160)
	lw	%vi2162, 32(%vi2160)
	lw	%vi2163, 28(%vi2160)
	lw	%vi2164, 24(%vi2160)
	lw	%vi2165, 20(%vi2160)
	lw	%vi2166, 16(%vi2160)
	lw	%vi2167, 12(%vi2160)
	lw	%vi2168, 8(%vi2160)
	lw	%vi2169, 4(%vi2160)
	lw	%vi2170, 0(%vi2160)
	mov	%vi2171, %vi2170
	mov	%vi2172, %vi2169
	mov	%vi2173, %vi2168
	mov	%vi2174, %vi2167
	mov	%vi2175, %vi2166
	mov	%vi2176, %vi2165
	mov	%vi2177, %vi2164
	mov	%vi2178, %vi2163
	mov	%vi2179, %vi2162
	mov	%vi2180, %vi2161
	set_label	%vi2181, min_caml_solver_w_vec
	mov	%vi2182, %i0
	mov	%vi2183, %i0
	lf	%vf2235, 0(%vi2157)
	mov	%i4, %vi2170
	mov	%i5, %vi2169
	mov	%i6, %vi2168
	mov	%i7, %vi2167
	mov	%i8, %vi2166
	mov	%i9, %vi2165
	mov	%i10, %vi2164
	mov	%i11, %vi2163
	mov	%i12, %vi2162
	mov	%i13, %vi2161
	call_dir	o_param_x.2490
	fmov	%vf2237, %f1
	fsub	%vf2238, %vf2235, %vf2237
	sf	%vf2238, 0(%vi2181)
	set_label	%vi2184, min_caml_solver_w_vec
	lf	%vf2239, 4(%vi2157)
	mov	%i4, %vi2170
	mov	%i5, %vi2169
	mov	%i6, %vi2168
	mov	%i7, %vi2167
	mov	%i8, %vi2166
	mov	%i9, %vi2165
	mov	%i10, %vi2164
	mov	%i11, %vi2163
	mov	%i12, %vi2162
	mov	%i13, %vi2161
	call_dir	o_param_y.2503
	fmov	%vf2241, %f1
	fsub	%vf2242, %vf2239, %vf2241
	sf	%vf2242, 4(%vi2184)
	set_label	%vi2185, min_caml_solver_w_vec
	lf	%vf2243, 8(%vi2157)
	mov	%i4, %vi2170
	mov	%i5, %vi2169
	mov	%i6, %vi2168
	mov	%i7, %vi2167
	mov	%i8, %vi2166
	mov	%i9, %vi2165
	mov	%i10, %vi2164
	mov	%i11, %vi2163
	mov	%i12, %vi2162
	mov	%i13, %vi2161
	call_dir	o_param_z.2516
	fmov	%vf2245, %f1
	fsub	%vf2246, %vf2243, %vf2245
	sf	%vf2246, 8(%vi2185)
	mov	%i4, %vi2170
	mov	%i5, %vi2169
	mov	%i6, %vi2168
	mov	%i7, %vi2167
	mov	%i8, %vi2166
	mov	%i9, %vi2165
	mov	%i10, %vi2164
	mov	%i11, %vi2163
	mov	%i12, %vi2162
	mov	%i13, %vi2161
	call_dir	o_form.2403
	mov	%vi2187, %i4
	movi	%i31, 1
	jeq	%vi2187, %i31, then.11699
	movi	%i31, 2
	jeq	%vi2187, %i31, then.11701
	mov	%i4, %vi2170
	mov	%i5, %vi2169
	mov	%i6, %vi2168
	mov	%i7, %vi2167
	mov	%i8, %vi2166
	mov	%i9, %vi2165
	mov	%i10, %vi2164
	mov	%i11, %vi2163
	mov	%i12, %vi2162
	mov	%i13, %vi2161
	mov	%i14, %vi2156
	call_dir	solver_second.3601
	mov	%vi2191, %i4
	set_label	%i31, cont.11702
	jmp	%i0, 0(%i31)
then.11701:
	mov	%i4, %vi2170
	mov	%i5, %vi2169
	mov	%i6, %vi2168
	mov	%i7, %vi2167
	mov	%i8, %vi2166
	mov	%i9, %vi2165
	mov	%i10, %vi2164
	mov	%i11, %vi2163
	mov	%i12, %vi2162
	mov	%i13, %vi2161
	mov	%i14, %vi2156
	call_dir	solver_surface.3440
	mov	%vi2191, %i4
cont.11702:
	set_label	%i31, cont.11700
	jmp	%i0, 0(%i31)
then.11699:
	mov	%i4, %vi2170
	mov	%i5, %vi2169
	mov	%i6, %vi2168
	mov	%i7, %vi2167
	mov	%i8, %vi2166
	mov	%i9, %vi2165
	mov	%i10, %vi2164
	mov	%i11, %vi2163
	mov	%i12, %vi2162
	mov	%i13, %vi2161
	mov	%i14, %vi2156
	call_dir	solver_rect.3311
	mov	%vi2191, %i4
cont.11700:
	mov	%vi2192, %i0
	jeq	%vi2191, %i0, then.11703
	movui	%i31, 777421
	addi	%i31, %i31, -819
	mif	%vf2247, %i31
	set_label	%vi2197, min_caml_solver_dist
	mov	%vi2198, %i0
	lf	%vf2248, 0(%vi2197)
	fleq	%i31, %vf2247, %vf2248
	jzero	%i0, %i31, else.11705
	addi	%vi2199, %vi2116, 1
	mov	%vi2200, %vi2199
	mov	%vi2201, %vi2117
	mov	%vi2202, %vi2118
	mov	%vi2116, %vi2200
	mov	%vi2117, %vi2201
	mov	%vi2118, %vi2202
	set_label	%i31, cont.11706
	jmp	%i0, 0(%i31)
else.11705:
	movi	%vi2203, 1
	mov	%vi2204, %vi2203
	mov	%vi2205, %vi2123
	mov	%vi2206, %vi2118
	movi	%vi2207, 1
	sub	%vi2208, %i0, %vi2207
loop_start.11065:
	slli	%vi2209, %vi2204, 2
	add	%i31, %vi2205, %vi2209
	lw	%vi2210, 0(%i31)
	jeq	%vi2210, %vi2208, then.11708
	set_label	%vi2212, min_caml_and_net
	slli	%vi2213, %vi2210, 2
	add	%i31, %vi2212, %vi2213
	lw	%vi2214, 0(%i31)
	mov	%vi2215, %i0
	mov	%i4, %i0
	mov	%i5, %vi2214
	mov	%i6, %vi2206
	call_dir	shadow_check_and_group.3779
	mov	%vi2217, %i4
	mov	%vi2218, %i0
	jeq	%vi2217, %i0, then.11710
	movi	%vi2223, 1
	mov	%i31, %vi2223
	set_label	%i30, loop_end.11066
	jmp	%i0, 0(%i30)
then.11710:
	addi	%vi2219, %vi2204, 1
	mov	%vi2220, %vi2219
	mov	%vi2221, %vi2205
	mov	%vi2222, %vi2206
	mov	%vi2204, %vi2220
	mov	%vi2205, %vi2221
	mov	%vi2206, %vi2222
cont.11711:
	set_label	%i31, cont.11709
	jmp	%i0, 0(%i31)
then.11708:
	mov	%vi2211, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11066
	jmp	%i0, 0(%i30)
cont.11709:
	set_label	%i30, loop_start.11065
	jmp	%i0, 0(%i30)
loop_end.11066:
	mov	%vi2224, %i31
	mov	%vi2225, %i0
	jeq	%vi2224, %i0, then.11712
	movi	%vi2230, 1
	mov	%i31, %vi2230
	set_label	%i30, loop_end.11062
	jmp	%i0, 0(%i30)
then.11712:
	addi	%vi2226, %vi2116, 1
	mov	%vi2227, %vi2226
	mov	%vi2228, %vi2117
	mov	%vi2229, %vi2118
	mov	%vi2116, %vi2227
	mov	%vi2117, %vi2228
	mov	%vi2118, %vi2229
cont.11713:
cont.11706:
	set_label	%i31, cont.11704
	jmp	%i0, 0(%i31)
then.11703:
	addi	%vi2193, %vi2116, 1
	mov	%vi2194, %vi2193
	mov	%vi2195, %vi2117
	mov	%vi2196, %vi2118
	mov	%vi2116, %vi2194
	mov	%vi2117, %vi2195
	mov	%vi2118, %vi2196
cont.11704:
	set_label	%i31, cont.11698
	jmp	%i0, 0(%i31)
then.11697:
	movi	%vi2126, 1
	mov	%vi2127, %vi2126
	mov	%vi2128, %vi2123
	mov	%vi2129, %vi2118
	movi	%vi2130, 1
	sub	%vi2131, %i0, %vi2130
loop_start.11081:
	slli	%vi2132, %vi2127, 2
	add	%i31, %vi2128, %vi2132
	lw	%vi2133, 0(%i31)
	jeq	%vi2133, %vi2131, then.11715
	set_label	%vi2135, min_caml_and_net
	slli	%vi2136, %vi2133, 2
	add	%i31, %vi2135, %vi2136
	lw	%vi2137, 0(%i31)
	mov	%vi2138, %i0
	mov	%i4, %i0
	mov	%i5, %vi2137
	mov	%i6, %vi2129
	call_dir	shadow_check_and_group.3779
	mov	%vi2140, %i4
	mov	%vi2141, %i0
	jeq	%vi2140, %i0, then.11717
	movi	%vi2146, 1
	mov	%i31, %vi2146
	set_label	%i30, loop_end.11082
	jmp	%i0, 0(%i30)
then.11717:
	addi	%vi2142, %vi2127, 1
	mov	%vi2143, %vi2142
	mov	%vi2144, %vi2128
	mov	%vi2145, %vi2129
	mov	%vi2127, %vi2143
	mov	%vi2128, %vi2144
	mov	%vi2129, %vi2145
cont.11718:
	set_label	%i31, cont.11716
	jmp	%i0, 0(%i31)
then.11715:
	mov	%vi2134, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11082
	jmp	%i0, 0(%i30)
cont.11716:
	set_label	%i30, loop_start.11081
	jmp	%i0, 0(%i30)
loop_end.11082:
	mov	%vi2147, %i31
	mov	%vi2148, %i0
	jeq	%vi2147, %i0, then.11719
	movi	%vi2153, 1
	mov	%i31, %vi2153
	set_label	%i30, loop_end.11062
	jmp	%i0, 0(%i30)
then.11719:
	addi	%vi2149, %vi2116, 1
	mov	%vi2150, %vi2149
	mov	%vi2151, %vi2117
	mov	%vi2152, %vi2118
	mov	%vi2116, %vi2150
	mov	%vi2117, %vi2151
	mov	%vi2118, %vi2152
cont.11720:
cont.11698:
	set_label	%i31, cont.11696
	jmp	%i0, 0(%i31)
then.11695:
	mov	%vi2125, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11062
	jmp	%i0, 0(%i30)
cont.11696:
	set_label	%i30, loop_start.11061
	jmp	%i0, 0(%i30)
loop_end.11062:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
solve_each_element.3884:
	mov	%vi2231, %i4
	mov	%vi2232, %i5
	movi	%vi2233, 1
	sub	%vi2234, %i0, %vi2233
loop_start.11091:
	slli	%vi2235, %vi2231, 2
	add	%i31, %vi2232, %vi2235
	lw	%vi2236, 0(%i31)
	jeq	%vi2236, %vi2234, then.11722
	set_label	%vi2237, min_caml_vscan
	set_label	%vi2238, min_caml_viewpoint
	mov	%vi2239, %vi2236
	mov	%vi2240, %vi2237
	mov	%vi2241, %vi2238
	set_label	%vi2242, min_caml_objects
	slli	%vi2243, %vi2239, 2
	add	%i31, %vi2242, %vi2243
	lw	%vi2244, 0(%i31)
	lw	%vi2245, 36(%vi2244)
	lw	%vi2246, 32(%vi2244)
	lw	%vi2247, 28(%vi2244)
	lw	%vi2248, 24(%vi2244)
	lw	%vi2249, 20(%vi2244)
	lw	%vi2250, 16(%vi2244)
	lw	%vi2251, 12(%vi2244)
	lw	%vi2252, 8(%vi2244)
	lw	%vi2253, 4(%vi2244)
	lw	%vi2254, 0(%vi2244)
	mov	%vi2255, %vi2254
	mov	%vi2256, %vi2253
	mov	%vi2257, %vi2252
	mov	%vi2258, %vi2251
	mov	%vi2259, %vi2250
	mov	%vi2260, %vi2249
	mov	%vi2261, %vi2248
	mov	%vi2262, %vi2247
	mov	%vi2263, %vi2246
	mov	%vi2264, %vi2245
	set_label	%vi2265, min_caml_solver_w_vec
	mov	%vi2266, %i0
	mov	%vi2267, %i0
	lf	%vf2249, 0(%vi2241)
	mov	%i4, %vi2254
	mov	%i5, %vi2253
	mov	%i6, %vi2252
	mov	%i7, %vi2251
	mov	%i8, %vi2250
	mov	%i9, %vi2249
	mov	%i10, %vi2248
	mov	%i11, %vi2247
	mov	%i12, %vi2246
	mov	%i13, %vi2245
	call_dir	o_param_x.2490
	fmov	%vf2251, %f1
	fsub	%vf2252, %vf2249, %vf2251
	sf	%vf2252, 0(%vi2265)
	set_label	%vi2268, min_caml_solver_w_vec
	lf	%vf2253, 4(%vi2241)
	mov	%i4, %vi2254
	mov	%i5, %vi2253
	mov	%i6, %vi2252
	mov	%i7, %vi2251
	mov	%i8, %vi2250
	mov	%i9, %vi2249
	mov	%i10, %vi2248
	mov	%i11, %vi2247
	mov	%i12, %vi2246
	mov	%i13, %vi2245
	call_dir	o_param_y.2503
	fmov	%vf2255, %f1
	fsub	%vf2256, %vf2253, %vf2255
	sf	%vf2256, 4(%vi2268)
	set_label	%vi2269, min_caml_solver_w_vec
	lf	%vf2257, 8(%vi2241)
	mov	%i4, %vi2254
	mov	%i5, %vi2253
	mov	%i6, %vi2252
	mov	%i7, %vi2251
	mov	%i8, %vi2250
	mov	%i9, %vi2249
	mov	%i10, %vi2248
	mov	%i11, %vi2247
	mov	%i12, %vi2246
	mov	%i13, %vi2245
	call_dir	o_param_z.2516
	fmov	%vf2259, %f1
	fsub	%vf2260, %vf2257, %vf2259
	sf	%vf2260, 8(%vi2269)
	mov	%i4, %vi2254
	mov	%i5, %vi2253
	mov	%i6, %vi2252
	mov	%i7, %vi2251
	mov	%i8, %vi2250
	mov	%i9, %vi2249
	mov	%i10, %vi2248
	mov	%i11, %vi2247
	mov	%i12, %vi2246
	mov	%i13, %vi2245
	call_dir	o_form.2403
	mov	%vi2271, %i4
	movi	%i31, 1
	jeq	%vi2271, %i31, then.11724
	movi	%i31, 2
	jeq	%vi2271, %i31, then.11726
	mov	%i4, %vi2254
	mov	%i5, %vi2253
	mov	%i6, %vi2252
	mov	%i7, %vi2251
	mov	%i8, %vi2250
	mov	%i9, %vi2249
	mov	%i10, %vi2248
	mov	%i11, %vi2247
	mov	%i12, %vi2246
	mov	%i13, %vi2245
	mov	%i14, %vi2240
	call_dir	solver_second.3601
	mov	%vi2275, %i4
	set_label	%i31, cont.11727
	jmp	%i0, 0(%i31)
then.11726:
	mov	%i4, %vi2254
	mov	%i5, %vi2253
	mov	%i6, %vi2252
	mov	%i7, %vi2251
	mov	%i8, %vi2250
	mov	%i9, %vi2249
	mov	%i10, %vi2248
	mov	%i11, %vi2247
	mov	%i12, %vi2246
	mov	%i13, %vi2245
	mov	%i14, %vi2240
	call_dir	solver_surface.3440
	mov	%vi2275, %i4
cont.11727:
	set_label	%i31, cont.11725
	jmp	%i0, 0(%i31)
then.11724:
	mov	%i4, %vi2254
	mov	%i5, %vi2253
	mov	%i6, %vi2252
	mov	%i7, %vi2251
	mov	%i8, %vi2250
	mov	%i9, %vi2249
	mov	%i10, %vi2248
	mov	%i11, %vi2247
	mov	%i12, %vi2246
	mov	%i13, %vi2245
	mov	%i14, %vi2240
	call_dir	solver_rect.3311
	mov	%vi2275, %i4
cont.11725:
	mov	%vi2276, %i0
	jeq	%vi2275, %i0, then.11728
	set_label	%vi2315, min_caml_solver_dist
	mov	%vi2316, %i0
	lf	%vf2261, 0(%vi2315)
	movui	%i31, 777421
	addi	%i31, %i31, -819
	mif	%vf2262, %i31
	fleq	%i31, %vf2261, %vf2262
	ceqi	%i31, %i31, 0
	jzero	%i0, %i31, cont.11730
	set_label	%vi2317, min_caml_tmin
	mov	%vi2318, %i0
	lf	%vf2263, 0(%vi2317)
	fleq	%i31, %vf2263, %vf2261
	ceqi	%i31, %i31, 0
	jzero	%i0, %i31, cont.11731
	movui	%i31, 246333
	addi	%i31, %i31, 1802
	mif	%vf2264, %i31
	fadd	%vf2265, %vf2261, %vf2264
	set_label	%vi2319, min_caml_chkinside_p
	mov	%vi2320, %i0
	set_label	%vi2321, min_caml_vscan
	mov	%vi2322, %i0
	lf	%vf2266, 0(%vi2321)
	fmul	%vf2267, %vf2266, %vf2265
	set_label	%vi2323, min_caml_viewpoint
	mov	%vi2324, %i0
	lf	%vf2268, 0(%vi2323)
	fadd	%vf2269, %vf2267, %vf2268
	sf	%vf2269, 0(%vi2319)
	set_label	%vi2325, min_caml_chkinside_p
	set_label	%vi2326, min_caml_vscan
	lf	%vf2270, 4(%vi2326)
	fmul	%vf2271, %vf2270, %vf2265
	set_label	%vi2327, min_caml_viewpoint
	lf	%vf2272, 4(%vi2327)
	fadd	%vf2273, %vf2271, %vf2272
	sf	%vf2273, 4(%vi2325)
	set_label	%vi2328, min_caml_chkinside_p
	set_label	%vi2329, min_caml_vscan
	lf	%vf2274, 8(%vi2329)
	fmul	%vf2275, %vf2274, %vf2265
	set_label	%vi2330, min_caml_viewpoint
	lf	%vf2276, 8(%vi2330)
	fadd	%vf2277, %vf2275, %vf2276
	sf	%vf2277, 8(%vi2328)
	mov	%vi2331, %i0
	mov	%vi2332, %i0
	mov	%vi2333, %vi2232
	movi	%vi2334, 1
	sub	%vi2335, %i0, %vi2334
loop_start.11095:
	slli	%vi2336, %vi2332, 2
	add	%i31, %vi2333, %vi2336
	lw	%vi2337, 0(%i31)
	jeq	%vi2337, %vi2335, then.11733
	set_label	%vi2339, min_caml_objects
	slli	%vi2340, %vi2337, 2
	add	%i31, %vi2339, %vi2340
	lw	%vi2341, 0(%i31)
	lw	%vi2342, 36(%vi2341)
	lw	%vi2343, 32(%vi2341)
	lw	%vi2344, 28(%vi2341)
	lw	%vi2345, 24(%vi2341)
	lw	%vi2346, 20(%vi2341)
	lw	%vi2347, 16(%vi2341)
	lw	%vi2348, 12(%vi2341)
	lw	%vi2349, 8(%vi2341)
	lw	%vi2350, 4(%vi2341)
	lw	%vi2351, 0(%vi2341)
	mov	%vi2352, %vi2351
	mov	%vi2353, %vi2350
	mov	%vi2354, %vi2349
	mov	%vi2355, %vi2348
	mov	%vi2356, %vi2347
	mov	%vi2357, %vi2346
	mov	%vi2358, %vi2345
	mov	%vi2359, %vi2344
	mov	%vi2360, %vi2343
	mov	%vi2361, %vi2342
	mov	%i4, %vi2351
	mov	%i5, %vi2350
	mov	%i6, %vi2349
	mov	%i7, %vi2348
	mov	%i8, %vi2347
	mov	%i9, %vi2346
	mov	%i10, %vi2345
	mov	%i11, %vi2344
	mov	%i12, %vi2343
	mov	%i13, %vi2342
	call_dir	is_outside.3738
	mov	%vi2363, %i4
	mov	%vi2364, %i0
	jeq	%vi2363, %i0, then.11735
	mov	%vi2368, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11096
	jmp	%i0, 0(%i30)
then.11735:
	addi	%vi2365, %vi2332, 1
	mov	%vi2366, %vi2365
	mov	%vi2367, %vi2333
	mov	%vi2332, %vi2366
	mov	%vi2333, %vi2367
cont.11736:
	set_label	%i31, cont.11734
	jmp	%i0, 0(%i31)
then.11733:
	movi	%vi2338, 1
	mov	%i31, %vi2338
	set_label	%i30, loop_end.11096
	jmp	%i0, 0(%i30)
cont.11734:
	set_label	%i30, loop_start.11095
	jmp	%i0, 0(%i30)
loop_end.11096:
	mov	%vi2369, %i31
	mov	%vi2370, %i0
	jeq	%vi2369, %i0, cont.11737
	set_label	%vi2371, min_caml_tmin
	mov	%vi2372, %i0
	sf	%vf2265, 0(%vi2371)
	set_label	%vi2373, min_caml_crashed_point
	mov	%vi2374, %i0
	set_label	%vi2375, min_caml_chkinside_p
	mov	%vi2376, %i0
	lf	%vf2278, 0(%vi2375)
	sf	%vf2278, 0(%vi2373)
	set_label	%vi2377, min_caml_crashed_point
	set_label	%vi2378, min_caml_chkinside_p
	lf	%vf2279, 4(%vi2378)
	sf	%vf2279, 4(%vi2377)
	set_label	%vi2379, min_caml_crashed_point
	set_label	%vi2380, min_caml_chkinside_p
	lf	%vf2280, 8(%vi2380)
	sf	%vf2280, 8(%vi2379)
	set_label	%vi2381, min_caml_intsec_rectside
	mov	%vi2382, %i0
	sw	%vi2275, 0(%vi2381)
	set_label	%vi2383, min_caml_crashed_object
	mov	%vi2384, %i0
	sw	%vi2236, 0(%vi2383)
cont.11737:
cont.11731:
cont.11730:
	set_label	%i31, cont.11729
	jmp	%i0, 0(%i31)
then.11728:
	set_label	%vi2277, min_caml_objects
	slli	%vi2278, %vi2236, 2
	add	%i31, %vi2277, %vi2278
	lw	%vi2279, 0(%i31)
	lw	%vi2280, 36(%vi2279)
	lw	%vi2281, 32(%vi2279)
	lw	%vi2282, 28(%vi2279)
	lw	%vi2283, 24(%vi2279)
	lw	%vi2284, 20(%vi2279)
	lw	%vi2285, 16(%vi2279)
	lw	%vi2286, 12(%vi2279)
	lw	%vi2287, 8(%vi2279)
	lw	%vi2288, 4(%vi2279)
	lw	%vi2289, 0(%vi2279)
	mov	%vi2290, %vi2289
	mov	%vi2291, %vi2288
	mov	%vi2292, %vi2287
	mov	%vi2293, %vi2286
	mov	%vi2294, %vi2285
	mov	%vi2295, %vi2284
	mov	%vi2296, %vi2283
	mov	%vi2297, %vi2282
	mov	%vi2298, %vi2281
	mov	%vi2299, %vi2280
	mov	%vi2300, %vi2290
	mov	%vi2301, %vi2291
	mov	%vi2302, %vi2292
	mov	%vi2303, %vi2293
	mov	%vi2304, %vi2294
	mov	%vi2305, %vi2295
	mov	%vi2306, %vi2296
	mov	%vi2307, %vi2297
	mov	%vi2308, %vi2298
	mov	%vi2309, %vi2299
	mov	%vi2310, %vi2306
	mov	%vi2311, %i0
	ceqi	%i31, %vi2310, 0
	jzero	%i0, %i31, cont.11738
	set_label	%vi2312, min_caml_end_flag
	mov	%vi2313, %i0
	movi	%vi2314, 1
	sw	%vi2314, 0(%vi2312)
cont.11738:
cont.11729:
	set_label	%vi2385, min_caml_end_flag
	mov	%vi2386, %i0
	lw	%vi2387, 0(%vi2385)
	mov	%vi2388, %i0
	jeq	%vi2387, %i0, then.11739
	mov	%i31, %i0
	set_label	%i30, loop_end.11092
	jmp	%i0, 0(%i30)
then.11739:
	addi	%vi2389, %vi2231, 1
	mov	%vi2390, %vi2389
	mov	%vi2391, %vi2232
	mov	%vi2231, %vi2390
	mov	%vi2232, %vi2391
cont.11740:
	set_label	%i31, cont.11723
	jmp	%i0, 0(%i31)
then.11722:
	mov	%i31, %i0
	set_label	%i30, loop_end.11092
	jmp	%i0, 0(%i30)
cont.11723:
	set_label	%i30, loop_start.11091
	jmp	%i0, 0(%i30)
loop_end.11092:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
solve_one_or_network.3979:
	mov	%vi2392, %i4
	mov	%vi2393, %i5
	movi	%vi2394, 1
	sub	%vi2395, %i0, %vi2394
loop_start.11104:
	slli	%vi2396, %vi2392, 2
	add	%i31, %vi2393, %vi2396
	lw	%vi2397, 0(%i31)
	jeq	%vi2397, %vi2395, then.11742
	set_label	%vi2398, min_caml_and_net
	slli	%vi2399, %vi2397, 2
	add	%i31, %vi2398, %vi2399
	lw	%vi2400, 0(%i31)
	set_label	%vi2401, min_caml_end_flag
	mov	%vi2402, %i0
	mov	%vi2403, %i0
	sw	%i0, 0(%vi2401)
	mov	%vi2404, %i0
	mov	%vi2405, %i0
	mov	%vi2406, %vi2400
	movi	%vi2407, 1
	sub	%vi2408, %i0, %vi2407
loop_start.11108:
	slli	%vi2409, %vi2405, 2
	add	%i31, %vi2406, %vi2409
	lw	%vi2410, 0(%i31)
	jeq	%vi2410, %vi2408, then.11745
	set_label	%vi2411, min_caml_vscan
	set_label	%vi2412, min_caml_viewpoint
	mov	%i4, %vi2410
	mov	%i5, %vi2411
	mov	%i6, %vi2412
	call_dir	solver.3645
	mov	%vi2414, %i4
	mov	%vi2415, %i0
	jeq	%vi2414, %i0, then.11747
	set_label	%vi2445, min_caml_solver_dist
	mov	%vi2446, %i0
	lf	%vf2281, 0(%vi2445)
	movui	%i31, 777421
	addi	%i31, %i31, -819
	mif	%vf2282, %i31
	fleq	%i31, %vf2281, %vf2282
	ceqi	%i31, %i31, 0
	jzero	%i0, %i31, cont.11749
	set_label	%vi2447, min_caml_tmin
	mov	%vi2448, %i0
	lf	%vf2283, 0(%vi2447)
	fleq	%i31, %vf2283, %vf2281
	ceqi	%i31, %i31, 0
	jzero	%i0, %i31, cont.11750
	movui	%i31, 246333
	addi	%i31, %i31, 1802
	mif	%vf2284, %i31
	fadd	%vf2285, %vf2281, %vf2284
	set_label	%vi2449, min_caml_chkinside_p
	mov	%vi2450, %i0
	set_label	%vi2451, min_caml_vscan
	mov	%vi2452, %i0
	lf	%vf2286, 0(%vi2451)
	fmul	%vf2287, %vf2286, %vf2285
	set_label	%vi2453, min_caml_viewpoint
	mov	%vi2454, %i0
	lf	%vf2288, 0(%vi2453)
	fadd	%vf2289, %vf2287, %vf2288
	sf	%vf2289, 0(%vi2449)
	set_label	%vi2455, min_caml_chkinside_p
	set_label	%vi2456, min_caml_vscan
	lf	%vf2290, 4(%vi2456)
	fmul	%vf2291, %vf2290, %vf2285
	set_label	%vi2457, min_caml_viewpoint
	lf	%vf2292, 4(%vi2457)
	fadd	%vf2293, %vf2291, %vf2292
	sf	%vf2293, 4(%vi2455)
	set_label	%vi2458, min_caml_chkinside_p
	set_label	%vi2459, min_caml_vscan
	lf	%vf2294, 8(%vi2459)
	fmul	%vf2295, %vf2294, %vf2285
	set_label	%vi2460, min_caml_viewpoint
	lf	%vf2296, 8(%vi2460)
	fadd	%vf2297, %vf2295, %vf2296
	sf	%vf2297, 8(%vi2458)
	mov	%vi2461, %i0
	mov	%i4, %i0
	mov	%i5, %vi2406
	call_dir	check_all_inside.3767
	mov	%vi2463, %i4
	mov	%vi2464, %i0
	jeq	%vi2463, %i0, cont.11751
	set_label	%vi2465, min_caml_tmin
	mov	%vi2466, %i0
	sf	%vf2285, 0(%vi2465)
	set_label	%vi2467, min_caml_crashed_point
	mov	%vi2468, %i0
	set_label	%vi2469, min_caml_chkinside_p
	mov	%vi2470, %i0
	lf	%vf2298, 0(%vi2469)
	sf	%vf2298, 0(%vi2467)
	set_label	%vi2471, min_caml_crashed_point
	set_label	%vi2472, min_caml_chkinside_p
	lf	%vf2299, 4(%vi2472)
	sf	%vf2299, 4(%vi2471)
	set_label	%vi2473, min_caml_crashed_point
	set_label	%vi2474, min_caml_chkinside_p
	lf	%vf2300, 8(%vi2474)
	sf	%vf2300, 8(%vi2473)
	set_label	%vi2475, min_caml_intsec_rectside
	mov	%vi2476, %i0
	sw	%vi2414, 0(%vi2475)
	set_label	%vi2477, min_caml_crashed_object
	mov	%vi2478, %i0
	sw	%vi2410, 0(%vi2477)
cont.11751:
cont.11750:
cont.11749:
	set_label	%i31, cont.11748
	jmp	%i0, 0(%i31)
then.11747:
	set_label	%vi2416, min_caml_objects
	slli	%vi2417, %vi2410, 2
	add	%i31, %vi2416, %vi2417
	lw	%vi2418, 0(%i31)
	lw	%vi2419, 36(%vi2418)
	lw	%vi2420, 32(%vi2418)
	lw	%vi2421, 28(%vi2418)
	lw	%vi2422, 24(%vi2418)
	lw	%vi2423, 20(%vi2418)
	lw	%vi2424, 16(%vi2418)
	lw	%vi2425, 12(%vi2418)
	lw	%vi2426, 8(%vi2418)
	lw	%vi2427, 4(%vi2418)
	lw	%vi2428, 0(%vi2418)
	mov	%vi2429, %vi2428
	mov	%vi2430, %vi2427
	mov	%vi2431, %vi2426
	mov	%vi2432, %vi2425
	mov	%vi2433, %vi2424
	mov	%vi2434, %vi2423
	mov	%vi2435, %vi2422
	mov	%vi2436, %vi2421
	mov	%vi2437, %vi2420
	mov	%vi2438, %vi2419
	mov	%i4, %vi2428
	mov	%i5, %vi2427
	mov	%i6, %vi2426
	mov	%i7, %vi2425
	mov	%i8, %vi2424
	mov	%i9, %vi2423
	mov	%i10, %vi2422
	mov	%i11, %vi2421
	mov	%i12, %vi2420
	mov	%i13, %vi2419
	call_dir	o_isinvert.2427
	mov	%vi2440, %i4
	mov	%vi2441, %i0
	ceqi	%i31, %vi2440, 0
	jzero	%i0, %i31, cont.11752
	set_label	%vi2442, min_caml_end_flag
	mov	%vi2443, %i0
	movi	%vi2444, 1
	sw	%vi2444, 0(%vi2442)
cont.11752:
cont.11748:
	set_label	%vi2479, min_caml_end_flag
	mov	%vi2480, %i0
	lw	%vi2481, 0(%vi2479)
	mov	%vi2482, %i0
	jeq	%vi2481, %i0, then.11753
	mov	%i31, %i0
	set_label	%i30, loop_end.11109
	jmp	%i0, 0(%i30)
then.11753:
	addi	%vi2483, %vi2405, 1
	mov	%vi2484, %vi2483
	mov	%vi2485, %vi2406
	mov	%vi2405, %vi2484
	mov	%vi2406, %vi2485
cont.11754:
	set_label	%i31, cont.11746
	jmp	%i0, 0(%i31)
then.11745:
	mov	%i31, %i0
	set_label	%i30, loop_end.11109
	jmp	%i0, 0(%i30)
cont.11746:
	set_label	%i30, loop_start.11108
	jmp	%i0, 0(%i30)
loop_end.11109:
	mov	%i0, %i31
	addi	%vi2486, %vi2392, 1
	mov	%vi2487, %vi2486
	mov	%vi2488, %vi2393
	mov	%vi2392, %vi2487
	mov	%vi2393, %vi2488
	set_label	%i31, cont.11743
	jmp	%i0, 0(%i31)
then.11742:
	mov	%i31, %i0
	set_label	%i30, loop_end.11105
	jmp	%i0, 0(%i30)
cont.11743:
	set_label	%i30, loop_start.11104
	jmp	%i0, 0(%i30)
loop_end.11105:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
trace_or_matrix.3995:
	mov	%vi2489, %i4
	mov	%vi2490, %i5
	mov	%vi2491, %i0
	movi	%vi2492, 1
	sub	%vi2493, %i0, %vi2492
loop_start.11116:
	slli	%vi2494, %vi2489, 2
	add	%i31, %vi2490, %vi2494
	lw	%vi2495, 0(%i31)
	lw	%vi2496, 0(%vi2495)
	jeq	%vi2496, %vi2493, then.11756
	movi	%i31, 99
	jeq	%vi2496, %i31, then.11758
	set_label	%vi2514, min_caml_vscan
	set_label	%vi2515, min_caml_viewpoint
	mov	%vi2516, %vi2496
	mov	%vi2517, %vi2514
	mov	%vi2518, %vi2515
	set_label	%vi2519, min_caml_objects
	slli	%vi2520, %vi2516, 2
	add	%i31, %vi2519, %vi2520
	lw	%vi2521, 0(%i31)
	lw	%vi2522, 36(%vi2521)
	lw	%vi2523, 32(%vi2521)
	lw	%vi2524, 28(%vi2521)
	lw	%vi2525, 24(%vi2521)
	lw	%vi2526, 20(%vi2521)
	lw	%vi2527, 16(%vi2521)
	lw	%vi2528, 12(%vi2521)
	lw	%vi2529, 8(%vi2521)
	lw	%vi2530, 4(%vi2521)
	lw	%vi2531, 0(%vi2521)
	mov	%vi2532, %vi2531
	mov	%vi2533, %vi2530
	mov	%vi2534, %vi2529
	mov	%vi2535, %vi2528
	mov	%vi2536, %vi2527
	mov	%vi2537, %vi2526
	mov	%vi2538, %vi2525
	mov	%vi2539, %vi2524
	mov	%vi2540, %vi2523
	mov	%vi2541, %vi2522
	set_label	%vi2542, min_caml_solver_w_vec
	mov	%vi2543, %i0
	mov	%vi2544, %i0
	lf	%vf2301, 0(%vi2518)
	mov	%i4, %vi2531
	mov	%i5, %vi2530
	mov	%i6, %vi2529
	mov	%i7, %vi2528
	mov	%i8, %vi2527
	mov	%i9, %vi2526
	mov	%i10, %vi2525
	mov	%i11, %vi2524
	mov	%i12, %vi2523
	mov	%i13, %vi2522
	call_dir	o_param_x.2490
	fmov	%vf2303, %f1
	fsub	%vf2304, %vf2301, %vf2303
	sf	%vf2304, 0(%vi2542)
	set_label	%vi2545, min_caml_solver_w_vec
	lf	%vf2305, 4(%vi2518)
	mov	%i4, %vi2531
	mov	%i5, %vi2530
	mov	%i6, %vi2529
	mov	%i7, %vi2528
	mov	%i8, %vi2527
	mov	%i9, %vi2526
	mov	%i10, %vi2525
	mov	%i11, %vi2524
	mov	%i12, %vi2523
	mov	%i13, %vi2522
	call_dir	o_param_y.2503
	fmov	%vf2307, %f1
	fsub	%vf2308, %vf2305, %vf2307
	sf	%vf2308, 4(%vi2545)
	set_label	%vi2546, min_caml_solver_w_vec
	lf	%vf2309, 8(%vi2518)
	mov	%i4, %vi2531
	mov	%i5, %vi2530
	mov	%i6, %vi2529
	mov	%i7, %vi2528
	mov	%i8, %vi2527
	mov	%i9, %vi2526
	mov	%i10, %vi2525
	mov	%i11, %vi2524
	mov	%i12, %vi2523
	mov	%i13, %vi2522
	call_dir	o_param_z.2516
	fmov	%vf2311, %f1
	fsub	%vf2312, %vf2309, %vf2311
	sf	%vf2312, 8(%vi2546)
	mov	%i4, %vi2531
	mov	%i5, %vi2530
	mov	%i6, %vi2529
	mov	%i7, %vi2528
	mov	%i8, %vi2527
	mov	%i9, %vi2526
	mov	%i10, %vi2525
	mov	%i11, %vi2524
	mov	%i12, %vi2523
	mov	%i13, %vi2522
	call_dir	o_form.2403
	mov	%vi2548, %i4
	movi	%i31, 1
	jeq	%vi2548, %i31, then.11760
	movi	%i31, 2
	jeq	%vi2548, %i31, then.11762
	mov	%i4, %vi2531
	mov	%i5, %vi2530
	mov	%i6, %vi2529
	mov	%i7, %vi2528
	mov	%i8, %vi2527
	mov	%i9, %vi2526
	mov	%i10, %vi2525
	mov	%i11, %vi2524
	mov	%i12, %vi2523
	mov	%i13, %vi2522
	mov	%i14, %vi2517
	call_dir	solver_second.3601
	mov	%vi2552, %i4
	set_label	%i31, cont.11763
	jmp	%i0, 0(%i31)
then.11762:
	mov	%i4, %vi2531
	mov	%i5, %vi2530
	mov	%i6, %vi2529
	mov	%i7, %vi2528
	mov	%i8, %vi2527
	mov	%i9, %vi2526
	mov	%i10, %vi2525
	mov	%i11, %vi2524
	mov	%i12, %vi2523
	mov	%i13, %vi2522
	mov	%i14, %vi2517
	call_dir	solver_surface.3440
	mov	%vi2552, %i4
cont.11763:
	set_label	%i31, cont.11761
	jmp	%i0, 0(%i31)
then.11760:
	mov	%i4, %vi2531
	mov	%i5, %vi2530
	mov	%i6, %vi2529
	mov	%i7, %vi2528
	mov	%i8, %vi2527
	mov	%i9, %vi2526
	mov	%i10, %vi2525
	mov	%i11, %vi2524
	mov	%i12, %vi2523
	mov	%i13, %vi2522
	mov	%i14, %vi2517
	call_dir	solver_rect.3311
	mov	%vi2552, %i4
cont.11761:
	mov	%vi2553, %i0
	jeq	%vi2552, %i0, cont.11764
	set_label	%vi2554, min_caml_solver_dist
	mov	%vi2555, %i0
	lf	%vf2313, 0(%vi2554)
	set_label	%vi2556, min_caml_tmin
	mov	%vi2557, %i0
	lf	%vf2314, 0(%vi2556)
	fleq	%i31, %vf2314, %vf2313
	ceqi	%i31, %i31, 0
	jzero	%i0, %i31, cont.11765
	movi	%vi2558, 1
	mov	%vi2559, %vi2558
	mov	%vi2560, %vi2495
	movi	%vi2561, 1
	sub	%vi2562, %i0, %vi2561
loop_start.11120:
	slli	%vi2563, %vi2559, 2
	add	%i31, %vi2560, %vi2563
	lw	%vi2564, 0(%i31)
	jeq	%vi2564, %vi2562, then.11767
	set_label	%vi2565, min_caml_and_net
	slli	%vi2566, %vi2564, 2
	add	%i31, %vi2565, %vi2566
	lw	%vi2567, 0(%i31)
	set_label	%vi2568, min_caml_end_flag
	mov	%vi2569, %i0
	mov	%vi2570, %i0
	sw	%i0, 0(%vi2568)
	mov	%vi2571, %i0
	mov	%i4, %i0
	mov	%i5, %vi2567
	call_dir	solve_each_element.3884
	addi	%vi2572, %vi2559, 1
	mov	%vi2573, %vi2572
	mov	%vi2574, %vi2560
	mov	%vi2559, %vi2573
	mov	%vi2560, %vi2574
	set_label	%i31, cont.11768
	jmp	%i0, 0(%i31)
then.11767:
	mov	%i31, %i0
	set_label	%i30, loop_end.11121
	jmp	%i0, 0(%i30)
cont.11768:
	set_label	%i30, loop_start.11120
	jmp	%i0, 0(%i30)
loop_end.11121:
	mov	%i0, %i31
cont.11765:
cont.11764:
	set_label	%i31, cont.11759
	jmp	%i0, 0(%i31)
then.11758:
	movi	%vi2497, 1
	mov	%vi2498, %vi2497
	mov	%vi2499, %vi2495
	movi	%vi2500, 1
	sub	%vi2501, %i0, %vi2500
loop_start.11126:
	slli	%vi2502, %vi2498, 2
	add	%i31, %vi2499, %vi2502
	lw	%vi2503, 0(%i31)
	jeq	%vi2503, %vi2501, then.11770
	set_label	%vi2504, min_caml_and_net
	slli	%vi2505, %vi2503, 2
	add	%i31, %vi2504, %vi2505
	lw	%vi2506, 0(%i31)
	set_label	%vi2507, min_caml_end_flag
	mov	%vi2508, %i0
	mov	%vi2509, %i0
	sw	%i0, 0(%vi2507)
	mov	%vi2510, %i0
	mov	%i4, %i0
	mov	%i5, %vi2506
	call_dir	solve_each_element.3884
	addi	%vi2511, %vi2498, 1
	mov	%vi2512, %vi2511
	mov	%vi2513, %vi2499
	mov	%vi2498, %vi2512
	mov	%vi2499, %vi2513
	set_label	%i31, cont.11771
	jmp	%i0, 0(%i31)
then.11770:
	mov	%i31, %i0
	set_label	%i30, loop_end.11127
	jmp	%i0, 0(%i30)
cont.11771:
	set_label	%i30, loop_start.11126
	jmp	%i0, 0(%i30)
loop_end.11127:
	mov	%i0, %i31
cont.11759:
	addi	%vi2575, %vi2489, 1
	mov	%vi2576, %vi2575
	mov	%vi2577, %vi2490
	mov	%vi2489, %vi2576
	mov	%vi2490, %vi2577
	set_label	%i31, cont.11757
	jmp	%i0, 0(%i31)
then.11756:
	mov	%i31, %i0
	set_label	%i30, loop_end.11117
	jmp	%i0, 0(%i30)
cont.11757:
	set_label	%i30, loop_start.11116
	jmp	%i0, 0(%i30)
loop_end.11117:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
tracer.4019:
	mov	%vi2578, %i4
	mov	%vi2579, %i5
	set_label	%vi2580, min_caml_tmin
	mov	%vi2581, %i0
	movui	%i31, 321255
	addi	%i31, %i31, -1240
	mif	%vf2315, %i31
	sf	%vf2315, 0(%vi2580)
	mov	%vi2582, %i0
	set_label	%vi2583, min_caml_or_net
	mov	%vi2584, %i0
	lw	%vi2585, 0(%vi2583)
	mov	%vi2586, %i0
	mov	%vi2587, %vi2585
	mov	%vi2588, %i0
	movi	%vi2589, 1
	sub	%vi2590, %i0, %vi2589
loop_start.11134:
	slli	%vi2591, %vi2586, 2
	add	%i31, %vi2587, %vi2591
	lw	%vi2592, 0(%i31)
	lw	%vi2593, 0(%vi2592)
	jeq	%vi2593, %vi2590, then.11773
	movi	%i31, 99
	jeq	%vi2593, %i31, then.11775
	set_label	%vi2595, min_caml_vscan
	set_label	%vi2596, min_caml_viewpoint
	mov	%i4, %vi2593
	mov	%i5, %vi2595
	mov	%i6, %vi2596
	call_dir	solver.3645
	mov	%vi2598, %i4
	mov	%vi2599, %i0
	jeq	%vi2598, %i0, cont.11777
	set_label	%vi2600, min_caml_solver_dist
	mov	%vi2601, %i0
	lf	%vf2316, 0(%vi2600)
	set_label	%vi2602, min_caml_tmin
	mov	%vi2603, %i0
	lf	%vf2317, 0(%vi2602)
	fleq	%i31, %vf2317, %vf2316
	ceqi	%i31, %i31, 0
	jzero	%i0, %i31, cont.11778
	movi	%vi2604, 1
	mov	%i4, %vi2604
	mov	%i5, %vi2592
	call_dir	solve_one_or_network.3979
cont.11778:
cont.11777:
	set_label	%i31, cont.11776
	jmp	%i0, 0(%i31)
then.11775:
	movi	%vi2594, 1
	mov	%i4, %vi2594
	mov	%i5, %vi2592
	call_dir	solve_one_or_network.3979
cont.11776:
	addi	%vi2605, %vi2586, 1
	mov	%vi2606, %vi2605
	mov	%vi2607, %vi2587
	mov	%vi2586, %vi2606
	mov	%vi2587, %vi2607
	set_label	%i31, cont.11774
	jmp	%i0, 0(%i31)
then.11773:
	mov	%i31, %i0
	set_label	%i30, loop_end.11135
	jmp	%i0, 0(%i30)
cont.11774:
	set_label	%i30, loop_start.11134
	jmp	%i0, 0(%i30)
loop_end.11135:
	mov	%i0, %i31
	set_label	%vi2608, min_caml_tmin
	mov	%vi2609, %i0
	lf	%vf2318, 0(%vi2608)
	movui	%i31, 777421
	addi	%i31, %i31, -819
	mif	%vf2319, %i31
	fleq	%i31, %vf2318, %vf2319
	jzero	%i0, %i31, else.11779
	mov	%i4, %i0
	ret
else.11779:
	movui	%i31, 314348
	addi	%i31, %i31, -992
	mif	%vf2320, %i31
	fleq	%i31, %vf2320, %vf2318
	jzero	%i0, %i31, else.11780
	mov	%i4, %i0
	ret
else.11780:
	movi	%i4, 1
	ret
	.end_function
	.func_entry
get_nvector_rect.4036:
	set_label	%vi2610, min_caml_intsec_rectside
	mov	%vi2611, %i0
	lw	%vi2612, 0(%vi2610)
	movi	%i31, 1
	jeq	%vi2612, %i31, then.11781
	movi	%i31, 2
	jeq	%vi2612, %i31, then.11782
	movi	%i31, 3
	jeq	%vi2612, %i31, then.11783
	ret
then.11783:
	set_label	%vi2624, min_caml_nvector
	mov	%vi2625, %i0
	fmov	%vf2335, %f0
	sf	%f0, 0(%vi2624)
	set_label	%vi2626, min_caml_nvector
	fmov	%vf2336, %f0
	sf	%f0, 4(%vi2626)
	set_label	%vi2627, min_caml_nvector
	set_label	%vi2628, min_caml_vscan
	lf	%vf2337, 8(%vi2628)
	fmov	%vf2338, %vf2337
	fmov	%vf2339, %f0
	fleq	%i31, %vf2338, %f0
	jzero	%i0, %i31, else.11785
	movui	%i31, 784384
	mif	%vf2340, %i31
	set_label	%i31, cont.11786
	jmp	%i0, 0(%i31)
else.11785:
	movui	%i31, 260096
	mif	%vf2340, %i31
cont.11786:
	fneg	%vf2341, %vf2340
	sf	%vf2341, 8(%vi2627)
	ret
then.11782:
	set_label	%vi2619, min_caml_nvector
	mov	%vi2620, %i0
	fmov	%vf2328, %f0
	sf	%f0, 0(%vi2619)
	set_label	%vi2621, min_caml_nvector
	set_label	%vi2622, min_caml_vscan
	lf	%vf2329, 4(%vi2622)
	fmov	%vf2330, %vf2329
	fmov	%vf2331, %f0
	fleq	%i31, %vf2330, %f0
	jzero	%i0, %i31, else.11788
	movui	%i31, 784384
	mif	%vf2332, %i31
	set_label	%i31, cont.11789
	jmp	%i0, 0(%i31)
else.11788:
	movui	%i31, 260096
	mif	%vf2332, %i31
cont.11789:
	fneg	%vf2333, %vf2332
	sf	%vf2333, 4(%vi2621)
	set_label	%vi2623, min_caml_nvector
	fmov	%vf2334, %f0
	sf	%f0, 8(%vi2623)
	ret
then.11781:
	set_label	%vi2613, min_caml_nvector
	mov	%vi2614, %i0
	set_label	%vi2615, min_caml_vscan
	mov	%vi2616, %i0
	lf	%vf2321, 0(%vi2615)
	fmov	%vf2322, %vf2321
	fmov	%vf2323, %f0
	fleq	%i31, %vf2322, %f0
	jzero	%i0, %i31, else.11791
	movui	%i31, 784384
	mif	%vf2324, %i31
	set_label	%i31, cont.11792
	jmp	%i0, 0(%i31)
else.11791:
	movui	%i31, 260096
	mif	%vf2324, %i31
cont.11792:
	fneg	%vf2325, %vf2324
	sf	%vf2325, 0(%vi2613)
	set_label	%vi2617, min_caml_nvector
	fmov	%vf2326, %f0
	sf	%f0, 4(%vi2617)
	set_label	%vi2618, min_caml_nvector
	fmov	%vf2327, %f0
	sf	%f0, 8(%vi2618)
	ret
	.end_function
	.func_entry
get_nvector_plane.4089:
	mov	%vi2629, %i4
	mov	%vi2630, %i5
	mov	%vi2631, %i6
	mov	%vi2632, %i7
	mov	%vi2633, %i8
	mov	%vi2634, %i9
	mov	%vi2635, %i10
	mov	%vi2636, %i11
	mov	%vi2637, %i12
	mov	%vi2638, %i13
	set_label	%vi2639, min_caml_nvector
	mov	%vi2640, %i0
	mov	%vi2641, %vi2629
	mov	%vi2642, %vi2630
	mov	%vi2643, %vi2631
	mov	%vi2644, %vi2632
	mov	%vi2645, %vi2633
	mov	%vi2646, %vi2634
	mov	%vi2647, %vi2635
	mov	%vi2648, %vi2636
	mov	%vi2649, %vi2637
	mov	%vi2650, %vi2638
	mov	%vi2651, %i0
	lf	%vf2342, 0(%vi2645)
	fneg	%vf2343, %vf2342
	sf	%vf2343, 0(%vi2639)
	set_label	%vi2652, min_caml_nvector
	mov	%vi2653, %vi2629
	mov	%vi2654, %vi2630
	mov	%vi2655, %vi2631
	mov	%vi2656, %vi2632
	mov	%vi2657, %vi2633
	mov	%vi2658, %vi2634
	mov	%vi2659, %vi2635
	mov	%vi2660, %vi2636
	mov	%vi2661, %vi2637
	mov	%vi2662, %vi2638
	lf	%vf2344, 4(%vi2657)
	fneg	%vf2345, %vf2344
	sf	%vf2345, 4(%vi2652)
	set_label	%vi2663, min_caml_nvector
	mov	%vi2664, %vi2629
	mov	%vi2665, %vi2630
	mov	%vi2666, %vi2631
	mov	%vi2667, %vi2632
	mov	%vi2668, %vi2633
	mov	%vi2669, %vi2634
	mov	%vi2670, %vi2635
	mov	%vi2671, %vi2636
	mov	%vi2672, %vi2637
	mov	%vi2673, %vi2638
	lf	%vf2346, 8(%vi2668)
	fneg	%vf2347, %vf2346
	sf	%vf2347, 8(%vi2663)
	ret
	.end_function
	.func_entry
get_nvector_second_norot.4105:
	mov	%vi2674, %i4
	mov	%vi2675, %i5
	mov	%vi2676, %i6
	mov	%vi2677, %i7
	mov	%vi2678, %i8
	mov	%vi2679, %i9
	mov	%vi2680, %i10
	mov	%vi2681, %i11
	mov	%vi2682, %i12
	mov	%vi2683, %i13
	mov	%vi2684, %i14
	mov	%vi2685, %i0
	lf	%vf2348, 0(%vi2684)
	lf	%vf2349, 4(%vi2684)
	lf	%vf2350, 8(%vi2684)
	set_label	%vi2686, min_caml_nvector
	mov	%vi2687, %i0
	mov	%vi2688, %i0
	fmov	%vf2351, %vf2348
	mov	%vi2689, %vi2674
	mov	%vi2690, %vi2675
	mov	%vi2691, %vi2676
	mov	%vi2692, %vi2677
	mov	%vi2693, %vi2678
	mov	%vi2694, %vi2679
	mov	%vi2695, %vi2680
	mov	%vi2696, %vi2681
	mov	%vi2697, %vi2682
	mov	%vi2698, %vi2683
	mov	%vi2699, %i0
	lf	%vf2352, 0(%vi2694)
	fsub	%vf2353, %vf2351, %vf2352
	mov	%vi2700, %vi2674
	mov	%vi2701, %vi2675
	mov	%vi2702, %vi2676
	mov	%vi2703, %vi2677
	mov	%vi2704, %vi2678
	mov	%vi2705, %vi2679
	mov	%vi2706, %vi2680
	mov	%vi2707, %vi2681
	mov	%vi2708, %vi2682
	mov	%vi2709, %vi2683
	mov	%vi2710, %i0
	lf	%vf2354, 0(%vi2704)
	fmul	%vf2355, %vf2353, %vf2354
	sf	%vf2355, 0(%vi2686)
	set_label	%vi2711, min_caml_nvector
	fmov	%vf2356, %vf2349
	mov	%vi2712, %vi2674
	mov	%vi2713, %vi2675
	mov	%vi2714, %vi2676
	mov	%vi2715, %vi2677
	mov	%vi2716, %vi2678
	mov	%vi2717, %vi2679
	mov	%vi2718, %vi2680
	mov	%vi2719, %vi2681
	mov	%vi2720, %vi2682
	mov	%vi2721, %vi2683
	lf	%vf2357, 4(%vi2717)
	fsub	%vf2358, %vf2356, %vf2357
	mov	%vi2722, %vi2674
	mov	%vi2723, %vi2675
	mov	%vi2724, %vi2676
	mov	%vi2725, %vi2677
	mov	%vi2726, %vi2678
	mov	%vi2727, %vi2679
	mov	%vi2728, %vi2680
	mov	%vi2729, %vi2681
	mov	%vi2730, %vi2682
	mov	%vi2731, %vi2683
	lf	%vf2359, 4(%vi2726)
	fmul	%vf2360, %vf2358, %vf2359
	sf	%vf2360, 4(%vi2711)
	set_label	%vi2732, min_caml_nvector
	fmov	%vf2361, %vf2350
	mov	%vi2733, %vi2674
	mov	%vi2734, %vi2675
	mov	%vi2735, %vi2676
	mov	%vi2736, %vi2677
	mov	%vi2737, %vi2678
	mov	%vi2738, %vi2679
	mov	%vi2739, %vi2680
	mov	%vi2740, %vi2681
	mov	%vi2741, %vi2682
	mov	%vi2742, %vi2683
	lf	%vf2362, 8(%vi2738)
	fsub	%vf2363, %vf2361, %vf2362
	mov	%vi2743, %vi2674
	mov	%vi2744, %vi2675
	mov	%vi2745, %vi2676
	mov	%vi2746, %vi2677
	mov	%vi2747, %vi2678
	mov	%vi2748, %vi2679
	mov	%vi2749, %vi2680
	mov	%vi2750, %vi2681
	mov	%vi2751, %vi2682
	mov	%vi2752, %vi2683
	lf	%vf2364, 8(%vi2747)
	fmul	%vf2365, %vf2363, %vf2364
	sf	%vf2365, 8(%vi2732)
	set_label	%vi2753, min_caml_nvector
	mov	%vi2754, %vi2674
	mov	%vi2755, %vi2675
	mov	%vi2756, %vi2676
	mov	%vi2757, %vi2677
	mov	%vi2758, %vi2678
	mov	%vi2759, %vi2679
	mov	%vi2760, %vi2680
	mov	%vi2761, %vi2681
	mov	%vi2762, %vi2682
	mov	%vi2763, %vi2683
	mov	%vi2764, %vi2760
	mov	%vi2765, %vi2753
	mov	%vi2766, %vi2764
	mov	%vi2767, %i0
	lf	%vf2366, 0(%vi2765)
	fmov	%f1, %vf2366
	call_dir	fsqr.2386
	fmov	%vf2368, %f1
	lf	%vf2369, 4(%vi2765)
	fmov	%f1, %vf2369
	call_dir	fsqr.2386
	fmov	%vf2371, %f1
	fadd	%vf2372, %vf2368, %vf2371
	lf	%vf2373, 8(%vi2765)
	fmov	%f1, %vf2373
	call_dir	fsqr.2386
	fmov	%vf2375, %f1
	fadd	%vf2376, %vf2372, %vf2375
	fmov	%f1, %vf2376
	call_dir	sqrt.2275
	fmov	%vf2378, %f1
	mov	%vi2768, %i0
	jeq	%vi2766, %i0, then.11795
	fneg	%vf2379, %vf2378
	set_label	%i31, cont.11796
	jmp	%i0, 0(%i31)
then.11795:
	fmov	%vf2379, %vf2378
cont.11796:
	mov	%vi2769, %i0
	mov	%vi2770, %i0
	lf	%vf2380, 0(%vi2765)
	finv	%vf2381, %vf2379
	fmul	%vf2382, %vf2380, %vf2381
	sf	%vf2382, 0(%vi2765)
	lf	%vf2383, 4(%vi2765)
	finv	%vf2384, %vf2379
	fmul	%vf2385, %vf2383, %vf2384
	sf	%vf2385, 4(%vi2765)
	lf	%vf2386, 8(%vi2765)
	finv	%vf2387, %vf2379
	fmul	%vf2388, %vf2386, %vf2387
	sf	%vf2388, 8(%vi2765)
	ret
	.end_function
	.func_entry
get_nvector_second_rot.4137:
	mov	%vi2771, %i4
	mov	%vi2772, %i5
	mov	%vi2773, %i6
	mov	%vi2774, %i7
	mov	%vi2775, %i8
	mov	%vi2776, %i9
	mov	%vi2777, %i10
	mov	%vi2778, %i11
	mov	%vi2779, %i12
	mov	%vi2780, %i13
	mov	%vi2781, %i14
	mov	%vi2782, %i0
	lf	%vf2389, 0(%vi2781)
	lf	%vf2390, 4(%vi2781)
	lf	%vf2391, 8(%vi2781)
	set_label	%vi2783, min_caml_nvector_w
	mov	%vi2784, %i0
	mov	%vi2785, %i0
	fmov	%vf2392, %vf2389
	mov	%vi2786, %vi2771
	mov	%vi2787, %vi2772
	mov	%vi2788, %vi2773
	mov	%vi2789, %vi2774
	mov	%vi2790, %vi2775
	mov	%vi2791, %vi2776
	mov	%vi2792, %vi2777
	mov	%vi2793, %vi2778
	mov	%vi2794, %vi2779
	mov	%vi2795, %vi2780
	mov	%vi2796, %i0
	lf	%vf2393, 0(%vi2791)
	fsub	%vf2394, %vf2392, %vf2393
	sf	%vf2394, 0(%vi2783)
	set_label	%vi2797, min_caml_nvector_w
	fmov	%vf2395, %vf2390
	mov	%vi2798, %vi2771
	mov	%vi2799, %vi2772
	mov	%vi2800, %vi2773
	mov	%vi2801, %vi2774
	mov	%vi2802, %vi2775
	mov	%vi2803, %vi2776
	mov	%vi2804, %vi2777
	mov	%vi2805, %vi2778
	mov	%vi2806, %vi2779
	mov	%vi2807, %vi2780
	lf	%vf2396, 4(%vi2803)
	fsub	%vf2397, %vf2395, %vf2396
	sf	%vf2397, 4(%vi2797)
	set_label	%vi2808, min_caml_nvector_w
	fmov	%vf2398, %vf2391
	mov	%vi2809, %vi2771
	mov	%vi2810, %vi2772
	mov	%vi2811, %vi2773
	mov	%vi2812, %vi2774
	mov	%vi2813, %vi2775
	mov	%vi2814, %vi2776
	mov	%vi2815, %vi2777
	mov	%vi2816, %vi2778
	mov	%vi2817, %vi2779
	mov	%vi2818, %vi2780
	lf	%vf2399, 8(%vi2814)
	fsub	%vf2400, %vf2398, %vf2399
	sf	%vf2400, 8(%vi2808)
	set_label	%vi2819, min_caml_nvector
	mov	%vi2820, %i0
	set_label	%vi2821, min_caml_nvector_w
	mov	%vi2822, %i0
	lf	%vf2401, 0(%vi2821)
	mov	%vi2823, %vi2771
	mov	%vi2824, %vi2772
	mov	%vi2825, %vi2773
	mov	%vi2826, %vi2774
	mov	%vi2827, %vi2775
	mov	%vi2828, %vi2776
	mov	%vi2829, %vi2777
	mov	%vi2830, %vi2778
	mov	%vi2831, %vi2779
	mov	%vi2832, %vi2780
	mov	%vi2833, %i0
	lf	%vf2402, 0(%vi2827)
	fmul	%vf2403, %vf2401, %vf2402
	set_label	%vi2834, min_caml_nvector_w
	lf	%vf2404, 4(%vi2834)
	mov	%vi2835, %vi2771
	mov	%vi2836, %vi2772
	mov	%vi2837, %vi2773
	mov	%vi2838, %vi2774
	mov	%vi2839, %vi2775
	mov	%vi2840, %vi2776
	mov	%vi2841, %vi2777
	mov	%vi2842, %vi2778
	mov	%vi2843, %vi2779
	mov	%vi2844, %vi2780
	lf	%vf2405, 8(%vi2844)
	fmul	%vf2406, %vf2404, %vf2405
	set_label	%vi2845, min_caml_nvector_w
	lf	%vf2407, 8(%vi2845)
	mov	%vi2846, %vi2771
	mov	%vi2847, %vi2772
	mov	%vi2848, %vi2773
	mov	%vi2849, %vi2774
	mov	%vi2850, %vi2775
	mov	%vi2851, %vi2776
	mov	%vi2852, %vi2777
	mov	%vi2853, %vi2778
	mov	%vi2854, %vi2779
	mov	%vi2855, %vi2780
	lf	%vf2408, 4(%vi2855)
	fmul	%vf2409, %vf2407, %vf2408
	fadd	%vf2410, %vf2406, %vf2409
	fmov	%vf2411, %vf2410
	movui	%i31, 262144
	mif	%vf2412, %i31
	finv	%vf2413, %vf2412
	fmul	%vf2414, %vf2411, %vf2413
	fadd	%vf2415, %vf2403, %vf2414
	sf	%vf2415, 0(%vi2819)
	set_label	%vi2856, min_caml_nvector
	set_label	%vi2857, min_caml_nvector_w
	lf	%vf2416, 4(%vi2857)
	mov	%vi2858, %vi2771
	mov	%vi2859, %vi2772
	mov	%vi2860, %vi2773
	mov	%vi2861, %vi2774
	mov	%vi2862, %vi2775
	mov	%vi2863, %vi2776
	mov	%vi2864, %vi2777
	mov	%vi2865, %vi2778
	mov	%vi2866, %vi2779
	mov	%vi2867, %vi2780
	lf	%vf2417, 4(%vi2862)
	fmul	%vf2418, %vf2416, %vf2417
	set_label	%vi2868, min_caml_nvector_w
	mov	%vi2869, %i0
	lf	%vf2419, 0(%vi2868)
	mov	%vi2870, %vi2771
	mov	%vi2871, %vi2772
	mov	%vi2872, %vi2773
	mov	%vi2873, %vi2774
	mov	%vi2874, %vi2775
	mov	%vi2875, %vi2776
	mov	%vi2876, %vi2777
	mov	%vi2877, %vi2778
	mov	%vi2878, %vi2779
	mov	%vi2879, %vi2780
	lf	%vf2420, 8(%vi2879)
	fmul	%vf2421, %vf2419, %vf2420
	set_label	%vi2880, min_caml_nvector_w
	lf	%vf2422, 8(%vi2880)
	mov	%vi2881, %vi2771
	mov	%vi2882, %vi2772
	mov	%vi2883, %vi2773
	mov	%vi2884, %vi2774
	mov	%vi2885, %vi2775
	mov	%vi2886, %vi2776
	mov	%vi2887, %vi2777
	mov	%vi2888, %vi2778
	mov	%vi2889, %vi2779
	mov	%vi2890, %vi2780
	mov	%vi2891, %i0
	lf	%vf2423, 0(%vi2890)
	fmul	%vf2424, %vf2422, %vf2423
	fadd	%vf2425, %vf2421, %vf2424
	fmov	%vf2426, %vf2425
	movui	%i31, 262144
	mif	%vf2427, %i31
	finv	%vf2428, %vf2427
	fmul	%vf2429, %vf2426, %vf2428
	fadd	%vf2430, %vf2418, %vf2429
	sf	%vf2430, 4(%vi2856)
	set_label	%vi2892, min_caml_nvector
	set_label	%vi2893, min_caml_nvector_w
	lf	%vf2431, 8(%vi2893)
	mov	%vi2894, %vi2771
	mov	%vi2895, %vi2772
	mov	%vi2896, %vi2773
	mov	%vi2897, %vi2774
	mov	%vi2898, %vi2775
	mov	%vi2899, %vi2776
	mov	%vi2900, %vi2777
	mov	%vi2901, %vi2778
	mov	%vi2902, %vi2779
	mov	%vi2903, %vi2780
	lf	%vf2432, 8(%vi2898)
	fmul	%vf2433, %vf2431, %vf2432
	set_label	%vi2904, min_caml_nvector_w
	mov	%vi2905, %i0
	lf	%vf2434, 0(%vi2904)
	mov	%vi2906, %vi2771
	mov	%vi2907, %vi2772
	mov	%vi2908, %vi2773
	mov	%vi2909, %vi2774
	mov	%vi2910, %vi2775
	mov	%vi2911, %vi2776
	mov	%vi2912, %vi2777
	mov	%vi2913, %vi2778
	mov	%vi2914, %vi2779
	mov	%vi2915, %vi2780
	lf	%vf2435, 4(%vi2915)
	fmul	%vf2436, %vf2434, %vf2435
	set_label	%vi2916, min_caml_nvector_w
	lf	%vf2437, 4(%vi2916)
	mov	%vi2917, %vi2771
	mov	%vi2918, %vi2772
	mov	%vi2919, %vi2773
	mov	%vi2920, %vi2774
	mov	%vi2921, %vi2775
	mov	%vi2922, %vi2776
	mov	%vi2923, %vi2777
	mov	%vi2924, %vi2778
	mov	%vi2925, %vi2779
	mov	%vi2926, %vi2780
	mov	%vi2927, %i0
	lf	%vf2438, 0(%vi2926)
	fmul	%vf2439, %vf2437, %vf2438
	fadd	%vf2440, %vf2436, %vf2439
	fmov	%vf2441, %vf2440
	movui	%i31, 262144
	mif	%vf2442, %i31
	finv	%vf2443, %vf2442
	fmul	%vf2444, %vf2441, %vf2443
	fadd	%vf2445, %vf2433, %vf2444
	sf	%vf2445, 8(%vi2892)
	set_label	%vi2928, min_caml_nvector
	mov	%vi2929, %vi2771
	mov	%vi2930, %vi2772
	mov	%vi2931, %vi2773
	mov	%vi2932, %vi2774
	mov	%vi2933, %vi2775
	mov	%vi2934, %vi2776
	mov	%vi2935, %vi2777
	mov	%vi2936, %vi2778
	mov	%vi2937, %vi2779
	mov	%vi2938, %vi2780
	mov	%vi2939, %vi2935
	mov	%vi2940, %vi2928
	mov	%vi2941, %vi2939
	mov	%vi2942, %i0
	lf	%vf2446, 0(%vi2940)
	fmov	%f1, %vf2446
	call_dir	fsqr.2386
	fmov	%vf2448, %f1
	lf	%vf2449, 4(%vi2940)
	fmov	%f1, %vf2449
	call_dir	fsqr.2386
	fmov	%vf2451, %f1
	fadd	%vf2452, %vf2448, %vf2451
	lf	%vf2453, 8(%vi2940)
	fmov	%f1, %vf2453
	call_dir	fsqr.2386
	fmov	%vf2455, %f1
	fadd	%vf2456, %vf2452, %vf2455
	fmov	%f1, %vf2456
	call_dir	sqrt.2275
	fmov	%vf2458, %f1
	mov	%vi2943, %i0
	jeq	%vi2941, %i0, then.11798
	fneg	%vf2459, %vf2458
	set_label	%i31, cont.11799
	jmp	%i0, 0(%i31)
then.11798:
	fmov	%vf2459, %vf2458
cont.11799:
	mov	%vi2944, %i0
	mov	%vi2945, %i0
	lf	%vf2460, 0(%vi2940)
	finv	%vf2461, %vf2459
	fmul	%vf2462, %vf2460, %vf2461
	sf	%vf2462, 0(%vi2940)
	lf	%vf2463, 4(%vi2940)
	finv	%vf2464, %vf2459
	fmul	%vf2465, %vf2463, %vf2464
	sf	%vf2465, 4(%vi2940)
	lf	%vf2466, 8(%vi2940)
	finv	%vf2467, %vf2459
	fmul	%vf2468, %vf2466, %vf2467
	sf	%vf2468, 8(%vi2940)
	ret
	.end_function
	.func_entry
get_nvector.4226:
	mov	%vi2946, %i4
	mov	%vi2947, %i5
	mov	%vi2948, %i6
	mov	%vi2949, %i7
	mov	%vi2950, %i8
	mov	%vi2951, %i9
	mov	%vi2952, %i10
	mov	%vi2953, %i11
	mov	%vi2954, %i12
	mov	%vi2955, %i13
	mov	%vi2956, %i14
	mov	%vi2957, %vi2946
	mov	%vi2958, %vi2947
	mov	%vi2959, %vi2948
	mov	%vi2960, %vi2949
	mov	%vi2961, %vi2950
	mov	%vi2962, %vi2951
	mov	%vi2963, %vi2952
	mov	%vi2964, %vi2953
	mov	%vi2965, %vi2954
	mov	%vi2966, %vi2955
	mov	%vi2967, %vi2958
	movi	%i31, 1
	jeq	%vi2967, %i31, then.11801
	movi	%i31, 2
	jeq	%vi2967, %i31, then.11802
	mov	%vi3001, %vi2946
	mov	%vi3002, %vi2947
	mov	%vi3003, %vi2948
	mov	%vi3004, %vi2949
	mov	%vi3005, %vi2950
	mov	%vi3006, %vi2951
	mov	%vi3007, %vi2952
	mov	%vi3008, %vi2953
	mov	%vi3009, %vi2954
	mov	%vi3010, %vi2955
	mov	%vi3011, %vi3004
	mov	%vi3012, %i0
	jeq	%vi3011, %i0, then.11803
	mov	%vi3032, %vi2946
	mov	%vi3033, %vi2947
	mov	%vi3034, %vi2948
	mov	%vi3035, %vi2949
	mov	%vi3036, %vi2950
	mov	%vi3037, %vi2951
	mov	%vi3038, %vi2952
	mov	%vi3039, %vi2953
	mov	%vi3040, %vi2954
	mov	%vi3041, %vi2955
	mov	%vi3042, %vi2956
	set_label	%vi3043, min_caml_nvector_w
	mov	%vi3044, %i0
	mov	%vi3045, %i0
	lf	%vf2517, 0(%vi3042)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_x.2490
	fmov	%vf2519, %f1
	fsub	%vf2520, %vf2517, %vf2519
	sf	%vf2520, 0(%vi3043)
	set_label	%vi3046, min_caml_nvector_w
	lf	%vf2521, 4(%vi3042)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_y.2503
	fmov	%vf2523, %f1
	fsub	%vf2524, %vf2521, %vf2523
	sf	%vf2524, 4(%vi3046)
	set_label	%vi3047, min_caml_nvector_w
	lf	%vf2525, 8(%vi3042)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_z.2516
	fmov	%vf2527, %f1
	fsub	%vf2528, %vf2525, %vf2527
	sf	%vf2528, 8(%vi3047)
	set_label	%vi3048, min_caml_nvector
	mov	%vi3049, %i0
	set_label	%vi3050, min_caml_nvector_w
	mov	%vi3051, %i0
	lf	%vf2529, 0(%vi3050)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_a.2451
	fmov	%vf2531, %f1
	fmul	%vf2532, %vf2529, %vf2531
	set_label	%vi3052, min_caml_nvector_w
	lf	%vf2533, 4(%vi3052)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_r3.2620
	fmov	%vf2535, %f1
	fmul	%vf2536, %vf2533, %vf2535
	set_label	%vi3053, min_caml_nvector_w
	lf	%vf2537, 8(%vi3053)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_r2.2607
	fmov	%vf2539, %f1
	fmul	%vf2540, %vf2537, %vf2539
	fadd	%vf2541, %vf2536, %vf2540
	fmov	%f1, %vf2541
	call_dir	fhalf.2388
	fmov	%vf2543, %f1
	fadd	%vf2544, %vf2532, %vf2543
	sf	%vf2544, 0(%vi3048)
	set_label	%vi3054, min_caml_nvector
	set_label	%vi3055, min_caml_nvector_w
	lf	%vf2545, 4(%vi3055)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_b.2464
	fmov	%vf2547, %f1
	fmul	%vf2548, %vf2545, %vf2547
	set_label	%vi3056, min_caml_nvector_w
	mov	%vi3057, %i0
	lf	%vf2549, 0(%vi3056)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_r3.2620
	fmov	%vf2551, %f1
	fmul	%vf2552, %vf2549, %vf2551
	set_label	%vi3058, min_caml_nvector_w
	lf	%vf2553, 8(%vi3058)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_r1.2594
	fmov	%vf2555, %f1
	fmul	%vf2556, %vf2553, %vf2555
	fadd	%vf2557, %vf2552, %vf2556
	fmov	%f1, %vf2557
	call_dir	fhalf.2388
	fmov	%vf2559, %f1
	fadd	%vf2560, %vf2548, %vf2559
	sf	%vf2560, 4(%vi3054)
	set_label	%vi3059, min_caml_nvector
	set_label	%vi3060, min_caml_nvector_w
	lf	%vf2561, 8(%vi3060)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_c.2477
	fmov	%vf2563, %f1
	fmul	%vf2564, %vf2561, %vf2563
	set_label	%vi3061, min_caml_nvector_w
	mov	%vi3062, %i0
	lf	%vf2565, 0(%vi3061)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_r2.2607
	fmov	%vf2567, %f1
	fmul	%vf2568, %vf2565, %vf2567
	set_label	%vi3063, min_caml_nvector_w
	lf	%vf2569, 4(%vi3063)
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_param_r1.2594
	fmov	%vf2571, %f1
	fmul	%vf2572, %vf2569, %vf2571
	fadd	%vf2573, %vf2568, %vf2572
	fmov	%f1, %vf2573
	call_dir	fhalf.2388
	fmov	%vf2575, %f1
	fadd	%vf2576, %vf2564, %vf2575
	sf	%vf2576, 8(%vi3059)
	set_label	%vi3064, min_caml_nvector
	mov	%i4, %vi3032
	mov	%i5, %vi3033
	mov	%i6, %vi3034
	mov	%i7, %vi3035
	mov	%i8, %vi3036
	mov	%i9, %vi3037
	mov	%i10, %vi3038
	mov	%i11, %vi3039
	mov	%i12, %vi3040
	mov	%i13, %vi3041
	call_dir	o_isinvert.2427
	mov	%vi3066, %i4
	mov	%i4, %vi3064
	mov	%i5, %vi3066
	call_dir	normalize_vector.2633
	ret
then.11803:
	mov	%vi3013, %vi2946
	mov	%vi3014, %vi2947
	mov	%vi3015, %vi2948
	mov	%vi3016, %vi2949
	mov	%vi3017, %vi2950
	mov	%vi3018, %vi2951
	mov	%vi3019, %vi2952
	mov	%vi3020, %vi2953
	mov	%vi3021, %vi2954
	mov	%vi3022, %vi2955
	mov	%vi3023, %vi2956
	set_label	%vi3024, min_caml_nvector
	mov	%vi3025, %i0
	mov	%vi3026, %i0
	lf	%vf2496, 0(%vi3023)
	mov	%i4, %vi3013
	mov	%i5, %vi3014
	mov	%i6, %vi3015
	mov	%i7, %vi3016
	mov	%i8, %vi3017
	mov	%i9, %vi3018
	mov	%i10, %vi3019
	mov	%i11, %vi3020
	mov	%i12, %vi3021
	mov	%i13, %vi3022
	call_dir	o_param_x.2490
	fmov	%vf2498, %f1
	fsub	%vf2499, %vf2496, %vf2498
	mov	%i4, %vi3013
	mov	%i5, %vi3014
	mov	%i6, %vi3015
	mov	%i7, %vi3016
	mov	%i8, %vi3017
	mov	%i9, %vi3018
	mov	%i10, %vi3019
	mov	%i11, %vi3020
	mov	%i12, %vi3021
	mov	%i13, %vi3022
	call_dir	o_param_a.2451
	fmov	%vf2501, %f1
	fmul	%vf2502, %vf2499, %vf2501
	sf	%vf2502, 0(%vi3024)
	set_label	%vi3027, min_caml_nvector
	lf	%vf2503, 4(%vi3023)
	mov	%i4, %vi3013
	mov	%i5, %vi3014
	mov	%i6, %vi3015
	mov	%i7, %vi3016
	mov	%i8, %vi3017
	mov	%i9, %vi3018
	mov	%i10, %vi3019
	mov	%i11, %vi3020
	mov	%i12, %vi3021
	mov	%i13, %vi3022
	call_dir	o_param_y.2503
	fmov	%vf2505, %f1
	fsub	%vf2506, %vf2503, %vf2505
	mov	%i4, %vi3013
	mov	%i5, %vi3014
	mov	%i6, %vi3015
	mov	%i7, %vi3016
	mov	%i8, %vi3017
	mov	%i9, %vi3018
	mov	%i10, %vi3019
	mov	%i11, %vi3020
	mov	%i12, %vi3021
	mov	%i13, %vi3022
	call_dir	o_param_b.2464
	fmov	%vf2508, %f1
	fmul	%vf2509, %vf2506, %vf2508
	sf	%vf2509, 4(%vi3027)
	set_label	%vi3028, min_caml_nvector
	lf	%vf2510, 8(%vi3023)
	mov	%i4, %vi3013
	mov	%i5, %vi3014
	mov	%i6, %vi3015
	mov	%i7, %vi3016
	mov	%i8, %vi3017
	mov	%i9, %vi3018
	mov	%i10, %vi3019
	mov	%i11, %vi3020
	mov	%i12, %vi3021
	mov	%i13, %vi3022
	call_dir	o_param_z.2516
	fmov	%vf2512, %f1
	fsub	%vf2513, %vf2510, %vf2512
	mov	%i4, %vi3013
	mov	%i5, %vi3014
	mov	%i6, %vi3015
	mov	%i7, %vi3016
	mov	%i8, %vi3017
	mov	%i9, %vi3018
	mov	%i10, %vi3019
	mov	%i11, %vi3020
	mov	%i12, %vi3021
	mov	%i13, %vi3022
	call_dir	o_param_c.2477
	fmov	%vf2515, %f1
	fmul	%vf2516, %vf2513, %vf2515
	sf	%vf2516, 8(%vi3028)
	set_label	%vi3029, min_caml_nvector
	mov	%i4, %vi3013
	mov	%i5, %vi3014
	mov	%i6, %vi3015
	mov	%i7, %vi3016
	mov	%i8, %vi3017
	mov	%i9, %vi3018
	mov	%i10, %vi3019
	mov	%i11, %vi3020
	mov	%i12, %vi3021
	mov	%i13, %vi3022
	call_dir	o_isinvert.2427
	mov	%vi3031, %i4
	mov	%i4, %vi3029
	mov	%i5, %vi3031
	call_dir	normalize_vector.2633
	ret
then.11802:
	mov	%vi2987, %vi2946
	mov	%vi2988, %vi2947
	mov	%vi2989, %vi2948
	mov	%vi2990, %vi2949
	mov	%vi2991, %vi2950
	mov	%vi2992, %vi2951
	mov	%vi2993, %vi2952
	mov	%vi2994, %vi2953
	mov	%vi2995, %vi2954
	mov	%vi2996, %vi2955
	set_label	%vi2997, min_caml_nvector
	mov	%vi2998, %i0
	mov	%i4, %vi2987
	mov	%i5, %vi2988
	mov	%i6, %vi2989
	mov	%i7, %vi2990
	mov	%i8, %vi2991
	mov	%i9, %vi2992
	mov	%i10, %vi2993
	mov	%i11, %vi2994
	mov	%i12, %vi2995
	mov	%i13, %vi2996
	call_dir	o_param_a.2451
	fmov	%vf2488, %f1
	fneg	%vf2489, %vf2488
	sf	%vf2489, 0(%vi2997)
	set_label	%vi2999, min_caml_nvector
	mov	%i4, %vi2987
	mov	%i5, %vi2988
	mov	%i6, %vi2989
	mov	%i7, %vi2990
	mov	%i8, %vi2991
	mov	%i9, %vi2992
	mov	%i10, %vi2993
	mov	%i11, %vi2994
	mov	%i12, %vi2995
	mov	%i13, %vi2996
	call_dir	o_param_b.2464
	fmov	%vf2491, %f1
	fneg	%vf2492, %vf2491
	sf	%vf2492, 4(%vi2999)
	set_label	%vi3000, min_caml_nvector
	mov	%i4, %vi2987
	mov	%i5, %vi2988
	mov	%i6, %vi2989
	mov	%i7, %vi2990
	mov	%i8, %vi2991
	mov	%i9, %vi2992
	mov	%i10, %vi2993
	mov	%i11, %vi2994
	mov	%i12, %vi2995
	mov	%i13, %vi2996
	call_dir	o_param_c.2477
	fmov	%vf2494, %f1
	fneg	%vf2495, %vf2494
	sf	%vf2495, 8(%vi3000)
	ret
then.11801:
	set_label	%vi2968, min_caml_intsec_rectside
	mov	%vi2969, %i0
	lw	%vi2970, 0(%vi2968)
	movi	%i31, 1
	jeq	%vi2970, %i31, then.11805
	movi	%i31, 2
	jeq	%vi2970, %i31, then.11806
	movi	%i31, 3
	jeq	%vi2970, %i31, then.11807
	ret
then.11807:
	set_label	%vi2982, min_caml_nvector
	mov	%vi2983, %i0
	fmov	%vf2481, %f0
	sf	%f0, 0(%vi2982)
	set_label	%vi2984, min_caml_nvector
	fmov	%vf2482, %f0
	sf	%f0, 4(%vi2984)
	set_label	%vi2985, min_caml_nvector
	set_label	%vi2986, min_caml_vscan
	lf	%vf2483, 8(%vi2986)
	fmov	%f1, %vf2483
	call_dir	sgn.2664
	fmov	%vf2485, %f1
	fneg	%vf2486, %vf2485
	sf	%vf2486, 8(%vi2985)
	ret
then.11806:
	set_label	%vi2977, min_caml_nvector
	mov	%vi2978, %i0
	fmov	%vf2475, %f0
	sf	%f0, 0(%vi2977)
	set_label	%vi2979, min_caml_nvector
	set_label	%vi2980, min_caml_vscan
	lf	%vf2476, 4(%vi2980)
	fmov	%f1, %vf2476
	call_dir	sgn.2664
	fmov	%vf2478, %f1
	fneg	%vf2479, %vf2478
	sf	%vf2479, 4(%vi2979)
	set_label	%vi2981, min_caml_nvector
	fmov	%vf2480, %f0
	sf	%f0, 8(%vi2981)
	ret
then.11805:
	set_label	%vi2971, min_caml_nvector
	mov	%vi2972, %i0
	set_label	%vi2973, min_caml_vscan
	mov	%vi2974, %i0
	lf	%vf2469, 0(%vi2973)
	fmov	%f1, %vf2469
	call_dir	sgn.2664
	fmov	%vf2471, %f1
	fneg	%vf2472, %vf2471
	sf	%vf2472, 0(%vi2971)
	set_label	%vi2975, min_caml_nvector
	fmov	%vf2473, %f0
	sf	%f0, 4(%vi2975)
	set_label	%vi2976, min_caml_nvector
	fmov	%vf2474, %f0
	sf	%f0, 8(%vi2976)
	ret
	.end_function
	.func_entry
utexture.4235:
	mov	%vi3067, %i4
	mov	%vi3068, %i5
	mov	%vi3069, %i6
	mov	%vi3070, %i7
	mov	%vi3071, %i8
	mov	%vi3072, %i9
	mov	%vi3073, %i10
	mov	%vi3074, %i11
	mov	%vi3075, %i12
	mov	%vi3076, %i13
	mov	%vi3077, %i14
	mov	%vi3078, %i0
	lf	%vf2577, 0(%vi3077)
	lf	%vf2578, 4(%vi3077)
	lf	%vf2579, 8(%vi3077)
	mov	%vi3079, %vi3067
	mov	%vi3080, %vi3068
	mov	%vi3081, %vi3069
	mov	%vi3082, %vi3070
	mov	%vi3083, %vi3071
	mov	%vi3084, %vi3072
	mov	%vi3085, %vi3073
	mov	%vi3086, %vi3074
	mov	%vi3087, %vi3075
	mov	%vi3088, %vi3076
	mov	%vi3089, %vi3079
	set_label	%vi3090, min_caml_texture_color
	mov	%vi3091, %i0
	mov	%vi3092, %vi3067
	mov	%vi3093, %vi3068
	mov	%vi3094, %vi3069
	mov	%vi3095, %vi3070
	mov	%vi3096, %vi3071
	mov	%vi3097, %vi3072
	mov	%vi3098, %vi3073
	mov	%vi3099, %vi3074
	mov	%vi3100, %vi3075
	mov	%vi3101, %vi3076
	mov	%vi3102, %i0
	lf	%vf2580, 0(%vi3100)
	sf	%vf2580, 0(%vi3090)
	set_label	%vi3103, min_caml_texture_color
	mov	%vi3104, %vi3067
	mov	%vi3105, %vi3068
	mov	%vi3106, %vi3069
	mov	%vi3107, %vi3070
	mov	%vi3108, %vi3071
	mov	%vi3109, %vi3072
	mov	%vi3110, %vi3073
	mov	%vi3111, %vi3074
	mov	%vi3112, %vi3075
	mov	%vi3113, %vi3076
	lf	%vf2581, 4(%vi3112)
	sf	%vf2581, 4(%vi3103)
	set_label	%vi3114, min_caml_texture_color
	mov	%vi3115, %vi3067
	mov	%vi3116, %vi3068
	mov	%vi3117, %vi3069
	mov	%vi3118, %vi3070
	mov	%vi3119, %vi3071
	mov	%vi3120, %vi3072
	mov	%vi3121, %vi3073
	mov	%vi3122, %vi3074
	mov	%vi3123, %vi3075
	mov	%vi3124, %vi3076
	lf	%vf2582, 8(%vi3123)
	sf	%vf2582, 8(%vi3114)
	movi	%i31, 1
	jeq	%vi3089, %i31, then.11812
	movi	%i31, 2
	jeq	%vi3089, %i31, then.11813
	movi	%i31, 3
	jeq	%vi3089, %i31, then.11814
	movi	%i31, 4
	jeq	%vi3089, %i31, then.11815
	ret
then.11815:
	mov	%vi3180, %i0
	fmov	%vf2742, %vf2577
	mov	%vi3181, %vi3067
	mov	%vi3182, %vi3068
	mov	%vi3183, %vi3069
	mov	%vi3184, %vi3070
	mov	%vi3185, %vi3071
	mov	%vi3186, %vi3072
	mov	%vi3187, %vi3073
	mov	%vi3188, %vi3074
	mov	%vi3189, %vi3075
	mov	%vi3190, %vi3076
	mov	%vi3191, %i0
	lf	%vf2743, 0(%vi3186)
	fsub	%vf2744, %vf2742, %vf2743
	mov	%vi3192, %vi3067
	mov	%vi3193, %vi3068
	mov	%vi3194, %vi3069
	mov	%vi3195, %vi3070
	mov	%vi3196, %vi3071
	mov	%vi3197, %vi3072
	mov	%vi3198, %vi3073
	mov	%vi3199, %vi3074
	mov	%vi3200, %vi3075
	mov	%vi3201, %vi3076
	mov	%vi3202, %i0
	lf	%vf2745, 0(%vi3196)
	fmov	%vf2746, %vf2745
	fmov	%f1, %vf2746
	frsqrt	%f1, %f1
	fmov	%vf2748, %f1
	movui	%i31, 260096
	mif	%vf2749, %i31
	finv	%vf2750, %vf2748
	fmul	%vf2751, %vf2749, %vf2750
	fmul	%vf2752, %vf2744, %vf2751
	fmov	%vf2753, %vf2579
	mov	%vi3203, %vi3067
	mov	%vi3204, %vi3068
	mov	%vi3205, %vi3069
	mov	%vi3206, %vi3070
	mov	%vi3207, %vi3071
	mov	%vi3208, %vi3072
	mov	%vi3209, %vi3073
	mov	%vi3210, %vi3074
	mov	%vi3211, %vi3075
	mov	%vi3212, %vi3076
	lf	%vf2754, 8(%vi3208)
	fsub	%vf2755, %vf2753, %vf2754
	mov	%vi3213, %vi3067
	mov	%vi3214, %vi3068
	mov	%vi3215, %vi3069
	mov	%vi3216, %vi3070
	mov	%vi3217, %vi3071
	mov	%vi3218, %vi3072
	mov	%vi3219, %vi3073
	mov	%vi3220, %vi3074
	mov	%vi3221, %vi3075
	mov	%vi3222, %vi3076
	lf	%vf2756, 8(%vi3217)
	fmov	%vf2757, %vf2756
	fmov	%f1, %vf2757
	frsqrt	%f1, %f1
	fmov	%vf2759, %f1
	movui	%i31, 260096
	mif	%vf2760, %i31
	finv	%vf2761, %vf2759
	fmul	%vf2762, %vf2760, %vf2761
	fmul	%vf2763, %vf2755, %vf2762
	fmov	%vf2764, %vf2752
	fmul	%vf2765, %vf2764, %vf2764
	fmov	%vf2766, %vf2763
	fmul	%vf2767, %vf2766, %vf2766
	fadd	%vf2768, %vf2765, %vf2767
	fmov	%vf2769, %vf2768
	fmov	%f1, %vf2769
	frsqrt	%f1, %f1
	fmov	%vf2771, %f1
	movui	%i31, 260096
	mif	%vf2772, %i31
	finv	%vf2773, %vf2771
	fmul	%vf2774, %vf2772, %vf2773
	movui	%i31, 232731
	addi	%i31, %i31, 1815
	mif	%vf2775, %i31
	fmov	%f1, %vf2752
	call_dir	min_caml_abs_float
	fmov	%vf2777, %f1
	fleq	%i31, %vf2775, %vf2777
	jzero	%i0, %i31, else.11817
	finv	%vf2778, %vf2752
	fmul	%vf2779, %vf2763, %vf2778
	fmov	%f1, %vf2779
	call_dir	min_caml_abs_float
	fmov	%vf2781, %f1
	fmov	%vf2782, %vf2781
	movui	%i31, 260096
	mif	%vf2783, %i31
	fleq	%i31, %vf2782, %vf2783
	jzero	%i0, %i31, else.11819
	movui	%i31, 784384
	mif	%vf2784, %i31
	fleq	%i31, %vf2784, %vf2782
	jzero	%i0, %i31, else.11821
	fmul	%vf2785, %vf2782, %vf2782
	movui	%i31, 245674
	addi	%i31, %i31, -245
	mif	%vf2786, %i31
	fmul	%vf2787, %vf2786, %vf2785
	movui	%i31, 774479
	addi	%i31, %i31, -339
	mif	%vf2788, %i31
	fadd	%vf2789, %vf2787, %vf2788
	fmul	%vf2790, %vf2789, %vf2785
	movui	%i31, 252580
	addi	%i31, %i31, -460
	mif	%vf2791, %i31
	fadd	%vf2792, %vf2790, %vf2791
	fmul	%vf2793, %vf2792, %vf2785
	movui	%i31, 778395
	addi	%i31, %i31, 1221
	mif	%vf2794, %i31
	fadd	%vf2795, %vf2793, %vf2794
	fmul	%vf2796, %vf2795, %vf2785
	movui	%i31, 255160
	addi	%i31, %i31, -676
	mif	%vf2797, %i31
	fadd	%vf2798, %vf2796, %vf2797
	fmul	%vf2799, %vf2798, %vf2785
	movui	%i31, 780970
	addi	%i31, %i31, 162
	mif	%vf2800, %i31
	fadd	%vf2801, %vf2799, %vf2800
	fmul	%vf2802, %vf2801, %vf2785
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf2803, %i31
	fadd	%vf2804, %vf2802, %vf2803
	fmul	%vf2855, %vf2804, %vf2782
	set_label	%i31, cont.11822
	jmp	%i0, 0(%i31)
else.11821:
	movui	%i31, 260096
	mif	%vf2805, %i31
	finv	%vf2806, %vf2782
	fmul	%vf2807, %vf2805, %vf2806
	fmul	%vf2808, %vf2807, %vf2807
	movui	%i31, 769962
	addi	%i31, %i31, -245
	mif	%vf2809, %i31
	fmul	%vf2810, %vf2809, %vf2808
	movui	%i31, 250191
	addi	%i31, %i31, -339
	mif	%vf2811, %i31
	fadd	%vf2812, %vf2810, %vf2811
	fmul	%vf2813, %vf2812, %vf2808
	movui	%i31, 776868
	addi	%i31, %i31, -460
	mif	%vf2814, %i31
	fadd	%vf2815, %vf2813, %vf2814
	fmul	%vf2816, %vf2815, %vf2808
	movui	%i31, 254107
	addi	%i31, %i31, 1221
	mif	%vf2817, %i31
	fadd	%vf2818, %vf2816, %vf2817
	fmul	%vf2819, %vf2818, %vf2808
	movui	%i31, 779448
	addi	%i31, %i31, -676
	mif	%vf2820, %i31
	fadd	%vf2821, %vf2819, %vf2820
	fmul	%vf2822, %vf2821, %vf2808
	movui	%i31, 256682
	addi	%i31, %i31, 162
	mif	%vf2823, %i31
	fadd	%vf2824, %vf2822, %vf2823
	fmul	%vf2825, %vf2824, %vf2808
	movui	%i31, 784384
	addi	%i31, %i31, -13
	mif	%vf2826, %i31
	fadd	%vf2827, %vf2825, %vf2826
	fmul	%vf2828, %vf2827, %vf2807
	lf	%vf2829, 8(%i0)
	fadd	%vf2855, %vf2828, %vf2829
cont.11822:
	set_label	%i31, cont.11820
	jmp	%i0, 0(%i31)
else.11819:
	movui	%i31, 260096
	mif	%vf2830, %i31
	finv	%vf2831, %vf2782
	fmul	%vf2832, %vf2830, %vf2831
	fmul	%vf2833, %vf2832, %vf2832
	movui	%i31, 769962
	addi	%i31, %i31, -245
	mif	%vf2834, %i31
	fmul	%vf2835, %vf2834, %vf2833
	movui	%i31, 250191
	addi	%i31, %i31, -339
	mif	%vf2836, %i31
	fadd	%vf2837, %vf2835, %vf2836
	fmul	%vf2838, %vf2837, %vf2833
	movui	%i31, 776868
	addi	%i31, %i31, -460
	mif	%vf2839, %i31
	fadd	%vf2840, %vf2838, %vf2839
	fmul	%vf2841, %vf2840, %vf2833
	movui	%i31, 254107
	addi	%i31, %i31, 1221
	mif	%vf2842, %i31
	fadd	%vf2843, %vf2841, %vf2842
	fmul	%vf2844, %vf2843, %vf2833
	movui	%i31, 779448
	addi	%i31, %i31, -676
	mif	%vf2845, %i31
	fadd	%vf2846, %vf2844, %vf2845
	fmul	%vf2847, %vf2846, %vf2833
	movui	%i31, 256682
	addi	%i31, %i31, 162
	mif	%vf2848, %i31
	fadd	%vf2849, %vf2847, %vf2848
	fmul	%vf2850, %vf2849, %vf2833
	movui	%i31, 784384
	addi	%i31, %i31, -13
	mif	%vf2851, %i31
	fadd	%vf2852, %vf2850, %vf2851
	fmul	%vf2853, %vf2852, %vf2832
	lf	%vf2854, 4(%i0)
	fadd	%vf2855, %vf2853, %vf2854
cont.11820:
	movui	%i31, 270080
	mif	%vf2856, %i31
	movui	%i31, 263313
	addi	%i31, %i31, -37
	mif	%vf2857, %i31
	finv	%vf2858, %vf2857
	fmul	%vf2859, %vf2856, %vf2858
	fmul	%vf2860, %vf2855, %vf2859
	set_label	%i31, cont.11818
	jmp	%i0, 0(%i31)
else.11817:
	movui	%i31, 268032
	mif	%vf2860, %i31
cont.11818:
	fmov	%f1, %vf2860
	ffloor	%f1, %f1
	fmov	%vf2862, %f1
	fsub	%vf2863, %vf2860, %vf2862
	fmov	%vf2864, %vf2578
	mov	%vi3223, %vi3067
	mov	%vi3224, %vi3068
	mov	%vi3225, %vi3069
	mov	%vi3226, %vi3070
	mov	%vi3227, %vi3071
	mov	%vi3228, %vi3072
	mov	%vi3229, %vi3073
	mov	%vi3230, %vi3074
	mov	%vi3231, %vi3075
	mov	%vi3232, %vi3076
	lf	%vf2865, 4(%vi3228)
	fsub	%vf2866, %vf2864, %vf2865
	mov	%vi3233, %vi3067
	mov	%vi3234, %vi3068
	mov	%vi3235, %vi3069
	mov	%vi3236, %vi3070
	mov	%vi3237, %vi3071
	mov	%vi3238, %vi3072
	mov	%vi3239, %vi3073
	mov	%vi3240, %vi3074
	mov	%vi3241, %vi3075
	mov	%vi3242, %vi3076
	lf	%vf2867, 4(%vi3237)
	fmov	%vf2868, %vf2867
	fmov	%f1, %vf2868
	frsqrt	%f1, %f1
	fmov	%vf2870, %f1
	movui	%i31, 260096
	mif	%vf2871, %i31
	finv	%vf2872, %vf2870
	fmul	%vf2873, %vf2871, %vf2872
	fmul	%vf2874, %vf2866, %vf2873
	movui	%i31, 232731
	addi	%i31, %i31, 1815
	mif	%vf2875, %i31
	fmov	%f1, %vf2860
	call_dir	min_caml_abs_float
	fmov	%vf2877, %f1
	fleq	%i31, %vf2875, %vf2877
	jzero	%i0, %i31, else.11823
	finv	%vf2878, %vf2774
	fmul	%vf2879, %vf2874, %vf2878
	fmov	%f1, %vf2879
	call_dir	min_caml_abs_float
	fmov	%vf2881, %f1
	fmov	%vf2882, %vf2881
	movui	%i31, 260096
	mif	%vf2883, %i31
	fleq	%i31, %vf2882, %vf2883
	jzero	%i0, %i31, else.11825
	movui	%i31, 784384
	mif	%vf2884, %i31
	fleq	%i31, %vf2884, %vf2882
	jzero	%i0, %i31, else.11827
	fmul	%vf2885, %vf2882, %vf2882
	movui	%i31, 245674
	addi	%i31, %i31, -245
	mif	%vf2886, %i31
	fmul	%vf2887, %vf2886, %vf2885
	movui	%i31, 774479
	addi	%i31, %i31, -339
	mif	%vf2888, %i31
	fadd	%vf2889, %vf2887, %vf2888
	fmul	%vf2890, %vf2889, %vf2885
	movui	%i31, 252580
	addi	%i31, %i31, -460
	mif	%vf2891, %i31
	fadd	%vf2892, %vf2890, %vf2891
	fmul	%vf2893, %vf2892, %vf2885
	movui	%i31, 778395
	addi	%i31, %i31, 1221
	mif	%vf2894, %i31
	fadd	%vf2895, %vf2893, %vf2894
	fmul	%vf2896, %vf2895, %vf2885
	movui	%i31, 255160
	addi	%i31, %i31, -676
	mif	%vf2897, %i31
	fadd	%vf2898, %vf2896, %vf2897
	fmul	%vf2899, %vf2898, %vf2885
	movui	%i31, 780970
	addi	%i31, %i31, 162
	mif	%vf2900, %i31
	fadd	%vf2901, %vf2899, %vf2900
	fmul	%vf2902, %vf2901, %vf2885
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf2903, %i31
	fadd	%vf2904, %vf2902, %vf2903
	fmul	%vf2955, %vf2904, %vf2882
	set_label	%i31, cont.11828
	jmp	%i0, 0(%i31)
else.11827:
	movui	%i31, 260096
	mif	%vf2905, %i31
	finv	%vf2906, %vf2882
	fmul	%vf2907, %vf2905, %vf2906
	fmul	%vf2908, %vf2907, %vf2907
	movui	%i31, 769962
	addi	%i31, %i31, -245
	mif	%vf2909, %i31
	fmul	%vf2910, %vf2909, %vf2908
	movui	%i31, 250191
	addi	%i31, %i31, -339
	mif	%vf2911, %i31
	fadd	%vf2912, %vf2910, %vf2911
	fmul	%vf2913, %vf2912, %vf2908
	movui	%i31, 776868
	addi	%i31, %i31, -460
	mif	%vf2914, %i31
	fadd	%vf2915, %vf2913, %vf2914
	fmul	%vf2916, %vf2915, %vf2908
	movui	%i31, 254107
	addi	%i31, %i31, 1221
	mif	%vf2917, %i31
	fadd	%vf2918, %vf2916, %vf2917
	fmul	%vf2919, %vf2918, %vf2908
	movui	%i31, 779448
	addi	%i31, %i31, -676
	mif	%vf2920, %i31
	fadd	%vf2921, %vf2919, %vf2920
	fmul	%vf2922, %vf2921, %vf2908
	movui	%i31, 256682
	addi	%i31, %i31, 162
	mif	%vf2923, %i31
	fadd	%vf2924, %vf2922, %vf2923
	fmul	%vf2925, %vf2924, %vf2908
	movui	%i31, 784384
	addi	%i31, %i31, -13
	mif	%vf2926, %i31
	fadd	%vf2927, %vf2925, %vf2926
	fmul	%vf2928, %vf2927, %vf2907
	lf	%vf2929, 8(%i0)
	fadd	%vf2955, %vf2928, %vf2929
cont.11828:
	set_label	%i31, cont.11826
	jmp	%i0, 0(%i31)
else.11825:
	movui	%i31, 260096
	mif	%vf2930, %i31
	finv	%vf2931, %vf2882
	fmul	%vf2932, %vf2930, %vf2931
	fmul	%vf2933, %vf2932, %vf2932
	movui	%i31, 769962
	addi	%i31, %i31, -245
	mif	%vf2934, %i31
	fmul	%vf2935, %vf2934, %vf2933
	movui	%i31, 250191
	addi	%i31, %i31, -339
	mif	%vf2936, %i31
	fadd	%vf2937, %vf2935, %vf2936
	fmul	%vf2938, %vf2937, %vf2933
	movui	%i31, 776868
	addi	%i31, %i31, -460
	mif	%vf2939, %i31
	fadd	%vf2940, %vf2938, %vf2939
	fmul	%vf2941, %vf2940, %vf2933
	movui	%i31, 254107
	addi	%i31, %i31, 1221
	mif	%vf2942, %i31
	fadd	%vf2943, %vf2941, %vf2942
	fmul	%vf2944, %vf2943, %vf2933
	movui	%i31, 779448
	addi	%i31, %i31, -676
	mif	%vf2945, %i31
	fadd	%vf2946, %vf2944, %vf2945
	fmul	%vf2947, %vf2946, %vf2933
	movui	%i31, 256682
	addi	%i31, %i31, 162
	mif	%vf2948, %i31
	fadd	%vf2949, %vf2947, %vf2948
	fmul	%vf2950, %vf2949, %vf2933
	movui	%i31, 784384
	addi	%i31, %i31, -13
	mif	%vf2951, %i31
	fadd	%vf2952, %vf2950, %vf2951
	fmul	%vf2953, %vf2952, %vf2932
	lf	%vf2954, 4(%i0)
	fadd	%vf2955, %vf2953, %vf2954
cont.11826:
	movui	%i31, 270080
	mif	%vf2956, %i31
	movui	%i31, 263313
	addi	%i31, %i31, -37
	mif	%vf2957, %i31
	finv	%vf2958, %vf2957
	fmul	%vf2959, %vf2956, %vf2958
	fmul	%vf2960, %vf2955, %vf2959
	set_label	%i31, cont.11824
	jmp	%i0, 0(%i31)
else.11823:
	movui	%i31, 268032
	mif	%vf2960, %i31
cont.11824:
	fmov	%f1, %vf2960
	ffloor	%f1, %f1
	fmov	%vf2962, %f1
	fsub	%vf2963, %vf2960, %vf2962
	movui	%i31, 254362
	addi	%i31, %i31, -1638
	mif	%vf2964, %i31
	movui	%i31, 258048
	mif	%vf2965, %i31
	fsub	%vf2966, %vf2965, %vf2863
	fmov	%vf2967, %vf2966
	fmul	%vf2968, %vf2967, %vf2967
	fsub	%vf2969, %vf2964, %vf2968
	movui	%i31, 258048
	mif	%vf2970, %i31
	fsub	%vf2971, %vf2970, %vf2963
	fmov	%vf2972, %vf2971
	fmul	%vf2973, %vf2972, %vf2972
	fsub	%vf2974, %vf2969, %vf2973
	set_label	%vi3243, min_caml_texture_color
	fmov	%vf2975, %f0
	fleq	%i31, %vf2974, %f0
	jzero	%i0, %i31, else.11829
	fmov	%vf2980, %f0
	set_label	%i31, cont.11830
	jmp	%i0, 0(%i31)
else.11829:
	movui	%i31, 276464
	mif	%vf2976, %i31
	movui	%i31, 256410
	addi	%i31, %i31, -1638
	mif	%vf2977, %i31
	finv	%vf2978, %vf2977
	fmul	%vf2979, %vf2976, %vf2978
	fmul	%vf2980, %vf2974, %vf2979
cont.11830:
	sf	%vf2980, 8(%vi3243)
	ret
then.11814:
	mov	%vi3156, %i0
	fmov	%vf2704, %vf2577
	mov	%vi3157, %vi3067
	mov	%vi3158, %vi3068
	mov	%vi3159, %vi3069
	mov	%vi3160, %vi3070
	mov	%vi3161, %vi3071
	mov	%vi3162, %vi3072
	mov	%vi3163, %vi3073
	mov	%vi3164, %vi3074
	mov	%vi3165, %vi3075
	mov	%vi3166, %vi3076
	mov	%vi3167, %i0
	lf	%vf2705, 0(%vi3162)
	fsub	%vf2706, %vf2704, %vf2705
	fmov	%vf2707, %vf2579
	mov	%vi3168, %vi3067
	mov	%vi3169, %vi3068
	mov	%vi3170, %vi3069
	mov	%vi3171, %vi3070
	mov	%vi3172, %vi3071
	mov	%vi3173, %vi3072
	mov	%vi3174, %vi3073
	mov	%vi3175, %vi3074
	mov	%vi3176, %vi3075
	mov	%vi3177, %vi3076
	lf	%vf2708, 8(%vi3173)
	fsub	%vf2709, %vf2707, %vf2708
	fmov	%vf2710, %vf2706
	fmul	%vf2711, %vf2710, %vf2710
	fmov	%vf2712, %vf2709
	fmul	%vf2713, %vf2712, %vf2712
	fadd	%vf2714, %vf2711, %vf2713
	fmov	%vf2715, %vf2714
	fmov	%f1, %vf2715
	frsqrt	%f1, %f1
	fmov	%vf2717, %f1
	movui	%i31, 260096
	mif	%vf2718, %i31
	finv	%vf2719, %vf2717
	fmul	%vf2720, %vf2718, %vf2719
	movui	%i31, 266752
	mif	%vf2721, %i31
	finv	%vf2722, %vf2721
	fmul	%vf2723, %vf2720, %vf2722
	fmov	%f1, %vf2723
	ffloor	%f1, %f1
	fmov	%vf2725, %f1
	fsub	%vf2726, %vf2723, %vf2725
	movui	%i31, 263313
	addi	%i31, %i31, -37
	mif	%vf2727, %i31
	fmul	%vf2728, %vf2726, %vf2727
	fmov	%vf2729, %vf2728
	lf	%vf2730, 4(%i0)
	fsub	%vf2731, %vf2730, %vf2729
	fmov	%f1, %vf2731
	call_dir	sin.2133
	fmov	%vf2733, %f1
	fmov	%vf2734, %vf2733
	fmul	%vf2735, %vf2734, %vf2734
	set_label	%vi3178, min_caml_texture_color
	movui	%i31, 276464
	mif	%vf2736, %i31
	fmul	%vf2737, %vf2735, %vf2736
	sf	%vf2737, 4(%vi3178)
	set_label	%vi3179, min_caml_texture_color
	movui	%i31, 260096
	mif	%vf2738, %i31
	fsub	%vf2739, %vf2738, %vf2735
	movui	%i31, 276464
	mif	%vf2740, %i31
	fmul	%vf2741, %vf2739, %vf2740
	sf	%vf2741, 8(%vi3179)
	ret
then.11813:
	fmov	%vf2606, %vf2578
	movui	%i31, 256000
	mif	%vf2607, %i31
	fmul	%vf2608, %vf2606, %vf2607
	fmov	%vf2609, %vf2608
	lf	%vf2610, 4(%i0)
	fleq	%i31, %vf2609, %vf2610
	jzero	%i0, %i31, else.11833
	lf	%vf2611, 8(%i0)
	fleq	%i31, %vf2611, %vf2609
	jzero	%i0, %i31, else.11835
	fmul	%vf2612, %vf2609, %vf2609
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf2613, %i31
	fmul	%vf2614, %vf2613, %vf2612
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf2615, %i31
	fadd	%vf2616, %vf2614, %vf2615
	fmul	%vf2617, %vf2616, %vf2612
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf2618, %i31
	fadd	%vf2619, %vf2617, %vf2618
	fmul	%vf2620, %vf2619, %vf2612
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf2621, %i31
	fadd	%vf2622, %vf2620, %vf2621
	fmul	%vf2695, %vf2622, %vf2609
	set_label	%i31, cont.11836
	jmp	%i0, 0(%i31)
else.11835:
	lf	%vf2623, 12(%i0)
	fleq	%i31, %vf2609, %vf2623
	jzero	%i0, %i31, else.11837
	lf	%vf2624, 0(%i0)
	finv	%vf2625, %vf2624
	fmul	%vf2626, %vf2609, %vf2625
	fmov	%f1, %vf2626
	ffloor	%f1, %f1
	fmov	%vf2628, %f1
	lf	%vf2629, 0(%i0)
	fmul	%vf2630, %vf2628, %vf2629
	fsub	%vf2631, %vf2609, %vf2630
	lf	%vf2632, 4(%i0)
	fleq	%i31, %vf2631, %vf2632
	jzero	%i0, %i31, else.11839
	fmov	%vf2634, %vf2631
	set_label	%i31, cont.11840
	jmp	%i0, 0(%i31)
else.11839:
	lf	%vf2633, 0(%i0)
	fsub	%vf2634, %vf2633, %vf2631
cont.11840:
	fmul	%vf2635, %vf2634, %vf2634
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf2636, %i31
	fmul	%vf2637, %vf2636, %vf2635
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf2638, %i31
	fadd	%vf2639, %vf2637, %vf2638
	fmul	%vf2640, %vf2639, %vf2635
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf2641, %i31
	fadd	%vf2642, %vf2640, %vf2641
	fmul	%vf2643, %vf2642, %vf2635
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf2644, %i31
	fadd	%vf2645, %vf2643, %vf2644
	fmul	%vf2695, %vf2645, %vf2634
	set_label	%i31, cont.11838
	jmp	%i0, 0(%i31)
else.11837:
	lf	%vf2646, 12(%i0)
	fsub	%vf2647, %vf2646, %vf2609
	fmul	%vf2648, %vf2647, %vf2647
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf2649, %i31
	fmul	%vf2650, %vf2649, %vf2648
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf2651, %i31
	fadd	%vf2652, %vf2650, %vf2651
	fmul	%vf2653, %vf2652, %vf2648
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf2654, %i31
	fadd	%vf2655, %vf2653, %vf2654
	fmul	%vf2656, %vf2655, %vf2648
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf2657, %i31
	fadd	%vf2658, %vf2656, %vf2657
	fmul	%vf2695, %vf2658, %vf2647
cont.11838:
cont.11836:
	set_label	%i31, cont.11834
	jmp	%i0, 0(%i31)
else.11833:
	lf	%vf2659, 0(%i0)
	fleq	%i31, %vf2659, %vf2609
	jzero	%i0, %i31, else.11841
	lf	%vf2660, 0(%i0)
	finv	%vf2661, %vf2660
	fmul	%vf2662, %vf2609, %vf2661
	fmov	%f1, %vf2662
	ffloor	%f1, %f1
	fmov	%vf2664, %f1
	lf	%vf2665, 0(%i0)
	fmul	%vf2666, %vf2664, %vf2665
	fsub	%vf2667, %vf2609, %vf2666
	lf	%vf2668, 4(%i0)
	fleq	%i31, %vf2667, %vf2668
	jzero	%i0, %i31, else.11843
	fmov	%vf2670, %vf2667
	set_label	%i31, cont.11844
	jmp	%i0, 0(%i31)
else.11843:
	lf	%vf2669, 0(%i0)
	fsub	%vf2670, %vf2669, %vf2667
cont.11844:
	fmul	%vf2671, %vf2670, %vf2670
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf2672, %i31
	fmul	%vf2673, %vf2672, %vf2671
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf2674, %i31
	fadd	%vf2675, %vf2673, %vf2674
	fmul	%vf2676, %vf2675, %vf2671
	movui	%i31, 778923
	addi	%i31, %i31, -2033
	mif	%vf2677, %i31
	fadd	%vf2678, %vf2676, %vf2677
	fmul	%vf2679, %vf2678, %vf2671
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf2680, %i31
	fadd	%vf2681, %vf2679, %vf2680
	fmul	%vf2695, %vf2681, %vf2670
	set_label	%i31, cont.11842
	jmp	%i0, 0(%i31)
else.11841:
	lf	%vf2682, 0(%i0)
	fsub	%vf2683, %vf2682, %vf2609
	fmul	%vf2684, %vf2683, %vf2683
	movui	%i31, 758819
	addi	%i31, %i31, 973
	mif	%vf2685, %i31
	fmul	%vf2686, %vf2685, %vf2684
	movui	%i31, 245891
	addi	%i31, %i31, 972
	mif	%vf2687, %i31
	fadd	%vf2688, %vf2686, %vf2687
	fmul	%vf2689, %vf2688, %vf2684
	movui	%i31, 254635
	addi	%i31, %i31, -2033
	mif	%vf2690, %i31
	fsub	%vf2691, %vf2689, %vf2690
	fmul	%vf2692, %vf2691, %vf2684
	movui	%i31, 260096
	addi	%i31, %i31, -13
	mif	%vf2693, %i31
	fadd	%vf2694, %vf2692, %vf2693
	fmul	%vf2695, %vf2694, %vf2683
cont.11842:
cont.11834:
	fmov	%vf2696, %vf2695
	fmul	%vf2697, %vf2696, %vf2696
	set_label	%vi3153, min_caml_texture_color
	mov	%vi3154, %i0
	movui	%i31, 276464
	mif	%vf2698, %i31
	fmul	%vf2699, %vf2698, %vf2697
	sf	%vf2699, 0(%vi3153)
	set_label	%vi3155, min_caml_texture_color
	movui	%i31, 276464
	mif	%vf2700, %i31
	movui	%i31, 260096
	mif	%vf2701, %i31
	fsub	%vf2702, %vf2701, %vf2697
	fmul	%vf2703, %vf2700, %vf2702
	sf	%vf2703, 4(%vi3155)
	ret
then.11812:
	mov	%vi3125, %i0
	fmov	%vf2583, %vf2577
	mov	%vi3126, %vi3067
	mov	%vi3127, %vi3068
	mov	%vi3128, %vi3069
	mov	%vi3129, %vi3070
	mov	%vi3130, %vi3071
	mov	%vi3131, %vi3072
	mov	%vi3132, %vi3073
	mov	%vi3133, %vi3074
	mov	%vi3134, %vi3075
	mov	%vi3135, %vi3076
	mov	%vi3136, %i0
	lf	%vf2584, 0(%vi3131)
	fsub	%vf2585, %vf2583, %vf2584
	movui	%i31, 251085
	addi	%i31, %i31, -819
	mif	%vf2586, %i31
	fmul	%vf2587, %vf2585, %vf2586
	fmov	%f1, %vf2587
	ffloor	%f1, %f1
	fmov	%vf2589, %f1
	movui	%i31, 268800
	mif	%vf2590, %i31
	fmul	%vf2591, %vf2589, %vf2590
	movui	%i31, 266752
	mif	%vf2592, %i31
	fsub	%vf2593, %vf2585, %vf2591
	fleq	%i31, %vf2592, %vf2593
	jzero	%i0, %i31, else.11846
	mov	%vi3137, %i0
	set_label	%i31, cont.11847
	jmp	%i0, 0(%i31)
else.11846:
	movi	%vi3137, 1
cont.11847:
	fmov	%vf2594, %vf2579
	mov	%vi3138, %vi3067
	mov	%vi3139, %vi3068
	mov	%vi3140, %vi3069
	mov	%vi3141, %vi3070
	mov	%vi3142, %vi3071
	mov	%vi3143, %vi3072
	mov	%vi3144, %vi3073
	mov	%vi3145, %vi3074
	mov	%vi3146, %vi3075
	mov	%vi3147, %vi3076
	lf	%vf2595, 8(%vi3143)
	fsub	%vf2596, %vf2594, %vf2595
	movui	%i31, 251085
	addi	%i31, %i31, -819
	mif	%vf2597, %i31
	fmul	%vf2598, %vf2596, %vf2597
	fmov	%f1, %vf2598
	ffloor	%f1, %f1
	fmov	%vf2600, %f1
	movui	%i31, 268800
	mif	%vf2601, %i31
	fmul	%vf2602, %vf2600, %vf2601
	movui	%i31, 266752
	mif	%vf2603, %i31
	fsub	%vf2604, %vf2596, %vf2602
	fleq	%i31, %vf2603, %vf2604
	jzero	%i0, %i31, else.11848
	mov	%vi3148, %i0
	set_label	%i31, cont.11849
	jmp	%i0, 0(%i31)
else.11848:
	movi	%vi3148, 1
cont.11849:
	set_label	%vi3149, min_caml_texture_color
	mov	%vi3150, %i0
	jeq	%vi3137, %i0, then.11850
	mov	%vi3152, %i0
	jeq	%vi3148, %i0, then.11852
	movui	%i31, 276464
	mif	%vf2605, %i31
	set_label	%i31, cont.11853
	jmp	%i0, 0(%i31)
then.11852:
	fmov	%vf2605, %f0
cont.11853:
	set_label	%i31, cont.11851
	jmp	%i0, 0(%i31)
then.11850:
	mov	%vi3151, %i0
	jeq	%vi3148, %i0, then.11854
	fmov	%vf2605, %f0
	set_label	%i31, cont.11855
	jmp	%i0, 0(%i31)
then.11854:
	movui	%i31, 276464
	mif	%vf2605, %i31
cont.11855:
cont.11851:
	sf	%vf2605, 4(%vi3149)
	ret
	.end_function
	.func_entry
in_prod.4396:
	mov	%vi3244, %i4
	mov	%vi3245, %i5
	mov	%vi3246, %i0
	lf	%vf2981, 0(%vi3244)
	lf	%vf2982, 4(%vi3244)
	lf	%vf2983, 8(%vi3244)
	mov	%vi3247, %i0
	lf	%vf2984, 0(%vi3245)
	lf	%vf2985, 4(%vi3245)
	lf	%vf2986, 8(%vi3245)
	mov	%vi3248, %i0
	fmov	%vf2987, %vf2981
	mov	%vi3249, %i0
	fmov	%vf2988, %vf2984
	fmul	%vf2989, %vf2987, %vf2988
	fmov	%vf2990, %vf2982
	fmov	%vf2991, %vf2985
	fmul	%vf2992, %vf2990, %vf2991
	fadd	%vf2993, %vf2989, %vf2992
	fmov	%vf2994, %vf2983
	fmov	%vf2995, %vf2986
	fmul	%vf2996, %vf2994, %vf2995
	fadd	%f1, %vf2993, %vf2996
	ret
	.end_function
	.func_entry
accumulate_vec_mul.4415:
	mov	%vi3250, %i4
	mov	%vi3251, %i5
	fmov	%vf2997, %f1
	mov	%vi3252, %i0
	lf	%vf2998, 0(%vi3251)
	lf	%vf2999, 4(%vi3251)
	lf	%vf3000, 8(%vi3251)
	mov	%vi3253, %i0
	mov	%vi3254, %i0
	lf	%vf3001, 0(%vi3250)
	mov	%vi3255, %i0
	fmov	%vf3002, %vf2998
	fmul	%vf3003, %vf2997, %vf3002
	fadd	%vf3004, %vf3001, %vf3003
	sf	%vf3004, 0(%vi3250)
	lf	%vf3005, 4(%vi3250)
	fmov	%vf3006, %vf2999
	fmul	%vf3007, %vf2997, %vf3006
	fadd	%vf3008, %vf3005, %vf3007
	sf	%vf3008, 4(%vi3250)
	lf	%vf3009, 8(%vi3250)
	fmov	%vf3010, %vf3000
	fmul	%vf3011, %vf2997, %vf3010
	fadd	%vf3012, %vf3009, %vf3011
	sf	%vf3012, 8(%vi3250)
	ret
	.end_function
	.func_entry
raytracing.4442:
	mov	%vi3256, %i4
	fmov	%vf3013, %f1
	set_label	%vi3257, min_caml_viewpoint
	set_label	%vi3258, min_caml_vscan
	mov	%vi3259, %i0
	mov	%vi3260, %i0
loop_start.11165:
	mov	%vi3261, %vi3257
	mov	%vi3262, %vi3258
	set_label	%vi3263, min_caml_tmin
	mov	%vi3264, %i0
	movui	%i31, 321255
	addi	%i31, %i31, -1240
	mif	%vf3014, %i31
	sf	%vf3014, 0(%vi3263)
	mov	%vi3265, %i0
	set_label	%vi3266, min_caml_or_net
	mov	%vi3267, %i0
	lw	%vi3268, 0(%vi3266)
	mov	%i4, %i0
	mov	%i5, %vi3268
	call_dir	trace_or_matrix.3995
	set_label	%vi3269, min_caml_tmin
	mov	%vi3270, %i0
	lf	%vf3015, 0(%vi3269)
	movui	%i31, 777421
	addi	%i31, %i31, -819
	mif	%vf3016, %i31
	fleq	%i31, %vf3015, %vf3016
	jzero	%i0, %i31, else.11859
	mov	%vi3271, %i0
	set_label	%i31, cont.11860
	jmp	%i0, 0(%i31)
else.11859:
	movui	%i31, 314348
	addi	%i31, %i31, -992
	mif	%vf3017, %i31
	fleq	%i31, %vf3017, %vf3015
	jzero	%i0, %i31, else.11861
	mov	%vi3271, %i0
	set_label	%i31, cont.11862
	jmp	%i0, 0(%i31)
else.11861:
	movi	%vi3271, 1
cont.11862:
cont.11860:
	ceqi	%i31, %vi3271, 0
	jzero	%i0, %i31, cont.11863
	mov	%vi3272, %i0
	jeq	%vi3256, %i0, cont.11864
	set_label	%vi3273, min_caml_vscan
	set_label	%vi3274, min_caml_light
	mov	%vi3275, %vi3273
	mov	%vi3276, %vi3274
	mov	%vi3277, %i0
	lf	%vf3018, 0(%vi3275)
	mov	%vi3278, %i0
	lf	%vf3019, 0(%vi3276)
	fmul	%vf3020, %vf3018, %vf3019
	lf	%vf3021, 4(%vi3275)
	lf	%vf3022, 4(%vi3276)
	fmul	%vf3023, %vf3021, %vf3022
	fadd	%vf3024, %vf3020, %vf3023
	lf	%vf3025, 8(%vi3275)
	lf	%vf3026, 8(%vi3276)
	fmul	%vf3027, %vf3025, %vf3026
	fadd	%vf3028, %vf3024, %vf3027
	fneg	%vf3029, %vf3028
	fmov	%vf3030, %f0
	fleq	%i31, %vf3029, %f0
	ceqi	%i31, %i31, 0
	jzero	%i0, %i31, cont.11865
	fmov	%vf3031, %vf3029
	fmul	%vf3032, %vf3031, %vf3031
	fmul	%vf3033, %vf3032, %vf3029
	fmul	%vf3034, %vf3033, %vf3013
	set_label	%vi3279, min_caml_beam
	mov	%vi3280, %i0
	lf	%vf3035, 0(%vi3279)
	fmul	%vf3036, %vf3034, %vf3035
	set_label	%vi3281, min_caml_rgb
	mov	%vi3282, %i0
	set_label	%vi3283, min_caml_rgb
	mov	%vi3284, %i0
	lf	%vf3037, 0(%vi3283)
	fadd	%vf3038, %vf3037, %vf3036
	sf	%vf3038, 0(%vi3281)
	set_label	%vi3285, min_caml_rgb
	set_label	%vi3286, min_caml_rgb
	lf	%vf3039, 4(%vi3286)
	fadd	%vf3040, %vf3039, %vf3036
	sf	%vf3040, 4(%vi3285)
	set_label	%vi3287, min_caml_rgb
	set_label	%vi3288, min_caml_rgb
	lf	%vf3041, 8(%vi3288)
	fadd	%vf3042, %vf3041, %vf3036
	sf	%vf3042, 8(%vi3287)
cont.11865:
cont.11864:
cont.11863:
	jeq	%vi3271, %i0, then.11866
	set_label	%vi3289, min_caml_objects
	set_label	%vi3290, min_caml_crashed_object
	mov	%vi3291, %i0
	lw	%vi3292, 0(%vi3290)
	slli	%vi3293, %vi3292, 2
	add	%i31, %vi3289, %vi3293
	lw	%vi3294, 0(%i31)
	lw	%vi3295, 36(%vi3294)
	lw	%vi3296, 32(%vi3294)
	lw	%vi3297, 28(%vi3294)
	lw	%vi3298, 24(%vi3294)
	lw	%vi3299, 20(%vi3294)
	lw	%vi3300, 16(%vi3294)
	lw	%vi3301, 12(%vi3294)
	lw	%vi3302, 8(%vi3294)
	lw	%vi3303, 4(%vi3294)
	lw	%vi3304, 0(%vi3294)
	mov	%vi3305, %vi3304
	mov	%vi3306, %vi3303
	mov	%vi3307, %vi3302
	mov	%vi3308, %vi3301
	mov	%vi3309, %vi3300
	mov	%vi3310, %vi3299
	mov	%vi3311, %vi3298
	mov	%vi3312, %vi3297
	mov	%vi3313, %vi3296
	mov	%vi3314, %vi3295
	set_label	%vi3315, min_caml_crashed_point
	mov	%vi3316, %vi3305
	mov	%vi3317, %vi3306
	mov	%vi3318, %vi3307
	mov	%vi3319, %vi3308
	mov	%vi3320, %vi3309
	mov	%vi3321, %vi3310
	mov	%vi3322, %vi3311
	mov	%vi3323, %vi3312
	mov	%vi3324, %vi3313
	mov	%vi3325, %vi3314
	mov	%vi3326, %vi3315
	mov	%i4, %vi3316
	mov	%i5, %vi3317
	mov	%i6, %vi3318
	mov	%i7, %vi3319
	mov	%i8, %vi3320
	mov	%i9, %vi3321
	mov	%i10, %vi3322
	mov	%i11, %vi3323
	mov	%i12, %vi3324
	mov	%i13, %vi3325
	call_dir	o_form.2403
	mov	%vi3328, %i4
	movi	%i31, 1
	jeq	%vi3328, %i31, then.11868
	movi	%i31, 2
	jeq	%vi3328, %i31, then.11870
	mov	%i4, %vi3316
	mov	%i5, %vi3317
	mov	%i6, %vi3318
	mov	%i7, %vi3319
	mov	%i8, %vi3320
	mov	%i9, %vi3321
	mov	%i10, %vi3322
	mov	%i11, %vi3323
	mov	%i12, %vi3324
	mov	%i13, %vi3325
	call_dir	o_isrot.2439
	mov	%vi3330, %i4
	mov	%vi3331, %i0
	jeq	%vi3330, %i0, then.11872
	mov	%i4, %vi3316
	mov	%i5, %vi3317
	mov	%i6, %vi3318
	mov	%i7, %vi3319
	mov	%i8, %vi3320
	mov	%i9, %vi3321
	mov	%i10, %vi3322
	mov	%i11, %vi3323
	mov	%i12, %vi3324
	mov	%i13, %vi3325
	mov	%i14, %vi3326
	call_dir	get_nvector_second_rot.4137
	set_label	%i31, cont.11873
	jmp	%i0, 0(%i31)
then.11872:
	mov	%i4, %vi3316
	mov	%i5, %vi3317
	mov	%i6, %vi3318
	mov	%i7, %vi3319
	mov	%i8, %vi3320
	mov	%i9, %vi3321
	mov	%i10, %vi3322
	mov	%i11, %vi3323
	mov	%i12, %vi3324
	mov	%i13, %vi3325
	mov	%i14, %vi3326
	call_dir	get_nvector_second_norot.4105
cont.11873:
	set_label	%i31, cont.11871
	jmp	%i0, 0(%i31)
then.11870:
	mov	%i4, %vi3316
	mov	%i5, %vi3317
	mov	%i6, %vi3318
	mov	%i7, %vi3319
	mov	%i8, %vi3320
	mov	%i9, %vi3321
	mov	%i10, %vi3322
	mov	%i11, %vi3323
	mov	%i12, %vi3324
	mov	%i13, %vi3325
	call_dir	get_nvector_plane.4089
cont.11871:
	set_label	%i31, cont.11869
	jmp	%i0, 0(%i31)
then.11868:
	call_dir	get_nvector_rect.4036
cont.11869:
	mov	%vi3332, %i0
	set_label	%vi3333, min_caml_or_net
	mov	%vi3334, %i0
	lw	%vi3335, 0(%vi3333)
	set_label	%vi3336, min_caml_crashed_point
	mov	%vi3337, %i0
	mov	%vi3338, %vi3335
	mov	%vi3339, %vi3336
	mov	%vi3340, %i0
	movi	%vi3341, 1
	sub	%vi3342, %i0, %vi3341
loop_start.11168:
	slli	%vi3343, %vi3337, 2
	add	%i31, %vi3338, %vi3343
	lw	%vi3344, 0(%i31)
	lw	%vi3345, 0(%vi3344)
	jeq	%vi3345, %vi3342, then.11875
	movi	%i31, 99
	jeq	%vi3345, %i31, then.11877
	set_label	%vi3356, min_caml_light
	mov	%i4, %vi3345
	mov	%i5, %vi3356
	mov	%i6, %vi3339
	call_dir	solver.3645
	mov	%vi3358, %i4
	mov	%vi3359, %i0
	jeq	%vi3358, %i0, then.11879
	movui	%i31, 777421
	addi	%i31, %i31, -819
	mif	%vf3043, %i31
	set_label	%vi3364, min_caml_solver_dist
	mov	%vi3365, %i0
	lf	%vf3044, 0(%vi3364)
	fleq	%i31, %vf3043, %vf3044
	jzero	%i0, %i31, else.11881
	addi	%vi3366, %vi3337, 1
	mov	%vi3367, %vi3366
	mov	%vi3368, %vi3338
	mov	%vi3369, %vi3339
	mov	%vi3337, %vi3367
	mov	%vi3338, %vi3368
	mov	%vi3339, %vi3369
	set_label	%i31, cont.11882
	jmp	%i0, 0(%i31)
else.11881:
	movi	%vi3370, 1
	mov	%i4, %vi3370
	mov	%i5, %vi3344
	mov	%i6, %vi3339
	call_dir	shadow_check_one_or_group.3839
	mov	%vi3372, %i4
	mov	%vi3373, %i0
	jeq	%vi3372, %i0, then.11883
	movi	%vi3378, 1
	mov	%i31, %vi3378
	set_label	%i30, loop_end.11169
	jmp	%i0, 0(%i30)
then.11883:
	addi	%vi3374, %vi3337, 1
	mov	%vi3375, %vi3374
	mov	%vi3376, %vi3338
	mov	%vi3377, %vi3339
	mov	%vi3337, %vi3375
	mov	%vi3338, %vi3376
	mov	%vi3339, %vi3377
cont.11884:
cont.11882:
	set_label	%i31, cont.11880
	jmp	%i0, 0(%i31)
then.11879:
	addi	%vi3360, %vi3337, 1
	mov	%vi3361, %vi3360
	mov	%vi3362, %vi3338
	mov	%vi3363, %vi3339
	mov	%vi3337, %vi3361
	mov	%vi3338, %vi3362
	mov	%vi3339, %vi3363
cont.11880:
	set_label	%i31, cont.11878
	jmp	%i0, 0(%i31)
then.11877:
	movi	%vi3347, 1
	mov	%i4, %vi3347
	mov	%i5, %vi3344
	mov	%i6, %vi3339
	call_dir	shadow_check_one_or_group.3839
	mov	%vi3349, %i4
	mov	%vi3350, %i0
	jeq	%vi3349, %i0, then.11885
	movi	%vi3355, 1
	mov	%i31, %vi3355
	set_label	%i30, loop_end.11169
	jmp	%i0, 0(%i30)
then.11885:
	addi	%vi3351, %vi3337, 1
	mov	%vi3352, %vi3351
	mov	%vi3353, %vi3338
	mov	%vi3354, %vi3339
	mov	%vi3337, %vi3352
	mov	%vi3338, %vi3353
	mov	%vi3339, %vi3354
cont.11886:
cont.11878:
	set_label	%i31, cont.11876
	jmp	%i0, 0(%i31)
then.11875:
	mov	%vi3346, %i0
	mov	%i31, %i0
	set_label	%i30, loop_end.11169
	jmp	%i0, 0(%i30)
cont.11876:
	set_label	%i30, loop_start.11168
	jmp	%i0, 0(%i30)
loop_end.11169:
	mov	%vi3379, %i31
	mov	%vi3380, %i0
	jeq	%vi3379, %i0, then.11887
	fmov	%vf3062, %f0
	set_label	%i31, cont.11888
	jmp	%i0, 0(%i31)
then.11887:
	set_label	%vi3381, min_caml_nvector
	set_label	%vi3382, min_caml_light
	mov	%vi3383, %vi3381
	mov	%vi3384, %vi3382
	mov	%vi3385, %i0
	lf	%vf3045, 0(%vi3383)
	mov	%vi3386, %i0
	lf	%vf3046, 0(%vi3384)
	fmul	%vf3047, %vf3045, %vf3046
	lf	%vf3048, 4(%vi3383)
	lf	%vf3049, 4(%vi3384)
	fmul	%vf3050, %vf3048, %vf3049
	fadd	%vf3051, %vf3047, %vf3050
	lf	%vf3052, 8(%vi3383)
	lf	%vf3053, 8(%vi3384)
	fmul	%vf3054, %vf3052, %vf3053
	fadd	%vf3055, %vf3051, %vf3054
	fneg	%vf3056, %vf3055
	fmov	%vf3057, %f0
	fleq	%i31, %f0, %vf3056
	jzero	%i0, %i31, else.11889
	movui	%i31, 255181
	addi	%i31, %i31, -819
	mif	%vf3058, %i31
	fadd	%vf3059, %vf3056, %vf3058
	set_label	%i31, cont.11890
	jmp	%i0, 0(%i31)
else.11889:
	movui	%i31, 255181
	addi	%i31, %i31, -819
	mif	%vf3059, %i31
cont.11890:
	fmul	%vf3060, %vf3059, %vf3013
	mov	%vi3387, %vi3305
	mov	%vi3388, %vi3306
	mov	%vi3389, %vi3307
	mov	%vi3390, %vi3308
	mov	%vi3391, %vi3309
	mov	%vi3392, %vi3310
	mov	%vi3393, %vi3311
	mov	%vi3394, %vi3312
	mov	%vi3395, %vi3313
	mov	%vi3396, %vi3314
	mov	%vi3397, %i0
	lf	%vf3061, 0(%vi3394)
	fmul	%vf3062, %vf3060, %vf3061
cont.11888:
	set_label	%vi3398, min_caml_crashed_point
	mov	%vi3399, %vi3305
	mov	%vi3400, %vi3306
	mov	%vi3401, %vi3307
	mov	%vi3402, %vi3308
	mov	%vi3403, %vi3309
	mov	%vi3404, %vi3310
	mov	%vi3405, %vi3311
	mov	%vi3406, %vi3312
	mov	%vi3407, %vi3313
	mov	%vi3408, %vi3314
	mov	%vi3409, %vi3398
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_texturetype.2391
	mov	%vi3411, %i4
	set_label	%vi3412, min_caml_texture_color
	mov	%vi3413, %i0
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_color_red.2555
	fmov	%vf3064, %f1
	sf	%vf3064, 0(%vi3412)
	set_label	%vi3414, min_caml_texture_color
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_color_green.2568
	fmov	%vf3066, %f1
	sf	%vf3066, 4(%vi3414)
	set_label	%vi3415, min_caml_texture_color
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_color_blue.2581
	fmov	%vf3068, %f1
	sf	%vf3068, 8(%vi3415)
	movi	%i31, 1
	jeq	%vi3411, %i31, then.11891
	movi	%i31, 2
	jeq	%vi3411, %i31, then.11893
	movi	%i31, 3
	jeq	%vi3411, %i31, then.11895
	ceqi	%i31, %vi3411, 4
	jzero	%i0, %i31, cont.11897
	mov	%vi3429, %i0
	lf	%vf3140, 0(%vi3409)
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_x.2490
	fmov	%vf3142, %f1
	fsub	%vf3143, %vf3140, %vf3142
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_a.2451
	fmov	%vf3145, %f1
	fmov	%f1, %vf3145
	call_dir	sqrt.2275
	fmov	%vf3147, %f1
	fmul	%vf3148, %vf3143, %vf3147
	lf	%vf3149, 8(%vi3409)
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_z.2516
	fmov	%vf3151, %f1
	fsub	%vf3152, %vf3149, %vf3151
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_c.2477
	fmov	%vf3154, %f1
	fmov	%f1, %vf3154
	call_dir	sqrt.2275
	fmov	%vf3156, %f1
	fmul	%vf3157, %vf3152, %vf3156
	fmov	%f1, %vf3148
	call_dir	fsqr.2386
	fmov	%vf3159, %f1
	fmov	%f1, %vf3157
	call_dir	fsqr.2386
	fmov	%vf3161, %f1
	fadd	%vf3162, %vf3159, %vf3161
	fmov	%f1, %vf3162
	call_dir	sqrt.2275
	fmov	%vf3164, %f1
	movui	%i31, 232731
	addi	%i31, %i31, 1815
	mif	%vf3165, %i31
	fmov	%f1, %vf3148
	call_dir	min_caml_abs_float
	fmov	%vf3167, %f1
	fleq	%i31, %vf3165, %vf3167
	jzero	%i0, %i31, else.11898
	finv	%vf3168, %vf3148
	fmul	%vf3169, %vf3157, %vf3168
	fmov	%f1, %vf3169
	call_dir	min_caml_abs_float
	fmov	%vf3171, %f1
	fmov	%f1, %vf3171
	call_dir	atan.2205
	fmov	%vf3173, %f1
	movui	%i31, 270080
	mif	%vf3174, %i31
	movui	%i31, 263313
	addi	%i31, %i31, -37
	mif	%vf3175, %i31
	finv	%vf3176, %vf3175
	fmul	%vf3177, %vf3174, %vf3176
	fmul	%vf3178, %vf3173, %vf3177
	set_label	%i31, cont.11899
	jmp	%i0, 0(%i31)
else.11898:
	movui	%i31, 268032
	mif	%vf3178, %i31
cont.11899:
	fmov	%f1, %vf3178
	ffloor	%f1, %f1
	fmov	%vf3180, %f1
	fsub	%vf3181, %vf3178, %vf3180
	lf	%vf3182, 4(%vi3409)
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_y.2503
	fmov	%vf3184, %f1
	fsub	%vf3185, %vf3182, %vf3184
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_b.2464
	fmov	%vf3187, %f1
	fmov	%f1, %vf3187
	call_dir	sqrt.2275
	fmov	%vf3189, %f1
	fmul	%vf3190, %vf3185, %vf3189
	movui	%i31, 232731
	addi	%i31, %i31, 1815
	mif	%vf3191, %i31
	fmov	%f1, %vf3178
	call_dir	min_caml_abs_float
	fmov	%vf3193, %f1
	fleq	%i31, %vf3191, %vf3193
	jzero	%i0, %i31, else.11900
	finv	%vf3194, %vf3164
	fmul	%vf3195, %vf3190, %vf3194
	fmov	%f1, %vf3195
	call_dir	min_caml_abs_float
	fmov	%vf3197, %f1
	fmov	%f1, %vf3197
	call_dir	atan.2205
	fmov	%vf3199, %f1
	movui	%i31, 270080
	mif	%vf3200, %i31
	movui	%i31, 263313
	addi	%i31, %i31, -37
	mif	%vf3201, %i31
	finv	%vf3202, %vf3201
	fmul	%vf3203, %vf3200, %vf3202
	fmul	%vf3204, %vf3199, %vf3203
	set_label	%i31, cont.11901
	jmp	%i0, 0(%i31)
else.11900:
	movui	%i31, 268032
	mif	%vf3204, %i31
cont.11901:
	fmov	%f1, %vf3204
	ffloor	%f1, %f1
	fmov	%vf3206, %f1
	fsub	%vf3207, %vf3204, %vf3206
	movui	%i31, 254362
	addi	%i31, %i31, -1638
	mif	%vf3208, %i31
	movui	%i31, 258048
	mif	%vf3209, %i31
	fsub	%vf3210, %vf3209, %vf3181
	fmov	%f1, %vf3210
	call_dir	fsqr.2386
	fmov	%vf3212, %f1
	fsub	%vf3213, %vf3208, %vf3212
	movui	%i31, 258048
	mif	%vf3214, %i31
	fsub	%vf3215, %vf3214, %vf3207
	fmov	%f1, %vf3215
	call_dir	fsqr.2386
	fmov	%vf3217, %f1
	fsub	%vf3218, %vf3213, %vf3217
	set_label	%vi3430, min_caml_texture_color
	fmov	%vf3219, %f0
	fleq	%i31, %vf3218, %f0
	jzero	%i0, %i31, else.11902
	fmov	%vf3224, %f0
	set_label	%i31, cont.11903
	jmp	%i0, 0(%i31)
else.11902:
	movui	%i31, 276464
	mif	%vf3220, %i31
	movui	%i31, 256410
	addi	%i31, %i31, -1638
	mif	%vf3221, %i31
	finv	%vf3222, %vf3221
	fmul	%vf3223, %vf3220, %vf3222
	fmul	%vf3224, %vf3218, %vf3223
cont.11903:
	sf	%vf3224, 8(%vi3430)
cont.11897:
	set_label	%i31, cont.11896
	jmp	%i0, 0(%i31)
then.11895:
	mov	%vi3426, %i0
	lf	%vf3107, 0(%vi3409)
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_x.2490
	fmov	%vf3109, %f1
	fsub	%vf3110, %vf3107, %vf3109
	lf	%vf3111, 8(%vi3409)
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_z.2516
	fmov	%vf3113, %f1
	fsub	%vf3114, %vf3111, %vf3113
	fmov	%f1, %vf3110
	call_dir	fsqr.2386
	fmov	%vf3116, %f1
	fmov	%f1, %vf3114
	call_dir	fsqr.2386
	fmov	%vf3118, %f1
	fadd	%vf3119, %vf3116, %vf3118
	fmov	%f1, %vf3119
	call_dir	sqrt.2275
	fmov	%vf3121, %f1
	movui	%i31, 266752
	mif	%vf3122, %i31
	finv	%vf3123, %vf3122
	fmul	%vf3124, %vf3121, %vf3123
	fmov	%f1, %vf3124
	ffloor	%f1, %f1
	fmov	%vf3126, %f1
	fsub	%vf3127, %vf3124, %vf3126
	movui	%i31, 263313
	addi	%i31, %i31, -37
	mif	%vf3128, %i31
	fmul	%vf3129, %vf3127, %vf3128
	fmov	%f1, %vf3129
	call_dir	cos.2202
	fmov	%vf3131, %f1
	fmov	%f1, %vf3131
	call_dir	fsqr.2386
	fmov	%vf3133, %f1
	set_label	%vi3427, min_caml_texture_color
	movui	%i31, 276464
	mif	%vf3134, %i31
	fmul	%vf3135, %vf3133, %vf3134
	sf	%vf3135, 4(%vi3427)
	set_label	%vi3428, min_caml_texture_color
	movui	%i31, 260096
	mif	%vf3136, %i31
	fsub	%vf3137, %vf3136, %vf3133
	movui	%i31, 276464
	mif	%vf3138, %i31
	fmul	%vf3139, %vf3137, %vf3138
	sf	%vf3139, 8(%vi3428)
cont.11896:
	set_label	%i31, cont.11894
	jmp	%i0, 0(%i31)
then.11893:
	lf	%vf3094, 4(%vi3409)
	movui	%i31, 256000
	mif	%vf3095, %i31
	fmul	%vf3096, %vf3094, %vf3095
	fmov	%f1, %vf3096
	call_dir	sin.2133
	fmov	%vf3098, %f1
	fmov	%f1, %vf3098
	call_dir	fsqr.2386
	fmov	%vf3100, %f1
	set_label	%vi3423, min_caml_texture_color
	mov	%vi3424, %i0
	movui	%i31, 276464
	mif	%vf3101, %i31
	fmul	%vf3102, %vf3101, %vf3100
	sf	%vf3102, 0(%vi3423)
	set_label	%vi3425, min_caml_texture_color
	movui	%i31, 276464
	mif	%vf3103, %i31
	movui	%i31, 260096
	mif	%vf3104, %i31
	fsub	%vf3105, %vf3104, %vf3100
	fmul	%vf3106, %vf3103, %vf3105
	sf	%vf3106, 4(%vi3425)
cont.11894:
	set_label	%i31, cont.11892
	jmp	%i0, 0(%i31)
then.11891:
	mov	%vi3416, %i0
	lf	%vf3069, 0(%vi3409)
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_x.2490
	fmov	%vf3071, %f1
	fsub	%vf3072, %vf3069, %vf3071
	movui	%i31, 251085
	addi	%i31, %i31, -819
	mif	%vf3073, %i31
	fmul	%vf3074, %vf3072, %vf3073
	fmov	%f1, %vf3074
	ffloor	%f1, %f1
	fmov	%vf3076, %f1
	movui	%i31, 268800
	mif	%vf3077, %i31
	fmul	%vf3078, %vf3076, %vf3077
	movui	%i31, 266752
	mif	%vf3079, %i31
	fsub	%vf3080, %vf3072, %vf3078
	fleq	%i31, %vf3079, %vf3080
	jzero	%i0, %i31, else.11904
	mov	%vi3417, %i0
	set_label	%i31, cont.11905
	jmp	%i0, 0(%i31)
else.11904:
	movi	%vi3417, 1
cont.11905:
	lf	%vf3081, 8(%vi3409)
	mov	%i4, %vi3399
	mov	%i5, %vi3400
	mov	%i6, %vi3401
	mov	%i7, %vi3402
	mov	%i8, %vi3403
	mov	%i9, %vi3404
	mov	%i10, %vi3405
	mov	%i11, %vi3406
	mov	%i12, %vi3407
	mov	%i13, %vi3408
	call_dir	o_param_z.2516
	fmov	%vf3083, %f1
	fsub	%vf3084, %vf3081, %vf3083
	movui	%i31, 251085
	addi	%i31, %i31, -819
	mif	%vf3085, %i31
	fmul	%vf3086, %vf3084, %vf3085
	fmov	%f1, %vf3086
	ffloor	%f1, %f1
	fmov	%vf3088, %f1
	movui	%i31, 268800
	mif	%vf3089, %i31
	fmul	%vf3090, %vf3088, %vf3089
	movui	%i31, 266752
	mif	%vf3091, %i31
	fsub	%vf3092, %vf3084, %vf3090
	fleq	%i31, %vf3091, %vf3092
	jzero	%i0, %i31, else.11906
	mov	%vi3418, %i0
	set_label	%i31, cont.11907
	jmp	%i0, 0(%i31)
else.11906:
	movi	%vi3418, 1
cont.11907:
	set_label	%vi3419, min_caml_texture_color
	mov	%vi3420, %i0
	jeq	%vi3417, %i0, then.11908
	mov	%vi3422, %i0
	jeq	%vi3418, %i0, then.11910
	movui	%i31, 276464
	mif	%vf3093, %i31
	set_label	%i31, cont.11911
	jmp	%i0, 0(%i31)
then.11910:
	fmov	%vf3093, %f0
cont.11911:
	set_label	%i31, cont.11909
	jmp	%i0, 0(%i31)
then.11908:
	mov	%vi3421, %i0
	jeq	%vi3418, %i0, then.11912
	fmov	%vf3093, %f0
	set_label	%i31, cont.11913
	jmp	%i0, 0(%i31)
then.11912:
	movui	%i31, 276464
	mif	%vf3093, %i31
cont.11913:
cont.11909:
	sf	%vf3093, 4(%vi3419)
cont.11892:
	set_label	%vi3431, min_caml_rgb
	set_label	%vi3432, min_caml_texture_color
	mov	%vi3433, %vi3431
	mov	%vi3434, %vi3432
	fmov	%vf3225, %vf3062
	mov	%vi3435, %i0
	mov	%vi3436, %i0
	lf	%vf3226, 0(%vi3433)
	mov	%vi3437, %i0
	lf	%vf3227, 0(%vi3434)
	fmul	%vf3228, %vf3225, %vf3227
	fadd	%vf3229, %vf3226, %vf3228
	sf	%vf3229, 0(%vi3433)
	lf	%vf3230, 4(%vi3433)
	lf	%vf3231, 4(%vi3434)
	fmul	%vf3232, %vf3225, %vf3231
	fadd	%vf3233, %vf3230, %vf3232
	sf	%vf3233, 4(%vi3433)
	lf	%vf3234, 8(%vi3433)
	lf	%vf3235, 8(%vi3434)
	fmul	%vf3236, %vf3225, %vf3235
	fadd	%vf3237, %vf3234, %vf3236
	sf	%vf3237, 8(%vi3433)
	movi	%i31, 4
	jleq	%vi3256, %i31, then.11914
	mov	%i31, %i0
	set_label	%i30, loop_end.11166
	jmp	%i0, 0(%i30)
then.11914:
	movui	%i31, 253133
	addi	%i31, %i31, -819
	mif	%vf3238, %i31
	fleq	%i31, %vf3013, %vf3238
	jzero	%i0, %i31, else.11916
	mov	%i31, %i0
	set_label	%i30, loop_end.11166
	jmp	%i0, 0(%i30)
else.11916:
	movui	%i31, 786432
	mif	%vf3239, %i31
	set_label	%vi3438, min_caml_vscan
	set_label	%vi3439, min_caml_nvector
	mov	%vi3440, %vi3438
	mov	%vi3441, %vi3439
	mov	%vi3442, %i0
	lf	%vf3240, 0(%vi3440)
	mov	%vi3443, %i0
	lf	%vf3241, 0(%vi3441)
	fmul	%vf3242, %vf3240, %vf3241
	lf	%vf3243, 4(%vi3440)
	lf	%vf3244, 4(%vi3441)
	fmul	%vf3245, %vf3243, %vf3244
	fadd	%vf3246, %vf3242, %vf3245
	lf	%vf3247, 8(%vi3440)
	lf	%vf3248, 8(%vi3441)
	fmul	%vf3249, %vf3247, %vf3248
	fadd	%vf3250, %vf3246, %vf3249
	fmul	%vf3251, %vf3239, %vf3250
	set_label	%vi3444, min_caml_vscan
	set_label	%vi3445, min_caml_nvector
	mov	%vi3446, %vi3444
	mov	%vi3447, %vi3445
	fmov	%vf3252, %vf3251
	mov	%vi3448, %i0
	mov	%vi3449, %i0
	lf	%vf3253, 0(%vi3446)
	mov	%vi3450, %i0
	lf	%vf3254, 0(%vi3447)
	fmul	%vf3255, %vf3252, %vf3254
	fadd	%vf3256, %vf3253, %vf3255
	sf	%vf3256, 0(%vi3446)
	lf	%vf3257, 4(%vi3446)
	lf	%vf3258, 4(%vi3447)
	fmul	%vf3259, %vf3252, %vf3258
	fadd	%vf3260, %vf3257, %vf3259
	sf	%vf3260, 4(%vi3446)
	lf	%vf3261, 8(%vi3446)
	lf	%vf3262, 8(%vi3447)
	fmul	%vf3263, %vf3252, %vf3262
	fadd	%vf3264, %vf3261, %vf3263
	sf	%vf3264, 8(%vi3446)
	mov	%vi3451, %vi3305
	mov	%vi3452, %vi3306
	mov	%vi3453, %vi3307
	mov	%vi3454, %vi3308
	mov	%vi3455, %vi3309
	mov	%vi3456, %vi3310
	mov	%vi3457, %vi3311
	mov	%vi3458, %vi3312
	mov	%vi3459, %vi3313
	mov	%vi3460, %vi3314
	mov	%vi3461, %vi3453
	movi	%i31, 1
	jeq	%vi3461, %i31, then.11918
	movi	%i31, 2
	jeq	%vi3461, %i31, then.11920
	mov	%i31, %i0
	set_label	%i30, loop_end.11166
	jmp	%i0, 0(%i30)
then.11920:
	set_label	%vi3496, min_caml_viewpoint
	mov	%vi3497, %i0
	set_label	%vi3498, min_caml_crashed_point
	mov	%vi3499, %i0
	lf	%vf3294, 0(%vi3498)
	sf	%vf3294, 0(%vi3496)
	set_label	%vi3500, min_caml_viewpoint
	set_label	%vi3501, min_caml_crashed_point
	lf	%vf3295, 4(%vi3501)
	sf	%vf3295, 4(%vi3500)
	set_label	%vi3502, min_caml_viewpoint
	set_label	%vi3503, min_caml_crashed_point
	lf	%vf3296, 8(%vi3503)
	sf	%vf3296, 8(%vi3502)
	movui	%i31, 260096
	mif	%vf3297, %i31
	mov	%vi3504, %vi3305
	mov	%vi3505, %vi3306
	mov	%vi3506, %vi3307
	mov	%vi3507, %vi3308
	mov	%vi3508, %vi3309
	mov	%vi3509, %vi3310
	mov	%vi3510, %vi3311
	mov	%vi3511, %vi3312
	mov	%vi3512, %vi3313
	mov	%vi3513, %vi3314
	mov	%vi3514, %i0
	lf	%vf3298, 0(%vi3511)
	fsub	%vf3299, %vf3297, %vf3298
	fmul	%vf3300, %vf3013, %vf3299
	addi	%vi3515, %vi3256, 1
	mov	%vi3516, %vi3515
	fmov	%vf3301, %vf3300
	mov	%vi3256, %vi3516
	fmov	%vf3013, %vf3301
cont.11921:
	set_label	%i31, cont.11919
	jmp	%i0, 0(%i31)
then.11918:
	fmov	%vf3265, %f0
	mov	%vi3462, %vi3305
	mov	%vi3463, %vi3306
	mov	%vi3464, %vi3307
	mov	%vi3465, %vi3308
	mov	%vi3466, %vi3309
	mov	%vi3467, %vi3310
	mov	%vi3468, %vi3311
	mov	%vi3469, %vi3312
	mov	%vi3470, %vi3313
	mov	%vi3471, %vi3314
	lf	%vf3266, 4(%vi3469)
	feq	%i31, %f0, %vf3266
	jzero	%i0, %i31, else.11922
	mov	%i31, %i0
	set_label	%i30, loop_end.11166
	jmp	%i0, 0(%i30)
else.11922:
	set_label	%vi3472, min_caml_vscan
	set_label	%vi3473, min_caml_light
	mov	%vi3474, %vi3472
	mov	%vi3475, %vi3473
	mov	%vi3476, %i0
	lf	%vf3267, 0(%vi3474)
	mov	%vi3477, %i0
	lf	%vf3268, 0(%vi3475)
	fmul	%vf3269, %vf3267, %vf3268
	lf	%vf3270, 4(%vi3474)
	lf	%vf3271, 4(%vi3475)
	fmul	%vf3272, %vf3270, %vf3271
	fadd	%vf3273, %vf3269, %vf3272
	lf	%vf3274, 8(%vi3474)
	lf	%vf3275, 8(%vi3475)
	fmul	%vf3276, %vf3274, %vf3275
	fadd	%vf3277, %vf3273, %vf3276
	fneg	%vf3278, %vf3277
	fmov	%vf3279, %f0
	fleq	%i31, %vf3278, %f0
	jzero	%i0, %i31, else.11924
	mov	%i31, %i0
	set_label	%i30, loop_end.11166
	jmp	%i0, 0(%i30)
else.11924:
	fmov	%vf3280, %vf3278
	fmul	%vf3281, %vf3280, %vf3280
	fmov	%vf3282, %vf3281
	fmul	%vf3283, %vf3282, %vf3282
	fmul	%vf3284, %vf3283, %vf3013
	fmul	%vf3285, %vf3284, %vf3062
	mov	%vi3478, %vi3305
	mov	%vi3479, %vi3306
	mov	%vi3480, %vi3307
	mov	%vi3481, %vi3308
	mov	%vi3482, %vi3309
	mov	%vi3483, %vi3310
	mov	%vi3484, %vi3311
	mov	%vi3485, %vi3312
	mov	%vi3486, %vi3313
	mov	%vi3487, %vi3314
	lf	%vf3286, 4(%vi3485)
	fmul	%vf3287, %vf3285, %vf3286
	set_label	%vi3488, min_caml_rgb
	mov	%vi3489, %i0
	set_label	%vi3490, min_caml_rgb
	mov	%vi3491, %i0
	lf	%vf3288, 0(%vi3490)
	fadd	%vf3289, %vf3288, %vf3287
	sf	%vf3289, 0(%vi3488)
	set_label	%vi3492, min_caml_rgb
	set_label	%vi3493, min_caml_rgb
	lf	%vf3290, 4(%vi3493)
	fadd	%vf3291, %vf3290, %vf3287
	sf	%vf3291, 4(%vi3492)
	set_label	%vi3494, min_caml_rgb
	set_label	%vi3495, min_caml_rgb
	lf	%vf3292, 8(%vi3495)
	fadd	%vf3293, %vf3292, %vf3287
	sf	%vf3293, 8(%vi3494)
	mov	%i31, %i0
	set_label	%i30, loop_end.11166
	jmp	%i0, 0(%i30)
cont.11925:
cont.11923:
cont.11919:
cont.11917:
cont.11915:
	set_label	%i31, cont.11867
	jmp	%i0, 0(%i31)
then.11866:
	mov	%i31, %i0
	set_label	%i30, loop_end.11166
	jmp	%i0, 0(%i30)
cont.11867:
	set_label	%i30, loop_start.11165
	jmp	%i0, 0(%i30)
loop_end.11166:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
write_rgb.4583:
	set_label	%vi3517, min_caml_rgb
	mov	%vi3518, %i0
	lf	%vf3302, 0(%vi3517)
	fmov	%f1, %vf3302
	ftoi	%vi3519, %f1
	movi	%i31, 255
	jleq	%vi3519, %i31, then.11926
	movi	%vi3520, 255
	set_label	%i31, cont.11927
	jmp	%i0, 0(%i31)
then.11926:
	mov	%vi3520, %vi3519
cont.11927:
	mov	%i4, %vi3520
	call_dir	min_caml_print_byte
	set_label	%vi3521, min_caml_rgb
	lf	%vf3303, 4(%vi3521)
	fmov	%f1, %vf3303
	ftoi	%vi3522, %f1
	movi	%i31, 255
	jleq	%vi3522, %i31, then.11928
	movi	%vi3523, 255
	set_label	%i31, cont.11929
	jmp	%i0, 0(%i31)
then.11928:
	mov	%vi3523, %vi3522
cont.11929:
	mov	%i4, %vi3523
	call_dir	min_caml_print_byte
	set_label	%vi3524, min_caml_rgb
	lf	%vf3304, 8(%vi3524)
	fmov	%f1, %vf3304
	ftoi	%vi3525, %f1
	movi	%i31, 255
	jleq	%vi3525, %i31, then.11930
	movi	%vi3526, 255
	set_label	%i31, cont.11931
	jmp	%i0, 0(%i31)
then.11930:
	mov	%vi3526, %vi3525
cont.11931:
	mov	%i4, %vi3526
	call_dir	min_caml_print_byte
	ret
	.end_function
	.func_entry
write_ppm_header.4605:
	movi	%vi3527, 80
	mov	%i4, %vi3527
	call_dir	min_caml_print_byte
	movi	%vi3528, 48
	addi	%vi3529, %vi3528, 6
	mov	%i4, %vi3529
	call_dir	min_caml_print_byte
	movi	%vi3530, 10
	mov	%i4, %vi3530
	call_dir	min_caml_print_byte
	set_label	%vi3531, min_caml_size
	mov	%vi3532, %i0
	lw	%vi3533, 0(%vi3531)
	mov	%vi3534, %vi3533
	movi	%vi3535, 100
	jleq	%vi3535, %vi3534, then.11932
	movi	%vi3539, 48
	mov	%i4, %vi3539
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%vi3540, %vi3534
	set_label	%i31, cont.11933
	jmp	%i0, 0(%i31)
then.11932:
	movi	%vi3536, 200
	jleq	%vi3536, %vi3534, then.11934
	movi	%vi3538, 49
	mov	%i4, %vi3538
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3540, %vi3534, 100
	set_label	%i31, cont.11935
	jmp	%i0, 0(%i31)
then.11934:
	movi	%vi3537, 50
	mov	%i4, %vi3537
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3540, %vi3534, 200
cont.11935:
cont.11933:
	movi	%vi3541, 40
	jleq	%vi3541, %vi3540, then.11936
	movi	%vi3553, 20
	jleq	%vi3553, %vi3540, then.11938
	movi	%vi3557, 10
	jleq	%vi3557, %vi3540, then.11940
	movi	%vi3559, 48
	mov	%i4, %vi3559
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%vi3560, %vi3540
	set_label	%i31, cont.11941
	jmp	%i0, 0(%i31)
then.11940:
	movi	%vi3558, 49
	mov	%i4, %vi3558
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3560, %vi3540, 10
cont.11941:
	set_label	%i31, cont.11939
	jmp	%i0, 0(%i31)
then.11938:
	movi	%vi3554, 30
	jleq	%vi3554, %vi3540, then.11942
	movi	%vi3556, 50
	mov	%i4, %vi3556
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3560, %vi3540, 20
	set_label	%i31, cont.11943
	jmp	%i0, 0(%i31)
then.11942:
	movi	%vi3555, 51
	mov	%i4, %vi3555
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3560, %vi3540, 30
cont.11943:
cont.11939:
	set_label	%i31, cont.11937
	jmp	%i0, 0(%i31)
then.11936:
	movi	%vi3542, 60
	jleq	%vi3542, %vi3540, then.11944
	movi	%vi3550, 50
	jleq	%vi3550, %vi3540, then.11946
	movi	%vi3552, 52
	mov	%i4, %vi3552
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3560, %vi3540, 40
	set_label	%i31, cont.11947
	jmp	%i0, 0(%i31)
then.11946:
	movi	%vi3551, 53
	mov	%i4, %vi3551
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3560, %vi3540, 50
cont.11947:
	set_label	%i31, cont.11945
	jmp	%i0, 0(%i31)
then.11944:
	movi	%vi3543, 80
	jleq	%vi3543, %vi3540, then.11948
	movi	%vi3547, 70
	jleq	%vi3547, %vi3540, then.11950
	movi	%vi3549, 54
	mov	%i4, %vi3549
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3560, %vi3540, 60
	set_label	%i31, cont.11951
	jmp	%i0, 0(%i31)
then.11950:
	movi	%vi3548, 55
	mov	%i4, %vi3548
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3560, %vi3540, 70
cont.11951:
	set_label	%i31, cont.11949
	jmp	%i0, 0(%i31)
then.11948:
	movi	%vi3544, 90
	jleq	%vi3544, %vi3540, then.11952
	movi	%vi3546, 56
	mov	%i4, %vi3546
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3560, %vi3540, 80
	set_label	%i31, cont.11953
	jmp	%i0, 0(%i31)
then.11952:
	movi	%vi3545, 57
	mov	%i4, %vi3545
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3560, %vi3540, 90
cont.11953:
cont.11949:
cont.11945:
cont.11937:
	movi	%vi3561, 4
	jleq	%vi3561, %vi3560, then.11954
	movi	%vi3573, 2
	jleq	%vi3573, %vi3560, then.11956
	movi	%vi3577, 1
	jleq	%vi3577, %vi3560, then.11958
	movi	%vi3579, 48
	mov	%i4, %vi3579
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.11959
	jmp	%i0, 0(%i31)
then.11958:
	movi	%vi3578, 49
	mov	%i4, %vi3578
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.11959:
	set_label	%i31, cont.11957
	jmp	%i0, 0(%i31)
then.11956:
	movi	%vi3574, 3
	jleq	%vi3574, %vi3560, then.11960
	movi	%vi3576, 50
	mov	%i4, %vi3576
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.11961
	jmp	%i0, 0(%i31)
then.11960:
	movi	%vi3575, 51
	mov	%i4, %vi3575
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.11961:
cont.11957:
	set_label	%i31, cont.11955
	jmp	%i0, 0(%i31)
then.11954:
	movi	%vi3562, 6
	jleq	%vi3562, %vi3560, then.11962
	movi	%vi3570, 5
	jleq	%vi3570, %vi3560, then.11964
	movi	%vi3572, 52
	mov	%i4, %vi3572
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.11965
	jmp	%i0, 0(%i31)
then.11964:
	movi	%vi3571, 53
	mov	%i4, %vi3571
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.11965:
	set_label	%i31, cont.11963
	jmp	%i0, 0(%i31)
then.11962:
	movi	%vi3563, 8
	jleq	%vi3563, %vi3560, then.11966
	movi	%vi3567, 7
	jleq	%vi3567, %vi3560, then.11968
	movi	%vi3569, 54
	mov	%i4, %vi3569
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.11969
	jmp	%i0, 0(%i31)
then.11968:
	movi	%vi3568, 55
	mov	%i4, %vi3568
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.11969:
	set_label	%i31, cont.11967
	jmp	%i0, 0(%i31)
then.11966:
	movi	%vi3564, 9
	jleq	%vi3564, %vi3560, then.11970
	movi	%vi3566, 56
	mov	%i4, %vi3566
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.11971
	jmp	%i0, 0(%i31)
then.11970:
	movi	%vi3565, 57
	mov	%i4, %vi3565
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.11971:
cont.11967:
cont.11963:
cont.11955:
	movi	%vi3580, 32
	mov	%i4, %vi3580
	call_dir	min_caml_print_byte
	set_label	%vi3581, min_caml_size
	lw	%vi3582, 4(%vi3581)
	mov	%vi3583, %vi3582
	movi	%vi3584, 100
	jleq	%vi3584, %vi3583, then.11972
	movi	%vi3588, 48
	mov	%i4, %vi3588
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%vi3589, %vi3583
	set_label	%i31, cont.11973
	jmp	%i0, 0(%i31)
then.11972:
	movi	%vi3585, 200
	jleq	%vi3585, %vi3583, then.11974
	movi	%vi3587, 49
	mov	%i4, %vi3587
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3589, %vi3583, 100
	set_label	%i31, cont.11975
	jmp	%i0, 0(%i31)
then.11974:
	movi	%vi3586, 50
	mov	%i4, %vi3586
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3589, %vi3583, 200
cont.11975:
cont.11973:
	movi	%vi3590, 40
	jleq	%vi3590, %vi3589, then.11976
	movi	%vi3602, 20
	jleq	%vi3602, %vi3589, then.11978
	movi	%vi3606, 10
	jleq	%vi3606, %vi3589, then.11980
	movi	%vi3608, 48
	mov	%i4, %vi3608
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%vi3609, %vi3589
	set_label	%i31, cont.11981
	jmp	%i0, 0(%i31)
then.11980:
	movi	%vi3607, 49
	mov	%i4, %vi3607
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3609, %vi3589, 10
cont.11981:
	set_label	%i31, cont.11979
	jmp	%i0, 0(%i31)
then.11978:
	movi	%vi3603, 30
	jleq	%vi3603, %vi3589, then.11982
	movi	%vi3605, 50
	mov	%i4, %vi3605
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3609, %vi3589, 20
	set_label	%i31, cont.11983
	jmp	%i0, 0(%i31)
then.11982:
	movi	%vi3604, 51
	mov	%i4, %vi3604
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3609, %vi3589, 30
cont.11983:
cont.11979:
	set_label	%i31, cont.11977
	jmp	%i0, 0(%i31)
then.11976:
	movi	%vi3591, 60
	jleq	%vi3591, %vi3589, then.11984
	movi	%vi3599, 50
	jleq	%vi3599, %vi3589, then.11986
	movi	%vi3601, 52
	mov	%i4, %vi3601
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3609, %vi3589, 40
	set_label	%i31, cont.11987
	jmp	%i0, 0(%i31)
then.11986:
	movi	%vi3600, 53
	mov	%i4, %vi3600
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3609, %vi3589, 50
cont.11987:
	set_label	%i31, cont.11985
	jmp	%i0, 0(%i31)
then.11984:
	movi	%vi3592, 80
	jleq	%vi3592, %vi3589, then.11988
	movi	%vi3596, 70
	jleq	%vi3596, %vi3589, then.11990
	movi	%vi3598, 54
	mov	%i4, %vi3598
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3609, %vi3589, 60
	set_label	%i31, cont.11991
	jmp	%i0, 0(%i31)
then.11990:
	movi	%vi3597, 55
	mov	%i4, %vi3597
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3609, %vi3589, 70
cont.11991:
	set_label	%i31, cont.11989
	jmp	%i0, 0(%i31)
then.11988:
	movi	%vi3593, 90
	jleq	%vi3593, %vi3589, then.11992
	movi	%vi3595, 56
	mov	%i4, %vi3595
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3609, %vi3589, 80
	set_label	%i31, cont.11993
	jmp	%i0, 0(%i31)
then.11992:
	movi	%vi3594, 57
	mov	%i4, %vi3594
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3609, %vi3589, 90
cont.11993:
cont.11989:
cont.11985:
cont.11977:
	movi	%vi3610, 4
	jleq	%vi3610, %vi3609, then.11994
	movi	%vi3622, 2
	jleq	%vi3622, %vi3609, then.11996
	movi	%vi3626, 1
	jleq	%vi3626, %vi3609, then.11998
	movi	%vi3628, 48
	mov	%i4, %vi3628
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.11999
	jmp	%i0, 0(%i31)
then.11998:
	movi	%vi3627, 49
	mov	%i4, %vi3627
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.11999:
	set_label	%i31, cont.11997
	jmp	%i0, 0(%i31)
then.11996:
	movi	%vi3623, 3
	jleq	%vi3623, %vi3609, then.12000
	movi	%vi3625, 50
	mov	%i4, %vi3625
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.12001
	jmp	%i0, 0(%i31)
then.12000:
	movi	%vi3624, 51
	mov	%i4, %vi3624
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.12001:
cont.11997:
	set_label	%i31, cont.11995
	jmp	%i0, 0(%i31)
then.11994:
	movi	%vi3611, 6
	jleq	%vi3611, %vi3609, then.12002
	movi	%vi3619, 5
	jleq	%vi3619, %vi3609, then.12004
	movi	%vi3621, 52
	mov	%i4, %vi3621
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.12005
	jmp	%i0, 0(%i31)
then.12004:
	movi	%vi3620, 53
	mov	%i4, %vi3620
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.12005:
	set_label	%i31, cont.12003
	jmp	%i0, 0(%i31)
then.12002:
	movi	%vi3612, 8
	jleq	%vi3612, %vi3609, then.12006
	movi	%vi3616, 7
	jleq	%vi3616, %vi3609, then.12008
	movi	%vi3618, 54
	mov	%i4, %vi3618
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.12009
	jmp	%i0, 0(%i31)
then.12008:
	movi	%vi3617, 55
	mov	%i4, %vi3617
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.12009:
	set_label	%i31, cont.12007
	jmp	%i0, 0(%i31)
then.12006:
	movi	%vi3613, 9
	jleq	%vi3613, %vi3609, then.12010
	movi	%vi3615, 56
	mov	%i4, %vi3615
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.12011
	jmp	%i0, 0(%i31)
then.12010:
	movi	%vi3614, 57
	mov	%i4, %vi3614
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.12011:
cont.12007:
cont.12003:
cont.11995:
	movi	%vi3629, 10
	mov	%i4, %vi3629
	call_dir	min_caml_print_byte
	movi	%vi3630, 255
	mov	%vi3631, %vi3630
	movi	%vi3632, 100
	jleq	%vi3632, %vi3631, then.12012
	movi	%vi3636, 48
	mov	%i4, %vi3636
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%vi3637, %vi3631
	set_label	%i31, cont.12013
	jmp	%i0, 0(%i31)
then.12012:
	movi	%vi3633, 200
	jleq	%vi3633, %vi3631, then.12014
	movi	%vi3635, 49
	mov	%i4, %vi3635
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3637, %vi3631, 100
	set_label	%i31, cont.12015
	jmp	%i0, 0(%i31)
then.12014:
	movi	%vi3634, 50
	mov	%i4, %vi3634
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3637, %vi3631, 200
cont.12015:
cont.12013:
	movi	%vi3638, 40
	jleq	%vi3638, %vi3637, then.12016
	movi	%vi3650, 20
	jleq	%vi3650, %vi3637, then.12018
	movi	%vi3654, 10
	jleq	%vi3654, %vi3637, then.12020
	movi	%vi3656, 48
	mov	%i4, %vi3656
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%vi3657, %vi3637
	set_label	%i31, cont.12021
	jmp	%i0, 0(%i31)
then.12020:
	movi	%vi3655, 49
	mov	%i4, %vi3655
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3657, %vi3637, 10
cont.12021:
	set_label	%i31, cont.12019
	jmp	%i0, 0(%i31)
then.12018:
	movi	%vi3651, 30
	jleq	%vi3651, %vi3637, then.12022
	movi	%vi3653, 50
	mov	%i4, %vi3653
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3657, %vi3637, 20
	set_label	%i31, cont.12023
	jmp	%i0, 0(%i31)
then.12022:
	movi	%vi3652, 51
	mov	%i4, %vi3652
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3657, %vi3637, 30
cont.12023:
cont.12019:
	set_label	%i31, cont.12017
	jmp	%i0, 0(%i31)
then.12016:
	movi	%vi3639, 60
	jleq	%vi3639, %vi3637, then.12024
	movi	%vi3647, 50
	jleq	%vi3647, %vi3637, then.12026
	movi	%vi3649, 52
	mov	%i4, %vi3649
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3657, %vi3637, 40
	set_label	%i31, cont.12027
	jmp	%i0, 0(%i31)
then.12026:
	movi	%vi3648, 53
	mov	%i4, %vi3648
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3657, %vi3637, 50
cont.12027:
	set_label	%i31, cont.12025
	jmp	%i0, 0(%i31)
then.12024:
	movi	%vi3640, 80
	jleq	%vi3640, %vi3637, then.12028
	movi	%vi3644, 70
	jleq	%vi3644, %vi3637, then.12030
	movi	%vi3646, 54
	mov	%i4, %vi3646
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3657, %vi3637, 60
	set_label	%i31, cont.12031
	jmp	%i0, 0(%i31)
then.12030:
	movi	%vi3645, 55
	mov	%i4, %vi3645
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3657, %vi3637, 70
cont.12031:
	set_label	%i31, cont.12029
	jmp	%i0, 0(%i31)
then.12028:
	movi	%vi3641, 90
	jleq	%vi3641, %vi3637, then.12032
	movi	%vi3643, 56
	mov	%i4, %vi3643
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3657, %vi3637, 80
	set_label	%i31, cont.12033
	jmp	%i0, 0(%i31)
then.12032:
	movi	%vi3642, 57
	mov	%i4, %vi3642
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%vi3657, %vi3637, 90
cont.12033:
cont.12029:
cont.12025:
cont.12017:
	movi	%vi3658, 4
	jleq	%vi3658, %vi3657, then.12034
	movi	%vi3670, 2
	jleq	%vi3670, %vi3657, then.12036
	movi	%vi3674, 1
	jleq	%vi3674, %vi3657, then.12038
	movi	%vi3676, 48
	mov	%i4, %vi3676
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.12039
	jmp	%i0, 0(%i31)
then.12038:
	movi	%vi3675, 49
	mov	%i4, %vi3675
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.12039:
	set_label	%i31, cont.12037
	jmp	%i0, 0(%i31)
then.12036:
	movi	%vi3671, 3
	jleq	%vi3671, %vi3657, then.12040
	movi	%vi3673, 50
	mov	%i4, %vi3673
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.12041
	jmp	%i0, 0(%i31)
then.12040:
	movi	%vi3672, 51
	mov	%i4, %vi3672
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.12041:
cont.12037:
	set_label	%i31, cont.12035
	jmp	%i0, 0(%i31)
then.12034:
	movi	%vi3659, 6
	jleq	%vi3659, %vi3657, then.12042
	movi	%vi3667, 5
	jleq	%vi3667, %vi3657, then.12044
	movi	%vi3669, 52
	mov	%i4, %vi3669
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.12045
	jmp	%i0, 0(%i31)
then.12044:
	movi	%vi3668, 53
	mov	%i4, %vi3668
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.12045:
	set_label	%i31, cont.12043
	jmp	%i0, 0(%i31)
then.12042:
	movi	%vi3660, 8
	jleq	%vi3660, %vi3657, then.12046
	movi	%vi3664, 7
	jleq	%vi3664, %vi3657, then.12048
	movi	%vi3666, 54
	mov	%i4, %vi3666
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.12049
	jmp	%i0, 0(%i31)
then.12048:
	movi	%vi3665, 55
	mov	%i4, %vi3665
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.12049:
	set_label	%i31, cont.12047
	jmp	%i0, 0(%i31)
then.12046:
	movi	%vi3661, 9
	jleq	%vi3661, %vi3657, then.12050
	movi	%vi3663, 56
	mov	%i4, %vi3663
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	set_label	%i31, cont.12051
	jmp	%i0, 0(%i31)
then.12050:
	movi	%vi3662, 57
	mov	%i4, %vi3662
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.12051:
cont.12047:
cont.12043:
cont.12035:
	movi	%vi3677, 10
	mov	%i4, %vi3677
	call_dir	min_caml_print_byte
	ret
	.end_function
	.func_entry
scan_point.4630:
	mov	%vi3678, %i4
	set_label	%vi3679, min_caml_size
	mov	%vi3680, %i0
	lw	%vi3681, 0(%vi3679)
loop_start.11191:
	jleq	%vi3681, %vi3678, then.12053
	mov	%i4, %vi3678
	itof	%vf3305, %i4
	set_label	%vi3682, min_caml_scan_offset
	mov	%vi3683, %i0
	lf	%vf3306, 0(%vi3682)
	fsub	%vf3307, %vf3305, %vf3306
	set_label	%vi3684, min_caml_scan_d
	mov	%vi3685, %i0
	lf	%vf3308, 0(%vi3684)
	fmul	%vf3309, %vf3307, %vf3308
	set_label	%vi3686, min_caml_vscan
	mov	%vi3687, %i0
	set_label	%vi3688, min_caml_cos_v
	lf	%vf3310, 4(%vi3688)
	fmul	%vf3311, %vf3309, %vf3310
	set_label	%vi3689, min_caml_wscan
	mov	%vi3690, %i0
	lf	%vf3312, 0(%vi3689)
	fadd	%vf3313, %vf3311, %vf3312
	sf	%vf3313, 0(%vi3686)
	set_label	%vi3691, min_caml_vscan
	set_label	%vi3692, min_caml_scan_sscany
	mov	%vi3693, %i0
	lf	%vf3314, 0(%vi3692)
	set_label	%vi3694, min_caml_cos_v
	mov	%vi3695, %i0
	lf	%vf3315, 0(%vi3694)
	fmul	%vf3316, %vf3314, %vf3315
	set_label	%vi3696, min_caml_vp
	lf	%vf3317, 4(%vi3696)
	fsub	%vf3318, %vf3316, %vf3317
	sf	%vf3318, 4(%vi3691)
	set_label	%vi3697, min_caml_vscan
	fneg	%vf3319, %vf3309
	set_label	%vi3698, min_caml_sin_v
	lf	%vf3320, 4(%vi3698)
	fmul	%vf3321, %vf3319, %vf3320
	set_label	%vi3699, min_caml_wscan
	lf	%vf3322, 8(%vi3699)
	fadd	%vf3323, %vf3321, %vf3322
	sf	%vf3323, 8(%vi3697)
	fmov	%vf3324, %vf3309
	fmul	%vf3325, %vf3324, %vf3324
	set_label	%vi3700, min_caml_scan_met1
	mov	%vi3701, %i0
	lf	%vf3326, 0(%vi3700)
	fadd	%vf3327, %vf3325, %vf3326
	fmov	%vf3328, %vf3327
	fmov	%f1, %vf3328
	frsqrt	%f1, %f1
	fmov	%vf3330, %f1
	movui	%i31, 260096
	mif	%vf3331, %i31
	finv	%vf3332, %vf3330
	fmul	%vf3333, %vf3331, %vf3332
	set_label	%vi3702, min_caml_vscan
	mov	%vi3703, %i0
	set_label	%vi3704, min_caml_vscan
	mov	%vi3705, %i0
	lf	%vf3334, 0(%vi3704)
	finv	%vf3335, %vf3333
	fmul	%vf3336, %vf3334, %vf3335
	sf	%vf3336, 0(%vi3702)
	set_label	%vi3706, min_caml_vscan
	set_label	%vi3707, min_caml_vscan
	lf	%vf3337, 4(%vi3707)
	finv	%vf3338, %vf3333
	fmul	%vf3339, %vf3337, %vf3338
	sf	%vf3339, 4(%vi3706)
	set_label	%vi3708, min_caml_vscan
	set_label	%vi3709, min_caml_vscan
	lf	%vf3340, 8(%vi3709)
	finv	%vf3341, %vf3333
	fmul	%vf3342, %vf3340, %vf3341
	sf	%vf3342, 8(%vi3708)
	set_label	%vi3710, min_caml_viewpoint
	mov	%vi3711, %i0
	set_label	%vi3712, min_caml_view
	mov	%vi3713, %i0
	lf	%vf3343, 0(%vi3712)
	sf	%vf3343, 0(%vi3710)
	set_label	%vi3714, min_caml_viewpoint
	set_label	%vi3715, min_caml_view
	lf	%vf3344, 4(%vi3715)
	sf	%vf3344, 4(%vi3714)
	set_label	%vi3716, min_caml_viewpoint
	set_label	%vi3717, min_caml_view
	lf	%vf3345, 8(%vi3717)
	sf	%vf3345, 8(%vi3716)
	set_label	%vi3718, min_caml_rgb
	mov	%vi3719, %i0
	fmov	%vf3346, %f0
	sf	%f0, 0(%vi3718)
	set_label	%vi3720, min_caml_rgb
	fmov	%vf3347, %f0
	sf	%f0, 4(%vi3720)
	set_label	%vi3721, min_caml_rgb
	fmov	%vf3348, %f0
	sf	%f0, 8(%vi3721)
	mov	%vi3722, %i0
	movui	%i31, 260096
	mif	%vf3349, %i31
	mov	%vi3723, %i0
	fmov	%vf3350, %vf3349
	set_label	%vi3724, min_caml_viewpoint
	set_label	%vi3725, min_caml_vscan
	mov	%vi3726, %i0
	mov	%vi3727, %i0
loop_start.11197:
	mov	%i4, %vi3724
	mov	%i5, %vi3725
	call_dir	tracer.4019
	mov	%vi3729, %i4
	ceqi	%i31, %vi3729, 0
	jzero	%i0, %i31, cont.12056
	mov	%vi3730, %i0
	jeq	%vi3723, %i0, cont.12057
	set_label	%vi3731, min_caml_vscan
	set_label	%vi3732, min_caml_light
	mov	%i4, %vi3731
	mov	%i5, %vi3732
	call_dir	in_prod.4396
	fmov	%vf3352, %f1
	fneg	%vf3353, %vf3352
	fmov	%vf3354, %f0
	fleq	%i31, %vf3353, %f0
	ceqi	%i31, %i31, 0
	jzero	%i0, %i31, cont.12058
	fmov	%f1, %vf3353
	call_dir	fsqr.2386
	fmov	%vf3356, %f1
	fmul	%vf3357, %vf3356, %vf3353
	fmul	%vf3358, %vf3357, %vf3350
	set_label	%vi3733, min_caml_beam
	mov	%vi3734, %i0
	lf	%vf3359, 0(%vi3733)
	fmul	%vf3360, %vf3358, %vf3359
	set_label	%vi3735, min_caml_rgb
	mov	%vi3736, %i0
	set_label	%vi3737, min_caml_rgb
	mov	%vi3738, %i0
	lf	%vf3361, 0(%vi3737)
	fadd	%vf3362, %vf3361, %vf3360
	sf	%vf3362, 0(%vi3735)
	set_label	%vi3739, min_caml_rgb
	set_label	%vi3740, min_caml_rgb
	lf	%vf3363, 4(%vi3740)
	fadd	%vf3364, %vf3363, %vf3360
	sf	%vf3364, 4(%vi3739)
	set_label	%vi3741, min_caml_rgb
	set_label	%vi3742, min_caml_rgb
	lf	%vf3365, 8(%vi3742)
	fadd	%vf3366, %vf3365, %vf3360
	sf	%vf3366, 8(%vi3741)
cont.12058:
cont.12057:
cont.12056:
	jeq	%vi3729, %i0, then.12059
	set_label	%vi3743, min_caml_objects
	set_label	%vi3744, min_caml_crashed_object
	mov	%vi3745, %i0
	lw	%vi3746, 0(%vi3744)
	slli	%vi3747, %vi3746, 2
	add	%i31, %vi3743, %vi3747
	lw	%vi3748, 0(%i31)
	lw	%vi3749, 36(%vi3748)
	lw	%vi3750, 32(%vi3748)
	lw	%vi3751, 28(%vi3748)
	lw	%vi3752, 24(%vi3748)
	lw	%vi3753, 20(%vi3748)
	lw	%vi3754, 16(%vi3748)
	lw	%vi3755, 12(%vi3748)
	lw	%vi3756, 8(%vi3748)
	lw	%vi3757, 4(%vi3748)
	lw	%vi3758, 0(%vi3748)
	mov	%vi3759, %vi3758
	mov	%vi3760, %vi3757
	mov	%vi3761, %vi3756
	mov	%vi3762, %vi3755
	mov	%vi3763, %vi3754
	mov	%vi3764, %vi3753
	mov	%vi3765, %vi3752
	mov	%vi3766, %vi3751
	mov	%vi3767, %vi3750
	mov	%vi3768, %vi3749
	set_label	%vi3769, min_caml_crashed_point
	mov	%i4, %vi3758
	mov	%i5, %vi3757
	mov	%i6, %vi3756
	mov	%i7, %vi3755
	mov	%i8, %vi3754
	mov	%i9, %vi3753
	mov	%i10, %vi3752
	mov	%i11, %vi3751
	mov	%i12, %vi3750
	mov	%i13, %vi3749
	mov	%i14, %vi3769
	call_dir	get_nvector.4226
	mov	%vi3770, %i0
	set_label	%vi3771, min_caml_or_net
	mov	%vi3772, %i0
	lw	%vi3773, 0(%vi3771)
	set_label	%vi3774, min_caml_crashed_point
	mov	%i4, %i0
	mov	%i5, %vi3773
	mov	%i6, %vi3774
	call_dir	shadow_check_one_or_matrix.3853
	mov	%vi3776, %i4
	mov	%vi3777, %i0
	jeq	%vi3776, %i0, then.12061
	fmov	%vf3376, %f0
	set_label	%i31, cont.12062
	jmp	%i0, 0(%i31)
then.12061:
	set_label	%vi3778, min_caml_nvector
	set_label	%vi3779, min_caml_light
	mov	%i4, %vi3778
	mov	%i5, %vi3779
	call_dir	in_prod.4396
	fmov	%vf3368, %f1
	fneg	%vf3369, %vf3368
	fmov	%vf3370, %f0
	fleq	%i31, %f0, %vf3369
	jzero	%i0, %i31, else.12063
	movui	%i31, 255181
	addi	%i31, %i31, -819
	mif	%vf3371, %i31
	fadd	%vf3372, %vf3369, %vf3371
	set_label	%i31, cont.12064
	jmp	%i0, 0(%i31)
else.12063:
	movui	%i31, 255181
	addi	%i31, %i31, -819
	mif	%vf3372, %i31
cont.12064:
	fmul	%vf3373, %vf3372, %vf3350
	mov	%i4, %vi3758
	mov	%i5, %vi3757
	mov	%i6, %vi3756
	mov	%i7, %vi3755
	mov	%i8, %vi3754
	mov	%i9, %vi3753
	mov	%i10, %vi3752
	mov	%i11, %vi3751
	mov	%i12, %vi3750
	mov	%i13, %vi3749
	call_dir	o_diffuse.2529
	fmov	%vf3375, %f1
	fmul	%vf3376, %vf3373, %vf3375
cont.12062:
	set_label	%vi3780, min_caml_crashed_point
	mov	%i4, %vi3758
	mov	%i5, %vi3757
	mov	%i6, %vi3756
	mov	%i7, %vi3755
	mov	%i8, %vi3754
	mov	%i9, %vi3753
	mov	%i10, %vi3752
	mov	%i11, %vi3751
	mov	%i12, %vi3750
	mov	%i13, %vi3749
	mov	%i14, %vi3780
	call_dir	utexture.4235
	set_label	%vi3781, min_caml_rgb
	set_label	%vi3782, min_caml_texture_color
	mov	%i4, %vi3781
	mov	%i5, %vi3782
	fmov	%f1, %vf3376
	call_dir	accumulate_vec_mul.4415
	movi	%i31, 4
	jleq	%vi3723, %i31, then.12065
	mov	%i31, %i0
	set_label	%i30, loop_end.11198
	jmp	%i0, 0(%i30)
then.12065:
	movui	%i31, 253133
	addi	%i31, %i31, -819
	mif	%vf3377, %i31
	fleq	%i31, %vf3350, %vf3377
	jzero	%i0, %i31, else.12067
	mov	%i31, %i0
	set_label	%i30, loop_end.11198
	jmp	%i0, 0(%i30)
else.12067:
	movui	%i31, 786432
	mif	%vf3378, %i31
	set_label	%vi3783, min_caml_vscan
	set_label	%vi3784, min_caml_nvector
	mov	%i4, %vi3783
	mov	%i5, %vi3784
	call_dir	in_prod.4396
	fmov	%vf3380, %f1
	fmul	%vf3381, %vf3378, %vf3380
	set_label	%vi3785, min_caml_vscan
	set_label	%vi3786, min_caml_nvector
	mov	%i4, %vi3785
	mov	%i5, %vi3786
	fmov	%f1, %vf3381
	call_dir	accumulate_vec_mul.4415
	mov	%i4, %vi3758
	mov	%i5, %vi3757
	mov	%i6, %vi3756
	mov	%i7, %vi3755
	mov	%i8, %vi3754
	mov	%i9, %vi3753
	mov	%i10, %vi3752
	mov	%i11, %vi3751
	mov	%i12, %vi3750
	mov	%i13, %vi3749
	call_dir	o_reflectiontype.2415
	mov	%vi3788, %i4
	movi	%i31, 1
	jeq	%vi3788, %i31, then.12069
	movi	%i31, 2
	jeq	%vi3788, %i31, then.12071
	mov	%i31, %i0
	set_label	%i30, loop_end.11198
	jmp	%i0, 0(%i30)
then.12071:
	set_label	%vi3799, min_caml_viewpoint
	mov	%vi3800, %i0
	set_label	%vi3801, min_caml_crashed_point
	mov	%vi3802, %i0
	lf	%vf3404, 0(%vi3801)
	sf	%vf3404, 0(%vi3799)
	set_label	%vi3803, min_caml_viewpoint
	set_label	%vi3804, min_caml_crashed_point
	lf	%vf3405, 4(%vi3804)
	sf	%vf3405, 4(%vi3803)
	set_label	%vi3805, min_caml_viewpoint
	set_label	%vi3806, min_caml_crashed_point
	lf	%vf3406, 8(%vi3806)
	sf	%vf3406, 8(%vi3805)
	movui	%i31, 260096
	mif	%vf3407, %i31
	mov	%i4, %vi3758
	mov	%i5, %vi3757
	mov	%i6, %vi3756
	mov	%i7, %vi3755
	mov	%i8, %vi3754
	mov	%i9, %vi3753
	mov	%i10, %vi3752
	mov	%i11, %vi3751
	mov	%i12, %vi3750
	mov	%i13, %vi3749
	call_dir	o_diffuse.2529
	fmov	%vf3409, %f1
	fsub	%vf3410, %vf3407, %vf3409
	fmul	%vf3411, %vf3350, %vf3410
	addi	%vi3807, %vi3723, 1
	mov	%vi3808, %vi3807
	fmov	%vf3412, %vf3411
	mov	%vi3723, %vi3808
	fmov	%vf3350, %vf3412
cont.12072:
	set_label	%i31, cont.12070
	jmp	%i0, 0(%i31)
then.12069:
	fmov	%vf3382, %f0
	mov	%i4, %vi3758
	mov	%i5, %vi3757
	mov	%i6, %vi3756
	mov	%i7, %vi3755
	mov	%i8, %vi3754
	mov	%i9, %vi3753
	mov	%i10, %vi3752
	mov	%i11, %vi3751
	mov	%i12, %vi3750
	mov	%i13, %vi3749
	call_dir	o_hilight.2542
	fmov	%vf3384, %f1
	feq	%i31, %f0, %vf3384
	jzero	%i0, %i31, else.12073
	mov	%i31, %i0
	set_label	%i30, loop_end.11198
	jmp	%i0, 0(%i30)
else.12073:
	set_label	%vi3789, min_caml_vscan
	set_label	%vi3790, min_caml_light
	mov	%i4, %vi3789
	mov	%i5, %vi3790
	call_dir	in_prod.4396
	fmov	%vf3386, %f1
	fneg	%vf3387, %vf3386
	fmov	%vf3388, %f0
	fleq	%i31, %vf3387, %f0
	jzero	%i0, %i31, else.12075
	mov	%i31, %i0
	set_label	%i30, loop_end.11198
	jmp	%i0, 0(%i30)
else.12075:
	fmov	%f1, %vf3387
	call_dir	fsqr.2386
	fmov	%vf3390, %f1
	fmov	%f1, %vf3390
	call_dir	fsqr.2386
	fmov	%vf3392, %f1
	fmul	%vf3393, %vf3392, %vf3350
	fmul	%vf3394, %vf3393, %vf3376
	mov	%i4, %vi3758
	mov	%i5, %vi3757
	mov	%i6, %vi3756
	mov	%i7, %vi3755
	mov	%i8, %vi3754
	mov	%i9, %vi3753
	mov	%i10, %vi3752
	mov	%i11, %vi3751
	mov	%i12, %vi3750
	mov	%i13, %vi3749
	call_dir	o_hilight.2542
	fmov	%vf3396, %f1
	fmul	%vf3397, %vf3394, %vf3396
	set_label	%vi3791, min_caml_rgb
	mov	%vi3792, %i0
	set_label	%vi3793, min_caml_rgb
	mov	%vi3794, %i0
	lf	%vf3398, 0(%vi3793)
	fadd	%vf3399, %vf3398, %vf3397
	sf	%vf3399, 0(%vi3791)
	set_label	%vi3795, min_caml_rgb
	set_label	%vi3796, min_caml_rgb
	lf	%vf3400, 4(%vi3796)
	fadd	%vf3401, %vf3400, %vf3397
	sf	%vf3401, 4(%vi3795)
	set_label	%vi3797, min_caml_rgb
	set_label	%vi3798, min_caml_rgb
	lf	%vf3402, 8(%vi3798)
	fadd	%vf3403, %vf3402, %vf3397
	sf	%vf3403, 8(%vi3797)
	mov	%i31, %i0
	set_label	%i30, loop_end.11198
	jmp	%i0, 0(%i30)
cont.12076:
cont.12074:
cont.12070:
cont.12068:
cont.12066:
	set_label	%i31, cont.12060
	jmp	%i0, 0(%i31)
then.12059:
	mov	%i31, %i0
	set_label	%i30, loop_end.11198
	jmp	%i0, 0(%i30)
cont.12060:
	set_label	%i30, loop_start.11197
	jmp	%i0, 0(%i30)
loop_end.11198:
	mov	%i0, %i31
	set_label	%vi3809, min_caml_rgb
	mov	%vi3810, %i0
	lf	%vf3413, 0(%vi3809)
	fmov	%f1, %vf3413
	ftoi	%vi3811, %f1
	movi	%i31, 255
	jleq	%vi3811, %i31, then.12077
	movi	%vi3812, 255
	set_label	%i31, cont.12078
	jmp	%i0, 0(%i31)
then.12077:
	mov	%vi3812, %vi3811
cont.12078:
	mov	%i4, %vi3812
	call_dir	min_caml_print_byte
	set_label	%vi3813, min_caml_rgb
	lf	%vf3414, 4(%vi3813)
	fmov	%f1, %vf3414
	ftoi	%vi3814, %f1
	movi	%i31, 255
	jleq	%vi3814, %i31, then.12079
	movi	%vi3815, 255
	set_label	%i31, cont.12080
	jmp	%i0, 0(%i31)
then.12079:
	mov	%vi3815, %vi3814
cont.12080:
	mov	%i4, %vi3815
	call_dir	min_caml_print_byte
	set_label	%vi3816, min_caml_rgb
	lf	%vf3415, 8(%vi3816)
	fmov	%f1, %vf3415
	ftoi	%vi3817, %f1
	movi	%i31, 255
	jleq	%vi3817, %i31, then.12081
	movi	%vi3818, 255
	set_label	%i31, cont.12082
	jmp	%i0, 0(%i31)
then.12081:
	mov	%vi3818, %vi3817
cont.12082:
	mov	%i4, %vi3818
	call_dir	min_caml_print_byte
	addi	%vi3819, %vi3678, 1
	mov	%vi3820, %vi3819
	mov	%vi3678, %vi3820
	set_label	%i31, cont.12054
	jmp	%i0, 0(%i31)
then.12053:
	mov	%i31, %i0
	set_label	%i30, loop_end.11192
	jmp	%i0, 0(%i30)
cont.12054:
	set_label	%i30, loop_start.11191
	jmp	%i0, 0(%i30)
loop_end.11192:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
scan_line.4745:
	mov	%vi3821, %i4
	set_label	%vi3822, min_caml_size
	mov	%vi3823, %i0
	lw	%vi3824, 0(%vi3822)
loop_start.11203:
	jleq	%vi3824, %vi3821, then.12084
	set_label	%vi3825, min_caml_scan_sscany
	mov	%vi3826, %i0
	set_label	%vi3827, min_caml_scan_offset
	mov	%vi3828, %i0
	lf	%vf3416, 0(%vi3827)
	movui	%i31, 260096
	mif	%vf3417, %i31
	fsub	%vf3418, %vf3416, %vf3417
	mov	%i4, %vi3821
	itof	%vf3419, %i4
	fsub	%vf3420, %vf3418, %vf3419
	set_label	%vi3829, min_caml_scan_d
	mov	%vi3830, %i0
	lf	%vf3421, 0(%vi3829)
	fmul	%vf3422, %vf3421, %vf3420
	sf	%vf3422, 0(%vi3825)
	set_label	%vi3831, min_caml_scan_met1
	mov	%vi3832, %i0
	set_label	%vi3833, min_caml_scan_sscany
	mov	%vi3834, %i0
	lf	%vf3423, 0(%vi3833)
	fmov	%vf3424, %vf3423
	fmul	%vf3425, %vf3424, %vf3424
	movui	%i31, 291268
	mif	%vf3426, %i31
	fadd	%vf3427, %vf3425, %vf3426
	sf	%vf3427, 0(%vi3831)
	set_label	%vi3835, min_caml_scan_sscany
	mov	%vi3836, %i0
	lf	%vf3428, 0(%vi3835)
	set_label	%vi3837, min_caml_sin_v
	mov	%vi3838, %i0
	lf	%vf3429, 0(%vi3837)
	fmul	%vf3430, %vf3428, %vf3429
	set_label	%vi3839, min_caml_wscan
	mov	%vi3840, %i0
	set_label	%vi3841, min_caml_sin_v
	lf	%vf3431, 4(%vi3841)
	fmul	%vf3432, %vf3430, %vf3431
	set_label	%vi3842, min_caml_vp
	mov	%vi3843, %i0
	lf	%vf3433, 0(%vi3842)
	fsub	%vf3434, %vf3432, %vf3433
	sf	%vf3434, 0(%vi3839)
	set_label	%vi3844, min_caml_wscan
	set_label	%vi3845, min_caml_cos_v
	lf	%vf3435, 4(%vi3845)
	fmul	%vf3436, %vf3430, %vf3435
	set_label	%vi3846, min_caml_vp
	lf	%vf3437, 8(%vi3846)
	fsub	%vf3438, %vf3436, %vf3437
	sf	%vf3438, 8(%vi3844)
	mov	%vi3847, %i0
	mov	%vi3848, %i0
	set_label	%vi3849, min_caml_size
	mov	%vi3850, %i0
	lw	%vi3851, 0(%vi3849)
loop_start.11205:
	jleq	%vi3851, %vi3848, then.12087
	mov	%i4, %vi3848
	itof	%vf3439, %i4
	set_label	%vi3852, min_caml_scan_offset
	mov	%vi3853, %i0
	lf	%vf3440, 0(%vi3852)
	fsub	%vf3441, %vf3439, %vf3440
	set_label	%vi3854, min_caml_scan_d
	mov	%vi3855, %i0
	lf	%vf3442, 0(%vi3854)
	fmul	%vf3443, %vf3441, %vf3442
	set_label	%vi3856, min_caml_vscan
	mov	%vi3857, %i0
	set_label	%vi3858, min_caml_cos_v
	lf	%vf3444, 4(%vi3858)
	fmul	%vf3445, %vf3443, %vf3444
	set_label	%vi3859, min_caml_wscan
	mov	%vi3860, %i0
	lf	%vf3446, 0(%vi3859)
	fadd	%vf3447, %vf3445, %vf3446
	sf	%vf3447, 0(%vi3856)
	set_label	%vi3861, min_caml_vscan
	set_label	%vi3862, min_caml_scan_sscany
	mov	%vi3863, %i0
	lf	%vf3448, 0(%vi3862)
	set_label	%vi3864, min_caml_cos_v
	mov	%vi3865, %i0
	lf	%vf3449, 0(%vi3864)
	fmul	%vf3450, %vf3448, %vf3449
	set_label	%vi3866, min_caml_vp
	lf	%vf3451, 4(%vi3866)
	fsub	%vf3452, %vf3450, %vf3451
	sf	%vf3452, 4(%vi3861)
	set_label	%vi3867, min_caml_vscan
	fneg	%vf3453, %vf3443
	set_label	%vi3868, min_caml_sin_v
	lf	%vf3454, 4(%vi3868)
	fmul	%vf3455, %vf3453, %vf3454
	set_label	%vi3869, min_caml_wscan
	lf	%vf3456, 8(%vi3869)
	fadd	%vf3457, %vf3455, %vf3456
	sf	%vf3457, 8(%vi3867)
	fmov	%f1, %vf3443
	call_dir	fsqr.2386
	fmov	%vf3459, %f1
	set_label	%vi3870, min_caml_scan_met1
	mov	%vi3871, %i0
	lf	%vf3460, 0(%vi3870)
	fadd	%vf3461, %vf3459, %vf3460
	fmov	%f1, %vf3461
	call_dir	sqrt.2275
	fmov	%vf3463, %f1
	set_label	%vi3872, min_caml_vscan
	mov	%vi3873, %i0
	set_label	%vi3874, min_caml_vscan
	mov	%vi3875, %i0
	lf	%vf3464, 0(%vi3874)
	finv	%vf3465, %vf3463
	fmul	%vf3466, %vf3464, %vf3465
	sf	%vf3466, 0(%vi3872)
	set_label	%vi3876, min_caml_vscan
	set_label	%vi3877, min_caml_vscan
	lf	%vf3467, 4(%vi3877)
	finv	%vf3468, %vf3463
	fmul	%vf3469, %vf3467, %vf3468
	sf	%vf3469, 4(%vi3876)
	set_label	%vi3878, min_caml_vscan
	set_label	%vi3879, min_caml_vscan
	lf	%vf3470, 8(%vi3879)
	finv	%vf3471, %vf3463
	fmul	%vf3472, %vf3470, %vf3471
	sf	%vf3472, 8(%vi3878)
	set_label	%vi3880, min_caml_viewpoint
	mov	%vi3881, %i0
	set_label	%vi3882, min_caml_view
	mov	%vi3883, %i0
	lf	%vf3473, 0(%vi3882)
	sf	%vf3473, 0(%vi3880)
	set_label	%vi3884, min_caml_viewpoint
	set_label	%vi3885, min_caml_view
	lf	%vf3474, 4(%vi3885)
	sf	%vf3474, 4(%vi3884)
	set_label	%vi3886, min_caml_viewpoint
	set_label	%vi3887, min_caml_view
	lf	%vf3475, 8(%vi3887)
	sf	%vf3475, 8(%vi3886)
	set_label	%vi3888, min_caml_rgb
	mov	%vi3889, %i0
	fmov	%vf3476, %f0
	sf	%f0, 0(%vi3888)
	set_label	%vi3890, min_caml_rgb
	fmov	%vf3477, %f0
	sf	%f0, 4(%vi3890)
	set_label	%vi3891, min_caml_rgb
	fmov	%vf3478, %f0
	sf	%f0, 8(%vi3891)
	mov	%vi3892, %i0
	movui	%i31, 260096
	mif	%vf3479, %i31
	mov	%i4, %i0
	fmov	%f1, %vf3479
	call_dir	raytracing.4442
	call_dir	write_rgb.4583
	addi	%vi3893, %vi3848, 1
	mov	%vi3894, %vi3893
	mov	%vi3848, %vi3894
	set_label	%i31, cont.12088
	jmp	%i0, 0(%i31)
then.12087:
	mov	%i31, %i0
	set_label	%i30, loop_end.11206
	jmp	%i0, 0(%i30)
cont.12088:
	set_label	%i30, loop_start.11205
	jmp	%i0, 0(%i30)
loop_end.11206:
	mov	%i0, %i31
	addi	%vi3895, %vi3821, 1
	mov	%vi3896, %vi3895
	mov	%vi3821, %vi3896
	set_label	%i31, cont.12085
	jmp	%i0, 0(%i31)
then.12084:
	mov	%i31, %i0
	set_label	%i30, loop_end.11204
	jmp	%i0, 0(%i30)
cont.12085:
	set_label	%i30, loop_start.11203
	jmp	%i0, 0(%i30)
loop_end.11204:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
scan_start.4806:
	movi	%vi3897, 80
	mov	%i4, %vi3897
	call_dir	min_caml_print_byte
	movi	%vi3898, 48
	addi	%vi3899, %vi3898, 6
	mov	%i4, %vi3899
	call_dir	min_caml_print_byte
	movi	%vi3900, 10
	mov	%i4, %vi3900
	call_dir	min_caml_print_byte
	set_label	%vi3901, min_caml_size
	mov	%vi3902, %i0
	lw	%vi3903, 0(%vi3901)
	mov	%i4, %vi3903
	call_dir	print_int.2281
	movi	%vi3904, 32
	mov	%i4, %vi3904
	call_dir	min_caml_print_byte
	set_label	%vi3905, min_caml_size
	lw	%vi3906, 4(%vi3905)
	mov	%i4, %vi3906
	call_dir	print_int.2281
	movi	%vi3907, 10
	mov	%i4, %vi3907
	call_dir	min_caml_print_byte
	movi	%vi3908, 255
	mov	%i4, %vi3908
	call_dir	print_int.2281
	movi	%vi3909, 10
	mov	%i4, %vi3909
	call_dir	min_caml_print_byte
	set_label	%vi3910, min_caml_size
	mov	%vi3911, %i0
	lw	%vi3912, 0(%vi3910)
	mov	%i4, %vi3912
	itof	%vf3480, %i4
	set_label	%vi3913, min_caml_scan_d
	mov	%vi3914, %i0
	movui	%i31, 274432
	mif	%vf3481, %i31
	finv	%vf3482, %vf3480
	fmul	%vf3483, %vf3481, %vf3482
	sf	%vf3483, 0(%vi3913)
	set_label	%vi3915, min_caml_scan_offset
	mov	%vi3916, %i0
	movui	%i31, 262144
	mif	%vf3484, %i31
	finv	%vf3485, %vf3484
	fmul	%vf3486, %vf3480, %vf3485
	sf	%vf3486, 0(%vi3915)
	mov	%vi3917, %i0
	mov	%vi3918, %i0
	set_label	%vi3919, min_caml_size
	mov	%vi3920, %i0
	lw	%vi3921, 0(%vi3919)
loop_start.11214:
	jleq	%vi3921, %vi3918, then.12090
	set_label	%vi3922, min_caml_scan_sscany
	mov	%vi3923, %i0
	set_label	%vi3924, min_caml_scan_offset
	mov	%vi3925, %i0
	lf	%vf3487, 0(%vi3924)
	movui	%i31, 260096
	mif	%vf3488, %i31
	fsub	%vf3489, %vf3487, %vf3488
	mov	%i4, %vi3918
	itof	%vf3490, %i4
	fsub	%vf3491, %vf3489, %vf3490
	set_label	%vi3926, min_caml_scan_d
	mov	%vi3927, %i0
	lf	%vf3492, 0(%vi3926)
	fmul	%vf3493, %vf3492, %vf3491
	sf	%vf3493, 0(%vi3922)
	set_label	%vi3928, min_caml_scan_met1
	mov	%vi3929, %i0
	set_label	%vi3930, min_caml_scan_sscany
	mov	%vi3931, %i0
	lf	%vf3494, 0(%vi3930)
	fmov	%f1, %vf3494
	call_dir	fsqr.2386
	fmov	%vf3496, %f1
	movui	%i31, 291268
	mif	%vf3497, %i31
	fadd	%vf3498, %vf3496, %vf3497
	sf	%vf3498, 0(%vi3928)
	set_label	%vi3932, min_caml_scan_sscany
	mov	%vi3933, %i0
	lf	%vf3499, 0(%vi3932)
	set_label	%vi3934, min_caml_sin_v
	mov	%vi3935, %i0
	lf	%vf3500, 0(%vi3934)
	fmul	%vf3501, %vf3499, %vf3500
	set_label	%vi3936, min_caml_wscan
	mov	%vi3937, %i0
	set_label	%vi3938, min_caml_sin_v
	lf	%vf3502, 4(%vi3938)
	fmul	%vf3503, %vf3501, %vf3502
	set_label	%vi3939, min_caml_vp
	mov	%vi3940, %i0
	lf	%vf3504, 0(%vi3939)
	fsub	%vf3505, %vf3503, %vf3504
	sf	%vf3505, 0(%vi3936)
	set_label	%vi3941, min_caml_wscan
	set_label	%vi3942, min_caml_cos_v
	lf	%vf3506, 4(%vi3942)
	fmul	%vf3507, %vf3501, %vf3506
	set_label	%vi3943, min_caml_vp
	lf	%vf3508, 8(%vi3943)
	fsub	%vf3509, %vf3507, %vf3508
	sf	%vf3509, 8(%vi3941)
	mov	%vi3944, %i0
	mov	%i4, %i0
	call_dir	scan_point.4630
	addi	%vi3945, %vi3918, 1
	mov	%vi3946, %vi3945
	mov	%vi3918, %vi3946
	set_label	%i31, cont.12091
	jmp	%i0, 0(%i31)
then.12090:
	mov	%i31, %i0
	set_label	%i30, loop_end.11215
	jmp	%i0, 0(%i30)
cont.12091:
	set_label	%i30, loop_start.11214
	jmp	%i0, 0(%i30)
loop_end.11215:
	mov	%i4, %i31
	fmov	%f1, %f31
	ret
	.end_function
	.func_entry
rt.4825:
	mov	%vi3947, %i4
	mov	%vi3948, %i5
	mov	%vi3949, %i6
	set_label	%vi3950, min_caml_size
	mov	%vi3951, %i0
	sw	%vi3947, 0(%vi3950)
	set_label	%vi3952, min_caml_size
	sw	%vi3948, 4(%vi3952)
	set_label	%vi3953, min_caml_dbg
	mov	%vi3954, %i0
	sw	%vi3949, 0(%vi3953)
	call_dir	read_environ.2670
	call_dir	read_all_object.3256
	mov	%vi3955, %i0
	mov	%i4, %i0
	call_dir	read_and_network.3287
	set_label	%vi3956, min_caml_or_net
	mov	%vi3957, %i0
	mov	%vi3958, %i0
	mov	%i4, %i0
	call_dir	read_or_network.3273
	mov	%vi3960, %i4
	sw	%vi3960, 0(%vi3956)
	call_dir	write_ppm_header.4605
	set_label	%vi3961, min_caml_size
	mov	%vi3962, %i0
	lw	%vi3963, 0(%vi3961)
	mov	%i4, %vi3963
	itof	%vf3510, %i4
	set_label	%vi3964, min_caml_scan_d
	mov	%vi3965, %i0
	movui	%i31, 274432
	mif	%vf3511, %i31
	finv	%vf3512, %vf3510
	fmul	%vf3513, %vf3511, %vf3512
	sf	%vf3513, 0(%vi3964)
	set_label	%vi3966, min_caml_scan_offset
	mov	%vi3967, %i0
	movui	%i31, 262144
	mif	%vf3514, %i31
	finv	%vf3515, %vf3514
	fmul	%vf3516, %vf3510, %vf3515
	sf	%vf3516, 0(%vi3966)
	mov	%vi3968, %i0
	mov	%i4, %i0
	call_dir	scan_line.4745
	ret
	.end_function
.section ".text"
.global min_caml_print_newline # done!
min_caml_print_newline:
	movui %i5, 0xf0000
	movi %i4, 10
	sb %i4, 0(%i5)
	jmp	%i0, 0(%i3)

.global min_caml_print_char # done!
min_caml_print_char:
	movui %i5, 0xf0000
	sb %i4, 0(%i5)
	jmp	%i0, 0(%i3)

min_caml_read_char:
	movui %i5, 0xf0000
	lb %i30, 0(%i5)
	jmp	%i0, 0(%i3)

min_caml_read_int:
    movui %i5, 0xf0000
    lb %i30, 0(%i5)
    slli %i30, %i30, 8
    lb %i31, 0(%i5)
    or %i30, %i31, %i30
    slli %i30, %i30, 8
    lb %i31, 0(%i5)
    or %i30, %i31, %i30
    slli %i30, %i30, 8
    lb %i31, 0(%i5)
    or %i30, %i31, %i30
    jmp	%i0, 0(%i3)

min_caml_read_float:
    movui %i5, 0xf0000
    lb %i30, 0(%i5)
    slli %i30, %i30, 8
    lb %i31, 0(%i5)
    or %i30, %i31, %i30
    slli %i30, %i30, 8
    lb %i31, 0(%i5)
    or %i30, %i31, %i30
    slli %i30, %i30, 8
    lb %i31, 0(%i5)
    or %i30, %i31, %i30
    mif %f30, %i30
    jmp	%i0, 0(%i3)


.global min_caml_create_array # done!
min_caml_create_array:
    mov    %i15, %i4
    mov    %i30, %i2
create_array_loop:
    ceqi    %i31, %i15, 0
    jzero    %i0, %i31, create_array_cont
    jmp	%i0, 0(%i3)    
create_array_cont:
    sw    %i5, 0(%i2)
    addi    %i2, %i2, 4    
    subi    %i15, %i15, 1    
    set_label    %i31, create_array_loop
    jmp    %i0, 0(%i31)

.global min_caml_create_float_array # done!
min_caml_create_float_array:
    mov    %i15, %i4
    mov    %i30, %i2
create_float_array_loop:
    ceqi    %i31, %i15, 0
    jzero    %i0, %i31, create_float_array_cont
    jmp	%i0, 0(%i3)
create_float_array_cont:
    sf    %f1, 0(%i2)
    addi    %i2, %i2, 4
    subi    %i15, %i15, 1
    set_label    %i31, create_float_array_loop
    jmp    %i0, 0(%i31)

.global min_caml_rsqrt
min_caml_rsqrt:
    frsqrt %f30, %f1
    jmp	%i0, 0(%i3)

.global min_caml_floor
min_caml_floor:
    ffloor %f30, %f1
    jmp	%i0, 0(%i3)
