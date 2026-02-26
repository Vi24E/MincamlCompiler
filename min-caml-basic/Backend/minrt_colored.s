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
	subi	%i1, %i1, 8
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	sf	%f1, 0(%i0)
	movui	%i31, 261264
	ori	%i31, %i31, -37
	mif	%f1, %i31
	sf	%f1, 1(%i0)
	movui	%i31, 785552
	ori	%i31, %i31, -37
	mif	%f1, %i31
	sf	%f1, 2(%i0)
	movui	%i31, 787600
	ori	%i31, %i31, -37
	mif	%f1, %i31
	sf	%f1, 3(%i0)
	movi	%i6, 1
	sw	%i6, 4(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	sw	%i6, 0(%i1)
	lw	%i31, 0(%i1)
	sw	%i31, 6(%i0)
	fmov	%f1, %f0
	mov	%i15, %i0
	mov	%i4, %i2
cfa_loop.70145:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, cfa_cont.70146
	jzero	%i0, %i0, cfa_done.70147
cfa_cont.70146:
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, cfa_loop.70145
	jmp	%i0, 0(%i31)
cfa_done.70147:
	mov	%i5, %i4
	sw	%i5, 9(%i0)
	movi	%i6, 60
	sw	%i6, 9(%i0)
	mov	%i4, %i2
	addi	%i2, %i2, 48
	sw	%i5, 10(%i4)
	sw	%i5, 9(%i4)
	sw	%i5, 8(%i4)
	sw	%i5, 7(%i4)
	sw	%i0, 6(%i4)
	sw	%i5, 5(%i4)
	sw	%i5, 4(%i4)
	sw	%i0, 3(%i4)
	sw	%i0, 2(%i4)
	sw	%i0, 1(%i4)
	sw	%i0, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i6
	mov	%i4, %i2
ca_loop.70148:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70149
	jzero	%i0, %i0, ca_done.70150
ca_cont.70149:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70148
	jmp	%i0, 0(%i31)
ca_done.70150:
	mov	%i16, %i4
	sw	%i16, 15(%i0)
	movi	%i5, 3
	sw	%i5, 75(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 77(%i0)
	movi	%i5, 3
	sw	%i5, 80(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 82(%i0)
	movi	%i5, 3
	sw	%i5, 85(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i29, %i5
	sw	%i29, 87(%i0)
	movi	%i5, 1
	sw	%i5, 90(%i0)
	movui	%i31, 276464
	mif	%f1, %i31
	sf	%f1, 91(%i0)
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	sw	%i5, 92(%i0)
	movi	%i7, 50
	sw	%i7, 93(%i0)
	movi	%i6, 1
	sw	%i6, 94(%i0)
	movi	%i4, -1
	sw	%i4, 95(%i0)
	mov	%i5, %i4
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i4, %i6
	sw	%i4, 96(%i0)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.70151:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70152
	jzero	%i0, %i0, ca_done.70153
ca_cont.70152:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70151
	jmp	%i0, 0(%i31)
ca_done.70153:
	sw	%i4, 97(%i0)
	movi	%i7, 1
	sw	%i7, 147(%i0)
	movi	%i6, 1
	sw	%i6, 148(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i4
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i4, %i6
	sw	%i4, 150(%i0)
	mov	%i5, %i4
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	sw	%i7, 151(%i0)
	movi	%i5, 1
	sw	%i5, 152(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	sw	%i5, 154(%i0)
	movi	%i4, 1
	sw	%i4, 155(%i0)
	mov	%i5, %i0
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	sw	%i4, 157(%i0)
	movi	%i5, 1
	sw	%i5, 158(%i0)
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	sf	%f1, 159(%i0)
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	sw	%i5, 160(%i0)
	movi	%i5, 3
	sw	%i5, 161(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 163(%i0)
	movi	%i4, 1
	sw	%i4, 166(%i0)
	mov	%i5, %i0
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	sw	%i4, 168(%i0)
	movi	%i5, 3
	sw	%i5, 169(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 171(%i0)
	movi	%i5, 3
	sw	%i5, 174(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 176(%i0)
	movi	%i5, 3
	sw	%i5, 179(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 181(%i0)
	movi	%i5, 3
	sw	%i5, 184(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 186(%i0)
	movi	%i6, 2
	sw	%i6, 189(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i28, %i6
	sw	%i28, 191(%i0)
	movi	%i6, 2
	sw	%i6, 193(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i27, %i6
	sw	%i27, 195(%i0)
	movi	%i5, 1
	sw	%i5, 197(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i26, %i5
	sw	%i26, 199(%i0)
	movi	%i5, 3
	sw	%i5, 200(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 202(%i0)
	movi	%i5, 3
	sw	%i5, 205(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 207(%i0)
	movi	%i5, 3
	sw	%i5, 210(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 212(%i0)
	movi	%i5, 3
	sw	%i5, 215(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i25, %i5
	sw	%i25, 217(%i0)
	movi	%i5, 3
	sw	%i5, 220(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i24, %i5
	sw	%i24, 222(%i0)
	movi	%i5, 3
	sw	%i5, 225(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 227(%i0)
	fmov	%f1, %f0
	mov	%i15, %i0
	mov	%i4, %i2
cfa_loop.70154:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, cfa_cont.70155
	jzero	%i0, %i0, cfa_done.70156
cfa_cont.70155:
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, cfa_loop.70154
	jmp	%i0, 0(%i31)
cfa_done.70156:
	mov	%i6, %i4
	sw	%i6, 232(%i0)
	mov	%i5, %i6
	mov	%i15, %i0
	mov	%i4, %i2
ca_loop.70157:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70158
	jzero	%i0, %i0, ca_done.70159
ca_cont.70158:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70157
	jmp	%i0, 0(%i31)
ca_done.70159:
	mov	%i5, %i4
	sw	%i5, 233(%i0)
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i0
	mov	%i4, %i2
ca_loop.70160:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70161
	jzero	%i0, %i0, ca_done.70162
ca_cont.70161:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70160
	jmp	%i0, 0(%i31)
ca_done.70162:
	sw	%i4, 234(%i0)
	movi	%i6, 5
	sw	%i6, 234(%i0)
	mov	%i5, %i4
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	sw	%i6, 235(%i0)
	fmov	%f1, %f0
	mov	%i15, %i0
	mov	%i4, %i2
cfa_loop.70163:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, cfa_cont.70164
	jzero	%i0, %i0, cfa_done.70165
cfa_cont.70164:
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, cfa_loop.70163
	jmp	%i0, 0(%i31)
cfa_done.70165:
	mov	%i6, %i4
	sw	%i6, 242(%i0)
	movi	%i5, 3
	sw	%i5, 242(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i23, %i5
	sw	%i23, 244(%i0)
	movi	%i4, 60
	sw	%i4, 247(%i0)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70166:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70167
	jzero	%i0, %i0, ca_done.70168
ca_cont.70167:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70166
	jmp	%i0, 0(%i31)
ca_done.70168:
	mov	%i22, %i4
	sw	%i22, 248(%i0)
	fmov	%f1, %f0
	mov	%i15, %i0
	mov	%i4, %i2
cfa_loop.70169:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, cfa_cont.70170
	jzero	%i0, %i0, cfa_done.70171
cfa_cont.70170:
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, cfa_loop.70169
	jmp	%i0, 0(%i31)
cfa_done.70171:
	mov	%i7, %i4
	sw	%i7, 310(%i0)
	mov	%i5, %i7
	mov	%i15, %i0
	mov	%i4, %i2
ca_loop.70172:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70173
	jzero	%i0, %i0, ca_done.70174
ca_cont.70173:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70172
	jmp	%i0, 0(%i31)
ca_done.70174:
	mov	%i5, %i4
	sw	%i5, 311(%i0)
	movi	%i6, 180
	sw	%i6, 311(%i0)
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f0, 4(%i4)
	sw	%i5, 2(%i4)
	sw	%i7, 1(%i4)
	sw	%i0, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i6
	mov	%i4, %i2
ca_loop.70175:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70176
	jzero	%i0, %i0, ca_done.70177
ca_cont.70176:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70175
	jmp	%i0, 0(%i31)
ca_done.70177:
	mov	%i21, %i4
	sw	%i21, 314(%i0)
	movi	%i6, 1
	sw	%i6, 494(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i20, %i6
	sw	%i20, 496(%i0)
	movi	%i5, 32
	sw	%i5, 497(%i0)
	movi	%i4, 32
	sw	%i4, 498(%i0)
	movi	%i19, 3
	sw	%i19, 499(%i0)
	sw	%i5, 0(%i28)
	sw	%i4, 1(%i28)
	sari	%i4, %i5, 1
	sw	%i4, 504(%i0)
	sw	%i4, 0(%i27)
	sw	%i4, 1(%i27)
	movui	%i31, 274432
	mif	%f2, %i31
	sf	%f2, 507(%i0)
	mov	%i4, %i5
	itof	%f1, %i4
	sf	%f1, 508(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 509(%i0)
	sf	%f1, 0(%i26)
	subi	%i1, %i1, 8
	sw	%i16, 0(%i1)
	set_label	%i31, create_pixelline.3151
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i18, %i30
	subi	%i1, %i1, 8
	sw	%i16, 0(%i1)
	set_label	%i31, create_pixelline.3151
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i17, %i30
	subi	%i1, %i1, 8
	sw	%i16, 0(%i1)
	set_label	%i31, create_pixelline.3151
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	addi	%i1, %i1, 8
	sw	%i30, 1(%i1)
	subi	%i1, %i1, 56
	sw	%i16, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sw	%i22, 6(%i1)
	sw	%i23, 7(%i1)
	sw	%i24, 8(%i1)
	sw	%i25, 9(%i1)
	sw	%i26, 10(%i1)
	sw	%i27, 11(%i1)
	sw	%i28, 12(%i1)
	set_label	%i31, read_parameter.2865
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lw	%i22, 6(%i1)
	lw	%i23, 7(%i1)
	lw	%i24, 8(%i1)
	lw	%i25, 9(%i1)
	lw	%i26, 10(%i1)
	lw	%i27, 11(%i1)
	lw	%i28, 12(%i1)
	addi	%i1, %i1, 56
	mov	%i4, %i19
	set_label	%i31, write_ppm_header.3108
	jmp	%i3, 0(%i31)
	subi	%i1, %i1, 16
	sw	%i16, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	set_label	%i31, init_dirvecs.3185
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	addi	%i1, %i1, 16
	lf	%f1, 0(%i29)
	sf	%f1, 512(%i0)
	sf	%f1, 0(%i23)
	lf	%f1, 1(%i29)
	sf	%f1, 515(%i0)
	sf	%f1, 1(%i23)
	lf	%f1, 2(%i29)
	sf	%f1, 518(%i0)
	sf	%f1, 2(%i23)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	sw	%i4, 520(%i0)
	subi	%i31, %i4, 1
	sw	%i31, 2(%i1)
	movui	%i31, 0
	ori	%i31, %i31, -2008
	add	%i31, %i0, %i31
	lw	%i30, 2(%i1)
	sw	%i30, 0(%i31)
	lw	%i31, 2(%i1)
	jleq	%i0, %i31, then.70178
	jzero	%i0, %i0, cont.70179
then.70178:
	lw	%i31, 2(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	movi	%i31, 1
	jeq	%i6, %i31, then.70180
	movi	%i31, 2
	jeq	%i6, %i31, then.70182
	mov	%i4, %i23
	set_label	%i31, setup_second_table.2957
	jmp	%i3, 0(%i31)
	mov	%i5, %i30
	lw	%i31, 2(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i22, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.70181
then.70182:
	movi	%i5, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	sf	%f1, 3(%i2)
	addi	%i2, %i2, 16
	lf	%f2, 0(%i23)
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i23)
	lf	%f1, 1(%i9)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i23)
	lf	%f1, 2(%i9)
	fma	%f3, %f2, %f1, %f3
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.70184
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	sf	%f1, 0(%i5)
	lf	%f2, 0(%i9)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 1(%i5)
	lf	%f2, 1(%i9)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 2(%i5)
	lf	%f2, 2(%i9)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.70185
then.70184:
	sf	%f0, 0(%i5)
cont.70185:
	lw	%i31, 2(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i22, %i4
	sw	%i5, 0(%i31)
cont.70183:
	jzero	%i0, %i0, cont.70181
then.70180:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i15, %i4
	mov	%i4, %i2
cfa_loop.70186:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, cfa_cont.70187
	jzero	%i0, %i0, cfa_done.70188
cfa_cont.70187:
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, cfa_loop.70186
	jmp	%i0, 0(%i31)
cfa_done.70188:
	mov	%i6, %i4
	lf	%f1, 0(%i23)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70189
	sf	%f0, 1(%i6)
	jzero	%i0, %i0, cont.70190
then.70189:
	lf	%f1, 0(%i23)
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i9)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i23)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i6)
cont.70190:
	lf	%f1, 1(%i23)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70191
	sf	%f0, 3(%i6)
	jzero	%i0, %i0, cont.70192
then.70191:
	lf	%f1, 1(%i23)
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i9)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i23)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i6)
cont.70192:
	lf	%f1, 2(%i23)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70193
	sf	%f0, 5(%i6)
	jzero	%i0, %i0, cont.70194
then.70193:
	lf	%f1, 2(%i23)
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i9)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i23)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i6)
cont.70194:
	lw	%i31, 2(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i22, %i4
	sw	%i6, 0(%i31)
cont.70181:
	lw	%i31, 2(%i1)
	subi	%i4, %i31, 1
	sw	%i4, 2(%i1)
loop_start.69855:
	lw	%i31, 2(%i1)
	jleq	%i0, %i31, then.70196
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69856
	set_label	%i31, loop_start.69855
	jmp	%i0, 0(%i31)
then.70196:
	lw	%i31, 2(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	movi	%i31, 1
	jeq	%i6, %i31, then.70198
	movi	%i31, 2
	jeq	%i6, %i31, then.70200
	mov	%i4, %i23
	set_label	%i31, setup_second_table.2957
	jmp	%i3, 0(%i31)
	mov	%i5, %i30
	lw	%i31, 2(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i22, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.70199
then.70200:
	movi	%i5, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	sf	%f1, 3(%i2)
	addi	%i2, %i2, 16
	lf	%f2, 0(%i23)
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i23)
	lf	%f1, 1(%i9)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i23)
	lf	%f1, 2(%i9)
	fma	%f3, %f2, %f1, %f3
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.70202
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	sf	%f1, 0(%i5)
	lf	%f2, 0(%i9)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 1(%i5)
	lf	%f2, 1(%i9)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 2(%i5)
	lf	%f2, 2(%i9)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.70203
then.70202:
	sf	%f0, 0(%i5)
cont.70203:
	lw	%i31, 2(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i22, %i4
	sw	%i5, 0(%i31)
cont.70201:
	jzero	%i0, %i0, cont.70199
then.70198:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i15, %i4
	mov	%i4, %i2
cfa_loop.70204:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, cfa_cont.70205
	jzero	%i0, %i0, cfa_done.70206
cfa_cont.70205:
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, cfa_loop.70204
	jmp	%i0, 0(%i31)
cfa_done.70206:
	mov	%i6, %i4
	lf	%f1, 0(%i23)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70207
	sf	%f0, 1(%i6)
	jzero	%i0, %i0, cont.70208
then.70207:
	lf	%f1, 0(%i23)
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i9)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i23)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i6)
cont.70208:
	lf	%f1, 1(%i23)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70209
	sf	%f0, 3(%i6)
	jzero	%i0, %i0, cont.70210
then.70209:
	lf	%f1, 1(%i23)
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i9)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i23)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i6)
cont.70210:
	lf	%f1, 2(%i23)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70211
	sf	%f0, 5(%i6)
	jzero	%i0, %i0, cont.70212
then.70211:
	lf	%f1, 2(%i23)
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i9)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i23)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i6)
cont.70212:
	lw	%i31, 2(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i22, %i4
	sw	%i6, 0(%i31)
cont.70199:
	lw	%i31, 2(%i1)
	subi	%i4, %i31, 1
	sw	%i4, 2(%i1)
cont.70197:
	set_label	%i30, loop_start.69855
	jmp	%i0, 0(%i30)
loop_end.69856:
	mov	%i0, %i31
cont.70179:
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	sw	%i4, 525(%i0)
	subi	%i7, %i4, 1
	sw	%i7, 527(%i0)
	jlt	%i7, %i0, cont.70213
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i5, 0(%i31)
	lw	%i10, 7(%i5)
	lw	%i6, 4(%i5)
	lw	%i4, 2(%i5)
	lw	%i5, 1(%i5)
	ceqi	%i31, %i4, 2
	jzero	%i0, %i31, cont.70214
	lf	%f2, 0(%i10)
	movui	%i31, 260096
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.70215
	movi	%i31, 1
	jeq	%i5, %i31, then.70216
	ceqi	%i31, %i5, 2
	jzero	%i0, %i31, cont.70218
	slli	%i4, %i7, 2
	addi	%i9, %i4, 1
	lw	%i8, 0(%i20)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i10)
	fsub	%f6, %f2, %f1
	lf	%f2, 0(%i29)
	lf	%f1, 0(%i6)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i29)
	lf	%f1, 1(%i6)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i29)
	lf	%f1, 2(%i6)
	fma	%f5, %f2, %f1, %f3
	movui	%i31, 262144
	mif	%f2, %i31
	lf	%f1, 0(%i6)
	fmul	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	lf	%f1, 0(%i29)
	fsub	%f4, %f2, %f1
	movui	%i31, 262144
	mif	%f2, %i31
	lf	%f1, 1(%i6)
	fmul	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	lf	%f1, 1(%i29)
	fsub	%f3, %f2, %f1
	movui	%i31, 262144
	mif	%f2, %i31
	lf	%f1, 2(%i6)
	fmul	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	lf	%f1, 2(%i29)
	fsub	%f2, %f2, %f1
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i7, 3
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70219:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70220
	jzero	%i0, %i0, ca_done.70221
ca_cont.70220:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70219
	jmp	%i0, 0(%i31)
ca_done.70221:
	mov	%i5, %i4
	sf	%f4, 0(%i7)
	sf	%f3, 1(%i7)
	sf	%f2, 2(%i7)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i6, %i4, 1
	mov	%i4, %i7
	subi	%i1, %i1, 24
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sf	%f6, 4(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lf	%f6, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f6, 4(%i4)
	sw	%i5, 2(%i4)
	sw	%i7, 1(%i4)
	sw	%i9, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i21, %i4
	sw	%i5, 0(%i31)
	addi	%i4, %i8, 1
	sw	%i4, 0(%i20)
cont.70218:
	jzero	%i0, %i0, cont.70217
then.70216:
	slli	%i8, %i7, 2
	lw	%i7, 0(%i20)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i10)
	fsub	%f8, %f2, %f1
	lf	%f1, 0(%i29)
	fneg	%f7, %f1
	lf	%f1, 1(%i29)
	fneg	%f6, %f1
	lf	%f1, 2(%i29)
	fneg	%f5, %f1
	addi	%i10, %i8, 1
	lf	%f2, 0(%i29)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i9, 3
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i9
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70222:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70223
	jzero	%i0, %i0, ca_done.70224
ca_cont.70223:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70222
	jmp	%i0, 0(%i31)
ca_done.70224:
	mov	%i5, %i4
	sf	%f2, 0(%i9)
	sf	%f6, 1(%i9)
	sf	%f5, 2(%i9)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i6, %i4, 1
	mov	%i4, %i9
	subi	%i1, %i1, 32
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sw	%i10, 4(%i1)
	sf	%f5, 5(%i1)
	sf	%f6, 6(%i1)
	sf	%f7, 7(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lw	%i10, 4(%i1)
	lf	%f5, 5(%i1)
	lf	%f6, 6(%i1)
	lf	%f7, 7(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f8, 4(%i4)
	sw	%i5, 2(%i4)
	sw	%i9, 1(%i4)
	sw	%i10, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i7, 2
	add	%i31, %i21, %i4
	sw	%i5, 0(%i31)
	addi	%i11, %i7, 1
	addi	%i10, %i8, 2
	lf	%f2, 1(%i29)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i9, 3
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i9
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70225:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70226
	jzero	%i0, %i0, ca_done.70227
ca_cont.70226:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70225
	jmp	%i0, 0(%i31)
ca_done.70227:
	mov	%i5, %i4
	sf	%f7, 0(%i9)
	sf	%f2, 1(%i9)
	sf	%f5, 2(%i9)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i6, %i4, 1
	mov	%i4, %i9
	subi	%i1, %i1, 32
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sw	%i10, 4(%i1)
	sw	%i11, 5(%i1)
	sf	%f6, 6(%i1)
	sf	%f7, 7(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lw	%i10, 4(%i1)
	lw	%i11, 5(%i1)
	lf	%f6, 6(%i1)
	lf	%f7, 7(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f8, 4(%i4)
	sw	%i5, 2(%i4)
	sw	%i9, 1(%i4)
	sw	%i10, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i11, 2
	add	%i31, %i21, %i4
	sw	%i5, 0(%i31)
	addi	%i10, %i7, 2
	addi	%i9, %i8, 3
	lf	%f2, 2(%i29)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i8, 3
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i8
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70228:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70229
	jzero	%i0, %i0, ca_done.70230
ca_cont.70229:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70228
	jmp	%i0, 0(%i31)
ca_done.70230:
	mov	%i5, %i4
	sf	%f7, 0(%i8)
	sf	%f6, 1(%i8)
	sf	%f2, 2(%i8)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i6, %i4, 1
	mov	%i4, %i8
	subi	%i1, %i1, 24
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sw	%i10, 4(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lw	%i10, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f8, 4(%i4)
	sw	%i5, 2(%i4)
	sw	%i8, 1(%i4)
	sw	%i9, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i10, 2
	add	%i31, %i21, %i4
	sw	%i5, 0(%i31)
	addi	%i4, %i7, 3
	sw	%i4, 0(%i20)
cont.70217:
cont.70215:
cont.70214:
cont.70213:
	lf	%f2, 0(%i26)
	sf	%f2, 532(%i0)
	lw	%i4, 1(%i27)
	sw	%i4, 534(%i0)
	sub	%i4, %i0, %i4
	sw	%i4, 535(%i0)
	itof	%f1, %i4
	sf	%f1, 536(%i0)
	fmul	%f3, %f2, %f1
	sf	%f3, 537(%i0)
	lf	%f1, 0(%i25)
	sf	%f1, 539(%i0)
	fmul	%f2, %f3, %f1
	sf	%f2, 540(%i0)
	lf	%f1, 0(%i24)
	sf	%f1, 542(%i0)
	fadd	%f5, %f2, %f1
	sf	%f5, 543(%i0)
	lf	%f1, 1(%i25)
	sf	%f1, 545(%i0)
	fmul	%f2, %f3, %f1
	sf	%f2, 546(%i0)
	lf	%f1, 1(%i24)
	sf	%f1, 548(%i0)
	fadd	%f4, %f2, %f1
	sf	%f4, 549(%i0)
	lf	%f1, 2(%i25)
	sf	%f1, 551(%i0)
	fmul	%f2, %f3, %f1
	sf	%f2, 552(%i0)
	lf	%f1, 2(%i24)
	sf	%f1, 554(%i0)
	fadd	%f3, %f2, %f1
	sf	%f3, 555(%i0)
	lw	%i4, 0(%i28)
	sw	%i4, 557(%i0)
	subi	%i5, %i4, 1
	sw	%i5, 559(%i0)
	mov	%i4, %i17
	mov	%i6, %i0
	fmov	%f1, %f5
	fmov	%f2, %f4
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, pretrace_pixels.3119
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	movi	%i8, 2
	sw	%i8, 561(%i0)
	mov	%i4, %i0
	mov	%i5, %i18
	mov	%i6, %i17
	lw	%i31, 1(%i1)
	mov	%i7, %i31
	mov	%i9, %i19
	set_label	%i31, scan_line.3137
	jmp	%i3, 0(%i31)
fin:
	set_label	%i31, fin
	jmp	%i0, 0(%i31)
read_int_helper.2574:
	mov	%i8, %i4
	movi	%i6, 48
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70231
	mov	%i30, %i8
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.70231:
	movi	%i31, 57
	jleq	%i7, %i31, then.70232
	mov	%i30, %i8
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.70232:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i4, %i5, %i4
	mov	%i8, %i4
loop_start.67445:
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70234
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	set_label	%i31, loop_start.67445
	jmp	%i0, 0(%i31)
then.70234:
	movi	%i31, 57
	jleq	%i7, %i31, then.70236
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70237
then.70236:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70238
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70239
then.70238:
	movi	%i31, 57
	jleq	%i7, %i31, then.70240
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70241
then.70240:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70242
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70243
then.70242:
	movi	%i31, 57
	jleq	%i7, %i31, then.70244
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70245
then.70244:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70246
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70247
then.70246:
	movi	%i31, 57
	jleq	%i7, %i31, then.70248
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70249
then.70248:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70250
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70251
then.70250:
	movi	%i31, 57
	jleq	%i7, %i31, then.70252
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70253
then.70252:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70254
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70255
then.70254:
	movi	%i31, 57
	jleq	%i7, %i31, then.70256
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70257
then.70256:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70258
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70259
then.70258:
	movi	%i31, 57
	jleq	%i7, %i31, then.70260
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70261
then.70260:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70262
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70263
then.70262:
	movi	%i31, 57
	jleq	%i7, %i31, then.70264
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70265
then.70264:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70266
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70267
then.70266:
	movi	%i31, 57
	jleq	%i7, %i31, then.70268
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70269
then.70268:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70270
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70271
then.70270:
	movi	%i31, 57
	jleq	%i7, %i31, then.70272
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70273
then.70272:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70274
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70275
then.70274:
	movi	%i31, 57
	jleq	%i7, %i31, then.70276
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70277
then.70276:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70278
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70279
then.70278:
	movi	%i31, 57
	jleq	%i7, %i31, then.70280
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70281
then.70280:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70282
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70283
then.70282:
	movi	%i31, 57
	jleq	%i7, %i31, then.70284
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70285
then.70284:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70286
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70287
then.70286:
	movi	%i31, 57
	jleq	%i7, %i31, then.70288
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70289
then.70288:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70290
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70291
then.70290:
	movi	%i31, 57
	jleq	%i7, %i31, then.70292
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70293
then.70292:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70294
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70295
then.70294:
	movi	%i31, 57
	jleq	%i7, %i31, then.70296
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67446
	jzero	%i0, %i0, cont.70297
then.70296:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i4, %i5, %i4
	mov	%i8, %i4
cont.70297:
cont.70295:
cont.70293:
cont.70291:
cont.70289:
cont.70287:
cont.70285:
cont.70283:
cont.70281:
cont.70279:
cont.70277:
cont.70275:
cont.70273:
cont.70271:
cont.70269:
cont.70267:
cont.70265:
cont.70263:
cont.70261:
cont.70259:
cont.70257:
cont.70255:
cont.70253:
cont.70251:
cont.70249:
cont.70247:
cont.70245:
cont.70243:
cont.70241:
cont.70239:
cont.70237:
cont.70235:
	set_label	%i30, loop_start.67445
	jmp	%i0, 0(%i30)
loop_end.67446:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	jmp	%i0, 0(%i3)
read_int.2576:
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70298
	subi	%i8, %i4, 48
	movi	%i6, 48
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70299
	mov	%i30, %i8
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.70299:
	movi	%i31, 57
	jleq	%i7, %i31, then.70300
	mov	%i30, %i8
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.70300:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i4, %i5, %i4
	mov	%i8, %i4
loop_start.67449:
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70302
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	set_label	%i31, loop_start.67449
	jmp	%i0, 0(%i31)
then.70302:
	movi	%i31, 57
	jleq	%i7, %i31, then.70304
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70305
then.70304:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70306
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70307
then.70306:
	movi	%i31, 57
	jleq	%i7, %i31, then.70308
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70309
then.70308:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70310
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70311
then.70310:
	movi	%i31, 57
	jleq	%i7, %i31, then.70312
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70313
then.70312:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70314
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70315
then.70314:
	movi	%i31, 57
	jleq	%i7, %i31, then.70316
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70317
then.70316:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70318
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70319
then.70318:
	movi	%i31, 57
	jleq	%i7, %i31, then.70320
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70321
then.70320:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70322
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70323
then.70322:
	movi	%i31, 57
	jleq	%i7, %i31, then.70324
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70325
then.70324:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70326
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70327
then.70326:
	movi	%i31, 57
	jleq	%i7, %i31, then.70328
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70329
then.70328:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70330
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70331
then.70330:
	movi	%i31, 57
	jleq	%i7, %i31, then.70332
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70333
then.70332:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70334
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70335
then.70334:
	movi	%i31, 57
	jleq	%i7, %i31, then.70336
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70337
then.70336:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70338
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70339
then.70338:
	movi	%i31, 57
	jleq	%i7, %i31, then.70340
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70341
then.70340:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70342
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70343
then.70342:
	movi	%i31, 57
	jleq	%i7, %i31, then.70344
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70345
then.70344:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70346
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70347
then.70346:
	movi	%i31, 57
	jleq	%i7, %i31, then.70348
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70349
then.70348:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70350
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70351
then.70350:
	movi	%i31, 57
	jleq	%i7, %i31, then.70352
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70353
then.70352:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70354
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70355
then.70354:
	movi	%i31, 57
	jleq	%i7, %i31, then.70356
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70357
then.70356:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70358
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70359
then.70358:
	movi	%i31, 57
	jleq	%i7, %i31, then.70360
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70361
then.70360:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70362
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70363
then.70362:
	movi	%i31, 57
	jleq	%i7, %i31, then.70364
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67450
	jzero	%i0, %i0, cont.70365
then.70364:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i4, %i5, %i4
	mov	%i8, %i4
cont.70365:
cont.70363:
cont.70361:
cont.70359:
cont.70357:
cont.70355:
cont.70353:
cont.70351:
cont.70349:
cont.70347:
cont.70345:
cont.70343:
cont.70341:
cont.70339:
cont.70337:
cont.70335:
cont.70333:
cont.70331:
cont.70329:
cont.70327:
cont.70325:
cont.70323:
cont.70321:
cont.70319:
cont.70317:
cont.70315:
cont.70313:
cont.70311:
cont.70309:
cont.70307:
cont.70305:
cont.70303:
	set_label	%i30, loop_start.67449
	jmp	%i0, 0(%i30)
loop_end.67450:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	jmp	%i0, 0(%i3)
then.70298:
	mov	%i8, %i0
	movi	%i6, 48
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70366
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70367
then.70366:
	movi	%i31, 57
	jleq	%i7, %i31, then.70368
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70369
then.70368:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i4, %i5, %i4
	mov	%i8, %i4
loop_start.67453:
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70371
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	set_label	%i31, loop_start.67453
	jmp	%i0, 0(%i31)
then.70371:
	movi	%i31, 57
	jleq	%i7, %i31, then.70373
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70374
then.70373:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70375
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70376
then.70375:
	movi	%i31, 57
	jleq	%i7, %i31, then.70377
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70378
then.70377:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70379
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70380
then.70379:
	movi	%i31, 57
	jleq	%i7, %i31, then.70381
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70382
then.70381:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70383
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70384
then.70383:
	movi	%i31, 57
	jleq	%i7, %i31, then.70385
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70386
then.70385:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70387
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70388
then.70387:
	movi	%i31, 57
	jleq	%i7, %i31, then.70389
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70390
then.70389:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70391
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70392
then.70391:
	movi	%i31, 57
	jleq	%i7, %i31, then.70393
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70394
then.70393:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70395
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70396
then.70395:
	movi	%i31, 57
	jleq	%i7, %i31, then.70397
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70398
then.70397:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70399
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70400
then.70399:
	movi	%i31, 57
	jleq	%i7, %i31, then.70401
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70402
then.70401:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70403
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70404
then.70403:
	movi	%i31, 57
	jleq	%i7, %i31, then.70405
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70406
then.70405:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70407
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70408
then.70407:
	movi	%i31, 57
	jleq	%i7, %i31, then.70409
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70410
then.70409:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70411
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70412
then.70411:
	movi	%i31, 57
	jleq	%i7, %i31, then.70413
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70414
then.70413:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70415
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70416
then.70415:
	movi	%i31, 57
	jleq	%i7, %i31, then.70417
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70418
then.70417:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70419
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70420
then.70419:
	movi	%i31, 57
	jleq	%i7, %i31, then.70421
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70422
then.70421:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70423
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70424
then.70423:
	movi	%i31, 57
	jleq	%i7, %i31, then.70425
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70426
then.70425:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70427
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70428
then.70427:
	movi	%i31, 57
	jleq	%i7, %i31, then.70429
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70430
then.70429:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i8, %i5, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i7, %i4
	jleq	%i6, %i7, then.70431
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70432
then.70431:
	movi	%i31, 57
	jleq	%i7, %i31, then.70433
	mov	%i31, %i8
	jzero	%i0, %i0, loop_end.67454
	jzero	%i0, %i0, cont.70434
then.70433:
	slli	%i5, %i8, 3
	slli	%i4, %i8, 1
	add	%i5, %i5, %i4
	subi	%i4, %i7, 48
	add	%i4, %i5, %i4
	mov	%i8, %i4
cont.70434:
cont.70432:
cont.70430:
cont.70428:
cont.70426:
cont.70424:
cont.70422:
cont.70420:
cont.70418:
cont.70416:
cont.70414:
cont.70412:
cont.70410:
cont.70408:
cont.70406:
cont.70404:
cont.70402:
cont.70400:
cont.70398:
cont.70396:
cont.70394:
cont.70392:
cont.70390:
cont.70388:
cont.70386:
cont.70384:
cont.70382:
cont.70380:
cont.70378:
cont.70376:
cont.70374:
cont.70372:
	set_label	%i30, loop_start.67453
	jmp	%i0, 0(%i30)
loop_end.67454:
	mov	%i4, %i31
cont.70369:
cont.70367:
	sub	%i4, %i0, %i4
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
read_float_helper.2578:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70435
	movi	%i31, 45
	jeq	%i5, %i31, then.70436
	movi	%i4, 48
	jleq	%i4, %i5, then.70437
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70437:
	movi	%i31, 57
	jleq	%i5, %i31, then.70438
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70438:
	fleq	%i31, %f2, %f0
	jzero	%i0, %i31, else.70439
	movui	%i31, 266752
	mif	%f3, %i31
	fmul	%f3, %f1, %f3
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f4, %f3, %f1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70440
	movi	%i31, 45
	jeq	%i5, %i31, then.70441
	movi	%i4, 48
	jleq	%i4, %i5, then.70442
	mov	%i30, %i4
	fmov	%f30, %f4
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70442:
	movi	%i31, 57
	jleq	%i5, %i31, then.70443
	mov	%i30, %i4
	fmov	%f30, %f4
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70443:
	fleq	%i31, %f2, %f0
	jzero	%i0, %i31, else.70444
	movui	%i31, 266752
	mif	%f1, %i31
	fmul	%f3, %f4, %f1
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f3, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	set_label	%i31, read_float_helper.2578
	jmp	%i0, 0(%i31)
else.70444:
	subi	%i4, %i5, 48
	itof	%f3, %i4
	finv	%f1, %f2
	fma	%f3, %f3, %f1, %f4
	movui	%i31, 266752
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	fmov	%f1, %f3
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	set_label	%i31, read_float_helper.2578
	jmp	%i0, 0(%i31)
then.70441:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f1, %f1
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70440:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f4
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	set_label	%i31, read_float_helper.2578
	jmp	%i0, 0(%i31)
else.70439:
	subi	%i4, %i5, 48
	itof	%f4, %i4
	finv	%f3, %f2
	fma	%f3, %f4, %f3, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	fmul	%f4, %f2, %f1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70445
	movi	%i31, 45
	jeq	%i5, %i31, then.70446
	movi	%i4, 48
	jleq	%i4, %i5, then.70447
	mov	%i30, %i4
	fmov	%f30, %f3
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70447:
	movi	%i31, 57
	jleq	%i5, %i31, then.70448
	mov	%i30, %i4
	fmov	%f30, %f3
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70448:
	fleq	%i31, %f4, %f0
	jzero	%i0, %i31, else.70449
	movui	%i31, 266752
	mif	%f1, %i31
	fmul	%f2, %f3, %f1
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f2, %f1
	fmov	%f2, %f4
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	set_label	%i31, read_float_helper.2578
	jmp	%i0, 0(%i31)
else.70449:
	subi	%i4, %i5, 48
	itof	%f2, %i4
	finv	%f1, %f4
	fma	%f3, %f2, %f1, %f3
	movui	%i31, 266752
	mif	%f1, %i31
	fmul	%f2, %f4, %f1
	fmov	%f1, %f3
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	set_label	%i31, read_float_helper.2578
	jmp	%i0, 0(%i31)
then.70446:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f1, %f1
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70445:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f3
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	set_label	%i31, read_float_helper.2578
	jmp	%i0, 0(%i31)
then.70436:
	movui	%i31, 784384
	mif	%f2, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70450
	movi	%i31, 45
	jeq	%i5, %i31, then.70452
	movi	%i4, 48
	jleq	%i4, %i5, then.70454
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70451
then.70454:
	movi	%i31, 57
	jleq	%i5, %i31, then.70456
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70457
then.70456:
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f0, %f1
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70457:
cont.70455:
	jzero	%i0, %i0, cont.70451
then.70452:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f1, %f1
cont.70453:
	jzero	%i0, %i0, cont.70451
then.70450:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70451:
	fneg	%f1, %f1
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70435:
	movui	%i31, 266752
	mif	%f3, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70458
	movi	%i31, 45
	jeq	%i5, %i31, then.70459
	movi	%i4, 48
	jleq	%i4, %i5, then.70460
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70460:
	movi	%i31, 57
	jleq	%i5, %i31, then.70461
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70461:
	subi	%i4, %i5, 48
	itof	%f2, %i4
	finv	%f3, %f3
	fma	%f1, %f2, %f3, %f1
	movui	%i31, 273536
	mif	%f2, %i31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	set_label	%i31, read_float_helper.2578
	jmp	%i0, 0(%i31)
then.70459:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f1, %f1
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70458:
	movui	%i31, 266752
	mif	%f2, %i31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	set_label	%i31, read_float_helper.2578
	jmp	%i0, 0(%i31)
rotate_quadratic_matrix.2850:
	lf	%f2, 0(%i5)
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f2
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70462
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70464
	fmul	%f4, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f14, %f1, %f2
	jzero	%i0, %i0, cont.70463
else.70464:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70466
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70468
	fmov	%f3, %f2
	jzero	%i0, %i0, cont.70469
else.70468:
	lf	%f1, 0(%i0)
	fsub	%f3, %f1, %f2
cont.70469:
	fmul	%f2, %f3, %f3
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f1, %f1, %f2
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f4, %i31
	fadd	%f1, %f1, %f4
	fmul	%f4, %f1, %f2
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f2, %f1, %f2
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f14, %f1, %f3
	jzero	%i0, %i0, cont.70467
else.70466:
	lf	%f1, 3(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f14, %f1, %f4
cont.70467:
cont.70465:
	jzero	%i0, %i0, cont.70463
else.70462:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70470
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70472
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70473
else.70472:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70473:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f14, %f1, %f4
	jzero	%i0, %i0, cont.70471
else.70470:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f14, %f1, %f4
cont.70471:
cont.70463:
	lf	%f2, 0(%i5)
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70474
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70476
	fmul	%f4, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f5, %f1, %f2
	jzero	%i0, %i0, cont.70475
else.70476:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70478
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70480
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70481
else.70480:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70481:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f5, %f1, %f4
	jzero	%i0, %i0, cont.70479
else.70478:
	lf	%f1, 3(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f5, %f1, %f4
cont.70479:
cont.70477:
	jzero	%i0, %i0, cont.70475
else.70474:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70482
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70484
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70485
else.70484:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70485:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f5, %f1, %f4
	jzero	%i0, %i0, cont.70483
else.70482:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f5, %f1, %f4
cont.70483:
cont.70475:
	lf	%f2, 1(%i5)
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f2
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70486
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70488
	fmul	%f4, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f13, %f1, %f2
	jzero	%i0, %i0, cont.70487
else.70488:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70490
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70492
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70493
else.70492:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70493:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f13, %f1, %f4
	jzero	%i0, %i0, cont.70491
else.70490:
	lf	%f1, 3(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f13, %f1, %f4
cont.70491:
cont.70489:
	jzero	%i0, %i0, cont.70487
else.70486:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70494
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70496
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70497
else.70496:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70497:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f13, %f1, %f4
	jzero	%i0, %i0, cont.70495
else.70494:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f13, %f1, %f4
cont.70495:
cont.70487:
	lf	%f2, 1(%i5)
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70498
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70500
	fmul	%f4, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f4, %f1, %f2
	jzero	%i0, %i0, cont.70499
else.70500:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70502
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70504
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70505
else.70504:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70505:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f4, %f1, %f4
	jzero	%i0, %i0, cont.70503
else.70502:
	lf	%f1, 3(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f4, %f1, %f4
cont.70503:
cont.70501:
	jzero	%i0, %i0, cont.70499
else.70498:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70506
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70508
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70509
else.70508:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70509:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f4, %f1, %f4
	jzero	%i0, %i0, cont.70507
else.70506:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f4, %f1, %f4
cont.70507:
cont.70499:
	lf	%f2, 2(%i5)
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f2
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70510
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70512
	fmul	%f6, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f2
	jzero	%i0, %i0, cont.70511
else.70512:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70514
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70516
	fmov	%f6, %f2
	jzero	%i0, %i0, cont.70517
else.70516:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
cont.70517:
	fmul	%f3, %f6, %f6
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f3, %f1, %f6
	jzero	%i0, %i0, cont.70515
else.70514:
	lf	%f1, 3(%i0)
	fsub	%f6, %f1, %f2
	fmul	%f3, %f6, %f6
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f3, %f1, %f6
cont.70515:
cont.70513:
	jzero	%i0, %i0, cont.70511
else.70510:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70518
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70520
	fmov	%f6, %f2
	jzero	%i0, %i0, cont.70521
else.70520:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
cont.70521:
	fmul	%f3, %f6, %f6
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f3, %f1, %f6
	jzero	%i0, %i0, cont.70519
else.70518:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
	fmul	%f3, %f6, %f6
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f3, %f1, %f6
cont.70519:
cont.70511:
	lf	%f2, 2(%i5)
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70522
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70524
	fmul	%f7, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f6, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f7, %f1, %f2
	jzero	%i0, %i0, cont.70523
else.70524:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70526
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70528
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.70529
else.70528:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.70529:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f7
	jzero	%i0, %i0, cont.70527
else.70526:
	lf	%f1, 3(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f7
cont.70527:
cont.70525:
	jzero	%i0, %i0, cont.70523
else.70522:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70530
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70532
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.70533
else.70532:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.70533:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f7
	jzero	%i0, %i0, cont.70531
else.70530:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f7
cont.70531:
cont.70523:
	fmul	%f12, %f13, %f3
	fmul	%f6, %f5, %f4
	fmul	%f2, %f6, %f3
	fmul	%f1, %f14, %f7
	fsub	%f11, %f2, %f1
	fmul	%f2, %f14, %f4
	fmul	%f1, %f2, %f3
	fma	%f10, %f5, %f7, %f1
	fmul	%f9, %f13, %f7
	fmul	%f1, %f6, %f7
	fma	%f8, %f14, %f3, %f1
	fmul	%f2, %f2, %f7
	fmul	%f1, %f5, %f3
	fsub	%f7, %f2, %f1
	fneg	%f6, %f4
	fmul	%f5, %f5, %f13
	fmul	%f4, %f14, %f13
	lf	%f3, 0(%i4)
	lf	%f2, 1(%i4)
	lf	%f1, 2(%i4)
	fmul	%f13, %f12, %f12
	fmul	%f14, %f3, %f13
	fmul	%f13, %f9, %f9
	fma	%f14, %f2, %f13, %f14
	fmul	%f13, %f6, %f6
	fma	%f13, %f1, %f13, %f14
	sf	%f13, 0(%i4)
	fmul	%f13, %f11, %f11
	fmul	%f14, %f3, %f13
	fmul	%f13, %f8, %f8
	fma	%f14, %f2, %f13, %f14
	fmul	%f13, %f5, %f5
	fma	%f13, %f1, %f13, %f14
	sf	%f13, 1(%i4)
	fmul	%f13, %f10, %f10
	fmul	%f14, %f3, %f13
	fmul	%f13, %f7, %f7
	fma	%f14, %f2, %f13, %f14
	fmul	%f13, %f4, %f4
	fma	%f13, %f1, %f13, %f14
	sf	%f13, 2(%i4)
	movui	%i31, 262144
	mif	%f15, %i31
	fmul	%f13, %f3, %f11
	fmul	%f14, %f13, %f10
	fmul	%f13, %f2, %f8
	fma	%f14, %f13, %f7, %f14
	fmul	%f13, %f1, %f5
	fma	%f13, %f13, %f4, %f14
	fmul	%f13, %f15, %f13
	sf	%f13, 0(%i5)
	movui	%i31, 262144
	mif	%f13, %i31
	fmul	%f12, %f3, %f12
	fmul	%f3, %f12, %f10
	fmul	%f9, %f2, %f9
	fma	%f2, %f9, %f7, %f3
	fmul	%f3, %f1, %f6
	fma	%f1, %f3, %f4, %f2
	fmul	%f1, %f13, %f1
	sf	%f1, 1(%i5)
	movui	%i31, 262144
	mif	%f2, %i31
	fmul	%f1, %f12, %f11
	fma	%f1, %f9, %f8, %f1
	fma	%f1, %f3, %f5, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 2(%i5)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
read_nth_object.2853:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i20, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70535
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	jzero	%i0, %i0, cont.70536
then.70535:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i19, %i0, %i30
cont.70536:
	movi	%i31, -1
	jeq	%i19, %i31, then.70537
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70538
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.70539
then.70538:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.70539:
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70540
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i25, %i30
	jzero	%i0, %i0, cont.70541
then.70540:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i25, %i0, %i30
cont.70541:
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70542
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	jzero	%i0, %i0, cont.70543
then.70542:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i17, %i0, %i30
cont.70543:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i16, %i5
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 0(%i16)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 1(%i16)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 2(%i16)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i24, 3
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 0(%i24)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 1(%i24)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 2(%i24)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	flt	%i23, %f1, %f0
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	addi	%i2, %i2, 8
	movi	%i22, 2
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 0(%i22)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 1(%i22)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i21, 3
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 0(%i21)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 1(%i21)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	sf	%f30, 2(%i21)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	jeq	%i17, %i0, cont.70544
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f2, %f30
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	sf	%f1, 0(%i6)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f2, %f30
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i6)
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f2, %f30
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	sf	%f1, 2(%i6)
cont.70544:
	movi	%i31, 2
	jeq	%i18, %i31, then.70545
	mov	%i7, %i23
	jzero	%i0, %i0, cont.70546
then.70545:
	movi	%i7, 1
cont.70546:
	movi	%i5, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	sf	%f1, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i2
	addi	%i2, %i2, 48
	sw	%i5, 10(%i4)
	sw	%i6, 9(%i4)
	sw	%i21, 8(%i4)
	sw	%i22, 7(%i4)
	sw	%i7, 6(%i4)
	sw	%i24, 5(%i4)
	sw	%i16, 4(%i4)
	sw	%i17, 3(%i4)
	sw	%i25, 2(%i4)
	sw	%i18, 1(%i4)
	sw	%i19, 0(%i4)
	mov	%i7, %i4
	slli	%i5, %i20, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	sw	%i7, 0(%i31)
	movi	%i31, 3
	jeq	%i18, %i31, then.70547
	ceqi	%i31, %i18, 2
	jzero	%i0, %i31, cont.70549
	ceqi	%i5, %i23, 0
	lf	%f1, 0(%i16)
	fmul	%f2, %f1, %f1
	lf	%f1, 1(%i16)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i16)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70550
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.70551
then.70550:
	jeq	%i5, %i0, then.70552
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.70553
then.70552:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.70553:
cont.70551:
	lf	%f1, 0(%i16)
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i16)
	lf	%f1, 1(%i16)
	fmul	%f1, %f1, %f2
	sf	%f1, 1(%i16)
	lf	%f1, 2(%i16)
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i16)
cont.70549:
	jzero	%i0, %i0, cont.70548
then.70547:
	lf	%f3, 0(%i16)
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.70554
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70555
then.70554:
	jeq	%i4, %i0, then.70556
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70557
then.70556:
	flt	%i4, %f0, %f3
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmov	%f2, %f1
cont.70557:
	fmul	%f1, %f3, %f3
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
cont.70555:
	sf	%f1, 0(%i16)
	lf	%f3, 1(%i16)
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.70558
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70559
then.70558:
	jeq	%i4, %i0, then.70560
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70561
then.70560:
	flt	%i4, %f0, %f3
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmov	%f2, %f1
cont.70561:
	fmul	%f1, %f3, %f3
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
cont.70559:
	sf	%f1, 1(%i16)
	lf	%f3, 2(%i16)
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.70562
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70563
then.70562:
	jeq	%i4, %i0, then.70564
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70565
then.70564:
	flt	%i4, %f0, %f3
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmov	%f2, %f1
cont.70565:
	fmul	%f1, %f3, %f3
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
cont.70563:
	sf	%f1, 2(%i16)
cont.70548:
	jeq	%i17, %i0, cont.70566
	mov	%i4, %i16
	mov	%i5, %i6
	set_label	%i31, rotate_quadratic_matrix.2850
	jmp	%i3, 0(%i31)
cont.70566:
	movi	%i4, 1
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70537:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
read_object.2855:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	movi	%i16, 60
	jleq	%i16, %i4, then.70567
	subi	%i1, %i1, 8
	sw	%i4, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i4, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	jeq	%i5, %i0, then.70568
	addi	%i4, %i4, 1
loop_start.67507:
	jleq	%i16, %i4, then.70570
	subi	%i1, %i1, 8
	sw	%i4, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i4, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	jeq	%i5, %i0, then.70572
	addi	%i6, %i4, 1
	jleq	%i16, %i6, then.70574
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70576
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70578
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70580
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70582
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70584
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70586
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70588
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70590
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70592
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70594
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70596
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70598
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70600
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70602
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70604
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70606
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70608
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70610
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70612
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70614
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70616
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70618
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70620
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70622
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70624
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70626
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70628
	addi	%i6, %i6, 1
	jleq	%i16, %i6, then.70630
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	set_label	%i31, read_nth_object.2853
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.70632
	addi	%i4, %i6, 1
	set_label	%i31, loop_start.67507
	jmp	%i0, 0(%i31)
then.70632:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70630:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70628:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70626:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70624:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70622:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70620:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70618:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70616:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70614:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70612:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70610:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70608:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70606:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70604:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70602:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70600:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70598:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70596:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70594:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70592:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70590:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70588:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70586:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70584:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70582:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70580:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70578:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70576:
	lw	%i4, 6(%i0)
	sw	%i6, 0(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70574:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70572:
	lw	%i5, 6(%i0)
	sw	%i4, 0(%i5)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
then.70570:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67508
loop_end.67508:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70568:
	lw	%i5, 6(%i0)
	sw	%i4, 0(%i5)
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70567:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
read_net_item.2859:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i26, %i4
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70636
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i25, %i30
	jzero	%i0, %i0, cont.70637
then.70636:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i25, %i0, %i30
cont.70637:
	movi	%i31, -1
	jeq	%i25, %i31, then.70638
	addi	%i24, %i26, 1
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i23, %i30
	movi	%i31, -1
	jeq	%i23, %i31, then.70639
	addi	%i22, %i24, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70641
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i21, %i30
	jzero	%i0, %i0, cont.70642
then.70641:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i21, %i0, %i30
cont.70642:
	movi	%i31, -1
	jeq	%i21, %i31, then.70643
	addi	%i20, %i22, 1
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.70645
	addi	%i18, %i20, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70647
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	jzero	%i0, %i0, cont.70648
then.70647:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i17, %i0, %i30
cont.70648:
	movi	%i31, -1
	jeq	%i17, %i31, then.70649
	addi	%i28, %i18, 1
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i16, %i30
	movi	%i31, -1
	jeq	%i16, %i31, then.70651
	addi	%i27, %i28, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70653
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i8, %i30
	jzero	%i0, %i0, cont.70654
then.70653:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i8, %i0, %i30
cont.70654:
	movi	%i31, -1
	jeq	%i8, %i31, then.70655
	addi	%i7, %i27, 1
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	sw	%i8, 1(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i8, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.70657
	addi	%i4, %i7, 1
	subi	%i1, %i1, 64
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i16, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	sw	%i22, 9(%i1)
	sw	%i23, 10(%i1)
	sw	%i24, 11(%i1)
	sw	%i25, 12(%i1)
	sw	%i26, 13(%i1)
	sw	%i27, 14(%i1)
	sw	%i28, 15(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i16, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	lw	%i22, 9(%i1)
	lw	%i23, 10(%i1)
	lw	%i24, 11(%i1)
	lw	%i25, 12(%i1)
	lw	%i26, 13(%i1)
	lw	%i27, 14(%i1)
	lw	%i28, 15(%i1)
	addi	%i1, %i1, 64
	mov	%i5, %i30
	slli	%i4, %i7, 2
	add	%i31, %i5, %i4
	sw	%i6, 0(%i31)
	jzero	%i0, %i0, cont.70658
then.70657:
	addi	%i4, %i7, 1
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70659:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70660
	jzero	%i0, %i0, ca_done.70661
ca_cont.70660:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70659
	jmp	%i0, 0(%i31)
ca_done.70661:
	mov	%i5, %i4
cont.70658:
	slli	%i4, %i27, 2
	add	%i31, %i5, %i4
	sw	%i8, 0(%i31)
	jzero	%i0, %i0, cont.70656
then.70655:
	addi	%i4, %i27, 1
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70662:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70663
	jzero	%i0, %i0, ca_done.70664
ca_cont.70663:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70662
	jmp	%i0, 0(%i31)
ca_done.70664:
	mov	%i5, %i4
cont.70656:
	slli	%i4, %i28, 2
	add	%i31, %i5, %i4
	sw	%i16, 0(%i31)
	jzero	%i0, %i0, cont.70652
then.70651:
	addi	%i4, %i28, 1
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70665:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70666
	jzero	%i0, %i0, ca_done.70667
ca_cont.70666:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70665
	jmp	%i0, 0(%i31)
ca_done.70667:
	mov	%i5, %i4
cont.70652:
	slli	%i4, %i18, 2
	add	%i31, %i5, %i4
	sw	%i17, 0(%i31)
	jzero	%i0, %i0, cont.70650
then.70649:
	addi	%i4, %i18, 1
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70668:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70669
	jzero	%i0, %i0, ca_done.70670
ca_cont.70669:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70668
	jmp	%i0, 0(%i31)
ca_done.70670:
	mov	%i5, %i4
cont.70650:
	slli	%i4, %i20, 2
	add	%i31, %i5, %i4
	sw	%i19, 0(%i31)
	jzero	%i0, %i0, cont.70646
then.70645:
	addi	%i4, %i20, 1
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70671:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70672
	jzero	%i0, %i0, ca_done.70673
ca_cont.70672:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70671
	jmp	%i0, 0(%i31)
ca_done.70673:
	mov	%i5, %i4
cont.70646:
	slli	%i4, %i22, 2
	add	%i31, %i5, %i4
	sw	%i21, 0(%i31)
	jzero	%i0, %i0, cont.70644
then.70643:
	addi	%i4, %i22, 1
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70674:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70675
	jzero	%i0, %i0, ca_done.70676
ca_cont.70675:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70674
	jmp	%i0, 0(%i31)
ca_done.70676:
	mov	%i5, %i4
cont.70644:
	slli	%i4, %i24, 2
	add	%i31, %i5, %i4
	sw	%i23, 0(%i31)
	jzero	%i0, %i0, cont.70640
then.70639:
	addi	%i4, %i24, 1
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70677:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70678
	jzero	%i0, %i0, ca_done.70679
ca_cont.70678:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70677
	jmp	%i0, 0(%i31)
ca_done.70679:
	mov	%i5, %i4
cont.70640:
	slli	%i4, %i26, 2
	add	%i31, %i5, %i4
	sw	%i25, 0(%i31)
	mov	%i30, %i5
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70638:
	addi	%i4, %i26, 1
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70680:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70681
	jzero	%i0, %i0, ca_done.70682
ca_cont.70681:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70680
	jmp	%i0, 0(%i31)
ca_done.70682:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
read_or_network.2861:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i22, %i4
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i16, %i30
	movi	%i31, -1
	jeq	%i16, %i31, then.70683
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70685
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.70686
then.70685:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.70686:
	movi	%i31, -1
	jeq	%i20, %i31, then.70687
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.70689
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70691
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.70692
then.70691:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.70692:
	movi	%i31, -1
	jeq	%i18, %i31, then.70693
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.70695
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70697
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.70698
then.70697:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.70698:
	movi	%i31, -1
	jeq	%i7, %i31, then.70699
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.70701
	movi	%i4, 7
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i22, 7(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i22, 7(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 6(%i4)
	jzero	%i0, %i0, cont.70702
then.70701:
	movi	%i4, 7
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70703:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70704
	jzero	%i0, %i0, ca_done.70705
ca_cont.70704:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70703
	jmp	%i0, 0(%i31)
ca_done.70705:
cont.70702:
	sw	%i7, 5(%i4)
	jzero	%i0, %i0, cont.70700
then.70699:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70706:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70707
	jzero	%i0, %i0, ca_done.70708
ca_cont.70707:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70706
	jmp	%i0, 0(%i31)
ca_done.70708:
cont.70700:
	sw	%i17, 4(%i4)
	jzero	%i0, %i0, cont.70696
then.70695:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.70696:
	sw	%i18, 3(%i4)
	jzero	%i0, %i0, cont.70694
then.70693:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.70694:
	sw	%i19, 2(%i4)
	jzero	%i0, %i0, cont.70690
then.70689:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.70690:
	sw	%i20, 1(%i4)
	jzero	%i0, %i0, cont.70688
then.70687:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.70688:
	sw	%i16, 0(%i4)
	mov	%i21, %i4
	jzero	%i0, %i0, cont.70684
then.70683:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i21, %i6
cont.70684:
	lw	%i4, 0(%i21)
	movi	%i31, -1
	jeq	%i4, %i31, then.70709
	addi	%i20, %i22, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70710
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i16, %i30
	jzero	%i0, %i0, cont.70711
then.70710:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i16, %i0, %i30
cont.70711:
	movi	%i31, -1
	jeq	%i16, %i31, then.70712
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.70714
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70716
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.70717
then.70716:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.70717:
	movi	%i31, -1
	jeq	%i18, %i31, then.70718
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.70720
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70722
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.70723
then.70722:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.70723:
	movi	%i31, -1
	jeq	%i7, %i31, then.70724
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.70726
	movi	%i4, 6
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	sw	%i22, 8(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	lw	%i22, 8(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.70727
then.70726:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70728:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70729
	jzero	%i0, %i0, ca_done.70730
ca_cont.70729:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70728
	jmp	%i0, 0(%i31)
ca_done.70730:
cont.70727:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.70725
then.70724:
	movi	%i4, 5
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
cont.70725:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.70721
then.70720:
	movi	%i4, 4
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
cont.70721:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.70719
then.70718:
	movi	%i4, 3
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
cont.70719:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.70715
then.70714:
	movi	%i4, 2
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
cont.70715:
	sw	%i16, 0(%i4)
	mov	%i19, %i4
	jzero	%i0, %i0, cont.70713
then.70712:
	movi	%i4, 1
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i19, %i4
cont.70713:
	lw	%i4, 0(%i19)
	movi	%i31, -1
	jeq	%i4, %i31, then.70731
	addi	%i18, %i20, 1
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i16, %i30
	movi	%i31, -1
	jeq	%i16, %i31, then.70733
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70735
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i23, %i30
	jzero	%i0, %i0, cont.70736
then.70735:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i23, %i0, %i30
cont.70736:
	movi	%i31, -1
	jeq	%i23, %i31, then.70737
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.70739
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70741
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.70742
then.70741:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.70742:
	movi	%i31, -1
	jeq	%i7, %i31, then.70743
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.70745
	movi	%i4, 5
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	sw	%i22, 8(%i1)
	sw	%i23, 9(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	lw	%i22, 8(%i1)
	lw	%i23, 9(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	sw	%i6, 4(%i4)
	jzero	%i0, %i0, cont.70746
then.70745:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.70746:
	sw	%i7, 3(%i4)
	jzero	%i0, %i0, cont.70744
then.70743:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.70744:
	sw	%i17, 2(%i4)
	jzero	%i0, %i0, cont.70740
then.70739:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.70740:
	sw	%i23, 1(%i4)
	jzero	%i0, %i0, cont.70738
then.70737:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.70738:
	sw	%i16, 0(%i4)
	mov	%i17, %i4
	jzero	%i0, %i0, cont.70734
then.70733:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i17, %i6
cont.70734:
	lw	%i4, 0(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.70747
	addi	%i16, %i18, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70749
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i24, %i30
	jzero	%i0, %i0, cont.70750
then.70749:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i24, %i0, %i30
cont.70750:
	movi	%i31, -1
	jeq	%i24, %i31, then.70751
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i23, %i30
	movi	%i31, -1
	jeq	%i23, %i31, then.70753
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70755
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.70756
then.70755:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.70756:
	movi	%i31, -1
	jeq	%i7, %i31, then.70757
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.70759
	movi	%i4, 4
	subi	%i1, %i1, 48
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	sw	%i22, 8(%i1)
	sw	%i23, 9(%i1)
	sw	%i24, 10(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	lw	%i22, 8(%i1)
	lw	%i23, 9(%i1)
	lw	%i24, 10(%i1)
	addi	%i1, %i1, 48
	mov	%i4, %i30
	sw	%i6, 3(%i4)
	jzero	%i0, %i0, cont.70760
then.70759:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.70760:
	sw	%i7, 2(%i4)
	jzero	%i0, %i0, cont.70758
then.70757:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.70758:
	sw	%i23, 1(%i4)
	jzero	%i0, %i0, cont.70754
then.70753:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.70754:
	sw	%i24, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.70752
then.70751:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.70752:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.70761
	addi	%i4, %i16, 1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	sw	%i20, 5(%i1)
	sw	%i21, 6(%i1)
	sw	%i22, 7(%i1)
	set_label	%i31, read_or_network.2861
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	lw	%i20, 5(%i1)
	lw	%i21, 6(%i1)
	lw	%i22, 7(%i1)
	addi	%i1, %i1, 32
	mov	%i5, %i30
	slli	%i4, %i16, 2
	add	%i31, %i5, %i4
	sw	%i6, 0(%i31)
	jzero	%i0, %i0, cont.70762
then.70761:
	addi	%i4, %i16, 1
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70763:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70764
	jzero	%i0, %i0, ca_done.70765
ca_cont.70764:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70763
	jmp	%i0, 0(%i31)
ca_done.70765:
	mov	%i5, %i4
cont.70762:
	slli	%i4, %i18, 2
	add	%i31, %i5, %i4
	sw	%i17, 0(%i31)
	jzero	%i0, %i0, cont.70748
then.70747:
	addi	%i4, %i18, 1
	mov	%i5, %i17
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70766:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70767
	jzero	%i0, %i0, ca_done.70768
ca_cont.70767:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70766
	jmp	%i0, 0(%i31)
ca_done.70768:
	mov	%i5, %i4
cont.70748:
	slli	%i4, %i20, 2
	add	%i31, %i5, %i4
	sw	%i19, 0(%i31)
	jzero	%i0, %i0, cont.70732
then.70731:
	addi	%i4, %i20, 1
	mov	%i5, %i19
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70769:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70770
	jzero	%i0, %i0, ca_done.70771
ca_cont.70770:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70769
	jmp	%i0, 0(%i31)
ca_done.70771:
	mov	%i5, %i4
cont.70732:
	slli	%i4, %i22, 2
	add	%i31, %i5, %i4
	sw	%i21, 0(%i31)
	mov	%i30, %i5
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.70709:
	addi	%i4, %i22, 1
	mov	%i5, %i21
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70772:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70773
	jzero	%i0, %i0, ca_done.70774
ca_cont.70773:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70772
	jmp	%i0, 0(%i31)
ca_done.70774:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
read_parameter.2865:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	movui	%i31, 784384
	mif	%f2, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70775
	movi	%i31, 45
	jeq	%i5, %i31, then.70777
	movi	%i4, 48
	jleq	%i4, %i5, then.70779
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70776
then.70779:
	movi	%i31, 57
	jleq	%i5, %i31, then.70781
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70782
then.70781:
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f0, %f1
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70782:
cont.70780:
	jzero	%i0, %i0, cont.70776
then.70777:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f1, %f1
cont.70778:
	jzero	%i0, %i0, cont.70776
then.70775:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70776:
	lw	%i4, 77(%i0)
	sf	%f1, 0(%i4)
	movui	%i31, 784384
	mif	%f2, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70783
	movi	%i31, 45
	jeq	%i5, %i31, then.70785
	movi	%i4, 48
	jleq	%i4, %i5, then.70787
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70784
then.70787:
	movi	%i31, 57
	jleq	%i5, %i31, then.70789
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70790
then.70789:
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f0, %f1
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70790:
cont.70788:
	jzero	%i0, %i0, cont.70784
then.70785:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f1, %f1
cont.70786:
	jzero	%i0, %i0, cont.70784
then.70783:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70784:
	lw	%i4, 77(%i0)
	sf	%f1, 1(%i4)
	movui	%i31, 784384
	mif	%f2, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70791
	movi	%i31, 45
	jeq	%i5, %i31, then.70793
	movi	%i4, 48
	jleq	%i4, %i5, then.70795
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70792
then.70795:
	movi	%i31, 57
	jleq	%i5, %i31, then.70797
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70798
then.70797:
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f0, %f1
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70798:
cont.70796:
	jzero	%i0, %i0, cont.70792
then.70793:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f1, %f1
cont.70794:
	jzero	%i0, %i0, cont.70792
then.70791:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70792:
	lw	%i4, 77(%i0)
	sf	%f1, 2(%i4)
	movui	%i31, 784384
	mif	%f2, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70799
	movi	%i31, 45
	jeq	%i5, %i31, then.70801
	movi	%i4, 48
	jleq	%i4, %i5, then.70803
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70800
then.70803:
	movi	%i31, 57
	jleq	%i5, %i31, then.70805
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70806
then.70805:
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f0, %f1
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f2, %f30
cont.70806:
cont.70804:
	jzero	%i0, %i0, cont.70800
then.70801:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f2, %f1
cont.70802:
	jzero	%i0, %i0, cont.70800
then.70799:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f2, %f30
cont.70800:
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f3, %f2, %f1
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f3
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70807
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70809
	fmul	%f5, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f5, %f1, %f2
	jzero	%i0, %i0, cont.70808
else.70809:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70811
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70813
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70814
else.70813:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70814:
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f5, %f1, %f5
	jzero	%i0, %i0, cont.70812
else.70811:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f2
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f5, %f1, %f5
cont.70812:
cont.70810:
	jzero	%i0, %i0, cont.70808
else.70807:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70815
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70817
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70818
else.70817:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70818:
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f5, %f1, %f5
	jzero	%i0, %i0, cont.70816
else.70815:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f5, %f1, %f5
cont.70816:
cont.70808:
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.70819
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.70821
	fmul	%f4, %f3, %f3
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f4, %f1, %f3
	jzero	%i0, %i0, cont.70820
else.70821:
	lf	%f1, 3(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.70823
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f2, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70825
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70826
else.70825:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70826:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f4, %f1, %f4
	jzero	%i0, %i0, cont.70824
else.70823:
	lf	%f1, 3(%i0)
	fsub	%f4, %f1, %f3
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f4, %f1, %f4
cont.70824:
cont.70822:
	jzero	%i0, %i0, cont.70820
else.70819:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.70827
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f2, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70829
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70830
else.70829:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70830:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f4, %f1, %f4
	jzero	%i0, %i0, cont.70828
else.70827:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f3
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f4, %f1, %f4
cont.70828:
cont.70820:
	movui	%i31, 784384
	mif	%f2, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70831
	movi	%i31, 45
	jeq	%i5, %i31, then.70833
	movi	%i4, 48
	jleq	%i4, %i5, then.70835
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70832
then.70835:
	movi	%i31, 57
	jleq	%i5, %i31, then.70837
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70838
then.70837:
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f0, %f1
	subi	%i1, %i1, 8
	sf	%f4, 0(%i1)
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	lf	%f4, 0(%i1)
	addi	%i1, %i1, 8
	fmov	%f2, %f30
cont.70838:
cont.70836:
	jzero	%i0, %i0, cont.70832
then.70833:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	subi	%i1, %i1, 8
	sf	%f4, 0(%i1)
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	lf	%f4, 0(%i1)
	addi	%i1, %i1, 8
	fmov	%f1, %f30
	fneg	%f2, %f1
cont.70834:
	jzero	%i0, %i0, cont.70832
then.70831:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f0
	subi	%i1, %i1, 8
	sf	%f4, 0(%i1)
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	lf	%f4, 0(%i1)
	addi	%i1, %i1, 8
	fmov	%f2, %f30
cont.70832:
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f3, %f2, %f1
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f3
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70839
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70841
	fmul	%f7, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f6, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f2, %f1, %f2
	jzero	%i0, %i0, cont.70840
else.70841:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70843
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70845
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.70846
else.70845:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.70846:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	jzero	%i0, %i0, cont.70844
else.70843:
	lf	%f1, 3(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
cont.70844:
cont.70842:
	jzero	%i0, %i0, cont.70840
else.70839:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70847
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70849
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.70850
else.70849:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.70850:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	jzero	%i0, %i0, cont.70848
else.70847:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
cont.70848:
cont.70840:
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.70851
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.70853
	fmul	%f7, %f3, %f3
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f6, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f3
	jzero	%i0, %i0, cont.70852
else.70853:
	lf	%f1, 3(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.70855
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.70857
	fmov	%f7, %f3
	jzero	%i0, %i0, cont.70858
else.70857:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f3
cont.70858:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f6, %f1, %f7
	jzero	%i0, %i0, cont.70856
else.70855:
	lf	%f1, 3(%i0)
	fsub	%f7, %f1, %f3
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f6, %f1, %f7
cont.70856:
cont.70854:
	jzero	%i0, %i0, cont.70852
else.70851:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.70859
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.70861
	fmov	%f7, %f3
	jzero	%i0, %i0, cont.70862
else.70861:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f3
cont.70862:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f6, %f1, %f7
	jzero	%i0, %i0, cont.70860
else.70859:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f3
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f6, %f1, %f7
cont.70860:
cont.70852:
	fmul	%f3, %f5, %f6
	movui	%i31, 275584
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	lw	%i4, 222(%i0)
	sf	%f1, 0(%i4)
	movui	%i31, 799872
	mif	%f1, %i31
	fmul	%f1, %f4, %f1
	lw	%i4, 222(%i0)
	sf	%f1, 1(%i4)
	fmul	%f3, %f5, %f2
	movui	%i31, 275584
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	lw	%i4, 222(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 212(%i0)
	sf	%f2, 0(%i4)
	lw	%i4, 212(%i0)
	sf	%f0, 1(%i4)
	fneg	%f1, %f6
	lw	%i4, 212(%i0)
	sf	%f1, 2(%i4)
	fneg	%f3, %f4
	fmul	%f1, %f3, %f6
	lw	%i4, 217(%i0)
	sf	%f1, 0(%i4)
	fneg	%f1, %f5
	lw	%i4, 217(%i0)
	sf	%f1, 1(%i4)
	fmul	%f1, %f3, %f2
	lw	%i4, 217(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 77(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 222(%i0)
	lf	%f1, 0(%i4)
	fsub	%f1, %f2, %f1
	lw	%i4, 82(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 77(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 222(%i0)
	lf	%f1, 1(%i4)
	fsub	%f1, %f2, %f1
	lw	%i4, 82(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 77(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 222(%i0)
	lf	%f1, 2(%i4)
	fsub	%f1, %f2, %f1
	lw	%i4, 82(%i0)
	sf	%f1, 2(%i4)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
	movui	%i31, 784384
	mif	%f2, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70863
	movi	%i31, 45
	jeq	%i5, %i31, then.70865
	movi	%i4, 48
	jleq	%i4, %i5, then.70867
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70864
then.70867:
	movi	%i31, 57
	jleq	%i5, %i31, then.70869
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70870
then.70869:
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f0, %f1
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f2, %f30
cont.70870:
cont.70868:
	jzero	%i0, %i0, cont.70864
then.70865:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f2, %f1
cont.70866:
	jzero	%i0, %i0, cont.70864
then.70863:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f2, %f30
cont.70864:
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f3, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.70871
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.70873
	fmul	%f4, %f3, %f3
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f3
	jzero	%i0, %i0, cont.70872
else.70873:
	lf	%f1, 3(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.70875
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f2, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70877
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70878
else.70877:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70878:
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.70876
else.70875:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f5
cont.70876:
cont.70874:
	jzero	%i0, %i0, cont.70872
else.70871:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.70879
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f2, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70881
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70882
else.70881:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70882:
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.70880
else.70879:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f5
cont.70880:
cont.70872:
	fneg	%f1, %f1
	lw	%i4, 87(%i0)
	sf	%f1, 1(%i4)
	movui	%i31, 784384
	mif	%f2, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70883
	movi	%i31, 45
	jeq	%i5, %i31, then.70885
	movi	%i4, 48
	jleq	%i4, %i5, then.70887
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70884
then.70887:
	movi	%i31, 57
	jleq	%i5, %i31, then.70889
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70890
then.70889:
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f0, %f1
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	fmov	%f2, %f30
cont.70890:
cont.70888:
	jzero	%i0, %i0, cont.70884
then.70885:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	fmov	%f1, %f30
	fneg	%f2, %f1
cont.70886:
	jzero	%i0, %i0, cont.70884
then.70883:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f0
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	fmov	%f2, %f30
cont.70884:
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f4, %f2, %f1
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f3
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70891
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70893
	fmul	%f5, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f2
	jzero	%i0, %i0, cont.70892
else.70893:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70895
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70897
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70898
else.70897:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70898:
	fmul	%f3, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f3, %f1, %f5
	jzero	%i0, %i0, cont.70896
else.70895:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f2
	fmul	%f3, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f3, %f1, %f5
cont.70896:
cont.70894:
	jzero	%i0, %i0, cont.70892
else.70891:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70899
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70901
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70902
else.70901:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70902:
	fmul	%f3, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f3, %f1, %f5
	jzero	%i0, %i0, cont.70900
else.70899:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
	fmul	%f3, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f3, %f1, %f5
cont.70900:
cont.70892:
	lf	%f1, 1(%i0)
	fleq	%i31, %f4, %f1
	jzero	%i0, %i31, else.70903
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f4
	jzero	%i0, %i31, else.70905
	fmul	%f5, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f5
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f4
	jzero	%i0, %i0, cont.70904
else.70905:
	lf	%f1, 3(%i0)
	fleq	%i31, %f4, %f1
	jzero	%i0, %i31, else.70907
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	ffloor	%f1, %f1
	fmov	%f2, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f2, %f1
	fsub	%f2, %f4, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70909
	fmov	%f6, %f2
	jzero	%i0, %i0, cont.70910
else.70909:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
cont.70910:
	fmul	%f5, %f6, %f6
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f5
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f6
	jzero	%i0, %i0, cont.70908
else.70907:
	lf	%f1, 3(%i0)
	fsub	%f6, %f1, %f4
	fmul	%f5, %f6, %f6
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f5
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f6
cont.70908:
cont.70906:
	jzero	%i0, %i0, cont.70904
else.70903:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f4
	jzero	%i0, %i31, else.70911
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	ffloor	%f1, %f1
	fmov	%f2, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f2, %f1
	fsub	%f2, %f4, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70913
	fmov	%f6, %f2
	jzero	%i0, %i0, cont.70914
else.70913:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
cont.70914:
	fmul	%f5, %f6, %f6
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f5
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f6
	jzero	%i0, %i0, cont.70912
else.70911:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f4
	fmul	%f5, %f6, %f6
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f5
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f6
cont.70912:
cont.70904:
	fmul	%f1, %f3, %f1
	lw	%i4, 87(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f4
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70915
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70917
	fmul	%f5, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f1, %f1, %f2
	jzero	%i0, %i0, cont.70916
else.70917:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70919
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70921
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70922
else.70921:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70922:
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.70920
else.70919:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f2
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f5
cont.70920:
cont.70918:
	jzero	%i0, %i0, cont.70916
else.70915:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70923
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70925
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70926
else.70925:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70926:
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.70924
else.70923:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f5
cont.70924:
cont.70916:
	fmul	%f1, %f3, %f1
	lw	%i4, 87(%i0)
	sf	%f1, 2(%i4)
	movui	%i31, 784384
	mif	%f2, %i31
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	mov	%i5, %i4
	movi	%i31, 46
	jeq	%i5, %i31, then.70927
	movi	%i31, 45
	jeq	%i5, %i31, then.70929
	movi	%i4, 48
	jleq	%i4, %i5, then.70931
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70928
then.70931:
	movi	%i31, 57
	jleq	%i5, %i31, then.70933
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70934
then.70933:
	subi	%i4, %i5, 48
	itof	%f1, %i4
	fadd	%f1, %f0, %f1
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70934:
cont.70932:
	jzero	%i0, %i0, cont.70928
then.70929:
	movui	%i31, 784384
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
	fneg	%f1, %f1
cont.70930:
	jzero	%i0, %i0, cont.70928
then.70927:
	movui	%i31, 266752
	mif	%f2, %i31
	fmov	%f1, %f0
	set_label	%i31, read_float_helper.2578
	jmp	%i3, 0(%i31)
	fmov	%f1, %f30
cont.70928:
	lw	%i4, 92(%i0)
	sf	%f1, 0(%i4)
	mov	%i4, %i0
	set_label	%i31, read_object.2855
	jmp	%i3, 0(%i31)
	mov	%i16, %i0
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70935
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	jzero	%i0, %i0, cont.70936
then.70935:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i19, %i0, %i30
cont.70936:
	movi	%i31, -1
	jeq	%i19, %i31, then.70937
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	movi	%i31, -1
	jeq	%i18, %i31, then.70939
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70941
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	jzero	%i0, %i0, cont.70942
then.70941:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i17, %i0, %i30
cont.70942:
	movi	%i31, -1
	jeq	%i17, %i31, then.70943
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i16, %i30
	movi	%i31, -1
	jeq	%i16, %i31, then.70945
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70947
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.70948
then.70947:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.70948:
	movi	%i31, -1
	jeq	%i7, %i31, then.70949
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.70951
	movi	%i4, 6
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.70952
then.70951:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70953:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70954
	jzero	%i0, %i0, ca_done.70955
ca_cont.70954:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70953
	jmp	%i0, 0(%i31)
ca_done.70955:
cont.70952:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.70950
then.70949:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.70950:
	sw	%i16, 3(%i4)
	jzero	%i0, %i0, cont.70946
then.70945:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.70946:
	sw	%i17, 2(%i4)
	jzero	%i0, %i0, cont.70944
then.70943:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.70944:
	sw	%i18, 1(%i4)
	jzero	%i0, %i0, cont.70940
then.70939:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.70940:
	sw	%i19, 0(%i4)
	mov	%i5, %i4
	jzero	%i0, %i0, cont.70938
then.70937:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i5, %i6
cont.70938:
	lw	%i4, 0(%i5)
	movi	%i31, -1
	ceq	%i30, %i4, %i31
	jzero	%i0, %i30, Lrelax_skip_0
	set_label	%i30, then.70956
	jmp	%i0, 0(%i30)
Lrelax_skip_0:
	lw	%i4, 97(%i0)
	sw	%i5, 0(%i4)
	movi	%i16, 1
loop_start.67539:
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70959
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.70960
then.70959:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.70960:
	movi	%i31, -1
	jeq	%i20, %i31, then.70961
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.70963
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70965
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.70966
then.70965:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.70966:
	movi	%i31, -1
	jeq	%i18, %i31, then.70967
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.70969
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70971
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.70972
then.70971:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.70972:
	movi	%i31, -1
	jeq	%i7, %i31, then.70973
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.70975
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.70976
then.70975:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.70977:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.70978
	jzero	%i0, %i0, ca_done.70979
ca_cont.70978:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.70977
	jmp	%i0, 0(%i31)
ca_done.70979:
cont.70976:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.70974
then.70973:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.70974:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.70970
then.70969:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.70970:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.70968
then.70967:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.70968:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.70964
then.70963:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.70964:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.70962
then.70961:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.70962:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	ceq	%i30, %i4, %i31
	jzero	%i0, %i30, Lrelax_skip_1
	set_label	%i30, then.70980
	jmp	%i0, 0(%i30)
Lrelax_skip_1:
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70982
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.70983
then.70982:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.70983:
	movi	%i31, -1
	jeq	%i20, %i31, then.70984
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.70986
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70988
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.70989
then.70988:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.70989:
	movi	%i31, -1
	jeq	%i18, %i31, then.70990
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.70992
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.70994
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.70995
then.70994:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.70995:
	movi	%i31, -1
	jeq	%i7, %i31, then.70996
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.70998
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.70999
then.70998:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71000:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71001
	jzero	%i0, %i0, ca_done.71002
ca_cont.71001:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71000
	jmp	%i0, 0(%i31)
ca_done.71002:
cont.70999:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.70997
then.70996:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.70997:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.70993
then.70992:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.70993:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.70991
then.70990:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.70991:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.70987
then.70986:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.70987:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.70985
then.70984:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.70985:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	ceq	%i30, %i4, %i31
	jzero	%i0, %i30, Lrelax_skip_2
	set_label	%i30, then.71003
	jmp	%i0, 0(%i30)
Lrelax_skip_2:
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71005
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71006
then.71005:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71006:
	movi	%i31, -1
	jeq	%i20, %i31, then.71007
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71009
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71011
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71012
then.71011:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71012:
	movi	%i31, -1
	jeq	%i18, %i31, then.71013
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71015
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71017
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71018
then.71017:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71018:
	movi	%i31, -1
	jeq	%i7, %i31, then.71019
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71021
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71022
then.71021:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71023:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71024
	jzero	%i0, %i0, ca_done.71025
ca_cont.71024:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71023
	jmp	%i0, 0(%i31)
ca_done.71025:
cont.71022:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71020
then.71019:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71020:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71016
then.71015:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71016:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71014
then.71013:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71014:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71010
then.71009:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71010:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71008
then.71007:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71008:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	ceq	%i30, %i4, %i31
	jzero	%i0, %i30, Lrelax_skip_3
	set_label	%i30, then.71026
	jmp	%i0, 0(%i30)
Lrelax_skip_3:
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71028
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71029
then.71028:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71029:
	movi	%i31, -1
	jeq	%i20, %i31, then.71030
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71032
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71034
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71035
then.71034:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71035:
	movi	%i31, -1
	jeq	%i18, %i31, then.71036
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71038
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71040
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71041
then.71040:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71041:
	movi	%i31, -1
	jeq	%i7, %i31, then.71042
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71044
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71045
then.71044:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71046:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71047
	jzero	%i0, %i0, ca_done.71048
ca_cont.71047:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71046
	jmp	%i0, 0(%i31)
ca_done.71048:
cont.71045:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71043
then.71042:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71043:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71039
then.71038:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71039:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71037
then.71036:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71037:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71033
then.71032:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71033:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71031
then.71030:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71031:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	ceq	%i30, %i4, %i31
	jzero	%i0, %i30, Lrelax_skip_4
	set_label	%i30, then.71049
	jmp	%i0, 0(%i30)
Lrelax_skip_4:
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71051
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71052
then.71051:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71052:
	movi	%i31, -1
	jeq	%i20, %i31, then.71053
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71055
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71057
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71058
then.71057:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71058:
	movi	%i31, -1
	jeq	%i18, %i31, then.71059
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71061
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71063
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71064
then.71063:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71064:
	movi	%i31, -1
	jeq	%i7, %i31, then.71065
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71067
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71068
then.71067:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71069:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71070
	jzero	%i0, %i0, ca_done.71071
ca_cont.71070:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71069
	jmp	%i0, 0(%i31)
ca_done.71071:
cont.71068:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71066
then.71065:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71066:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71062
then.71061:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71062:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71060
then.71059:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71060:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71056
then.71055:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71056:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71054
then.71053:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71054:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71072
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71074
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71075
then.71074:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71075:
	movi	%i31, -1
	jeq	%i20, %i31, then.71076
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71078
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71080
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71081
then.71080:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71081:
	movi	%i31, -1
	jeq	%i18, %i31, then.71082
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71084
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71086
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71087
then.71086:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71087:
	movi	%i31, -1
	jeq	%i7, %i31, then.71088
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71090
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71091
then.71090:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71092:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71093
	jzero	%i0, %i0, ca_done.71094
ca_cont.71093:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71092
	jmp	%i0, 0(%i31)
ca_done.71094:
cont.71091:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71089
then.71088:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71089:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71085
then.71084:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71085:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71083
then.71082:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71083:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71079
then.71078:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71079:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71077
then.71076:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71077:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71095
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71097
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71098
then.71097:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71098:
	movi	%i31, -1
	jeq	%i20, %i31, then.71099
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71101
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71103
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71104
then.71103:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71104:
	movi	%i31, -1
	jeq	%i18, %i31, then.71105
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71107
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71109
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71110
then.71109:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71110:
	movi	%i31, -1
	jeq	%i7, %i31, then.71111
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71113
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71114
then.71113:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71115:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71116
	jzero	%i0, %i0, ca_done.71117
ca_cont.71116:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71115
	jmp	%i0, 0(%i31)
ca_done.71117:
cont.71114:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71112
then.71111:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71112:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71108
then.71107:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71108:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71106
then.71105:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71106:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71102
then.71101:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71102:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71100
then.71099:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71100:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71118
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71120
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71121
then.71120:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71121:
	movi	%i31, -1
	jeq	%i20, %i31, then.71122
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71124
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71126
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71127
then.71126:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71127:
	movi	%i31, -1
	jeq	%i18, %i31, then.71128
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71130
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71132
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71133
then.71132:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71133:
	movi	%i31, -1
	jeq	%i7, %i31, then.71134
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71136
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71137
then.71136:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71138:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71139
	jzero	%i0, %i0, ca_done.71140
ca_cont.71139:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71138
	jmp	%i0, 0(%i31)
ca_done.71140:
cont.71137:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71135
then.71134:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71135:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71131
then.71130:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71131:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71129
then.71128:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71129:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71125
then.71124:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71125:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71123
then.71122:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71123:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71141
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71143
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71144
then.71143:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71144:
	movi	%i31, -1
	jeq	%i20, %i31, then.71145
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71147
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71149
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71150
then.71149:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71150:
	movi	%i31, -1
	jeq	%i18, %i31, then.71151
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71153
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71155
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71156
then.71155:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71156:
	movi	%i31, -1
	jeq	%i7, %i31, then.71157
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71159
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71160
then.71159:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71161:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71162
	jzero	%i0, %i0, ca_done.71163
ca_cont.71162:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71161
	jmp	%i0, 0(%i31)
ca_done.71163:
cont.71160:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71158
then.71157:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71158:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71154
then.71153:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71154:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71152
then.71151:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71152:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71148
then.71147:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71148:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71146
then.71145:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71146:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71164
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71166
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71167
then.71166:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71167:
	movi	%i31, -1
	jeq	%i20, %i31, then.71168
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71170
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71172
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71173
then.71172:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71173:
	movi	%i31, -1
	jeq	%i18, %i31, then.71174
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71176
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71178
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71179
then.71178:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71179:
	movi	%i31, -1
	jeq	%i7, %i31, then.71180
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71182
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71183
then.71182:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71184:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71185
	jzero	%i0, %i0, ca_done.71186
ca_cont.71185:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71184
	jmp	%i0, 0(%i31)
ca_done.71186:
cont.71183:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71181
then.71180:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71181:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71177
then.71176:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71177:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71175
then.71174:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71175:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71171
then.71170:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71171:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71169
then.71168:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71169:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71187
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71189
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71190
then.71189:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71190:
	movi	%i31, -1
	jeq	%i20, %i31, then.71191
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71193
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71195
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71196
then.71195:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71196:
	movi	%i31, -1
	jeq	%i18, %i31, then.71197
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71199
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71201
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71202
then.71201:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71202:
	movi	%i31, -1
	jeq	%i7, %i31, then.71203
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71205
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71206
then.71205:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71207:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71208
	jzero	%i0, %i0, ca_done.71209
ca_cont.71208:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71207
	jmp	%i0, 0(%i31)
ca_done.71209:
cont.71206:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71204
then.71203:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71204:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71200
then.71199:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71200:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71198
then.71197:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71198:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71194
then.71193:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71194:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71192
then.71191:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71192:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71210
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71212
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71213
then.71212:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71213:
	movi	%i31, -1
	jeq	%i20, %i31, then.71214
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71216
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71218
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71219
then.71218:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71219:
	movi	%i31, -1
	jeq	%i18, %i31, then.71220
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71222
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71224
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71225
then.71224:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71225:
	movi	%i31, -1
	jeq	%i7, %i31, then.71226
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71228
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71229
then.71228:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71230:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71231
	jzero	%i0, %i0, ca_done.71232
ca_cont.71231:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71230
	jmp	%i0, 0(%i31)
ca_done.71232:
cont.71229:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71227
then.71226:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71227:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71223
then.71222:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71223:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71221
then.71220:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71221:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71217
then.71216:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71217:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71215
then.71214:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71215:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71233
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71235
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71236
then.71235:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71236:
	movi	%i31, -1
	jeq	%i20, %i31, then.71237
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71239
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71241
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71242
then.71241:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71242:
	movi	%i31, -1
	jeq	%i18, %i31, then.71243
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71245
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71247
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71248
then.71247:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71248:
	movi	%i31, -1
	jeq	%i7, %i31, then.71249
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71251
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71252
then.71251:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71253:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71254
	jzero	%i0, %i0, ca_done.71255
ca_cont.71254:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71253
	jmp	%i0, 0(%i31)
ca_done.71255:
cont.71252:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71250
then.71249:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71250:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71246
then.71245:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71246:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71244
then.71243:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71244:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71240
then.71239:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71240:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71238
then.71237:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71238:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71256
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71258
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71259
then.71258:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71259:
	movi	%i31, -1
	jeq	%i20, %i31, then.71260
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71262
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71264
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71265
then.71264:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71265:
	movi	%i31, -1
	jeq	%i18, %i31, then.71266
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71268
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71270
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71271
then.71270:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71271:
	movi	%i31, -1
	jeq	%i7, %i31, then.71272
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71274
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71275
then.71274:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71276:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71277
	jzero	%i0, %i0, ca_done.71278
ca_cont.71277:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71276
	jmp	%i0, 0(%i31)
ca_done.71278:
cont.71275:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71273
then.71272:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71273:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71269
then.71268:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71269:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71267
then.71266:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71267:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71263
then.71262:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71263:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71261
then.71260:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71261:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71279
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71281
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71282
then.71281:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71282:
	movi	%i31, -1
	jeq	%i20, %i31, then.71283
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71285
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71287
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71288
then.71287:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71288:
	movi	%i31, -1
	jeq	%i18, %i31, then.71289
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71291
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71293
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71294
then.71293:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71294:
	movi	%i31, -1
	jeq	%i7, %i31, then.71295
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71297
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71298
then.71297:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71299:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71300
	jzero	%i0, %i0, ca_done.71301
ca_cont.71300:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71299
	jmp	%i0, 0(%i31)
ca_done.71301:
cont.71298:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71296
then.71295:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71296:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71292
then.71291:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71292:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71290
then.71289:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71290:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71286
then.71285:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71286:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71284
then.71283:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71284:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71302
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i16, %i16, 1
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71304
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i20, %i30
	jzero	%i0, %i0, cont.71305
then.71304:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i20, %i0, %i30
cont.71305:
	movi	%i31, -1
	jeq	%i20, %i31, then.71306
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71308
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71310
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71311
then.71310:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71311:
	movi	%i31, -1
	jeq	%i18, %i31, then.71312
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	movi	%i31, -1
	jeq	%i17, %i31, then.71314
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71316
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71317
then.71316:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71317:
	movi	%i31, -1
	jeq	%i7, %i31, then.71318
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71320
	movi	%i4, 6
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71321
then.71320:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71322:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71323
	jzero	%i0, %i0, ca_done.71324
ca_cont.71323:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71322
	jmp	%i0, 0(%i31)
ca_done.71324:
cont.71321:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71319
then.71318:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71319:
	sw	%i17, 3(%i4)
	jzero	%i0, %i0, cont.71315
then.71314:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71315:
	sw	%i18, 2(%i4)
	jzero	%i0, %i0, cont.71313
then.71312:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71313:
	sw	%i19, 1(%i4)
	jzero	%i0, %i0, cont.71309
then.71308:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71309:
	sw	%i20, 0(%i4)
	mov	%i6, %i4
	jzero	%i0, %i0, cont.71307
then.71306:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
cont.71307:
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.71325
	slli	%i5, %i16, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	addi	%i4, %i16, 1
	mov	%i16, %i4
	set_label	%i31, loop_start.67539
	jmp	%i0, 0(%i31)
then.71325:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71302:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71279:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71256:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71233:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71210:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71187:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71164:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71141:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71118:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71095:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71072:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71049:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71026:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.71003:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
then.70980:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67540
loop_end.67540:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.70957
then.70956:
cont.70957:
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71327
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	jzero	%i0, %i0, cont.71328
then.71327:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i19, %i0, %i30
cont.71328:
	movi	%i31, -1
	jeq	%i19, %i31, then.71329
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	movi	%i31, -1
	jeq	%i18, %i31, then.71331
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71333
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i17, %i30
	jzero	%i0, %i0, cont.71334
then.71333:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i17, %i0, %i30
cont.71334:
	movi	%i31, -1
	jeq	%i17, %i31, then.71335
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i16, %i30
	movi	%i31, -1
	jeq	%i16, %i31, then.71337
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71339
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71340
then.71339:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71340:
	movi	%i31, -1
	jeq	%i7, %i31, then.71341
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71343
	movi	%i4, 6
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	sw	%i6, 5(%i4)
	jzero	%i0, %i0, cont.71344
then.71343:
	movi	%i4, 6
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.71345:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.71346
	jzero	%i0, %i0, ca_done.71347
ca_cont.71346:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.71345
	jmp	%i0, 0(%i31)
ca_done.71347:
cont.71344:
	sw	%i7, 4(%i4)
	jzero	%i0, %i0, cont.71342
then.71341:
	movi	%i4, 5
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
cont.71342:
	sw	%i16, 3(%i4)
	jzero	%i0, %i0, cont.71338
then.71337:
	movi	%i4, 4
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
cont.71338:
	sw	%i17, 2(%i4)
	jzero	%i0, %i0, cont.71336
then.71335:
	movi	%i4, 3
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
cont.71336:
	sw	%i18, 1(%i4)
	jzero	%i0, %i0, cont.71332
then.71331:
	movi	%i4, 2
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
cont.71332:
	sw	%i19, 0(%i4)
	mov	%i17, %i4
	jzero	%i0, %i0, cont.71330
then.71329:
	movi	%i4, 1
	movi	%i5, -1
	mov	%i6, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i17, %i4
cont.71330:
	lw	%i4, 0(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.71348
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	movi	%i31, -1
	jeq	%i19, %i31, then.71350
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71352
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	jzero	%i0, %i0, cont.71353
then.71352:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i18, %i0, %i30
cont.71353:
	movi	%i31, -1
	jeq	%i18, %i31, then.71354
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i16, %i30
	movi	%i31, -1
	jeq	%i16, %i31, then.71356
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71358
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71359
then.71358:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71359:
	movi	%i31, -1
	jeq	%i7, %i31, then.71360
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71362
	movi	%i4, 5
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	sw	%i6, 4(%i4)
	jzero	%i0, %i0, cont.71363
then.71362:
	movi	%i6, 5
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i4, %i6
cont.71363:
	sw	%i7, 3(%i4)
	jzero	%i0, %i0, cont.71361
then.71360:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71361:
	sw	%i16, 2(%i4)
	jzero	%i0, %i0, cont.71357
then.71356:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71357:
	sw	%i18, 1(%i4)
	jzero	%i0, %i0, cont.71355
then.71354:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71355:
	sw	%i19, 0(%i4)
	mov	%i16, %i4
	jzero	%i0, %i0, cont.71351
then.71350:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i16, %i6
cont.71351:
	lw	%i4, 0(%i16)
	movi	%i31, -1
	jeq	%i4, %i31, then.71364
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71366
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i19, %i30
	jzero	%i0, %i0, cont.71367
then.71366:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i19, %i0, %i30
cont.71367:
	movi	%i31, -1
	jeq	%i19, %i31, then.71368
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	mov	%i18, %i30
	movi	%i31, -1
	jeq	%i18, %i31, then.71370
	movui	%i5, 0xf0000
	lb	%i4, 0(%i5)
	movi	%i31, 45
	jeq	%i4, %i31, then.71372
	subi	%i4, %i4, 48
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.71373
then.71372:
	mov	%i4, %i0
	set_label	%i31, read_int_helper.2574
	jmp	%i3, 0(%i31)
	sub	%i7, %i0, %i30
cont.71373:
	movi	%i31, -1
	jeq	%i7, %i31, then.71374
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_int.2576
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	movi	%i31, -1
	jeq	%i6, %i31, then.71376
	movi	%i4, 4
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	set_label	%i31, read_net_item.2859
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	sw	%i6, 3(%i4)
	jzero	%i0, %i0, cont.71377
then.71376:
	movi	%i6, 4
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	addi	%i2, %i2, 16
	mov	%i4, %i6
cont.71377:
	sw	%i7, 2(%i4)
	jzero	%i0, %i0, cont.71375
then.71374:
	movi	%i6, 3
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71375:
	sw	%i18, 1(%i4)
	jzero	%i0, %i0, cont.71371
then.71370:
	movi	%i6, 2
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71371:
	sw	%i19, 0(%i4)
	mov	%i7, %i4
	jzero	%i0, %i0, cont.71369
then.71368:
	movi	%i6, 1
	movi	%i5, -1
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i7, %i6
cont.71369:
	lw	%i4, 0(%i7)
	movi	%i31, -1
	jeq	%i4, %i31, then.71378
	movi	%i4, 3
	subi	%i1, %i1, 16
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	set_label	%i31, read_or_network.2861
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	sw	%i7, 2(%i4)
	jzero	%i0, %i0, cont.71379
then.71378:
	movi	%i6, 3
	mov	%i5, %i7
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i4, %i6
cont.71379:
	sw	%i16, 1(%i4)
	jzero	%i0, %i0, cont.71365
then.71364:
	movi	%i6, 2
	mov	%i5, %i16
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	addi	%i2, %i2, 8
	mov	%i4, %i6
cont.71365:
	sw	%i17, 0(%i4)
	mov	%i5, %i4
	jzero	%i0, %i0, cont.71349
then.71348:
	movi	%i6, 1
	mov	%i5, %i17
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i5, %i6
cont.71349:
	lw	%i4, 151(%i0)
	sw	%i5, 0(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
solver_rect.2876:
	lf	%f4, 0(%i15)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.71381
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71382
then.71381:
	lf	%f4, 0(%i15)
	flt	%i5, %f4, %f0
	mov	%i4, %i10
	xor	%i4, %i4, %i5
	lf	%f5, 0(%i8)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f5
	fsub	%f5, %f4, %f1
	lf	%f4, 0(%i15)
	finv	%f4, %f4
	fmul	%f6, %f5, %f4
	lf	%f4, 1(%i15)
	fma	%f5, %f6, %f4, %f2
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 1(%i8)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.71383
	lf	%f4, 2(%i15)
	fma	%f5, %f6, %f4, %f3
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i8)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.71385
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71384
then.71385:
	mov	%i4, %i0
cont.71386:
	jzero	%i0, %i0, cont.71384
then.71383:
	mov	%i4, %i0
cont.71384:
cont.71382:
	jeq	%i4, %i0, then.71387
	movi	%i30, 1
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71387:
	lf	%f4, 1(%i15)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.71388
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71389
then.71388:
	lf	%f4, 1(%i15)
	flt	%i5, %f4, %f0
	mov	%i4, %i10
	xor	%i4, %i4, %i5
	lf	%f5, 1(%i8)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f5
	fsub	%f5, %f4, %f2
	lf	%f4, 1(%i15)
	finv	%f4, %f4
	fmul	%f6, %f5, %f4
	lf	%f4, 2(%i15)
	fma	%f5, %f6, %f4, %f3
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i8)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.71390
	lf	%f4, 0(%i15)
	fma	%f5, %f6, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i8)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.71392
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71391
then.71392:
	mov	%i4, %i0
cont.71393:
	jzero	%i0, %i0, cont.71391
then.71390:
	mov	%i4, %i0
cont.71391:
cont.71389:
	jeq	%i4, %i0, then.71394
	movi	%i30, 2
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71394:
	lf	%f4, 2(%i15)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.71395
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71396
then.71395:
	lf	%f4, 2(%i15)
	flt	%i5, %f4, %f0
	mov	%i4, %i10
	xor	%i4, %i4, %i5
	lf	%f5, 2(%i8)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f5
	fsub	%f4, %f4, %f3
	lf	%f3, 2(%i15)
	finv	%f3, %f3
	fmul	%f4, %f4, %f3
	lf	%f3, 0(%i15)
	fma	%f3, %f4, %f3, %f1
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i8)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71397
	lf	%f1, 1(%i15)
	fma	%f2, %f4, %f1, %f2
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i8)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.71399
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71398
then.71399:
	mov	%i4, %i0
cont.71400:
	jzero	%i0, %i0, cont.71398
then.71397:
	mov	%i4, %i0
cont.71398:
cont.71396:
	jeq	%i4, %i0, then.71401
	movi	%i30, 3
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71401:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
solver_second.2901:
	lf	%f9, 0(%i15)
	lf	%f8, 1(%i15)
	lf	%f7, 2(%i15)
	fmul	%f5, %f9, %f9
	lf	%f4, 0(%i8)
	fmul	%f6, %f5, %f4
	fmul	%f5, %f8, %f8
	lf	%f4, 1(%i8)
	fma	%f6, %f5, %f4, %f6
	fmul	%f5, %f7, %f7
	lf	%f4, 2(%i8)
	fma	%f6, %f5, %f4, %f6
	jeq	%i7, %i0, then.71402
	fmul	%f5, %f8, %f7
	lf	%f4, 0(%i13)
	fma	%f6, %f5, %f4, %f6
	fmul	%f5, %f7, %f9
	lf	%f4, 1(%i13)
	fma	%f6, %f5, %f4, %f6
	fmul	%f5, %f9, %f8
	lf	%f4, 2(%i13)
	fma	%f5, %f5, %f4, %f6
	jzero	%i0, %i0, cont.71403
then.71402:
	fmov	%f5, %f6
cont.71403:
	feq	%i4, %f5, %f0
	jeq	%i4, %i0, then.71404
	mov	%i30, %i0
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71404:
	lf	%f11, 0(%i15)
	lf	%f10, 1(%i15)
	lf	%f9, 2(%i15)
	fmul	%f6, %f11, %f1
	lf	%f4, 0(%i8)
	fmul	%f7, %f6, %f4
	fmul	%f6, %f10, %f2
	lf	%f4, 1(%i8)
	fma	%f7, %f6, %f4, %f7
	fmul	%f6, %f9, %f3
	lf	%f4, 2(%i8)
	fma	%f8, %f6, %f4, %f7
	jeq	%i7, %i0, then.71405
	fmul	%f4, %f9, %f2
	fma	%f6, %f10, %f3, %f4
	lf	%f4, 0(%i13)
	fmul	%f7, %f6, %f4
	fmul	%f4, %f11, %f3
	fma	%f6, %f9, %f1, %f4
	lf	%f4, 1(%i13)
	fma	%f7, %f6, %f4, %f7
	fmul	%f4, %f11, %f2
	fma	%f6, %f10, %f1, %f4
	lf	%f4, 2(%i13)
	fma	%f6, %f6, %f4, %f7
	movui	%i31, 258048
	mif	%f4, %i31
	fma	%f4, %f6, %f4, %f8
	jzero	%i0, %i0, cont.71406
then.71405:
	fmov	%f4, %f8
cont.71406:
	fmul	%f7, %f1, %f1
	lf	%f6, 0(%i8)
	fmul	%f8, %f7, %f6
	fmul	%f7, %f2, %f2
	lf	%f6, 1(%i8)
	fma	%f8, %f7, %f6, %f8
	fmul	%f7, %f3, %f3
	lf	%f6, 2(%i8)
	fma	%f8, %f7, %f6, %f8
	jeq	%i7, %i0, then.71407
	fmul	%f7, %f2, %f3
	lf	%f6, 0(%i13)
	fma	%f7, %f7, %f6, %f8
	fmul	%f6, %f3, %f1
	lf	%f3, 1(%i13)
	fma	%f3, %f6, %f3, %f7
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i13)
	fma	%f2, %f2, %f1, %f3
	jzero	%i0, %i0, cont.71408
then.71407:
	fmov	%f2, %f8
cont.71408:
	movi	%i31, 3
	jeq	%i5, %i31, then.71409
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.71410
then.71409:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.71410:
	fmul	%f2, %f4, %f4
	fmul	%f1, %f5, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71411
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	ceqi	%i4, %i10, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f4
	finv	%f1, %f5
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i30, 1
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71411:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
solver_rect_fast.2911:
	mov	%i5, %i16
	fmov	%f4, %f1
	fmov	%f1, %f3
	lf	%f3, 0(%i5)
	fsub	%f5, %f3, %f4
	lf	%f3, 1(%i5)
	fmul	%f6, %f5, %f3
	lf	%f3, 1(%i15)
	fma	%f5, %f6, %f3, %f2
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f5, %f3, %f5
	lf	%f3, 1(%i8)
	flt	%i4, %f5, %f3
	jeq	%i4, %i0, then.71412
	lf	%f3, 2(%i15)
	fma	%f5, %f6, %f3, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f5, %f3, %f5
	lf	%f3, 2(%i8)
	flt	%i4, %f5, %f3
	jeq	%i4, %i0, then.71414
	lf	%f3, 1(%i5)
	feq	%i4, %f3, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71413
then.71414:
	mov	%i4, %i0
cont.71415:
	jzero	%i0, %i0, cont.71413
then.71412:
	mov	%i4, %i0
cont.71413:
	jeq	%i4, %i0, then.71416
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i30, 1
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71416:
	lf	%f3, 2(%i5)
	fsub	%f5, %f3, %f2
	lf	%f3, 3(%i5)
	fmul	%f6, %f5, %f3
	lf	%f3, 0(%i15)
	fma	%f5, %f6, %f3, %f4
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f5, %f3, %f5
	lf	%f3, 0(%i8)
	flt	%i4, %f5, %f3
	jeq	%i4, %i0, then.71417
	lf	%f3, 2(%i15)
	fma	%f5, %f6, %f3, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f5, %f3, %f5
	lf	%f3, 2(%i8)
	flt	%i4, %f5, %f3
	jeq	%i4, %i0, then.71419
	lf	%f3, 3(%i5)
	feq	%i4, %f3, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71418
then.71419:
	mov	%i4, %i0
cont.71420:
	jzero	%i0, %i0, cont.71418
then.71417:
	mov	%i4, %i0
cont.71418:
	jeq	%i4, %i0, then.71421
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i30, 2
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71421:
	lf	%f3, 4(%i5)
	fsub	%f3, %f3, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f3, %f1
	lf	%f1, 0(%i15)
	fma	%f3, %f5, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i8)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71422
	lf	%f1, 1(%i15)
	fma	%f2, %f5, %f1, %f2
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i8)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.71424
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71423
then.71424:
	mov	%i4, %i0
cont.71425:
	jzero	%i0, %i0, cont.71423
then.71422:
	mov	%i4, %i0
cont.71423:
	jeq	%i4, %i0, then.71426
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i30, 3
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71426:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
setup_second_table.2957:
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	sf	%f1, 3(%i2)
	sf	%f1, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i5, 5
	lf	%f6, 0(%i4)
	lf	%f5, 1(%i4)
	lf	%f4, 2(%i4)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i9)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i9)
	fma	%f3, %f2, %f1, %f3
	jeq	%i8, %i0, then.71427
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i14)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i14)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i14)
	fma	%f2, %f2, %f1, %f3
	jzero	%i0, %i0, cont.71428
then.71427:
	fmov	%f2, %f3
cont.71428:
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i9)
	fmul	%f1, %f3, %f1
	fneg	%f7, %f1
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i9)
	fmul	%f1, %f3, %f1
	fneg	%f6, %f1
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i9)
	fmul	%f1, %f3, %f1
	fneg	%f1, %f1
	sf	%f2, 0(%i5)
	jeq	%i8, %i0, then.71429
	lf	%f4, 2(%i4)
	lf	%f3, 1(%i14)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i4)
	lf	%f3, 2(%i14)
	fma	%f4, %f4, %f3, %f5
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f7, %f3
	sf	%f3, 1(%i5)
	lf	%f4, 2(%i4)
	lf	%f3, 0(%i14)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i4)
	lf	%f3, 2(%i14)
	fma	%f4, %f4, %f3, %f5
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f6, %f3
	sf	%f3, 2(%i5)
	lf	%f4, 1(%i4)
	lf	%f3, 0(%i14)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i4)
	lf	%f3, 1(%i14)
	fma	%f4, %f4, %f3, %f5
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.71430
then.71429:
	sf	%f7, 1(%i5)
	sf	%f6, 2(%i5)
	sf	%f1, 3(%i5)
cont.71430:
	feq	%i4, %f2, %f0
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.71431
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f2
	fmul	%f1, %f3, %f1
	sf	%f1, 4(%i5)
cont.71431:
	mov	%i4, %i5
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
iter_setup_dirvec_constants.2960:
	mov	%i11, %i4
	mov	%i10, %i5
	jleq	%i0, %i6, then.71432
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71432:
	slli	%i5, %i6, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i12, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i4, 1(%i4)
	movi	%i31, 1
	jeq	%i4, %i31, then.71434
	movi	%i31, 2
	jeq	%i4, %i31, then.71436
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	sf	%f1, 3(%i2)
	sf	%f1, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i5, 5
	lf	%f6, 0(%i11)
	lf	%f5, 1(%i11)
	lf	%f4, 2(%i11)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i8)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i8)
	fma	%f3, %f2, %f1, %f3
	jeq	%i7, %i0, then.71438
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i12)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i12)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i12)
	fma	%f2, %f2, %f1, %f3
	jzero	%i0, %i0, cont.71439
then.71438:
	fmov	%f2, %f3
cont.71439:
	lf	%f3, 0(%i11)
	lf	%f1, 0(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f7, %f1
	lf	%f3, 1(%i11)
	lf	%f1, 1(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f6, %f1
	lf	%f3, 2(%i11)
	lf	%f1, 2(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f1, %f1
	sf	%f2, 0(%i5)
	jeq	%i7, %i0, then.71440
	lf	%f4, 2(%i11)
	lf	%f3, 1(%i12)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i11)
	lf	%f3, 2(%i12)
	fma	%f4, %f4, %f3, %f5
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f7, %f3
	sf	%f3, 1(%i5)
	lf	%f4, 2(%i11)
	lf	%f3, 0(%i12)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i11)
	lf	%f3, 2(%i12)
	fma	%f4, %f4, %f3, %f5
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f6, %f3
	sf	%f3, 2(%i5)
	lf	%f4, 1(%i11)
	lf	%f3, 0(%i12)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i11)
	lf	%f3, 1(%i12)
	fma	%f4, %f4, %f3, %f5
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.71441
then.71440:
	sf	%f7, 1(%i5)
	sf	%f6, 2(%i5)
	sf	%f1, 3(%i5)
cont.71441:
	feq	%i4, %f2, %f0
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.71442
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f2
	fmul	%f1, %f3, %f1
	sf	%f1, 4(%i5)
cont.71442:
	slli	%i4, %i6, 2
	add	%i31, %i10, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.71435
then.71436:
	movi	%i5, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	sf	%f1, 3(%i2)
	addi	%i2, %i2, 16
	lf	%f2, 0(%i11)
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i11)
	lf	%f1, 1(%i8)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i11)
	lf	%f1, 2(%i8)
	fma	%f3, %f2, %f1, %f3
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.71443
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	sf	%f1, 0(%i5)
	lf	%f2, 0(%i8)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 1(%i5)
	lf	%f2, 1(%i8)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 2(%i5)
	lf	%f2, 2(%i8)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.71444
then.71443:
	sf	%f0, 0(%i5)
cont.71444:
	slli	%i4, %i6, 2
	add	%i31, %i10, %i4
	sw	%i5, 0(%i31)
cont.71437:
	jzero	%i0, %i0, cont.71435
then.71434:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i15, %i4
	mov	%i4, %i2
cfa_loop.71445:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, cfa_cont.71446
	jzero	%i0, %i0, cfa_done.71447
cfa_cont.71446:
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, cfa_loop.71445
	jmp	%i0, 0(%i31)
cfa_done.71447:
	mov	%i7, %i4
	lf	%f1, 0(%i11)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71448
	sf	%f0, 1(%i7)
	jzero	%i0, %i0, cont.71449
then.71448:
	lf	%f1, 0(%i11)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i8)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i11)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i7)
cont.71449:
	lf	%f1, 1(%i11)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71450
	sf	%f0, 3(%i7)
	jzero	%i0, %i0, cont.71451
then.71450:
	lf	%f1, 1(%i11)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i8)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i11)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i7)
cont.71451:
	lf	%f1, 2(%i11)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71452
	sf	%f0, 5(%i7)
	jzero	%i0, %i0, cont.71453
then.71452:
	lf	%f1, 2(%i11)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i8)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i11)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i7)
cont.71453:
	slli	%i4, %i6, 2
	add	%i31, %i10, %i4
	sw	%i7, 0(%i31)
cont.71435:
	subi	%i4, %i6, 1
	mov	%i6, %i4
loop_start.67660:
	jleq	%i0, %i6, then.71455
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67661
	set_label	%i31, loop_start.67660
	jmp	%i0, 0(%i31)
then.71455:
	slli	%i5, %i6, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i12, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i4, 1(%i4)
	movi	%i31, 1
	jeq	%i4, %i31, then.71457
	movi	%i31, 2
	jeq	%i4, %i31, then.71459
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	sf	%f1, 3(%i2)
	sf	%f1, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i5, 5
	lf	%f6, 0(%i11)
	lf	%f5, 1(%i11)
	lf	%f4, 2(%i11)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i8)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i8)
	fma	%f3, %f2, %f1, %f3
	jeq	%i7, %i0, then.71461
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i12)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i12)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i12)
	fma	%f2, %f2, %f1, %f3
	jzero	%i0, %i0, cont.71462
then.71461:
	fmov	%f2, %f3
cont.71462:
	lf	%f3, 0(%i11)
	lf	%f1, 0(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f7, %f1
	lf	%f3, 1(%i11)
	lf	%f1, 1(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f6, %f1
	lf	%f3, 2(%i11)
	lf	%f1, 2(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f1, %f1
	sf	%f2, 0(%i5)
	jeq	%i7, %i0, then.71463
	lf	%f4, 2(%i11)
	lf	%f3, 1(%i12)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i11)
	lf	%f3, 2(%i12)
	fma	%f4, %f4, %f3, %f5
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f7, %f3
	sf	%f3, 1(%i5)
	lf	%f4, 2(%i11)
	lf	%f3, 0(%i12)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i11)
	lf	%f3, 2(%i12)
	fma	%f4, %f4, %f3, %f5
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f6, %f3
	sf	%f3, 2(%i5)
	lf	%f4, 1(%i11)
	lf	%f3, 0(%i12)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i11)
	lf	%f3, 1(%i12)
	fma	%f4, %f4, %f3, %f5
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.71464
then.71463:
	sf	%f7, 1(%i5)
	sf	%f6, 2(%i5)
	sf	%f1, 3(%i5)
cont.71464:
	feq	%i4, %f2, %f0
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.71465
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f2
	fmul	%f1, %f3, %f1
	sf	%f1, 4(%i5)
cont.71465:
	slli	%i4, %i6, 2
	add	%i31, %i10, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.71458
then.71459:
	movi	%i5, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	sf	%f1, 3(%i2)
	addi	%i2, %i2, 16
	lf	%f2, 0(%i11)
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i11)
	lf	%f1, 1(%i8)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i11)
	lf	%f1, 2(%i8)
	fma	%f3, %f2, %f1, %f3
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.71466
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	sf	%f1, 0(%i5)
	lf	%f2, 0(%i8)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 1(%i5)
	lf	%f2, 1(%i8)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 2(%i5)
	lf	%f2, 2(%i8)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.71467
then.71466:
	sf	%f0, 0(%i5)
cont.71467:
	slli	%i4, %i6, 2
	add	%i31, %i10, %i4
	sw	%i5, 0(%i31)
cont.71460:
	jzero	%i0, %i0, cont.71458
then.71457:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i15, %i4
	mov	%i4, %i2
cfa_loop.71468:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, cfa_cont.71469
	jzero	%i0, %i0, cfa_done.71470
cfa_cont.71469:
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, cfa_loop.71468
	jmp	%i0, 0(%i31)
cfa_done.71470:
	mov	%i7, %i4
	lf	%f1, 0(%i11)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71471
	sf	%f0, 1(%i7)
	jzero	%i0, %i0, cont.71472
then.71471:
	lf	%f1, 0(%i11)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i8)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i11)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i7)
cont.71472:
	lf	%f1, 1(%i11)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71473
	sf	%f0, 3(%i7)
	jzero	%i0, %i0, cont.71474
then.71473:
	lf	%f1, 1(%i11)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i8)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i11)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i7)
cont.71474:
	lf	%f1, 2(%i11)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71475
	sf	%f0, 5(%i7)
	jzero	%i0, %i0, cont.71476
then.71475:
	lf	%f1, 2(%i11)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i8)
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i11)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i7)
cont.71476:
	slli	%i4, %i6, 2
	add	%i31, %i10, %i4
	sw	%i7, 0(%i31)
cont.71458:
	subi	%i4, %i6, 1
	mov	%i6, %i4
cont.71456:
	set_label	%i30, loop_start.67660
	jmp	%i0, 0(%i30)
loop_end.67661:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	jmp	%i0, 0(%i3)
setup_startp_constants.2965:
	jleq	%i0, %i5, then.71477
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71477:
	slli	%i7, %i5, 2
	lw	%i6, 15(%i0)
	add	%i31, %i6, %i7
	lw	%i6, 0(%i31)
	lw	%i11, 10(%i6)
	lw	%i10, 9(%i6)
	lw	%i9, 5(%i6)
	lw	%i8, 4(%i6)
	lw	%i7, 3(%i6)
	lw	%i6, 1(%i6)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i9)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i11)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i9)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i11)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i9)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i11)
	movi	%i31, 2
	jeq	%i6, %i31, then.71479
	movi	%i31, 2
	jleq	%i6, %i31, cont.71481
	lf	%f6, 0(%i11)
	lf	%f5, 1(%i11)
	lf	%f4, 2(%i11)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i8)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i8)
	fma	%f3, %f2, %f1, %f3
	jeq	%i7, %i0, then.71482
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i10)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i10)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i10)
	fma	%f2, %f2, %f1, %f3
	jzero	%i0, %i0, cont.71483
then.71482:
	fmov	%f2, %f3
cont.71483:
	movi	%i31, 3
	jeq	%i6, %i31, then.71484
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.71485
then.71484:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.71485:
	sf	%f1, 3(%i11)
cont.71481:
	jzero	%i0, %i0, cont.71480
then.71479:
	lf	%f2, 0(%i11)
	lf	%f4, 1(%i11)
	lf	%f3, 2(%i11)
	lf	%f1, 0(%i8)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i8)
	fma	%f2, %f1, %f4, %f2
	lf	%f1, 2(%i8)
	fma	%f1, %f1, %f3, %f2
	sf	%f1, 3(%i11)
cont.71480:
	subi	%i5, %i5, 1
loop_start.67692:
	jleq	%i0, %i5, then.71487
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67693
	set_label	%i31, loop_start.67692
	jmp	%i0, 0(%i31)
then.71487:
	slli	%i7, %i5, 2
	lw	%i6, 15(%i0)
	add	%i31, %i6, %i7
	lw	%i6, 0(%i31)
	lw	%i11, 10(%i6)
	lw	%i10, 9(%i6)
	lw	%i9, 5(%i6)
	lw	%i8, 4(%i6)
	lw	%i7, 3(%i6)
	lw	%i6, 1(%i6)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i9)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i11)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i9)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i11)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i9)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i11)
	movi	%i31, 2
	jeq	%i6, %i31, then.71489
	movi	%i31, 2
	jleq	%i6, %i31, cont.71491
	lf	%f6, 0(%i11)
	lf	%f5, 1(%i11)
	lf	%f4, 2(%i11)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i8)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i8)
	fma	%f3, %f2, %f1, %f3
	jeq	%i7, %i0, then.71492
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i10)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i10)
	fma	%f3, %f2, %f1, %f3
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i10)
	fma	%f2, %f2, %f1, %f3
	jzero	%i0, %i0, cont.71493
then.71492:
	fmov	%f2, %f3
cont.71493:
	movi	%i31, 3
	jeq	%i6, %i31, then.71494
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.71495
then.71494:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.71495:
	sf	%f1, 3(%i11)
cont.71491:
	jzero	%i0, %i0, cont.71490
then.71489:
	lf	%f2, 0(%i11)
	lf	%f4, 1(%i11)
	lf	%f3, 2(%i11)
	lf	%f1, 0(%i8)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i8)
	fma	%f2, %f1, %f4, %f2
	lf	%f1, 2(%i8)
	fma	%f1, %f1, %f3, %f2
	sf	%f1, 3(%i11)
cont.71490:
	subi	%i5, %i5, 1
cont.71488:
	set_label	%i30, loop_start.67692
	jmp	%i0, 0(%i30)
loop_end.67693:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	jmp	%i0, 0(%i3)
shadow_check_and_group.2996:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i18, %i4
	mov	%i19, %i5
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	ceq	%i30, %i4, %i31
	jzero	%i0, %i30, Lrelax_skip_5
	set_label	%i30, then.71496
	jmp	%i0, 0(%i30)
Lrelax_skip_5:
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i20, 9(%i4)
	lw	%i14, 8(%i4)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f8, %f2, %f1
	slli	%i5, %i17, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.71497
	movi	%i31, 2
	jeq	%i7, %i31, then.71499
	lf	%f1, 0(%i16)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71501
	mov	%i5, %i0
	jzero	%i0, %i0, cont.71498
then.71501:
	lf	%f2, 1(%i16)
	fmul	%f5, %f2, %f4
	lf	%f2, 2(%i16)
	fma	%f5, %f2, %f3, %f5
	lf	%f2, 3(%i16)
	fma	%f2, %f2, %f8, %f5
	fmul	%f6, %f4, %f4
	lf	%f5, 0(%i10)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f3, %f3
	lf	%f5, 1(%i10)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f8
	lf	%f5, 2(%i10)
	fma	%f7, %f6, %f5, %f7
	jeq	%i9, %i0, then.71503
	fmul	%f6, %f3, %f8
	lf	%f5, 0(%i20)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f4
	lf	%f5, 1(%i20)
	fma	%f5, %f6, %f5, %f7
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i20)
	fma	%f4, %f4, %f3, %f5
	jzero	%i0, %i0, cont.71504
then.71503:
	fmov	%f4, %f7
cont.71504:
	movi	%i31, 3
	jeq	%i7, %i31, then.71505
	jzero	%i0, %i0, cont.71506
then.71505:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.71506:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71507
	jeq	%i12, %i0, then.71509
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fma	%f2, %f3, %f1, %f2
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71510
then.71509:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71510:
	movi	%i5, 1
	jzero	%i0, %i0, cont.71508
then.71507:
	mov	%i5, %i0
cont.71508:
cont.71502:
	jzero	%i0, %i0, cont.71498
then.71499:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71511
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f4
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f3, %f2
	lf	%f1, 3(%i16)
	fma	%f1, %f1, %f8, %f2
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.71512
then.71511:
	mov	%i5, %i0
cont.71512:
cont.71500:
	jzero	%i0, %i0, cont.71498
then.71497:
	lw	%i15, 244(%i0)
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i13
	mov	%i12, %i14
	mov	%i13, %i20
	mov	%i14, %i21
	fmov	%f1, %f4
	fmov	%f2, %f3
	fmov	%f3, %f8
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i5, %i30
cont.71498:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.71513
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.71514
then.71513:
	mov	%i4, %i0
cont.71514:
	jeq	%i4, %i0, then.71515
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f3, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f2, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i19)
	movi	%i31, -1
	jeq	%i4, %i31, then.71516
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i9, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i7, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i7)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i7)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i7)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71518
	movi	%i31, 2
	jeq	%i4, %i31, then.71520
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i6)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i6)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i6)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71522
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i9)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i9)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i9)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71523
then.71522:
	fmov	%f5, %f7
cont.71523:
	movi	%i31, 3
	jeq	%i4, %i31, then.71524
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71525
then.71524:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71525:
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71519
then.71520:
	lf	%f5, 0(%i6)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i6)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i6)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71521:
	jzero	%i0, %i0, cont.71519
then.71518:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71526
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71528
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i6)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71527
then.71528:
	mov	%i4, %i0
cont.71529:
	jzero	%i0, %i0, cont.71527
then.71526:
	mov	%i4, %i0
cont.71527:
	jeq	%i4, %i0, then.71530
	mov	%i4, %i8
	jzero	%i0, %i0, cont.71531
then.71530:
	ceqi	%i4, %i8, 0
cont.71531:
cont.71519:
	jeq	%i4, %i0, then.71532
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71517
then.71532:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.67716:
	slli	%i4, %i6, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71535
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i8)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i8)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i8)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71537
	movi	%i31, 2
	jeq	%i4, %i31, then.71539
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i7)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i7)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i7)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71541
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i10)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i10)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i10)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71542
then.71541:
	fmov	%f5, %f7
cont.71542:
	movi	%i31, 3
	jeq	%i4, %i31, then.71543
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71544
then.71543:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71544:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71538
then.71539:
	lf	%f5, 0(%i7)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i7)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i7)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71540:
	jzero	%i0, %i0, cont.71538
then.71537:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71545
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71547
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i7)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71546
then.71547:
	mov	%i4, %i0
cont.71548:
	jzero	%i0, %i0, cont.71546
then.71545:
	mov	%i4, %i0
cont.71546:
	jeq	%i4, %i0, then.71549
	mov	%i4, %i9
	jzero	%i0, %i0, cont.71550
then.71549:
	ceqi	%i4, %i9, 0
cont.71550:
cont.71538:
	jeq	%i4, %i0, then.71551
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67717
	set_label	%i31, loop_start.67716
	jmp	%i0, 0(%i31)
then.71551:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71552:
	set_label	%i31, loop_start.67716
	jmp	%i0, 0(%i31)
then.71535:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67717
loop_end.67717:
	mov	%i4, %i31
cont.71533:
	jzero	%i0, %i0, cont.71517
then.71516:
	movi	%i4, 1
cont.71517:
	jeq	%i4, %i0, then.71553
	movi	%i30, 1
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.71553:
	addi	%i4, %i18, 1
	mov	%i18, %i4
loop_start.67734:
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71555
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i20, 9(%i4)
	lw	%i14, 8(%i4)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f8, %f2, %f1
	slli	%i5, %i17, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.71557
	movi	%i31, 2
	jeq	%i7, %i31, then.71559
	lf	%f1, 0(%i16)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71561
	mov	%i5, %i0
	jzero	%i0, %i0, cont.71558
then.71561:
	lf	%f2, 1(%i16)
	fmul	%f5, %f2, %f4
	lf	%f2, 2(%i16)
	fma	%f5, %f2, %f3, %f5
	lf	%f2, 3(%i16)
	fma	%f2, %f2, %f8, %f5
	fmul	%f6, %f4, %f4
	lf	%f5, 0(%i10)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f3, %f3
	lf	%f5, 1(%i10)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f8
	lf	%f5, 2(%i10)
	fma	%f7, %f6, %f5, %f7
	jeq	%i9, %i0, then.71563
	fmul	%f6, %f3, %f8
	lf	%f5, 0(%i20)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f4
	lf	%f5, 1(%i20)
	fma	%f5, %f6, %f5, %f7
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i20)
	fma	%f4, %f4, %f3, %f5
	jzero	%i0, %i0, cont.71564
then.71563:
	fmov	%f4, %f7
cont.71564:
	movi	%i31, 3
	jeq	%i7, %i31, then.71565
	jzero	%i0, %i0, cont.71566
then.71565:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.71566:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71567
	jeq	%i12, %i0, then.71569
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fma	%f2, %f3, %f1, %f2
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71570
then.71569:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71570:
	movi	%i5, 1
	jzero	%i0, %i0, cont.71568
then.71567:
	mov	%i5, %i0
cont.71568:
cont.71562:
	jzero	%i0, %i0, cont.71558
then.71559:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71571
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f4
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f3, %f2
	lf	%f1, 3(%i16)
	fma	%f1, %f1, %f8, %f2
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.71572
then.71571:
	mov	%i5, %i0
cont.71572:
cont.71560:
	jzero	%i0, %i0, cont.71558
then.71557:
	lw	%i15, 244(%i0)
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i13
	mov	%i12, %i14
	mov	%i13, %i20
	mov	%i14, %i21
	fmov	%f1, %f4
	fmov	%f2, %f3
	fmov	%f3, %f8
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i5, %i30
cont.71558:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.71573
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.71574
then.71573:
	mov	%i4, %i0
cont.71574:
	jeq	%i4, %i0, then.71575
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f3, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f2, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i19)
	movi	%i31, -1
	jeq	%i4, %i31, then.71577
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i9, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i7, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i7)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i7)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i7)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71579
	movi	%i31, 2
	jeq	%i4, %i31, then.71581
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i6)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i6)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i6)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71583
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i9)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i9)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i9)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71584
then.71583:
	fmov	%f5, %f7
cont.71584:
	movi	%i31, 3
	jeq	%i4, %i31, then.71585
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71586
then.71585:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71586:
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71580
then.71581:
	lf	%f5, 0(%i6)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i6)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i6)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71582:
	jzero	%i0, %i0, cont.71580
then.71579:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71587
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71589
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i6)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71588
then.71589:
	mov	%i4, %i0
cont.71590:
	jzero	%i0, %i0, cont.71588
then.71587:
	mov	%i4, %i0
cont.71588:
	jeq	%i4, %i0, then.71591
	mov	%i4, %i8
	jzero	%i0, %i0, cont.71592
then.71591:
	ceqi	%i4, %i8, 0
cont.71592:
cont.71580:
	jeq	%i4, %i0, then.71593
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71578
then.71593:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.67755:
	slli	%i4, %i6, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71596
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i8)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i8)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i8)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71598
	movi	%i31, 2
	jeq	%i4, %i31, then.71600
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i7)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i7)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i7)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71602
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i10)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i10)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i10)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71603
then.71602:
	fmov	%f5, %f7
cont.71603:
	movi	%i31, 3
	jeq	%i4, %i31, then.71604
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71605
then.71604:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71605:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71599
then.71600:
	lf	%f5, 0(%i7)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i7)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i7)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71601:
	jzero	%i0, %i0, cont.71599
then.71598:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71606
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71608
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i7)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71607
then.71608:
	mov	%i4, %i0
cont.71609:
	jzero	%i0, %i0, cont.71607
then.71606:
	mov	%i4, %i0
cont.71607:
	jeq	%i4, %i0, then.71610
	mov	%i4, %i9
	jzero	%i0, %i0, cont.71611
then.71610:
	ceqi	%i4, %i9, 0
cont.71611:
cont.71599:
	jeq	%i4, %i0, then.71612
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67756
	set_label	%i31, loop_start.67755
	jmp	%i0, 0(%i31)
then.71612:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71613:
	set_label	%i31, loop_start.67755
	jmp	%i0, 0(%i31)
then.71596:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67756
loop_end.67756:
	mov	%i4, %i31
cont.71594:
	jzero	%i0, %i0, cont.71578
then.71577:
	movi	%i4, 1
cont.71578:
	jeq	%i4, %i0, then.71614
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67735
	set_label	%i31, loop_start.67734
	jmp	%i0, 0(%i31)
then.71614:
	addi	%i18, %i18, 1
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71616
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i20, 9(%i4)
	lw	%i14, 8(%i4)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f8, %f2, %f1
	slli	%i5, %i17, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.71618
	movi	%i31, 2
	jeq	%i7, %i31, then.71620
	lf	%f1, 0(%i16)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71622
	mov	%i5, %i0
	jzero	%i0, %i0, cont.71619
then.71622:
	lf	%f2, 1(%i16)
	fmul	%f5, %f2, %f4
	lf	%f2, 2(%i16)
	fma	%f5, %f2, %f3, %f5
	lf	%f2, 3(%i16)
	fma	%f2, %f2, %f8, %f5
	fmul	%f6, %f4, %f4
	lf	%f5, 0(%i10)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f3, %f3
	lf	%f5, 1(%i10)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f8
	lf	%f5, 2(%i10)
	fma	%f7, %f6, %f5, %f7
	jeq	%i9, %i0, then.71624
	fmul	%f6, %f3, %f8
	lf	%f5, 0(%i20)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f4
	lf	%f5, 1(%i20)
	fma	%f5, %f6, %f5, %f7
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i20)
	fma	%f4, %f4, %f3, %f5
	jzero	%i0, %i0, cont.71625
then.71624:
	fmov	%f4, %f7
cont.71625:
	movi	%i31, 3
	jeq	%i7, %i31, then.71626
	jzero	%i0, %i0, cont.71627
then.71626:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.71627:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71628
	jeq	%i12, %i0, then.71630
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fma	%f2, %f3, %f1, %f2
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71631
then.71630:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71631:
	movi	%i5, 1
	jzero	%i0, %i0, cont.71629
then.71628:
	mov	%i5, %i0
cont.71629:
cont.71623:
	jzero	%i0, %i0, cont.71619
then.71620:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71632
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f4
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f3, %f2
	lf	%f1, 3(%i16)
	fma	%f1, %f1, %f8, %f2
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.71633
then.71632:
	mov	%i5, %i0
cont.71633:
cont.71621:
	jzero	%i0, %i0, cont.71619
then.71618:
	lw	%i15, 244(%i0)
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i13
	mov	%i12, %i14
	mov	%i13, %i20
	mov	%i14, %i21
	fmov	%f1, %f4
	fmov	%f2, %f3
	fmov	%f3, %f8
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i5, %i30
cont.71619:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.71634
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.71635
then.71634:
	mov	%i4, %i0
cont.71635:
	jeq	%i4, %i0, then.71636
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f3, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f2, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i19)
	movi	%i31, -1
	jeq	%i4, %i31, then.71638
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i9, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i7, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i7)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i7)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i7)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71640
	movi	%i31, 2
	jeq	%i4, %i31, then.71642
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i6)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i6)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i6)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71644
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i9)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i9)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i9)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71645
then.71644:
	fmov	%f5, %f7
cont.71645:
	movi	%i31, 3
	jeq	%i4, %i31, then.71646
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71647
then.71646:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71647:
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71641
then.71642:
	lf	%f5, 0(%i6)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i6)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i6)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71643:
	jzero	%i0, %i0, cont.71641
then.71640:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71648
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71650
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i6)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71649
then.71650:
	mov	%i4, %i0
cont.71651:
	jzero	%i0, %i0, cont.71649
then.71648:
	mov	%i4, %i0
cont.71649:
	jeq	%i4, %i0, then.71652
	mov	%i4, %i8
	jzero	%i0, %i0, cont.71653
then.71652:
	ceqi	%i4, %i8, 0
cont.71653:
cont.71641:
	jeq	%i4, %i0, then.71654
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71639
then.71654:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.67792:
	slli	%i4, %i6, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71657
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i8)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i8)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i8)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71659
	movi	%i31, 2
	jeq	%i4, %i31, then.71661
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i7)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i7)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i7)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71663
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i10)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i10)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i10)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71664
then.71663:
	fmov	%f5, %f7
cont.71664:
	movi	%i31, 3
	jeq	%i4, %i31, then.71665
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71666
then.71665:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71666:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71660
then.71661:
	lf	%f5, 0(%i7)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i7)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i7)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71662:
	jzero	%i0, %i0, cont.71660
then.71659:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71667
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71669
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i7)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71668
then.71669:
	mov	%i4, %i0
cont.71670:
	jzero	%i0, %i0, cont.71668
then.71667:
	mov	%i4, %i0
cont.71668:
	jeq	%i4, %i0, then.71671
	mov	%i4, %i9
	jzero	%i0, %i0, cont.71672
then.71671:
	ceqi	%i4, %i9, 0
cont.71672:
cont.71660:
	jeq	%i4, %i0, then.71673
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67793
	set_label	%i31, loop_start.67792
	jmp	%i0, 0(%i31)
then.71673:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71674:
	set_label	%i31, loop_start.67792
	jmp	%i0, 0(%i31)
then.71657:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67793
loop_end.67793:
	mov	%i4, %i31
cont.71655:
	jzero	%i0, %i0, cont.71639
then.71638:
	movi	%i4, 1
cont.71639:
	jeq	%i4, %i0, then.71675
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67735
	jzero	%i0, %i0, cont.71617
then.71675:
	addi	%i4, %i18, 1
	mov	%i18, %i4
cont.71676:
	jzero	%i0, %i0, cont.71617
then.71636:
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71677
	addi	%i4, %i18, 1
	mov	%i18, %i4
	jzero	%i0, %i0, cont.71678
then.71677:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67735
cont.71678:
cont.71637:
	jzero	%i0, %i0, cont.71617
then.71616:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67735
cont.71617:
cont.71615:
	set_label	%i31, loop_start.67734
	jmp	%i0, 0(%i31)
then.71575:
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71679
	addi	%i4, %i18, 1
	mov	%i18, %i4
	jzero	%i0, %i0, cont.71680
then.71679:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67735
cont.71680:
cont.71576:
	set_label	%i31, loop_start.67734
	jmp	%i0, 0(%i31)
then.71555:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67735
loop_end.67735:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.71515:
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71681
	addi	%i4, %i18, 1
	mov	%i18, %i4
loop_start.67817:
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71683
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i20, 9(%i4)
	lw	%i14, 8(%i4)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f8, %f2, %f1
	slli	%i5, %i17, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.71685
	movi	%i31, 2
	jeq	%i7, %i31, then.71687
	lf	%f1, 0(%i16)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71689
	mov	%i5, %i0
	jzero	%i0, %i0, cont.71686
then.71689:
	lf	%f2, 1(%i16)
	fmul	%f5, %f2, %f4
	lf	%f2, 2(%i16)
	fma	%f5, %f2, %f3, %f5
	lf	%f2, 3(%i16)
	fma	%f2, %f2, %f8, %f5
	fmul	%f6, %f4, %f4
	lf	%f5, 0(%i10)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f3, %f3
	lf	%f5, 1(%i10)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f8
	lf	%f5, 2(%i10)
	fma	%f7, %f6, %f5, %f7
	jeq	%i9, %i0, then.71691
	fmul	%f6, %f3, %f8
	lf	%f5, 0(%i20)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f4
	lf	%f5, 1(%i20)
	fma	%f5, %f6, %f5, %f7
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i20)
	fma	%f4, %f4, %f3, %f5
	jzero	%i0, %i0, cont.71692
then.71691:
	fmov	%f4, %f7
cont.71692:
	movi	%i31, 3
	jeq	%i7, %i31, then.71693
	jzero	%i0, %i0, cont.71694
then.71693:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.71694:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71695
	jeq	%i12, %i0, then.71697
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fma	%f2, %f3, %f1, %f2
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71698
then.71697:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71698:
	movi	%i5, 1
	jzero	%i0, %i0, cont.71696
then.71695:
	mov	%i5, %i0
cont.71696:
cont.71690:
	jzero	%i0, %i0, cont.71686
then.71687:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71699
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f4
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f3, %f2
	lf	%f1, 3(%i16)
	fma	%f1, %f1, %f8, %f2
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.71700
then.71699:
	mov	%i5, %i0
cont.71700:
cont.71688:
	jzero	%i0, %i0, cont.71686
then.71685:
	lw	%i15, 244(%i0)
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i13
	mov	%i12, %i14
	mov	%i13, %i20
	mov	%i14, %i21
	fmov	%f1, %f4
	fmov	%f2, %f3
	fmov	%f3, %f8
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i5, %i30
cont.71686:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.71701
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.71702
then.71701:
	mov	%i4, %i0
cont.71702:
	jeq	%i4, %i0, then.71703
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f3, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f2, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i19)
	movi	%i31, -1
	jeq	%i4, %i31, then.71705
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i9, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i7, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i7)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i7)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i7)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71707
	movi	%i31, 2
	jeq	%i4, %i31, then.71709
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i6)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i6)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i6)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71711
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i9)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i9)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i9)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71712
then.71711:
	fmov	%f5, %f7
cont.71712:
	movi	%i31, 3
	jeq	%i4, %i31, then.71713
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71714
then.71713:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71714:
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71708
then.71709:
	lf	%f5, 0(%i6)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i6)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i6)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71710:
	jzero	%i0, %i0, cont.71708
then.71707:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71715
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71717
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i6)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71716
then.71717:
	mov	%i4, %i0
cont.71718:
	jzero	%i0, %i0, cont.71716
then.71715:
	mov	%i4, %i0
cont.71716:
	jeq	%i4, %i0, then.71719
	mov	%i4, %i8
	jzero	%i0, %i0, cont.71720
then.71719:
	ceqi	%i4, %i8, 0
cont.71720:
cont.71708:
	jeq	%i4, %i0, then.71721
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71706
then.71721:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.67838:
	slli	%i4, %i6, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71724
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i8)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i8)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i8)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71726
	movi	%i31, 2
	jeq	%i4, %i31, then.71728
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i7)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i7)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i7)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71730
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i10)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i10)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i10)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71731
then.71730:
	fmov	%f5, %f7
cont.71731:
	movi	%i31, 3
	jeq	%i4, %i31, then.71732
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71733
then.71732:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71733:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71727
then.71728:
	lf	%f5, 0(%i7)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i7)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i7)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71729:
	jzero	%i0, %i0, cont.71727
then.71726:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71734
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71736
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i7)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71735
then.71736:
	mov	%i4, %i0
cont.71737:
	jzero	%i0, %i0, cont.71735
then.71734:
	mov	%i4, %i0
cont.71735:
	jeq	%i4, %i0, then.71738
	mov	%i4, %i9
	jzero	%i0, %i0, cont.71739
then.71738:
	ceqi	%i4, %i9, 0
cont.71739:
cont.71727:
	jeq	%i4, %i0, then.71740
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67839
	set_label	%i31, loop_start.67838
	jmp	%i0, 0(%i31)
then.71740:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71741:
	set_label	%i31, loop_start.67838
	jmp	%i0, 0(%i31)
then.71724:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67839
loop_end.67839:
	mov	%i4, %i31
cont.71722:
	jzero	%i0, %i0, cont.71706
then.71705:
	movi	%i4, 1
cont.71706:
	jeq	%i4, %i0, then.71742
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67818
	set_label	%i31, loop_start.67817
	jmp	%i0, 0(%i31)
then.71742:
	addi	%i18, %i18, 1
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71744
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i20, 9(%i4)
	lw	%i14, 8(%i4)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f8, %f2, %f1
	slli	%i5, %i17, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.71746
	movi	%i31, 2
	jeq	%i7, %i31, then.71748
	lf	%f1, 0(%i16)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71750
	mov	%i5, %i0
	jzero	%i0, %i0, cont.71747
then.71750:
	lf	%f2, 1(%i16)
	fmul	%f5, %f2, %f4
	lf	%f2, 2(%i16)
	fma	%f5, %f2, %f3, %f5
	lf	%f2, 3(%i16)
	fma	%f2, %f2, %f8, %f5
	fmul	%f6, %f4, %f4
	lf	%f5, 0(%i10)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f3, %f3
	lf	%f5, 1(%i10)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f8
	lf	%f5, 2(%i10)
	fma	%f7, %f6, %f5, %f7
	jeq	%i9, %i0, then.71752
	fmul	%f6, %f3, %f8
	lf	%f5, 0(%i20)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f4
	lf	%f5, 1(%i20)
	fma	%f5, %f6, %f5, %f7
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i20)
	fma	%f4, %f4, %f3, %f5
	jzero	%i0, %i0, cont.71753
then.71752:
	fmov	%f4, %f7
cont.71753:
	movi	%i31, 3
	jeq	%i7, %i31, then.71754
	jzero	%i0, %i0, cont.71755
then.71754:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.71755:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71756
	jeq	%i12, %i0, then.71758
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fma	%f2, %f3, %f1, %f2
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71759
then.71758:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71759:
	movi	%i5, 1
	jzero	%i0, %i0, cont.71757
then.71756:
	mov	%i5, %i0
cont.71757:
cont.71751:
	jzero	%i0, %i0, cont.71747
then.71748:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71760
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f4
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f3, %f2
	lf	%f1, 3(%i16)
	fma	%f1, %f1, %f8, %f2
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.71761
then.71760:
	mov	%i5, %i0
cont.71761:
cont.71749:
	jzero	%i0, %i0, cont.71747
then.71746:
	lw	%i15, 244(%i0)
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i13
	mov	%i12, %i14
	mov	%i13, %i20
	mov	%i14, %i21
	fmov	%f1, %f4
	fmov	%f2, %f3
	fmov	%f3, %f8
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i5, %i30
cont.71747:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.71762
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.71763
then.71762:
	mov	%i4, %i0
cont.71763:
	jeq	%i4, %i0, then.71764
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f3, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f2, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i19)
	movi	%i31, -1
	jeq	%i4, %i31, then.71766
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i9, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i7, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i7)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i7)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i7)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71768
	movi	%i31, 2
	jeq	%i4, %i31, then.71770
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i6)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i6)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i6)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71772
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i9)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i9)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i9)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71773
then.71772:
	fmov	%f5, %f7
cont.71773:
	movi	%i31, 3
	jeq	%i4, %i31, then.71774
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71775
then.71774:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71775:
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71769
then.71770:
	lf	%f5, 0(%i6)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i6)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i6)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71771:
	jzero	%i0, %i0, cont.71769
then.71768:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71776
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i6)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71778
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i6)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71777
then.71778:
	mov	%i4, %i0
cont.71779:
	jzero	%i0, %i0, cont.71777
then.71776:
	mov	%i4, %i0
cont.71777:
	jeq	%i4, %i0, then.71780
	mov	%i4, %i8
	jzero	%i0, %i0, cont.71781
then.71780:
	ceqi	%i4, %i8, 0
cont.71781:
cont.71769:
	jeq	%i4, %i0, then.71782
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71767
then.71782:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.67875:
	slli	%i4, %i6, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71785
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i8)
	fsub	%f9, %f4, %f1
	lf	%f1, 1(%i8)
	fsub	%f8, %f3, %f1
	lf	%f1, 2(%i8)
	fsub	%f1, %f2, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71787
	movi	%i31, 2
	jeq	%i4, %i31, then.71789
	fmul	%f6, %f9, %f9
	lf	%f5, 0(%i7)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f8, %f8
	lf	%f5, 1(%i7)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f1, %f1
	lf	%f5, 2(%i7)
	fma	%f7, %f6, %f5, %f7
	jeq	%i5, %i0, then.71791
	fmul	%f6, %f8, %f1
	lf	%f5, 0(%i10)
	fma	%f6, %f6, %f5, %f7
	fmul	%f5, %f1, %f9
	lf	%f1, 1(%i10)
	fma	%f6, %f5, %f1, %f6
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i10)
	fma	%f5, %f5, %f1, %f6
	jzero	%i0, %i0, cont.71792
then.71791:
	fmov	%f5, %f7
cont.71792:
	movi	%i31, 3
	jeq	%i4, %i31, then.71793
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71794
then.71793:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71794:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71788
then.71789:
	lf	%f5, 0(%i7)
	fmul	%f6, %f5, %f9
	lf	%f5, 1(%i7)
	fma	%f6, %f5, %f8, %f6
	lf	%f5, 2(%i7)
	fma	%f1, %f5, %f1, %f6
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.71790:
	jzero	%i0, %i0, cont.71788
then.71787:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f9
	lf	%f5, 0(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71795
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f8
	lf	%f5, 1(%i7)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71797
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i7)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71796
then.71797:
	mov	%i4, %i0
cont.71798:
	jzero	%i0, %i0, cont.71796
then.71795:
	mov	%i4, %i0
cont.71796:
	jeq	%i4, %i0, then.71799
	mov	%i4, %i9
	jzero	%i0, %i0, cont.71800
then.71799:
	ceqi	%i4, %i9, 0
cont.71800:
cont.71788:
	jeq	%i4, %i0, then.71801
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67876
	set_label	%i31, loop_start.67875
	jmp	%i0, 0(%i31)
then.71801:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71802:
	set_label	%i31, loop_start.67875
	jmp	%i0, 0(%i31)
then.71785:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67876
loop_end.67876:
	mov	%i4, %i31
cont.71783:
	jzero	%i0, %i0, cont.71767
then.71766:
	movi	%i4, 1
cont.71767:
	jeq	%i4, %i0, then.71803
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67818
	jzero	%i0, %i0, cont.71745
then.71803:
	addi	%i4, %i18, 1
	mov	%i18, %i4
cont.71804:
	jzero	%i0, %i0, cont.71745
then.71764:
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71805
	addi	%i4, %i18, 1
	mov	%i18, %i4
	jzero	%i0, %i0, cont.71806
then.71805:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67818
cont.71806:
cont.71765:
	jzero	%i0, %i0, cont.71745
then.71744:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67818
cont.71745:
cont.71743:
	set_label	%i31, loop_start.67817
	jmp	%i0, 0(%i31)
then.71703:
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71807
	addi	%i4, %i18, 1
	mov	%i18, %i4
	jzero	%i0, %i0, cont.71808
then.71807:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67818
cont.71808:
cont.71704:
	set_label	%i31, loop_start.67817
	jmp	%i0, 0(%i31)
then.71683:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67818
loop_end.67818:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.71681:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.71496:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
shadow_check_one_or_matrix.3002:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i19, %i4
	mov	%i18, %i5
	slli	%i4, %i19, 2
	add	%i31, %i18, %i4
	lw	%i17, 0(%i31)
	lw	%i15, 0(%i17)
	movi	%i31, -1
	ceq	%i30, %i15, %i31
	jzero	%i0, %i30, Lrelax_skip_6
	set_label	%i30, then.71809
	jmp	%i0, 0(%i30)
Lrelax_skip_6:
	movi	%i31, 99
	jeq	%i15, %i31, then.71810
	slli	%i5, %i15, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i20, 9(%i4)
	lw	%i14, 8(%i4)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f8, %f2, %f1
	slli	%i5, %i15, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.71812
	movi	%i31, 2
	jeq	%i7, %i31, then.71814
	lf	%f1, 0(%i16)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71816
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71813
then.71816:
	lf	%f2, 1(%i16)
	fmul	%f5, %f2, %f4
	lf	%f2, 2(%i16)
	fma	%f5, %f2, %f3, %f5
	lf	%f2, 3(%i16)
	fma	%f2, %f2, %f8, %f5
	fmul	%f6, %f4, %f4
	lf	%f5, 0(%i10)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f3, %f3
	lf	%f5, 1(%i10)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f8
	lf	%f5, 2(%i10)
	fma	%f7, %f6, %f5, %f7
	jeq	%i9, %i0, then.71818
	fmul	%f6, %f3, %f8
	lf	%f5, 0(%i20)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f4
	lf	%f5, 1(%i20)
	fma	%f5, %f6, %f5, %f7
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i20)
	fma	%f4, %f4, %f3, %f5
	jzero	%i0, %i0, cont.71819
then.71818:
	fmov	%f4, %f7
cont.71819:
	movi	%i31, 3
	jeq	%i7, %i31, then.71820
	jzero	%i0, %i0, cont.71821
then.71820:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.71821:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71822
	jeq	%i12, %i0, then.71824
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fma	%f2, %f3, %f1, %f2
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71825
then.71824:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71825:
	movi	%i4, 1
	jzero	%i0, %i0, cont.71823
then.71822:
	mov	%i4, %i0
cont.71823:
cont.71817:
	jzero	%i0, %i0, cont.71813
then.71814:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71826
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f4
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f3, %f2
	lf	%f1, 3(%i16)
	fma	%f1, %f1, %f8, %f2
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71827
then.71826:
	mov	%i4, %i0
cont.71827:
cont.71815:
	jzero	%i0, %i0, cont.71813
then.71812:
	lw	%i15, 244(%i0)
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i13
	mov	%i12, %i14
	mov	%i13, %i20
	mov	%i14, %i21
	fmov	%f1, %f4
	fmov	%f2, %f3
	fmov	%f3, %f8
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.71813:
	jeq	%i4, %i0, then.71828
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.71830
	movi	%i6, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.71832
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71834
	movi	%i4, 1
	jzero	%i0, %i0, cont.71833
then.71834:
	movi	%i4, 2
	mov	%i6, %i4
loop_start.67905:
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71837
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71839
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	set_label	%i31, loop_start.67905
	jmp	%i0, 0(%i31)
then.71839:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71841
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71843
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71842
then.71843:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71845
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71847
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71846
then.71847:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71849
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71851
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71850
then.71851:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71853
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71855
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71854
then.71855:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71857
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71859
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71858
then.71859:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71861
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71863
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71862
then.71863:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71865
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71867
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71866
then.71867:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71869
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71871
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71870
then.71871:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71873
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71875
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71874
then.71875:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71877
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71879
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71878
then.71879:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71881
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71883
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71882
then.71883:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71885
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71887
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71886
then.71887:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71889
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71891
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71890
then.71891:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71893
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71895
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71894
then.71895:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71897
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71899
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67906
	jzero	%i0, %i0, cont.71898
then.71899:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71900:
	jzero	%i0, %i0, cont.71898
then.71897:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71898:
cont.71896:
	jzero	%i0, %i0, cont.71894
then.71893:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71894:
cont.71892:
	jzero	%i0, %i0, cont.71890
then.71889:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71890:
cont.71888:
	jzero	%i0, %i0, cont.71886
then.71885:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71886:
cont.71884:
	jzero	%i0, %i0, cont.71882
then.71881:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71882:
cont.71880:
	jzero	%i0, %i0, cont.71878
then.71877:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71878:
cont.71876:
	jzero	%i0, %i0, cont.71874
then.71873:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71874:
cont.71872:
	jzero	%i0, %i0, cont.71870
then.71869:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71870:
cont.71868:
	jzero	%i0, %i0, cont.71866
then.71865:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71866:
cont.71864:
	jzero	%i0, %i0, cont.71862
then.71861:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71862:
cont.71860:
	jzero	%i0, %i0, cont.71858
then.71857:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71858:
cont.71856:
	jzero	%i0, %i0, cont.71854
then.71853:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71854:
cont.71852:
	jzero	%i0, %i0, cont.71850
then.71849:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71850:
cont.71848:
	jzero	%i0, %i0, cont.71846
then.71845:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71846:
cont.71844:
	jzero	%i0, %i0, cont.71842
then.71841:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
cont.71842:
cont.71840:
	set_label	%i31, loop_start.67905
	jmp	%i0, 0(%i31)
then.71837:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67906
loop_end.67906:
	mov	%i4, %i31
cont.71835:
	jzero	%i0, %i0, cont.71833
then.71832:
	mov	%i4, %i0
cont.71833:
	jzero	%i0, %i0, cont.71811
then.71830:
	mov	%i4, %i0
cont.71831:
	jzero	%i0, %i0, cont.71811
then.71828:
	mov	%i4, %i0
cont.71829:
	jzero	%i0, %i0, cont.71811
then.71810:
	movi	%i4, 1
cont.71811:
	ceq	%i30, %i4, %i0
	jzero	%i0, %i30, Lrelax_skip_7
	set_label	%i30, then.71901
	jmp	%i0, 0(%i30)
Lrelax_skip_7:
	movi	%i6, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.71902
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71904
	movi	%i4, 1
	jzero	%i0, %i0, cont.71903
then.71904:
	movi	%i4, 2
	mov	%i6, %i4
loop_start.67942:
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71907
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71909
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	set_label	%i31, loop_start.67942
	jmp	%i0, 0(%i31)
then.71909:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71911
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71913
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71912
then.71913:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71915
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71917
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71916
then.71917:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71919
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71921
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71920
then.71921:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71923
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71925
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71924
then.71925:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71927
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71929
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71928
then.71929:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71931
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71933
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71932
then.71933:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71935
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71937
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71936
then.71937:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71939
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71941
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71940
then.71941:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71943
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71945
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71944
then.71945:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71947
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71949
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71948
then.71949:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71951
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71953
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71952
then.71953:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71955
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71957
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71956
then.71957:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71959
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71961
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71960
then.71961:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71963
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71965
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71964
then.71965:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71967
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71969
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67943
	jzero	%i0, %i0, cont.71968
then.71969:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71970:
	jzero	%i0, %i0, cont.71968
then.71967:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71968:
cont.71966:
	jzero	%i0, %i0, cont.71964
then.71963:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71964:
cont.71962:
	jzero	%i0, %i0, cont.71960
then.71959:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71960:
cont.71958:
	jzero	%i0, %i0, cont.71956
then.71955:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71956:
cont.71954:
	jzero	%i0, %i0, cont.71952
then.71951:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71952:
cont.71950:
	jzero	%i0, %i0, cont.71948
then.71947:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71948:
cont.71946:
	jzero	%i0, %i0, cont.71944
then.71943:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71944:
cont.71942:
	jzero	%i0, %i0, cont.71940
then.71939:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71940:
cont.71938:
	jzero	%i0, %i0, cont.71936
then.71935:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71936:
cont.71934:
	jzero	%i0, %i0, cont.71932
then.71931:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71932:
cont.71930:
	jzero	%i0, %i0, cont.71928
then.71927:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71928:
cont.71926:
	jzero	%i0, %i0, cont.71924
then.71923:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71924:
cont.71922:
	jzero	%i0, %i0, cont.71920
then.71919:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71920:
cont.71918:
	jzero	%i0, %i0, cont.71916
then.71915:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71916:
cont.71914:
	jzero	%i0, %i0, cont.71912
then.71911:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
cont.71912:
cont.71910:
	set_label	%i31, loop_start.67942
	jmp	%i0, 0(%i31)
then.71907:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67943
loop_end.67943:
	mov	%i4, %i31
cont.71905:
	jzero	%i0, %i0, cont.71903
then.71902:
	mov	%i4, %i0
cont.71903:
	jeq	%i4, %i0, then.71971
	movi	%i30, 1
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.71971:
	addi	%i4, %i19, 1
	mov	%i19, %i4
loop_start.67978:
	slli	%i4, %i19, 2
	add	%i31, %i18, %i4
	lw	%i17, 0(%i31)
	lw	%i15, 0(%i17)
	movi	%i31, -1
	jeq	%i15, %i31, then.71973
	movi	%i31, 99
	jeq	%i15, %i31, then.71975
	slli	%i5, %i15, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i20, 9(%i4)
	lw	%i14, 8(%i4)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f8, %f2, %f1
	slli	%i5, %i15, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.71977
	movi	%i31, 2
	jeq	%i7, %i31, then.71979
	lf	%f1, 0(%i16)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71981
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71978
then.71981:
	lf	%f2, 1(%i16)
	fmul	%f5, %f2, %f4
	lf	%f2, 2(%i16)
	fma	%f5, %f2, %f3, %f5
	lf	%f2, 3(%i16)
	fma	%f2, %f2, %f8, %f5
	fmul	%f6, %f4, %f4
	lf	%f5, 0(%i10)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f3, %f3
	lf	%f5, 1(%i10)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f8
	lf	%f5, 2(%i10)
	fma	%f7, %f6, %f5, %f7
	jeq	%i9, %i0, then.71983
	fmul	%f6, %f3, %f8
	lf	%f5, 0(%i20)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f4
	lf	%f5, 1(%i20)
	fma	%f5, %f6, %f5, %f7
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i20)
	fma	%f4, %f4, %f3, %f5
	jzero	%i0, %i0, cont.71984
then.71983:
	fmov	%f4, %f7
cont.71984:
	movi	%i31, 3
	jeq	%i7, %i31, then.71985
	jzero	%i0, %i0, cont.71986
then.71985:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.71986:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71987
	jeq	%i12, %i0, then.71989
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fma	%f2, %f3, %f1, %f2
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71990
then.71989:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71990:
	movi	%i4, 1
	jzero	%i0, %i0, cont.71988
then.71987:
	mov	%i4, %i0
cont.71988:
cont.71982:
	jzero	%i0, %i0, cont.71978
then.71979:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71991
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f4
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f3, %f2
	lf	%f1, 3(%i16)
	fma	%f1, %f1, %f8, %f2
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71992
then.71991:
	mov	%i4, %i0
cont.71992:
cont.71980:
	jzero	%i0, %i0, cont.71978
then.71977:
	lw	%i15, 244(%i0)
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i13
	mov	%i12, %i14
	mov	%i13, %i20
	mov	%i14, %i21
	fmov	%f1, %f4
	fmov	%f2, %f3
	fmov	%f3, %f8
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.71978:
	jeq	%i4, %i0, then.71993
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.71995
	movi	%i6, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.71997
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.71999
	movi	%i4, 1
	jzero	%i0, %i0, cont.71998
then.71999:
	movi	%i4, 2
	mov	%i6, %i4
loop_start.67986:
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72002
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72004
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	set_label	%i31, loop_start.67986
	jmp	%i0, 0(%i31)
then.72004:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72006
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72008
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72007
then.72008:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72010
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72012
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72011
then.72012:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72014
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72016
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72015
then.72016:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72018
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72020
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72019
then.72020:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72022
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72024
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72023
then.72024:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72026
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72028
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72027
then.72028:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72030
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72032
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72031
then.72032:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72034
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72036
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72035
then.72036:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72038
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72040
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72039
then.72040:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72042
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72044
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72043
then.72044:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72046
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72048
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72047
then.72048:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72050
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72052
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72051
then.72052:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72054
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72056
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72055
then.72056:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72058
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72060
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72059
then.72060:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72062
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72064
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67987
	jzero	%i0, %i0, cont.72063
then.72064:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72065:
	jzero	%i0, %i0, cont.72063
then.72062:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72063:
cont.72061:
	jzero	%i0, %i0, cont.72059
then.72058:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72059:
cont.72057:
	jzero	%i0, %i0, cont.72055
then.72054:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72055:
cont.72053:
	jzero	%i0, %i0, cont.72051
then.72050:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72051:
cont.72049:
	jzero	%i0, %i0, cont.72047
then.72046:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72047:
cont.72045:
	jzero	%i0, %i0, cont.72043
then.72042:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72043:
cont.72041:
	jzero	%i0, %i0, cont.72039
then.72038:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72039:
cont.72037:
	jzero	%i0, %i0, cont.72035
then.72034:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72035:
cont.72033:
	jzero	%i0, %i0, cont.72031
then.72030:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72031:
cont.72029:
	jzero	%i0, %i0, cont.72027
then.72026:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72027:
cont.72025:
	jzero	%i0, %i0, cont.72023
then.72022:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72023:
cont.72021:
	jzero	%i0, %i0, cont.72019
then.72018:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72019:
cont.72017:
	jzero	%i0, %i0, cont.72015
then.72014:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72015:
cont.72013:
	jzero	%i0, %i0, cont.72011
then.72010:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72011:
cont.72009:
	jzero	%i0, %i0, cont.72007
then.72006:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
cont.72007:
cont.72005:
	set_label	%i31, loop_start.67986
	jmp	%i0, 0(%i31)
then.72002:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67987
loop_end.67987:
	mov	%i4, %i31
cont.72000:
	jzero	%i0, %i0, cont.71998
then.71997:
	mov	%i4, %i0
cont.71998:
	jzero	%i0, %i0, cont.71976
then.71995:
	mov	%i4, %i0
cont.71996:
	jzero	%i0, %i0, cont.71976
then.71993:
	mov	%i4, %i0
cont.71994:
	jzero	%i0, %i0, cont.71976
then.71975:
	movi	%i4, 1
cont.71976:
	jeq	%i4, %i0, then.72066
	movi	%i6, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.72068
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72070
	movi	%i4, 1
	jzero	%i0, %i0, cont.72069
then.72070:
	movi	%i4, 2
	mov	%i6, %i4
loop_start.68023:
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72073
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72075
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	set_label	%i31, loop_start.68023
	jmp	%i0, 0(%i31)
then.72075:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72077
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72079
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72078
then.72079:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72081
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72083
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72082
then.72083:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72085
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72087
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72086
then.72087:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72089
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72091
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72090
then.72091:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72093
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72095
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72094
then.72095:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72097
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72099
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72098
then.72099:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72101
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72103
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72102
then.72103:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72105
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72107
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72106
then.72107:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72109
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72111
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72110
then.72111:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72113
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72115
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72114
then.72115:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72117
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72119
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72118
then.72119:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72121
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72123
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72122
then.72123:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72125
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72127
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72126
then.72127:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72129
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72131
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72130
then.72131:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72133
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72135
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68024
	jzero	%i0, %i0, cont.72134
then.72135:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72136:
	jzero	%i0, %i0, cont.72134
then.72133:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72134:
cont.72132:
	jzero	%i0, %i0, cont.72130
then.72129:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72130:
cont.72128:
	jzero	%i0, %i0, cont.72126
then.72125:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72126:
cont.72124:
	jzero	%i0, %i0, cont.72122
then.72121:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72122:
cont.72120:
	jzero	%i0, %i0, cont.72118
then.72117:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72118:
cont.72116:
	jzero	%i0, %i0, cont.72114
then.72113:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72114:
cont.72112:
	jzero	%i0, %i0, cont.72110
then.72109:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72110:
cont.72108:
	jzero	%i0, %i0, cont.72106
then.72105:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72106:
cont.72104:
	jzero	%i0, %i0, cont.72102
then.72101:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72102:
cont.72100:
	jzero	%i0, %i0, cont.72098
then.72097:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72098:
cont.72096:
	jzero	%i0, %i0, cont.72094
then.72093:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72094:
cont.72092:
	jzero	%i0, %i0, cont.72090
then.72089:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72090:
cont.72088:
	jzero	%i0, %i0, cont.72086
then.72085:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72086:
cont.72084:
	jzero	%i0, %i0, cont.72082
then.72081:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72082:
cont.72080:
	jzero	%i0, %i0, cont.72078
then.72077:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
cont.72078:
cont.72076:
	set_label	%i31, loop_start.68023
	jmp	%i0, 0(%i31)
then.72073:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68024
loop_end.68024:
	mov	%i4, %i31
cont.72071:
	jzero	%i0, %i0, cont.72069
then.72068:
	mov	%i4, %i0
cont.72069:
	jeq	%i4, %i0, then.72137
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.67979
	set_label	%i31, loop_start.67978
	jmp	%i0, 0(%i31)
then.72137:
	addi	%i4, %i19, 1
	mov	%i19, %i4
cont.72138:
	set_label	%i31, loop_start.67978
	jmp	%i0, 0(%i31)
then.72066:
	addi	%i4, %i19, 1
	mov	%i19, %i4
cont.72067:
	set_label	%i31, loop_start.67978
	jmp	%i0, 0(%i31)
then.71973:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67979
loop_end.67979:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.71901:
	addi	%i4, %i19, 1
	mov	%i19, %i4
loop_start.68062:
	slli	%i4, %i19, 2
	add	%i31, %i18, %i4
	lw	%i17, 0(%i31)
	lw	%i15, 0(%i17)
	movi	%i31, -1
	jeq	%i15, %i31, then.72140
	movi	%i31, 99
	jeq	%i15, %i31, then.72142
	slli	%i5, %i15, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i20, 9(%i4)
	lw	%i14, 8(%i4)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f8, %f2, %f1
	slli	%i5, %i15, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.72144
	movi	%i31, 2
	jeq	%i7, %i31, then.72146
	lf	%f1, 0(%i16)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72148
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72145
then.72148:
	lf	%f2, 1(%i16)
	fmul	%f5, %f2, %f4
	lf	%f2, 2(%i16)
	fma	%f5, %f2, %f3, %f5
	lf	%f2, 3(%i16)
	fma	%f2, %f2, %f8, %f5
	fmul	%f6, %f4, %f4
	lf	%f5, 0(%i10)
	fmul	%f7, %f6, %f5
	fmul	%f6, %f3, %f3
	lf	%f5, 1(%i10)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f8
	lf	%f5, 2(%i10)
	fma	%f7, %f6, %f5, %f7
	jeq	%i9, %i0, then.72150
	fmul	%f6, %f3, %f8
	lf	%f5, 0(%i20)
	fma	%f7, %f6, %f5, %f7
	fmul	%f6, %f8, %f4
	lf	%f5, 1(%i20)
	fma	%f5, %f6, %f5, %f7
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i20)
	fma	%f4, %f4, %f3, %f5
	jzero	%i0, %i0, cont.72151
then.72150:
	fmov	%f4, %f7
cont.72151:
	movi	%i31, 3
	jeq	%i7, %i31, then.72152
	jzero	%i0, %i0, cont.72153
then.72152:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.72153:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72154
	jeq	%i12, %i0, then.72156
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fma	%f2, %f3, %f1, %f2
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72157
then.72156:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72157:
	movi	%i4, 1
	jzero	%i0, %i0, cont.72155
then.72154:
	mov	%i4, %i0
cont.72155:
cont.72149:
	jzero	%i0, %i0, cont.72145
then.72146:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72158
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f4
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f3, %f2
	lf	%f1, 3(%i16)
	fma	%f1, %f1, %f8, %f2
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72159
then.72158:
	mov	%i4, %i0
cont.72159:
cont.72147:
	jzero	%i0, %i0, cont.72145
then.72144:
	lw	%i15, 244(%i0)
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i13
	mov	%i12, %i14
	mov	%i13, %i20
	mov	%i14, %i21
	fmov	%f1, %f4
	fmov	%f2, %f3
	fmov	%f3, %f8
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.72145:
	jeq	%i4, %i0, then.72160
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.72162
	movi	%i6, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.72164
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72166
	movi	%i4, 1
	jzero	%i0, %i0, cont.72165
then.72166:
	movi	%i4, 2
	mov	%i6, %i4
loop_start.68070:
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72169
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72171
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	set_label	%i31, loop_start.68070
	jmp	%i0, 0(%i31)
then.72171:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72173
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72175
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72174
then.72175:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72177
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72179
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72178
then.72179:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72181
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72183
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72182
then.72183:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72185
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72187
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72186
then.72187:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72189
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72191
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72190
then.72191:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72193
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72195
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72194
then.72195:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72197
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72199
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72198
then.72199:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72201
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72203
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72202
then.72203:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72205
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72207
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72206
then.72207:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72209
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72211
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72210
then.72211:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72213
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72215
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72214
then.72215:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72217
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72219
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72218
then.72219:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72221
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72223
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72222
then.72223:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72225
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72227
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72226
then.72227:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72229
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72231
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68071
	jzero	%i0, %i0, cont.72230
then.72231:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72232:
	jzero	%i0, %i0, cont.72230
then.72229:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72230:
cont.72228:
	jzero	%i0, %i0, cont.72226
then.72225:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72226:
cont.72224:
	jzero	%i0, %i0, cont.72222
then.72221:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72222:
cont.72220:
	jzero	%i0, %i0, cont.72218
then.72217:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72218:
cont.72216:
	jzero	%i0, %i0, cont.72214
then.72213:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72214:
cont.72212:
	jzero	%i0, %i0, cont.72210
then.72209:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72210:
cont.72208:
	jzero	%i0, %i0, cont.72206
then.72205:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72206:
cont.72204:
	jzero	%i0, %i0, cont.72202
then.72201:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72202:
cont.72200:
	jzero	%i0, %i0, cont.72198
then.72197:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72198:
cont.72196:
	jzero	%i0, %i0, cont.72194
then.72193:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72194:
cont.72192:
	jzero	%i0, %i0, cont.72190
then.72189:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72190:
cont.72188:
	jzero	%i0, %i0, cont.72186
then.72185:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72186:
cont.72184:
	jzero	%i0, %i0, cont.72182
then.72181:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72182:
cont.72180:
	jzero	%i0, %i0, cont.72178
then.72177:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72178:
cont.72176:
	jzero	%i0, %i0, cont.72174
then.72173:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
cont.72174:
cont.72172:
	set_label	%i31, loop_start.68070
	jmp	%i0, 0(%i31)
then.72169:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68071
loop_end.68071:
	mov	%i4, %i31
cont.72167:
	jzero	%i0, %i0, cont.72165
then.72164:
	mov	%i4, %i0
cont.72165:
	jzero	%i0, %i0, cont.72143
then.72162:
	mov	%i4, %i0
cont.72163:
	jzero	%i0, %i0, cont.72143
then.72160:
	mov	%i4, %i0
cont.72161:
	jzero	%i0, %i0, cont.72143
then.72142:
	movi	%i4, 1
cont.72143:
	jeq	%i4, %i0, then.72233
	movi	%i6, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.72235
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72237
	movi	%i4, 1
	jzero	%i0, %i0, cont.72236
then.72237:
	movi	%i4, 2
	mov	%i6, %i4
loop_start.68107:
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72240
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72242
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	set_label	%i31, loop_start.68107
	jmp	%i0, 0(%i31)
then.72242:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72244
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72246
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72245
then.72246:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72248
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72250
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72249
then.72250:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72252
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72254
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72253
then.72254:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72256
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72258
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72257
then.72258:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72260
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72262
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72261
then.72262:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72264
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72266
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72265
then.72266:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72268
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72270
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72269
then.72270:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72272
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72274
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72273
then.72274:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72276
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72278
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72277
then.72278:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72280
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72282
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72281
then.72282:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72284
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72286
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72285
then.72286:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72288
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72290
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72289
then.72290:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72292
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72294
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72293
then.72294:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72296
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72298
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72297
then.72298:
	addi	%i6, %i6, 1
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72300
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_and_group.2996
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	jeq	%i4, %i0, then.72302
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68108
	jzero	%i0, %i0, cont.72301
then.72302:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72303:
	jzero	%i0, %i0, cont.72301
then.72300:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72301:
cont.72299:
	jzero	%i0, %i0, cont.72297
then.72296:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72297:
cont.72295:
	jzero	%i0, %i0, cont.72293
then.72292:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72293:
cont.72291:
	jzero	%i0, %i0, cont.72289
then.72288:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72289:
cont.72287:
	jzero	%i0, %i0, cont.72285
then.72284:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72285:
cont.72283:
	jzero	%i0, %i0, cont.72281
then.72280:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72281:
cont.72279:
	jzero	%i0, %i0, cont.72277
then.72276:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72277:
cont.72275:
	jzero	%i0, %i0, cont.72273
then.72272:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72273:
cont.72271:
	jzero	%i0, %i0, cont.72269
then.72268:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72269:
cont.72267:
	jzero	%i0, %i0, cont.72265
then.72264:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72265:
cont.72263:
	jzero	%i0, %i0, cont.72261
then.72260:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72261:
cont.72259:
	jzero	%i0, %i0, cont.72257
then.72256:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72257:
cont.72255:
	jzero	%i0, %i0, cont.72253
then.72252:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72253:
cont.72251:
	jzero	%i0, %i0, cont.72249
then.72248:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72249:
cont.72247:
	jzero	%i0, %i0, cont.72245
then.72244:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
cont.72245:
cont.72243:
	set_label	%i31, loop_start.68107
	jmp	%i0, 0(%i31)
then.72240:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68108
loop_end.68108:
	mov	%i4, %i31
cont.72238:
	jzero	%i0, %i0, cont.72236
then.72235:
	mov	%i4, %i0
cont.72236:
	jeq	%i4, %i0, then.72304
	movi	%i31, 1
	jzero	%i0, %i0, loop_end.68063
	set_label	%i31, loop_start.68062
	jmp	%i0, 0(%i31)
then.72304:
	addi	%i4, %i19, 1
	mov	%i19, %i4
cont.72305:
	set_label	%i31, loop_start.68062
	jmp	%i0, 0(%i31)
then.72233:
	addi	%i4, %i19, 1
	mov	%i19, %i4
cont.72234:
	set_label	%i31, loop_start.68062
	jmp	%i0, 0(%i31)
then.72140:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68063
loop_end.68063:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.71809:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
solve_each_element.3005:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i19, %i4
	mov	%i18, %i5
	mov	%i17, %i6
	slli	%i4, %i19, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	movi	%i31, -1
	jeq	%i16, %i31, then.72306
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 202(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f6, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f5, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f4, %f2, %f1
	movi	%i31, 1
	jeq	%i6, %i31, then.72307
	movi	%i31, 2
	jeq	%i6, %i31, then.72309
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_second.2901
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.72308
then.72309:
	lf	%f2, 0(%i17)
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i17)
	lf	%f1, 1(%i9)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i17)
	lf	%f1, 2(%i9)
	fma	%f3, %f2, %f1, %f3
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.72311
	lf	%f1, 0(%i9)
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i9)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 2(%i9)
	fma	%f1, %f1, %f4, %f2
	fneg	%f2, %f1
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i7, 1
	jzero	%i0, %i0, cont.72312
then.72311:
	mov	%i7, %i0
cont.72312:
cont.72310:
	jzero	%i0, %i0, cont.72308
then.72307:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_rect.2876
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
cont.72308:
	jeq	%i7, %i0, then.72313
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.72314
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72315
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f6, %f2, %f1
	lf	%f1, 0(%i17)
	fmul	%f2, %f1, %f6
	lw	%i4, 202(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 1(%i17)
	fmul	%f2, %f1, %f6
	lw	%i4, 202(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lf	%f1, 2(%i17)
	fmul	%f2, %f1, %f6
	lw	%i4, 202(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i18)
	movi	%i31, -1
	jeq	%i4, %i31, then.72316
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i8)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i8)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i8)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72318
	movi	%i31, 2
	jeq	%i4, %i31, then.72320
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i6)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i6)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i6)
	fma	%f9, %f8, %f7, %f9
	jeq	%i5, %i0, then.72322
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i10)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i10)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i10)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72323
then.72322:
	fmov	%f2, %f9
cont.72323:
	movi	%i31, 3
	jeq	%i4, %i31, then.72324
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72325
then.72324:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72325:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72319
then.72320:
	lf	%f7, 0(%i6)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i6)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i6)
	fma	%f1, %f2, %f1, %f7
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72321:
	jzero	%i0, %i0, cont.72319
then.72318:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i6)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72326
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i6)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72328
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i6)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72327
then.72328:
	mov	%i4, %i0
cont.72329:
	jzero	%i0, %i0, cont.72327
then.72326:
	mov	%i4, %i0
cont.72327:
	jeq	%i4, %i0, then.72330
	mov	%i4, %i9
	jzero	%i0, %i0, cont.72331
then.72330:
	ceqi	%i4, %i9, 0
cont.72331:
cont.72319:
	jeq	%i4, %i0, then.72332
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72317
then.72332:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.68162:
	slli	%i4, %i6, 2
	add	%i31, %i18, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72335
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i11, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i10)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i10)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i10)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72337
	movi	%i31, 2
	jeq	%i4, %i31, then.72339
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i9)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i9)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i9)
	fma	%f9, %f8, %f7, %f9
	jeq	%i8, %i0, then.72341
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i11)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i11)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i11)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72342
then.72341:
	fmov	%f2, %f9
cont.72342:
	movi	%i31, 3
	jeq	%i4, %i31, then.72343
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72344
then.72343:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72344:
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72338
then.72339:
	lf	%f7, 0(%i9)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i9)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i9)
	fma	%f1, %f2, %f1, %f7
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72340:
	jzero	%i0, %i0, cont.72338
then.72337:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i9)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72345
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i9)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72347
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i9)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72346
then.72347:
	mov	%i4, %i0
cont.72348:
	jzero	%i0, %i0, cont.72346
then.72345:
	mov	%i4, %i0
cont.72346:
	jeq	%i4, %i0, then.72349
	mov	%i4, %i5
	jzero	%i0, %i0, cont.72350
then.72349:
	ceqi	%i4, %i5, 0
cont.72350:
cont.72338:
	jeq	%i4, %i0, then.72351
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68163
	set_label	%i31, loop_start.68162
	jmp	%i0, 0(%i31)
then.72351:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72352:
	set_label	%i31, loop_start.68162
	jmp	%i0, 0(%i31)
then.72335:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.68163
loop_end.68163:
	mov	%i4, %i31
cont.72333:
	jzero	%i0, %i0, cont.72317
then.72316:
	movi	%i4, 1
cont.72317:
	jeq	%i4, %i0, cont.72353
	lw	%i4, 160(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f3, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i16, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i7, 0(%i4)
cont.72353:
cont.72315:
cont.72314:
	addi	%i4, %i19, 1
	mov	%i19, %i4
loop_start.68180:
	slli	%i4, %i19, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	movi	%i31, -1
	jeq	%i16, %i31, then.72355
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 202(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f6, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f5, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f4, %f2, %f1
	movi	%i31, 1
	jeq	%i6, %i31, then.72357
	movi	%i31, 2
	jeq	%i6, %i31, then.72359
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_second.2901
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.72358
then.72359:
	lf	%f2, 0(%i17)
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i17)
	lf	%f1, 1(%i9)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i17)
	lf	%f1, 2(%i9)
	fma	%f3, %f2, %f1, %f3
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.72361
	lf	%f1, 0(%i9)
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i9)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 2(%i9)
	fma	%f1, %f1, %f4, %f2
	fneg	%f2, %f1
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i7, 1
	jzero	%i0, %i0, cont.72362
then.72361:
	mov	%i7, %i0
cont.72362:
cont.72360:
	jzero	%i0, %i0, cont.72358
then.72357:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_rect.2876
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
cont.72358:
	jeq	%i7, %i0, then.72363
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.72365
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72366
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f6, %f2, %f1
	lf	%f1, 0(%i17)
	fmul	%f2, %f1, %f6
	lw	%i4, 202(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 1(%i17)
	fmul	%f2, %f1, %f6
	lw	%i4, 202(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lf	%f1, 2(%i17)
	fmul	%f2, %f1, %f6
	lw	%i4, 202(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i18)
	movi	%i31, -1
	jeq	%i4, %i31, then.72367
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i8)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i8)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i8)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72369
	movi	%i31, 2
	jeq	%i4, %i31, then.72371
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i6)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i6)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i6)
	fma	%f9, %f8, %f7, %f9
	jeq	%i5, %i0, then.72373
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i10)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i10)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i10)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72374
then.72373:
	fmov	%f2, %f9
cont.72374:
	movi	%i31, 3
	jeq	%i4, %i31, then.72375
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72376
then.72375:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72376:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72370
then.72371:
	lf	%f7, 0(%i6)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i6)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i6)
	fma	%f1, %f2, %f1, %f7
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72372:
	jzero	%i0, %i0, cont.72370
then.72369:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i6)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72377
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i6)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72379
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i6)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72378
then.72379:
	mov	%i4, %i0
cont.72380:
	jzero	%i0, %i0, cont.72378
then.72377:
	mov	%i4, %i0
cont.72378:
	jeq	%i4, %i0, then.72381
	mov	%i4, %i9
	jzero	%i0, %i0, cont.72382
then.72381:
	ceqi	%i4, %i9, 0
cont.72382:
cont.72370:
	jeq	%i4, %i0, then.72383
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72368
then.72383:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.68198:
	slli	%i4, %i6, 2
	add	%i31, %i18, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72386
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i11, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i10)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i10)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i10)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72388
	movi	%i31, 2
	jeq	%i4, %i31, then.72390
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i9)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i9)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i9)
	fma	%f9, %f8, %f7, %f9
	jeq	%i8, %i0, then.72392
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i11)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i11)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i11)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72393
then.72392:
	fmov	%f2, %f9
cont.72393:
	movi	%i31, 3
	jeq	%i4, %i31, then.72394
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72395
then.72394:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72395:
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72389
then.72390:
	lf	%f7, 0(%i9)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i9)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i9)
	fma	%f1, %f2, %f1, %f7
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72391:
	jzero	%i0, %i0, cont.72389
then.72388:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i9)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72396
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i9)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72398
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i9)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72397
then.72398:
	mov	%i4, %i0
cont.72399:
	jzero	%i0, %i0, cont.72397
then.72396:
	mov	%i4, %i0
cont.72397:
	jeq	%i4, %i0, then.72400
	mov	%i4, %i5
	jzero	%i0, %i0, cont.72401
then.72400:
	ceqi	%i4, %i5, 0
cont.72401:
cont.72389:
	jeq	%i4, %i0, then.72402
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68199
	set_label	%i31, loop_start.68198
	jmp	%i0, 0(%i31)
then.72402:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72403:
	set_label	%i31, loop_start.68198
	jmp	%i0, 0(%i31)
then.72386:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.68199
loop_end.68199:
	mov	%i4, %i31
cont.72384:
	jzero	%i0, %i0, cont.72368
then.72367:
	movi	%i4, 1
cont.72368:
	jeq	%i4, %i0, cont.72404
	lw	%i4, 160(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f3, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i16, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i7, 0(%i4)
cont.72404:
cont.72366:
cont.72365:
	addi	%i4, %i19, 1
	mov	%i19, %i4
	set_label	%i31, loop_start.68180
	jmp	%i0, 0(%i31)
then.72363:
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72405
	addi	%i4, %i19, 1
	mov	%i19, %i4
	jzero	%i0, %i0, cont.72406
then.72405:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68181
cont.72406:
cont.72364:
	set_label	%i31, loop_start.68180
	jmp	%i0, 0(%i31)
then.72355:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68181
loop_end.68181:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.72313:
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72407
	addi	%i4, %i19, 1
	mov	%i19, %i4
loop_start.68221:
	slli	%i4, %i19, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	movi	%i31, -1
	jeq	%i16, %i31, then.72409
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 202(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f6, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f5, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f4, %f2, %f1
	movi	%i31, 1
	jeq	%i6, %i31, then.72411
	movi	%i31, 2
	jeq	%i6, %i31, then.72413
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_second.2901
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
	jzero	%i0, %i0, cont.72412
then.72413:
	lf	%f2, 0(%i17)
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i17)
	lf	%f1, 1(%i9)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i17)
	lf	%f1, 2(%i9)
	fma	%f3, %f2, %f1, %f3
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.72415
	lf	%f1, 0(%i9)
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i9)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 2(%i9)
	fma	%f1, %f1, %f4, %f2
	fneg	%f2, %f1
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i7, 1
	jzero	%i0, %i0, cont.72416
then.72415:
	mov	%i7, %i0
cont.72416:
cont.72414:
	jzero	%i0, %i0, cont.72412
then.72411:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_rect.2876
	jmp	%i3, 0(%i31)
	mov	%i7, %i30
cont.72412:
	jeq	%i7, %i0, then.72417
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.72419
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72420
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f6, %f2, %f1
	lf	%f1, 0(%i17)
	fmul	%f2, %f1, %f6
	lw	%i4, 202(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 1(%i17)
	fmul	%f2, %f1, %f6
	lw	%i4, 202(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lf	%f1, 2(%i17)
	fmul	%f2, %f1, %f6
	lw	%i4, 202(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i18)
	movi	%i31, -1
	jeq	%i4, %i31, then.72421
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i8)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i8)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i8)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72423
	movi	%i31, 2
	jeq	%i4, %i31, then.72425
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i6)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i6)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i6)
	fma	%f9, %f8, %f7, %f9
	jeq	%i5, %i0, then.72427
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i10)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i10)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i10)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72428
then.72427:
	fmov	%f2, %f9
cont.72428:
	movi	%i31, 3
	jeq	%i4, %i31, then.72429
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72430
then.72429:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72430:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72424
then.72425:
	lf	%f7, 0(%i6)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i6)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i6)
	fma	%f1, %f2, %f1, %f7
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72426:
	jzero	%i0, %i0, cont.72424
then.72423:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i6)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72431
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i6)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72433
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i6)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72432
then.72433:
	mov	%i4, %i0
cont.72434:
	jzero	%i0, %i0, cont.72432
then.72431:
	mov	%i4, %i0
cont.72432:
	jeq	%i4, %i0, then.72435
	mov	%i4, %i9
	jzero	%i0, %i0, cont.72436
then.72435:
	ceqi	%i4, %i9, 0
cont.72436:
cont.72424:
	jeq	%i4, %i0, then.72437
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72422
then.72437:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.68239:
	slli	%i4, %i6, 2
	add	%i31, %i18, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72440
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i11, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i10)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i10)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i10)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72442
	movi	%i31, 2
	jeq	%i4, %i31, then.72444
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i9)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i9)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i9)
	fma	%f9, %f8, %f7, %f9
	jeq	%i8, %i0, then.72446
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i11)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i11)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i11)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72447
then.72446:
	fmov	%f2, %f9
cont.72447:
	movi	%i31, 3
	jeq	%i4, %i31, then.72448
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72449
then.72448:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72449:
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72443
then.72444:
	lf	%f7, 0(%i9)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i9)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i9)
	fma	%f1, %f2, %f1, %f7
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72445:
	jzero	%i0, %i0, cont.72443
then.72442:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i9)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72450
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i9)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72452
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i9)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72451
then.72452:
	mov	%i4, %i0
cont.72453:
	jzero	%i0, %i0, cont.72451
then.72450:
	mov	%i4, %i0
cont.72451:
	jeq	%i4, %i0, then.72454
	mov	%i4, %i5
	jzero	%i0, %i0, cont.72455
then.72454:
	ceqi	%i4, %i5, 0
cont.72455:
cont.72443:
	jeq	%i4, %i0, then.72456
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68240
	set_label	%i31, loop_start.68239
	jmp	%i0, 0(%i31)
then.72456:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72457:
	set_label	%i31, loop_start.68239
	jmp	%i0, 0(%i31)
then.72440:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.68240
loop_end.68240:
	mov	%i4, %i31
cont.72438:
	jzero	%i0, %i0, cont.72422
then.72421:
	movi	%i4, 1
cont.72422:
	jeq	%i4, %i0, cont.72458
	lw	%i4, 160(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f3, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i16, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i7, 0(%i4)
cont.72458:
cont.72420:
cont.72419:
	addi	%i4, %i19, 1
	mov	%i19, %i4
	set_label	%i31, loop_start.68221
	jmp	%i0, 0(%i31)
then.72417:
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72459
	addi	%i4, %i19, 1
	mov	%i19, %i4
	jzero	%i0, %i0, cont.72460
then.72459:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68222
cont.72460:
cont.72418:
	set_label	%i31, loop_start.68221
	jmp	%i0, 0(%i31)
then.72409:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68222
loop_end.68222:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.72407:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.72306:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
trace_or_matrix.3013:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i19, %i4
	mov	%i18, %i5
	mov	%i17, %i6
	slli	%i4, %i19, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	lw	%i4, 0(%i16)
	movi	%i31, -1
	ceq	%i30, %i4, %i31
	jzero	%i0, %i30, Lrelax_skip_8
	set_label	%i30, then.72463
	jmp	%i0, 0(%i30)
Lrelax_skip_8:
	movi	%i31, 99
	jeq	%i4, %i31, then.72464
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 202(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f6, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f5, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f4, %f2, %f1
	movi	%i31, 1
	jeq	%i6, %i31, then.72466
	movi	%i31, 2
	jeq	%i6, %i31, then.72468
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_second.2901
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
	jzero	%i0, %i0, cont.72467
then.72468:
	lf	%f2, 0(%i17)
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i17)
	lf	%f1, 1(%i9)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i17)
	lf	%f1, 2(%i9)
	fma	%f3, %f2, %f1, %f3
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.72470
	lf	%f1, 0(%i9)
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i9)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 2(%i9)
	fma	%f1, %f1, %f4, %f2
	fneg	%f2, %f1
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72471
then.72470:
	mov	%i4, %i0
cont.72471:
cont.72469:
	jzero	%i0, %i0, cont.72467
then.72466:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_rect.2876
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.72467:
	jeq	%i4, %i0, cont.72472
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72473
	movi	%i7, 1
	lw	%i4, 1(%i16)
	movi	%i31, -1
	jeq	%i4, %i31, then.72474
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 16
	sw	%i16, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	movi	%i7, 2
loop_start.68265:
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72477
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72479
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72481
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72483
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72485
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72487
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72489
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72491
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72493
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72495
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72497
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72499
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72501
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72503
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72505
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72507
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i4, %i7, 1
	mov	%i7, %i4
	set_label	%i31, loop_start.68265
	jmp	%i0, 0(%i31)
then.72507:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72505:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72503:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72501:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72499:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72497:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72495:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72493:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72491:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72489:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72487:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72485:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72483:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72481:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72479:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
then.72477:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68266
loop_end.68266:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.72475
then.72474:
cont.72475:
cont.72473:
cont.72472:
	jzero	%i0, %i0, cont.72465
then.72464:
	movi	%i7, 1
	lw	%i4, 1(%i16)
	movi	%i31, -1
	jeq	%i4, %i31, then.72509
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 16
	sw	%i16, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	movi	%i7, 2
loop_start.68302:
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72512
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72514
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72516
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72518
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72520
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72522
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72524
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72526
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72528
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72530
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72532
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72534
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72536
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72538
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72540
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72542
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i4, %i7, 1
	mov	%i7, %i4
	set_label	%i31, loop_start.68302
	jmp	%i0, 0(%i31)
then.72542:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72540:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72538:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72536:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72534:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72532:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72530:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72528:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72526:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72524:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72522:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72520:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72518:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72516:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72514:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
then.72512:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68303
loop_end.68303:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.72510
then.72509:
cont.72510:
cont.72465:
	addi	%i4, %i19, 1
	mov	%i19, %i4
loop_start.68338:
	slli	%i4, %i19, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	lw	%i4, 0(%i16)
	movi	%i31, -1
	jeq	%i4, %i31, then.72545
	movi	%i31, 99
	jeq	%i4, %i31, then.72547
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 202(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f6, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f5, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f4, %f2, %f1
	movi	%i31, 1
	jeq	%i6, %i31, then.72549
	movi	%i31, 2
	jeq	%i6, %i31, then.72551
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_second.2901
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
	jzero	%i0, %i0, cont.72550
then.72551:
	lf	%f2, 0(%i17)
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i17)
	lf	%f1, 1(%i9)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i17)
	lf	%f1, 2(%i9)
	fma	%f3, %f2, %f1, %f3
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.72553
	lf	%f1, 0(%i9)
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i9)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 2(%i9)
	fma	%f1, %f1, %f4, %f2
	fneg	%f2, %f1
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72554
then.72553:
	mov	%i4, %i0
cont.72554:
cont.72552:
	jzero	%i0, %i0, cont.72550
then.72549:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i17
	fmov	%f1, %f6
	fmov	%f2, %f5
	fmov	%f3, %f4
	set_label	%i31, solver_rect.2876
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.72550:
	jeq	%i4, %i0, cont.72555
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72556
	movi	%i7, 1
	lw	%i4, 1(%i16)
	movi	%i31, -1
	jeq	%i4, %i31, then.72557
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 16
	sw	%i16, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	movi	%i7, 2
loop_start.68344:
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72560
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72562
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72564
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72566
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72568
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72570
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72572
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72574
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72576
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72578
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72580
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72582
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72584
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72586
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72588
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72590
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i4, %i7, 1
	mov	%i7, %i4
	set_label	%i31, loop_start.68344
	jmp	%i0, 0(%i31)
then.72590:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72588:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72586:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72584:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72582:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72580:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72578:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72576:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72574:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72572:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72570:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72568:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72566:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72564:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72562:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
then.72560:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68345
loop_end.68345:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.72558
then.72557:
cont.72558:
cont.72556:
cont.72555:
	jzero	%i0, %i0, cont.72548
then.72547:
	movi	%i7, 1
	lw	%i4, 1(%i16)
	movi	%i31, -1
	jeq	%i4, %i31, then.72592
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 16
	sw	%i16, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	movi	%i7, 2
loop_start.68381:
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72595
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72597
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72599
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72601
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72603
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72605
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72607
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72609
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72611
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72613
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72615
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72617
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72619
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72621
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72623
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i7, %i7, 1
	slli	%i4, %i7, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72625
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	set_label	%i31, solve_each_element.3005
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	addi	%i1, %i1, 24
	addi	%i4, %i7, 1
	mov	%i7, %i4
	set_label	%i31, loop_start.68381
	jmp	%i0, 0(%i31)
then.72625:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72623:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72621:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72619:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72617:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72615:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72613:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72611:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72609:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72607:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72605:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72603:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72601:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72599:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72597:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
then.72595:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68382
loop_end.68382:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.72593
then.72592:
cont.72593:
cont.72548:
	addi	%i4, %i19, 1
	mov	%i19, %i4
	set_label	%i31, loop_start.68338
	jmp	%i0, 0(%i31)
then.72545:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68339
loop_end.68339:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.72463:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
solve_each_element_fast.3019:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i20, %i4
	mov	%i19, %i5
	mov	%i15, %i6
	mov	%i18, %i7
	slli	%i4, %i20, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	movi	%i31, -1
	jeq	%i17, %i31, then.72628
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i21)
	lf	%f5, 1(%i21)
	lf	%f3, 2(%i21)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.72629
	movi	%i31, 2
	jeq	%i6, %i31, then.72631
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.72633
	mov	%i7, %i0
	jzero	%i0, %i0, cont.72630
then.72633:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i21)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72635
	jeq	%i11, %i0, then.72637
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72638
then.72637:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72638:
	movi	%i7, 1
	jzero	%i0, %i0, cont.72636
then.72635:
	mov	%i7, %i0
cont.72636:
cont.72634:
	jzero	%i0, %i0, cont.72630
then.72631:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72639
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i21)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i7, 1
	jzero	%i0, %i0, cont.72640
then.72639:
	mov	%i7, %i0
cont.72640:
cont.72632:
	jzero	%i0, %i0, cont.72630
then.72629:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	subi	%i1, %i1, 8
	sw	%i15, 0(%i1)
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	lw	%i15, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i7, %i30
cont.72630:
	jeq	%i7, %i0, then.72641
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.72642
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72643
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f6, %f2, %f1
	lf	%f1, 0(%i15)
	fmul	%f2, %f1, %f6
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 1(%i15)
	fmul	%f2, %f1, %f6
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lf	%f1, 2(%i15)
	fmul	%f2, %f1, %f6
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i19)
	movi	%i31, -1
	jeq	%i4, %i31, then.72644
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i9)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i9)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i9)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72646
	movi	%i31, 2
	jeq	%i4, %i31, then.72648
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i8)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i8)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i8)
	fma	%f9, %f8, %f7, %f9
	jeq	%i6, %i0, then.72650
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i10)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i10)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i10)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72651
then.72650:
	fmov	%f2, %f9
cont.72651:
	movi	%i31, 3
	jeq	%i4, %i31, then.72652
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72653
then.72652:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72653:
	flt	%i6, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i6
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72647
then.72648:
	lf	%f7, 0(%i8)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i8)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i8)
	fma	%f1, %f2, %f1, %f7
	flt	%i6, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i6
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72649:
	jzero	%i0, %i0, cont.72647
then.72646:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i8)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72654
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i8)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72656
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i8)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72655
then.72656:
	mov	%i4, %i0
cont.72657:
	jzero	%i0, %i0, cont.72655
then.72654:
	mov	%i4, %i0
cont.72655:
	jeq	%i4, %i0, then.72658
	mov	%i4, %i5
	jzero	%i0, %i0, cont.72659
then.72658:
	ceqi	%i4, %i5, 0
cont.72659:
cont.72647:
	jeq	%i4, %i0, then.72660
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72645
then.72660:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.68437:
	slli	%i4, %i6, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72663
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i11, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i10)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i10)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i10)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72665
	movi	%i31, 2
	jeq	%i4, %i31, then.72667
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i9)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i9)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i9)
	fma	%f9, %f8, %f7, %f9
	jeq	%i8, %i0, then.72669
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i11)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i11)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i11)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72670
then.72669:
	fmov	%f2, %f9
cont.72670:
	movi	%i31, 3
	jeq	%i4, %i31, then.72671
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72672
then.72671:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72672:
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72666
then.72667:
	lf	%f7, 0(%i9)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i9)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i9)
	fma	%f1, %f2, %f1, %f7
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72668:
	jzero	%i0, %i0, cont.72666
then.72665:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i9)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72673
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i9)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72675
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i9)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72674
then.72675:
	mov	%i4, %i0
cont.72676:
	jzero	%i0, %i0, cont.72674
then.72673:
	mov	%i4, %i0
cont.72674:
	jeq	%i4, %i0, then.72677
	mov	%i4, %i5
	jzero	%i0, %i0, cont.72678
then.72677:
	ceqi	%i4, %i5, 0
cont.72678:
cont.72666:
	jeq	%i4, %i0, then.72679
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68438
	set_label	%i31, loop_start.68437
	jmp	%i0, 0(%i31)
then.72679:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72680:
	set_label	%i31, loop_start.68437
	jmp	%i0, 0(%i31)
then.72663:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.68438
loop_end.68438:
	mov	%i4, %i31
cont.72661:
	jzero	%i0, %i0, cont.72645
then.72644:
	movi	%i4, 1
cont.72645:
	jeq	%i4, %i0, cont.72681
	lw	%i4, 160(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f3, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i17, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i7, 0(%i4)
cont.72681:
cont.72643:
cont.72642:
	addi	%i4, %i20, 1
	mov	%i20, %i4
loop_start.68455:
	slli	%i4, %i20, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	movi	%i31, -1
	jeq	%i17, %i31, then.72683
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i21)
	lf	%f5, 1(%i21)
	lf	%f3, 2(%i21)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.72685
	movi	%i31, 2
	jeq	%i6, %i31, then.72687
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.72689
	mov	%i7, %i0
	jzero	%i0, %i0, cont.72686
then.72689:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i21)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72691
	jeq	%i11, %i0, then.72693
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72694
then.72693:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72694:
	movi	%i7, 1
	jzero	%i0, %i0, cont.72692
then.72691:
	mov	%i7, %i0
cont.72692:
cont.72690:
	jzero	%i0, %i0, cont.72686
then.72687:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72695
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i21)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i7, 1
	jzero	%i0, %i0, cont.72696
then.72695:
	mov	%i7, %i0
cont.72696:
cont.72688:
	jzero	%i0, %i0, cont.72686
then.72685:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	subi	%i1, %i1, 8
	sw	%i15, 0(%i1)
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	lw	%i15, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i7, %i30
cont.72686:
	jeq	%i7, %i0, then.72697
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.72699
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72700
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f6, %f2, %f1
	lf	%f1, 0(%i15)
	fmul	%f2, %f1, %f6
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 1(%i15)
	fmul	%f2, %f1, %f6
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lf	%f1, 2(%i15)
	fmul	%f2, %f1, %f6
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i19)
	movi	%i31, -1
	jeq	%i4, %i31, then.72701
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i9)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i9)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i9)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72703
	movi	%i31, 2
	jeq	%i4, %i31, then.72705
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i8)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i8)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i8)
	fma	%f9, %f8, %f7, %f9
	jeq	%i6, %i0, then.72707
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i10)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i10)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i10)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72708
then.72707:
	fmov	%f2, %f9
cont.72708:
	movi	%i31, 3
	jeq	%i4, %i31, then.72709
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72710
then.72709:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72710:
	flt	%i6, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i6
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72704
then.72705:
	lf	%f7, 0(%i8)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i8)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i8)
	fma	%f1, %f2, %f1, %f7
	flt	%i6, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i6
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72706:
	jzero	%i0, %i0, cont.72704
then.72703:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i8)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72711
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i8)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72713
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i8)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72712
then.72713:
	mov	%i4, %i0
cont.72714:
	jzero	%i0, %i0, cont.72712
then.72711:
	mov	%i4, %i0
cont.72712:
	jeq	%i4, %i0, then.72715
	mov	%i4, %i5
	jzero	%i0, %i0, cont.72716
then.72715:
	ceqi	%i4, %i5, 0
cont.72716:
cont.72704:
	jeq	%i4, %i0, then.72717
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72702
then.72717:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.68475:
	slli	%i4, %i6, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72720
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i11, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i10)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i10)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i10)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72722
	movi	%i31, 2
	jeq	%i4, %i31, then.72724
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i9)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i9)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i9)
	fma	%f9, %f8, %f7, %f9
	jeq	%i8, %i0, then.72726
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i11)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i11)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i11)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72727
then.72726:
	fmov	%f2, %f9
cont.72727:
	movi	%i31, 3
	jeq	%i4, %i31, then.72728
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72729
then.72728:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72729:
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72723
then.72724:
	lf	%f7, 0(%i9)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i9)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i9)
	fma	%f1, %f2, %f1, %f7
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72725:
	jzero	%i0, %i0, cont.72723
then.72722:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i9)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72730
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i9)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72732
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i9)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72731
then.72732:
	mov	%i4, %i0
cont.72733:
	jzero	%i0, %i0, cont.72731
then.72730:
	mov	%i4, %i0
cont.72731:
	jeq	%i4, %i0, then.72734
	mov	%i4, %i5
	jzero	%i0, %i0, cont.72735
then.72734:
	ceqi	%i4, %i5, 0
cont.72735:
cont.72723:
	jeq	%i4, %i0, then.72736
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68476
	set_label	%i31, loop_start.68475
	jmp	%i0, 0(%i31)
then.72736:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72737:
	set_label	%i31, loop_start.68475
	jmp	%i0, 0(%i31)
then.72720:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.68476
loop_end.68476:
	mov	%i4, %i31
cont.72718:
	jzero	%i0, %i0, cont.72702
then.72701:
	movi	%i4, 1
cont.72702:
	jeq	%i4, %i0, cont.72738
	lw	%i4, 160(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f3, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i17, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i7, 0(%i4)
cont.72738:
cont.72700:
cont.72699:
	addi	%i4, %i20, 1
	mov	%i20, %i4
	set_label	%i31, loop_start.68455
	jmp	%i0, 0(%i31)
then.72697:
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72739
	addi	%i4, %i20, 1
	mov	%i20, %i4
	jzero	%i0, %i0, cont.72740
then.72739:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68456
cont.72740:
cont.72698:
	set_label	%i31, loop_start.68455
	jmp	%i0, 0(%i31)
then.72683:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68456
loop_end.68456:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.72641:
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72741
	addi	%i4, %i20, 1
	mov	%i20, %i4
loop_start.68498:
	slli	%i4, %i20, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	movi	%i31, -1
	jeq	%i17, %i31, then.72743
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i21)
	lf	%f5, 1(%i21)
	lf	%f3, 2(%i21)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.72745
	movi	%i31, 2
	jeq	%i6, %i31, then.72747
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.72749
	mov	%i7, %i0
	jzero	%i0, %i0, cont.72746
then.72749:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i21)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72751
	jeq	%i11, %i0, then.72753
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72754
then.72753:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72754:
	movi	%i7, 1
	jzero	%i0, %i0, cont.72752
then.72751:
	mov	%i7, %i0
cont.72752:
cont.72750:
	jzero	%i0, %i0, cont.72746
then.72747:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72755
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i21)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i7, 1
	jzero	%i0, %i0, cont.72756
then.72755:
	mov	%i7, %i0
cont.72756:
cont.72748:
	jzero	%i0, %i0, cont.72746
then.72745:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	subi	%i1, %i1, 8
	sw	%i15, 0(%i1)
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	lw	%i15, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i7, %i30
cont.72746:
	jeq	%i7, %i0, then.72757
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.72759
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72760
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f6, %f2, %f1
	lf	%f1, 0(%i15)
	fmul	%f2, %f1, %f6
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 1(%i15)
	fmul	%f2, %f1, %f6
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lf	%f1, 2(%i15)
	fmul	%f2, %f1, %f6
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	mov	%i6, %i0
	lw	%i4, 0(%i19)
	movi	%i31, -1
	jeq	%i4, %i31, then.72761
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i9)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i9)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i9)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72763
	movi	%i31, 2
	jeq	%i4, %i31, then.72765
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i8)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i8)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i8)
	fma	%f9, %f8, %f7, %f9
	jeq	%i6, %i0, then.72767
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i10)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i10)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i10)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72768
then.72767:
	fmov	%f2, %f9
cont.72768:
	movi	%i31, 3
	jeq	%i4, %i31, then.72769
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72770
then.72769:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72770:
	flt	%i6, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i6
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72764
then.72765:
	lf	%f7, 0(%i8)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i8)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i8)
	fma	%f1, %f2, %f1, %f7
	flt	%i6, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i6
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72766:
	jzero	%i0, %i0, cont.72764
then.72763:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i8)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72771
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i8)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72773
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i8)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72772
then.72773:
	mov	%i4, %i0
cont.72774:
	jzero	%i0, %i0, cont.72772
then.72771:
	mov	%i4, %i0
cont.72772:
	jeq	%i4, %i0, then.72775
	mov	%i4, %i5
	jzero	%i0, %i0, cont.72776
then.72775:
	ceqi	%i4, %i5, 0
cont.72776:
cont.72764:
	jeq	%i4, %i0, then.72777
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72762
then.72777:
	movi	%i4, 1
	mov	%i6, %i4
loop_start.68518:
	slli	%i4, %i6, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72780
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i11, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i10)
	fsub	%f10, %f5, %f1
	lf	%f1, 1(%i10)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i10)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72782
	movi	%i31, 2
	jeq	%i4, %i31, then.72784
	fmul	%f8, %f10, %f10
	lf	%f7, 0(%i9)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f2
	lf	%f7, 1(%i9)
	fma	%f9, %f8, %f7, %f9
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i9)
	fma	%f9, %f8, %f7, %f9
	jeq	%i8, %i0, then.72786
	fmul	%f8, %f2, %f1
	lf	%f7, 0(%i11)
	fma	%f8, %f8, %f7, %f9
	fmul	%f7, %f1, %f10
	lf	%f1, 1(%i11)
	fma	%f7, %f7, %f1, %f8
	fmul	%f2, %f10, %f2
	lf	%f1, 2(%i11)
	fma	%f2, %f2, %f1, %f7
	jzero	%i0, %i0, cont.72787
then.72786:
	fmov	%f2, %f9
cont.72787:
	movi	%i31, 3
	jeq	%i4, %i31, then.72788
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72789
then.72788:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72789:
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72783
then.72784:
	lf	%f7, 0(%i9)
	fmul	%f8, %f7, %f10
	lf	%f7, 1(%i9)
	fma	%f7, %f7, %f2, %f8
	lf	%f2, 2(%i9)
	fma	%f1, %f2, %f1, %f7
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	xor	%i4, %i4, %i5
	ceqi	%i4, %i4, 0
cont.72785:
	jzero	%i0, %i0, cont.72783
then.72782:
	fleq	%i4, %f0, %f10
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f10
	lf	%f7, 0(%i9)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.72790
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f2
	lf	%f2, 1(%i9)
	flt	%i4, %f7, %f2
	jeq	%i4, %i0, then.72792
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i9)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.72791
then.72792:
	mov	%i4, %i0
cont.72793:
	jzero	%i0, %i0, cont.72791
then.72790:
	mov	%i4, %i0
cont.72791:
	jeq	%i4, %i0, then.72794
	mov	%i4, %i5
	jzero	%i0, %i0, cont.72795
then.72794:
	ceqi	%i4, %i5, 0
cont.72795:
cont.72783:
	jeq	%i4, %i0, then.72796
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68519
	set_label	%i31, loop_start.68518
	jmp	%i0, 0(%i31)
then.72796:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72797:
	set_label	%i31, loop_start.68518
	jmp	%i0, 0(%i31)
then.72780:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.68519
loop_end.68519:
	mov	%i4, %i31
cont.72778:
	jzero	%i0, %i0, cont.72762
then.72761:
	movi	%i4, 1
cont.72762:
	jeq	%i4, %i0, cont.72798
	lw	%i4, 160(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f3, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i17, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i7, 0(%i4)
cont.72798:
cont.72760:
cont.72759:
	addi	%i4, %i20, 1
	mov	%i20, %i4
	set_label	%i31, loop_start.68498
	jmp	%i0, 0(%i31)
then.72757:
	slli	%i5, %i17, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72799
	addi	%i4, %i20, 1
	mov	%i20, %i4
	jzero	%i0, %i0, cont.72800
then.72799:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68499
cont.72800:
cont.72758:
	set_label	%i31, loop_start.68498
	jmp	%i0, 0(%i31)
then.72743:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68499
loop_end.68499:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.72741:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.72628:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
solve_one_or_network_fast.3023:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i8, %i4
	mov	%i17, %i5
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72803
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i4, %i8, 1
	mov	%i8, %i4
loop_start.68542:
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72805
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72807
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72809
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72811
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72813
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72815
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72817
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72819
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72821
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72823
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72825
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72827
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72829
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72831
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72833
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72835
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i17, 3(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i17, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i4, %i8, 1
	mov	%i8, %i4
	set_label	%i31, loop_start.68542
	jmp	%i0, 0(%i31)
then.72835:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72833:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72831:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72829:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72827:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72825:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72823:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72821:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72819:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72817:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72815:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72813:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72811:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72809:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72807:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
then.72805:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68543
loop_end.68543:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.72803:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
trace_or_matrix_fast.3027:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i21, %i4
	mov	%i20, %i5
	mov	%i19, %i6
	mov	%i18, %i7
	slli	%i4, %i21, 2
	add	%i31, %i20, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	ceq	%i30, %i16, %i31
	jzero	%i0, %i30, Lrelax_skip_9
	set_label	%i30, then.72838
	jmp	%i0, 0(%i30)
Lrelax_skip_9:
	movi	%i31, 99
	jeq	%i16, %i31, then.72839
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.72841
	movi	%i31, 2
	jeq	%i6, %i31, then.72843
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.72845
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72842
then.72845:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72847
	jeq	%i11, %i0, then.72849
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72850
then.72849:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72850:
	movi	%i4, 1
	jzero	%i0, %i0, cont.72848
then.72847:
	mov	%i4, %i0
cont.72848:
cont.72846:
	jzero	%i0, %i0, cont.72842
then.72843:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72851
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72852
then.72851:
	mov	%i4, %i0
cont.72852:
cont.72844:
	jzero	%i0, %i0, cont.72842
then.72841:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i19
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.72842:
	jeq	%i4, %i0, cont.72853
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72854
	movi	%i8, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.72855
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
	movi	%i8, 2
loop_start.68584:
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72858
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72860
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72862
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72864
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72866
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72868
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72870
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72872
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72874
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72876
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72878
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72880
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72882
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72884
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72886
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72888
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i4, %i8, 1
	mov	%i8, %i4
	set_label	%i31, loop_start.68584
	jmp	%i0, 0(%i31)
then.72888:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72886:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72884:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72882:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72880:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72878:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72876:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72874:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72872:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72870:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72868:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72866:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72864:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72862:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72860:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
then.72858:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68585
loop_end.68585:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.72856
then.72855:
cont.72856:
cont.72854:
cont.72853:
	jzero	%i0, %i0, cont.72840
then.72839:
	movi	%i8, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.72890
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
	movi	%i8, 2
loop_start.68621:
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72893
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72895
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72897
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72899
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72901
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72903
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72905
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72907
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72909
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72911
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72913
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72915
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72917
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72919
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72921
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72923
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i4, %i8, 1
	mov	%i8, %i4
	set_label	%i31, loop_start.68621
	jmp	%i0, 0(%i31)
then.72923:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72921:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72919:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72917:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72915:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72913:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72911:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72909:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72907:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72905:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72903:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72901:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72899:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72897:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72895:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
then.72893:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68622
loop_end.68622:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.72891
then.72890:
cont.72891:
cont.72840:
	addi	%i4, %i21, 1
	mov	%i21, %i4
loop_start.68657:
	slli	%i4, %i21, 2
	add	%i31, %i20, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.72926
	movi	%i31, 99
	jeq	%i16, %i31, then.72928
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i18, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.72930
	movi	%i31, 2
	jeq	%i6, %i31, then.72932
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.72934
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72931
then.72934:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72936
	jeq	%i11, %i0, then.72938
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72939
then.72938:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72939:
	movi	%i4, 1
	jzero	%i0, %i0, cont.72937
then.72936:
	mov	%i4, %i0
cont.72937:
cont.72935:
	jzero	%i0, %i0, cont.72931
then.72932:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72940
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72941
then.72940:
	mov	%i4, %i0
cont.72941:
cont.72933:
	jzero	%i0, %i0, cont.72931
then.72930:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i19
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.72931:
	jeq	%i4, %i0, cont.72942
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.72943
	movi	%i8, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.72944
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
	movi	%i8, 2
loop_start.68665:
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72947
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72949
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72951
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72953
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72955
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72957
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72959
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72961
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72963
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72965
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72967
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72969
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72971
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72973
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72975
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72977
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i4, %i8, 1
	mov	%i8, %i4
	set_label	%i31, loop_start.68665
	jmp	%i0, 0(%i31)
then.72977:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72975:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72973:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72971:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72969:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72967:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72965:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72963:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72961:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72959:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72957:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72955:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72953:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72951:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72949:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
then.72947:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68666
loop_end.68666:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.72945
then.72944:
cont.72945:
cont.72943:
cont.72942:
	jzero	%i0, %i0, cont.72929
then.72928:
	movi	%i8, 1
	lw	%i4, 1(%i17)
	movi	%i31, -1
	jeq	%i4, %i31, then.72979
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
	movi	%i8, 2
loop_start.68702:
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72982
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72984
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72986
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72988
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72990
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72992
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72994
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72996
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72998
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.73000
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.73002
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.73004
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.73006
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.73008
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.73010
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i8, %i8, 1
	slli	%i4, %i8, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.73012
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	mov	%i6, %i19
	mov	%i7, %i18
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, solve_each_element_fast.3019
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
	addi	%i4, %i8, 1
	mov	%i8, %i4
	set_label	%i31, loop_start.68702
	jmp	%i0, 0(%i31)
then.73012:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.73010:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.73008:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.73006:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.73004:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.73002:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.73000:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.72998:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.72996:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.72994:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.72992:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.72990:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.72988:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.72986:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.72984:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
then.72982:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68703
loop_end.68703:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.72980
then.72979:
cont.72980:
cont.72929:
	addi	%i4, %i21, 1
	mov	%i21, %i4
	set_label	%i31, loop_start.68657
	jmp	%i0, 0(%i31)
then.72926:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68658
loop_end.68658:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.72838:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
judge_intersection_fast.3031:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i21, %i4
	mov	%i20, %i5
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	mov	%i18, %i0
	lw	%i4, 151(%i0)
	lw	%i19, 0(%i4)
	lw	%i17, 0(%i19)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.73015
	movi	%i31, 99
	jeq	%i16, %i31, then.73017
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.73019
	movi	%i31, 2
	jeq	%i6, %i31, then.73021
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.73023
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73020
then.73023:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73025
	jeq	%i11, %i0, then.73027
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.73028
then.73027:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.73028:
	movi	%i4, 1
	jzero	%i0, %i0, cont.73026
then.73025:
	mov	%i4, %i0
cont.73026:
cont.73024:
	jzero	%i0, %i0, cont.73020
then.73021:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73029
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.73030
then.73029:
	mov	%i4, %i0
cont.73030:
cont.73022:
	jzero	%i0, %i0, cont.73020
then.73019:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.73020:
	jeq	%i4, %i0, cont.73031
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.73032
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i19, 0(%i1)
	sw	%i20, 1(%i1)
	sw	%i21, 2(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i19, 0(%i1)
	lw	%i20, 1(%i1)
	lw	%i21, 2(%i1)
	addi	%i1, %i1, 16
cont.73032:
cont.73031:
	jzero	%i0, %i0, cont.73018
then.73017:
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i19, 0(%i1)
	sw	%i20, 1(%i1)
	sw	%i21, 2(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i19, 0(%i1)
	lw	%i20, 1(%i1)
	lw	%i21, 2(%i1)
	addi	%i1, %i1, 16
cont.73018:
	movi	%i4, 1
	mov	%i18, %i4
loop_start.68744:
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.73034
	movi	%i31, 99
	jeq	%i16, %i31, then.73036
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.73038
	movi	%i31, 2
	jeq	%i6, %i31, then.73040
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.73042
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73039
then.73042:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73044
	jeq	%i11, %i0, then.73046
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.73047
then.73046:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.73047:
	movi	%i4, 1
	jzero	%i0, %i0, cont.73045
then.73044:
	mov	%i4, %i0
cont.73045:
cont.73043:
	jzero	%i0, %i0, cont.73039
then.73040:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73048
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.73049
then.73048:
	mov	%i4, %i0
cont.73049:
cont.73041:
	jzero	%i0, %i0, cont.73039
then.73038:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.73039:
	jeq	%i4, %i0, cont.73050
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.73051
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73051:
cont.73050:
	jzero	%i0, %i0, cont.73037
then.73036:
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73037:
	addi	%i18, %i18, 1
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.73052
	movi	%i31, 99
	jeq	%i16, %i31, then.73054
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.73056
	movi	%i31, 2
	jeq	%i6, %i31, then.73058
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.73060
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73057
then.73060:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73062
	jeq	%i11, %i0, then.73064
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.73065
then.73064:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.73065:
	movi	%i4, 1
	jzero	%i0, %i0, cont.73063
then.73062:
	mov	%i4, %i0
cont.73063:
cont.73061:
	jzero	%i0, %i0, cont.73057
then.73058:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73066
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.73067
then.73066:
	mov	%i4, %i0
cont.73067:
cont.73059:
	jzero	%i0, %i0, cont.73057
then.73056:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.73057:
	jeq	%i4, %i0, cont.73068
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.73069
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73069:
cont.73068:
	jzero	%i0, %i0, cont.73055
then.73054:
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73055:
	addi	%i18, %i18, 1
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.73070
	movi	%i31, 99
	jeq	%i16, %i31, then.73072
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.73074
	movi	%i31, 2
	jeq	%i6, %i31, then.73076
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.73078
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73075
then.73078:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73080
	jeq	%i11, %i0, then.73082
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.73083
then.73082:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.73083:
	movi	%i4, 1
	jzero	%i0, %i0, cont.73081
then.73080:
	mov	%i4, %i0
cont.73081:
cont.73079:
	jzero	%i0, %i0, cont.73075
then.73076:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73084
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.73085
then.73084:
	mov	%i4, %i0
cont.73085:
cont.73077:
	jzero	%i0, %i0, cont.73075
then.73074:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.73075:
	jeq	%i4, %i0, cont.73086
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.73087
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73087:
cont.73086:
	jzero	%i0, %i0, cont.73073
then.73072:
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73073:
	addi	%i18, %i18, 1
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.73088
	movi	%i31, 99
	jeq	%i16, %i31, then.73090
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.73092
	movi	%i31, 2
	jeq	%i6, %i31, then.73094
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.73096
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73093
then.73096:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73098
	jeq	%i11, %i0, then.73100
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.73101
then.73100:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.73101:
	movi	%i4, 1
	jzero	%i0, %i0, cont.73099
then.73098:
	mov	%i4, %i0
cont.73099:
cont.73097:
	jzero	%i0, %i0, cont.73093
then.73094:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73102
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.73103
then.73102:
	mov	%i4, %i0
cont.73103:
cont.73095:
	jzero	%i0, %i0, cont.73093
then.73092:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.73093:
	jeq	%i4, %i0, cont.73104
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.73105
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73105:
cont.73104:
	jzero	%i0, %i0, cont.73091
then.73090:
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73091:
	addi	%i18, %i18, 1
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.73106
	movi	%i31, 99
	jeq	%i16, %i31, then.73108
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.73110
	movi	%i31, 2
	jeq	%i6, %i31, then.73112
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.73114
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73111
then.73114:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73116
	jeq	%i11, %i0, then.73118
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.73119
then.73118:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.73119:
	movi	%i4, 1
	jzero	%i0, %i0, cont.73117
then.73116:
	mov	%i4, %i0
cont.73117:
cont.73115:
	jzero	%i0, %i0, cont.73111
then.73112:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73120
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.73121
then.73120:
	mov	%i4, %i0
cont.73121:
cont.73113:
	jzero	%i0, %i0, cont.73111
then.73110:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.73111:
	jeq	%i4, %i0, cont.73122
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.73123
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73123:
cont.73122:
	jzero	%i0, %i0, cont.73109
then.73108:
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73109:
	addi	%i18, %i18, 1
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.73124
	movi	%i31, 99
	jeq	%i16, %i31, then.73126
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.73128
	movi	%i31, 2
	jeq	%i6, %i31, then.73130
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.73132
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73129
then.73132:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73134
	jeq	%i11, %i0, then.73136
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.73137
then.73136:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.73137:
	movi	%i4, 1
	jzero	%i0, %i0, cont.73135
then.73134:
	mov	%i4, %i0
cont.73135:
cont.73133:
	jzero	%i0, %i0, cont.73129
then.73130:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73138
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.73139
then.73138:
	mov	%i4, %i0
cont.73139:
cont.73131:
	jzero	%i0, %i0, cont.73129
then.73128:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.73129:
	jeq	%i4, %i0, cont.73140
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.73141
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73141:
cont.73140:
	jzero	%i0, %i0, cont.73127
then.73126:
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73127:
	addi	%i18, %i18, 1
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.73142
	movi	%i31, 99
	jeq	%i16, %i31, then.73144
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.73146
	movi	%i31, 2
	jeq	%i6, %i31, then.73148
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.73150
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73147
then.73150:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73152
	jeq	%i11, %i0, then.73154
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.73155
then.73154:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.73155:
	movi	%i4, 1
	jzero	%i0, %i0, cont.73153
then.73152:
	mov	%i4, %i0
cont.73153:
cont.73151:
	jzero	%i0, %i0, cont.73147
then.73148:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73156
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.73157
then.73156:
	mov	%i4, %i0
cont.73157:
cont.73149:
	jzero	%i0, %i0, cont.73147
then.73146:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.73147:
	jeq	%i4, %i0, cont.73158
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.73159
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73159:
cont.73158:
	jzero	%i0, %i0, cont.73145
then.73144:
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73145:
	addi	%i18, %i18, 1
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i17, 0(%i31)
	lw	%i16, 0(%i17)
	movi	%i31, -1
	jeq	%i16, %i31, then.73160
	movi	%i31, 99
	jeq	%i16, %i31, then.73162
	slli	%i5, %i16, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i12, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	lf	%f2, 0(%i15)
	lf	%f5, 1(%i15)
	lf	%f3, 2(%i15)
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lw	%i16, 0(%i31)
	movi	%i31, 1
	jeq	%i6, %i31, then.73164
	movi	%i31, 2
	jeq	%i6, %i31, then.73166
	lf	%f4, 0(%i16)
	feq	%i4, %f4, %f0
	jeq	%i4, %i0, then.73168
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73165
then.73168:
	lf	%f1, 1(%i16)
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i16)
	fma	%f2, %f1, %f5, %f2
	lf	%f1, 3(%i16)
	fma	%f3, %f1, %f3, %f2
	lf	%f1, 3(%i15)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f4, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73170
	jeq	%i11, %i0, then.73172
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fma	%f2, %f2, %f1, %f3
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.73173
then.73172:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i16)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.73173:
	movi	%i4, 1
	jzero	%i0, %i0, cont.73171
then.73170:
	mov	%i4, %i0
cont.73171:
cont.73169:
	jzero	%i0, %i0, cont.73165
then.73166:
	lf	%f1, 0(%i16)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73174
	lf	%f2, 0(%i16)
	lf	%f1, 3(%i15)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.73175
then.73174:
	mov	%i4, %i0
cont.73175:
cont.73167:
	jzero	%i0, %i0, cont.73165
then.73164:
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i12
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i21
	fmov	%f1, %f2
	fmov	%f2, %f5
	set_label	%i31, solver_rect_fast.2911
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
cont.73165:
	jeq	%i4, %i0, cont.73176
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.73177
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73177:
cont.73176:
	jzero	%i0, %i0, cont.73163
then.73162:
	movi	%i4, 1
	mov	%i5, %i17
	mov	%i6, %i21
	mov	%i7, %i20
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	set_label	%i31, solve_one_or_network_fast.3023
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	addi	%i1, %i1, 16
cont.73163:
	addi	%i4, %i18, 1
	mov	%i18, %i4
	set_label	%i31, loop_start.68744
	jmp	%i0, 0(%i31)
then.73160:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68745
then.73142:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68745
then.73124:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68745
then.73106:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68745
then.73088:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68745
then.73070:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68745
then.73052:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68745
then.73034:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68745
loop_end.68745:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.73016
then.73015:
cont.73016:
	lw	%i4, 160(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f2
	jeq	%i4, %i0, then.73178
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73178:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
get_nvector_second.3037:
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i9)
	fsub	%f8, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i9)
	fsub	%f7, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i9)
	fsub	%f6, %f2, %f1
	lf	%f1, 0(%i8)
	fmul	%f5, %f8, %f1
	lf	%f1, 1(%i8)
	fmul	%f4, %f7, %f1
	lf	%f1, 2(%i8)
	fmul	%f3, %f6, %f1
	jeq	%i7, %i0, then.73179
	lf	%f1, 2(%i13)
	fmul	%f2, %f7, %f1
	lf	%f1, 1(%i13)
	fma	%f2, %f6, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f5
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 2(%i13)
	fmul	%f2, %f8, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f6, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f4
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 1(%i13)
	fmul	%f2, %f8, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f7, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.73180
then.73179:
	lw	%i4, 171(%i0)
	sf	%f5, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f4, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f3, 2(%i4)
cont.73180:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73181
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.73182
then.73181:
	jeq	%i10, %i0, then.73183
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.73184
then.73183:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.73184:
cont.73182:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
utexture.3042:
	lf	%f1, 0(%i12)
	lw	%i5, 176(%i0)
	sf	%f1, 0(%i5)
	lf	%f1, 1(%i12)
	lw	%i5, 176(%i0)
	sf	%f1, 1(%i5)
	lf	%f1, 2(%i12)
	lw	%i5, 176(%i0)
	sf	%f1, 2(%i5)
	movi	%i31, 1
	jeq	%i4, %i31, then.73186
	movi	%i31, 2
	jeq	%i4, %i31, then.73187
	movi	%i31, 3
	jeq	%i4, %i31, then.73188
	movi	%i31, 4
	jeq	%i4, %i31, then.73189
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.73189:
	lf	%f2, 0(%i15)
	lf	%f1, 0(%i9)
	fsub	%f3, %f2, %f1
	lf	%f1, 0(%i8)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fmul	%f5, %f3, %f1
	lf	%f2, 2(%i15)
	lf	%f1, 2(%i9)
	fsub	%f3, %f2, %f1
	lf	%f1, 2(%i8)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fmul	%f4, %f3, %f1
	fmul	%f2, %f5, %f5
	fmul	%f1, %f4, %f4
	fadd	%f3, %f2, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f5
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.73191
	movui	%i31, 268032
	mif	%f2, %i31
	jzero	%i0, %i0, cont.73192
then.73191:
	finv	%f1, %f5
	fmul	%f2, %f4, %f1
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f2
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f5, %f1
	jzero	%i0, %i31, else.73193
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f5
	jzero	%i0, %i31, else.73195
	fmul	%f4, %f5, %f5
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	jzero	%i0, %i0, cont.73194
else.73195:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f5
	fmul	%f5, %f2, %f1
	fmul	%f4, %f5, %f5
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	lf	%f1, 2(%i0)
	fadd	%f2, %f2, %f1
cont.73196:
	jzero	%i0, %i0, cont.73194
else.73193:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f5
	fmul	%f5, %f2, %f1
	fmul	%f4, %f5, %f5
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f4
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	lf	%f1, 1(%i0)
	fadd	%f2, %f2, %f1
cont.73194:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.73192:
	fmov	%f1, %f2
	ffloor	%f1, %f1
	fsub	%f2, %f2, %f1
	lf	%f4, 1(%i15)
	lf	%f1, 1(%i9)
	fsub	%f5, %f4, %f1
	lf	%f1, 1(%i8)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fmul	%f5, %f5, %f1
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f3
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.73197
	movui	%i31, 268032
	mif	%f3, %i31
	jzero	%i0, %i0, cont.73198
then.73197:
	finv	%f1, %f3
	fmul	%f3, %f5, %f1
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f3
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f5, %f1
	jzero	%i0, %i31, else.73199
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f5
	jzero	%i0, %i31, else.73201
	fmul	%f4, %f5, %f5
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	jzero	%i0, %i0, cont.73200
else.73201:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f5
	fmul	%f5, %f3, %f1
	fmul	%f4, %f5, %f5
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	lf	%f1, 2(%i0)
	fadd	%f3, %f3, %f1
cont.73202:
	jzero	%i0, %i0, cont.73200
else.73199:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f5
	fmul	%f5, %f3, %f1
	fmul	%f4, %f5, %f5
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	lf	%f1, 1(%i0)
	fadd	%f3, %f3, %f1
cont.73200:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.73198:
	fmov	%f1, %f3
	ffloor	%f1, %f1
	fsub	%f4, %f3, %f1
	movui	%i31, 254361
	ori	%i31, %i31, -1638
	mif	%f3, %i31
	movui	%i31, 258048
	mif	%f1, %i31
	fsub	%f1, %f1, %f2
	fmul	%f1, %f1, %f1
	fsub	%f2, %f3, %f1
	movui	%i31, 258048
	mif	%f1, %i31
	fsub	%f1, %f1, %f4
	fmul	%f1, %f1, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.73203
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.73204
then.73203:
	fmov	%f2, %f1
cont.73204:
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f2, %f1, %f2
	movui	%i31, 256409
	ori	%i31, %i31, -1638
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.73188:
	lf	%f2, 0(%i15)
	lf	%f1, 0(%i9)
	fsub	%f3, %f2, %f1
	lf	%f2, 2(%i15)
	lf	%f1, 2(%i9)
	fsub	%f1, %f2, %f1
	fmul	%f2, %f3, %f3
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	fmov	%f1, %f2
	ffloor	%f1, %f1
	fsub	%f2, %f2, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f2
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73206
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73208
	fmul	%f4, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f2
	jzero	%i0, %i0, cont.73207
else.73208:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73210
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73212
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.73213
else.73212:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.73213:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f4
	jzero	%i0, %i0, cont.73211
else.73210:
	lf	%f1, 3(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f4
cont.73211:
cont.73209:
	jzero	%i0, %i0, cont.73207
else.73206:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73214
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73216
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.73217
else.73216:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.73217:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f4
	jzero	%i0, %i0, cont.73215
else.73214:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f4
cont.73215:
cont.73207:
	fmul	%f2, %f1, %f1
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f2, %f1, %f2
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.73187:
	lf	%f2, 1(%i15)
	movui	%i31, 256000
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73219
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73221
	fmul	%f4, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f2
	jzero	%i0, %i0, cont.73220
else.73221:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73223
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73225
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.73226
else.73225:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.73226:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f4
	jzero	%i0, %i0, cont.73224
else.73223:
	lf	%f1, 3(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f4
cont.73224:
cont.73222:
	jzero	%i0, %i0, cont.73220
else.73219:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73227
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73229
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.73230
else.73229:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.73230:
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f4
	jzero	%i0, %i0, cont.73228
else.73227:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
	fmul	%f3, %f4, %f4
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f3
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f3
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f4
cont.73228:
cont.73220:
	fmul	%f3, %f1, %f1
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f1, %f3
	lw	%i4, 176(%i0)
	sf	%f1, 0(%i4)
	movui	%i31, 276464
	mif	%f2, %i31
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.73186:
	lf	%f2, 0(%i15)
	lf	%f1, 0(%i9)
	fsub	%f3, %f2, %f1
	movui	%i31, 251084
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f2, %f1
	movui	%i31, 268800
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	flt	%i5, %f2, %f1
	lf	%f2, 2(%i15)
	lf	%f1, 2(%i9)
	fsub	%f3, %f2, %f1
	movui	%i31, 251084
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f2, %f1
	movui	%i31, 268800
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i5, %i0, then.73232
	jeq	%i4, %i0, then.73234
	movui	%i31, 276464
	mif	%f1, %i31
	jzero	%i0, %i0, cont.73233
then.73234:
	fmov	%f1, %f0
cont.73235:
	jzero	%i0, %i0, cont.73233
then.73232:
	jeq	%i4, %i0, then.73236
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.73237
then.73236:
	movui	%i31, 276464
	mif	%f1, %i31
cont.73237:
cont.73233:
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
trace_ray.3054:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i23, %i4
	mov	%i22, %i5
	mov	%i21, %i7
	mov	%i20, %i8
	mov	%i19, %i9
	mov	%i18, %i10
	mov	%i17, %i13
	movi	%i31, 4
	jleq	%i23, %i31, then.73239
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73239:
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f3, %i31
	lw	%i4, 160(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i22
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sf	%f1, 3(%i1)
	sf	%f2, 4(%i1)
	set_label	%i31, trace_or_matrix.3013
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lf	%f1, 3(%i1)
	lf	%f2, 4(%i1)
	addi	%i1, %i1, 24
	lw	%i4, 160(%i0)
	lf	%f4, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f3, %i31
	flt	%i4, %f3, %f4
	jeq	%i4, %i0, then.73241
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f3, %i31
	flt	%i4, %f4, %f3
	jzero	%i0, %i0, cont.73242
then.73241:
	mov	%i4, %i0
cont.73242:
	jeq	%i4, %i0, then.73243
	lw	%i4, 168(%i0)
	lw	%i27, 0(%i4)
	slli	%i5, %i27, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 9(%i4)
	lw	%i12, 8(%i4)
	lw	%i26, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i25, 2(%i4)
	lw	%i24, 1(%i4)
	lw	%i15, 0(%i4)
	lf	%f3, 0(%i26)
	fmul	%f17, %f3, %f1
	movi	%i31, 1
	jeq	%i24, %i31, then.73244
	movi	%i31, 2
	jeq	%i24, %i31, then.73246
	mov	%i4, %i15
	mov	%i5, %i24
	mov	%i6, %i25
	mov	%i11, %i26
	subi	%i1, %i1, 40
	sw	%i7, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i13, 5(%i1)
	sw	%i14, 6(%i1)
	sf	%f1, 7(%i1)
	sf	%f2, 8(%i1)
	set_label	%i31, get_nvector_second.3037
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i13, 5(%i1)
	lw	%i14, 6(%i1)
	lf	%f1, 7(%i1)
	lf	%f2, 8(%i1)
	addi	%i1, %i1, 40
	jzero	%i0, %i0, cont.73245
then.73246:
	lf	%f3, 0(%i8)
	fneg	%f3, %f3
	lw	%i4, 171(%i0)
	sf	%f3, 0(%i4)
	lf	%f3, 1(%i8)
	fneg	%f3, %f3
	lw	%i4, 171(%i0)
	sf	%f3, 1(%i4)
	lf	%f3, 2(%i8)
	fneg	%f3, %f3
	lw	%i4, 171(%i0)
	sf	%f3, 2(%i4)
cont.73247:
	jzero	%i0, %i0, cont.73245
then.73244:
	lw	%i4, 157(%i0)
	lw	%i5, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i5, %i5, 1
	slli	%i4, %i5, 2
	add	%i31, %i22, %i4
	lf	%f3, 0(%i31)
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.73248
	fmov	%f3, %f0
	jzero	%i0, %i0, cont.73249
then.73248:
	flt	%i4, %f0, %f3
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f3, %i4
cont.73249:
	fneg	%f3, %f3
	slli	%i5, %i5, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i5
	sf	%f3, 0(%i31)
cont.73245:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 202(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 202(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 202(%i0)
	sf	%f3, 2(%i4)
	lw	%i16, 163(%i0)
	mov	%i4, %i15
	mov	%i5, %i24
	mov	%i6, %i25
	mov	%i11, %i26
	mov	%i15, %i16
	subi	%i1, %i1, 8
	sf	%f1, 0(%i1)
	sf	%f2, 1(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lf	%f1, 0(%i1)
	lf	%f2, 1(%i1)
	addi	%i1, %i1, 8
	slli	%i5, %i27, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i5, %i5, %i4
	slli	%i4, %i23, 2
	add	%i31, %i20, %i4
	sw	%i5, 0(%i31)
	slli	%i4, %i23, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	sf	%f3, 0(%i5)
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	sf	%f3, 1(%i5)
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	sf	%f3, 2(%i5)
	lf	%f4, 0(%i26)
	movui	%i31, 258048
	mif	%f3, %i31
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.73250
	slli	%i4, %i23, 2
	add	%i31, %i19, %i4
	sw	%i0, 0(%i31)
	jzero	%i0, %i0, cont.73251
then.73250:
	movi	%i5, 1
	slli	%i4, %i23, 2
	add	%i31, %i19, %i4
	sw	%i5, 0(%i31)
	slli	%i4, %i23, 2
	add	%i31, %i18, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 176(%i0)
	lf	%f3, 0(%i4)
	sf	%f3, 0(%i5)
	lw	%i4, 176(%i0)
	lf	%f3, 1(%i4)
	sf	%f3, 1(%i5)
	lw	%i4, 176(%i0)
	lf	%f3, 2(%i4)
	sf	%f3, 2(%i5)
	slli	%i4, %i23, 2
	add	%i31, %i18, %i4
	lw	%i4, 0(%i31)
	movui	%i31, 243712
	mif	%f3, %i31
	fmul	%f4, %f3, %f17
	lf	%f3, 0(%i4)
	fmul	%f3, %f3, %f4
	sf	%f3, 0(%i4)
	lf	%f3, 1(%i4)
	fmul	%f3, %f3, %f4
	sf	%f3, 1(%i4)
	lf	%f3, 2(%i4)
	fmul	%f3, %f3, %f4
	sf	%f3, 2(%i4)
	slli	%i4, %i23, 2
	add	%i31, %i17, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	sf	%f3, 0(%i5)
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	sf	%f3, 1(%i5)
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	sf	%f3, 2(%i5)
cont.73251:
	movui	%i31, 786432
	mif	%f6, %i31
	lf	%f4, 0(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	fma	%f5, %f4, %f3, %f5
	lf	%f4, 2(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f4, %f3, %f5
	fmul	%f5, %f6, %f3
	lf	%f4, 0(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	fma	%f3, %f5, %f3, %f4
	sf	%f3, 0(%i22)
	lf	%f4, 1(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	fma	%f3, %f5, %f3, %f4
	sf	%f3, 1(%i22)
	lf	%f4, 2(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f5, %f3, %f4
	sf	%f3, 2(%i22)
	lf	%f3, 1(%i26)
	fmul	%f16, %f1, %f3
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 32
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f1, 5(%i1)
	sf	%f2, 6(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f1, 5(%i1)
	lf	%f2, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73252
	lw	%i4, 171(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f3, 0(%i4)
	fmul	%f5, %f4, %f3
	lw	%i4, 171(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f3, 1(%i4)
	fma	%f5, %f4, %f3, %f5
	lw	%i4, 171(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f4, %f3, %f5
	fneg	%f3, %f3
	fmul	%f6, %f3, %f17
	lf	%f4, 0(%i22)
	lw	%i4, 87(%i0)
	lf	%f3, 0(%i4)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i22)
	lw	%i4, 87(%i0)
	lf	%f3, 1(%i4)
	fma	%f5, %f4, %f3, %f5
	lf	%f4, 2(%i22)
	lw	%i4, 87(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f4, %f3, %f5
	fneg	%f5, %f3
	flt	%i4, %f0, %f6
	jeq	%i4, %i0, cont.73253
	lw	%i4, 186(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 0(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 1(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73253:
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.73254
	fmul	%f3, %f5, %f5
	fmul	%f3, %f3, %f3
	fmul	%f4, %f3, %f16
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73254:
cont.73252:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 207(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 207(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 207(%i0)
	sf	%f3, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	lw	%i4, 163(%i0)
	subi	%i1, %i1, 8
	sf	%f1, 0(%i1)
	sf	%f2, 1(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f1, 0(%i1)
	lf	%f2, 1(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 496(%i0)
	lw	%i4, 0(%i4)
	subi	%i24, %i4, 1
	jleq	%i0, %i24, then.73255
	jzero	%i0, %i0, cont.73256
then.73255:
	slli	%i5, %i24, 2
	lw	%i4, 314(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lf	%f7, 4(%i4)
	lw	%i5, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i7, 0(%i4)
	mov	%i4, %i6
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	sw	%i20, 5(%i1)
	sw	%i21, 6(%i1)
	sf	%f1, 7(%i1)
	sf	%f2, 8(%i1)
	sf	%f7, 9(%i1)
	set_label	%i31, judge_intersection_fast.3031
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	lw	%i20, 5(%i1)
	lw	%i21, 6(%i1)
	lf	%f1, 7(%i1)
	lf	%f2, 8(%i1)
	lf	%f7, 9(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	jeq	%i4, %i0, cont.73257
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i4, %i5, %i4
	ceq	%i31, %i4, %i7
	jzero	%i0, %i31, cont.73258
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f1, 6(%i1)
	sf	%f2, 7(%i1)
	sf	%f7, 8(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f1, 6(%i1)
	lf	%f2, 7(%i1)
	lf	%f7, 8(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73259
	lw	%i4, 171(%i0)
	lf	%f4, 0(%i4)
	lf	%f3, 0(%i6)
	fmul	%f5, %f4, %f3
	lw	%i4, 171(%i0)
	lf	%f4, 1(%i4)
	lf	%f3, 1(%i6)
	fma	%f5, %f4, %f3, %f5
	lw	%i4, 171(%i0)
	lf	%f4, 2(%i4)
	lf	%f3, 2(%i6)
	fma	%f4, %f4, %f3, %f5
	fmul	%f3, %f7, %f17
	fmul	%f6, %f3, %f4
	lf	%f4, 0(%i22)
	lf	%f3, 0(%i6)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i22)
	lf	%f3, 1(%i6)
	fma	%f5, %f4, %f3, %f5
	lf	%f4, 2(%i22)
	lf	%f3, 2(%i6)
	fma	%f3, %f4, %f3, %f5
	fmul	%f5, %f7, %f3
	flt	%i4, %f0, %f6
	jeq	%i4, %i0, cont.73260
	lw	%i4, 186(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 0(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 1(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73260:
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.73261
	fmul	%f3, %f5, %f5
	fmul	%f3, %f3, %f3
	fmul	%f4, %f3, %f16
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73261:
cont.73259:
cont.73258:
cont.73257:
	subi	%i4, %i24, 1
	mov	%i24, %i4
loop_start.68841:
	jleq	%i0, %i24, then.73263
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68842
	set_label	%i31, loop_start.68841
	jmp	%i0, 0(%i31)
then.73263:
	slli	%i5, %i24, 2
	lw	%i4, 314(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lf	%f7, 4(%i4)
	lw	%i5, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i7, 0(%i4)
	mov	%i4, %i6
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	sw	%i20, 5(%i1)
	sw	%i21, 6(%i1)
	sf	%f1, 7(%i1)
	sf	%f2, 8(%i1)
	sf	%f7, 9(%i1)
	set_label	%i31, judge_intersection_fast.3031
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	lw	%i20, 5(%i1)
	lw	%i21, 6(%i1)
	lf	%f1, 7(%i1)
	lf	%f2, 8(%i1)
	lf	%f7, 9(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	jeq	%i4, %i0, cont.73265
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i4, %i5, %i4
	ceq	%i31, %i4, %i7
	jzero	%i0, %i31, cont.73266
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f1, 6(%i1)
	sf	%f2, 7(%i1)
	sf	%f7, 8(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f1, 6(%i1)
	lf	%f2, 7(%i1)
	lf	%f7, 8(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73267
	lw	%i4, 171(%i0)
	lf	%f4, 0(%i4)
	lf	%f3, 0(%i6)
	fmul	%f5, %f4, %f3
	lw	%i4, 171(%i0)
	lf	%f4, 1(%i4)
	lf	%f3, 1(%i6)
	fma	%f5, %f4, %f3, %f5
	lw	%i4, 171(%i0)
	lf	%f4, 2(%i4)
	lf	%f3, 2(%i6)
	fma	%f4, %f4, %f3, %f5
	fmul	%f3, %f7, %f17
	fmul	%f6, %f3, %f4
	lf	%f4, 0(%i22)
	lf	%f3, 0(%i6)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i22)
	lf	%f3, 1(%i6)
	fma	%f5, %f4, %f3, %f5
	lf	%f4, 2(%i22)
	lf	%f3, 2(%i6)
	fma	%f3, %f4, %f3, %f5
	fmul	%f5, %f7, %f3
	flt	%i4, %f0, %f6
	jeq	%i4, %i0, cont.73268
	lw	%i4, 186(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 0(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 1(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73268:
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.73269
	fmul	%f3, %f5, %f5
	fmul	%f3, %f3, %f3
	fmul	%f4, %f3, %f16
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73269:
cont.73267:
cont.73266:
cont.73265:
	subi	%i4, %i24, 1
	mov	%i24, %i4
cont.73264:
	set_label	%i30, loop_start.68841
	jmp	%i0, 0(%i30)
loop_end.68842:
	mov	%i0, %i31
cont.73256:
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f3, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.73270
	movi	%i4, 4
	jleq	%i4, %i23, cont.73271
	addi	%i4, %i23, 1
	movi	%i5, -1
	slli	%i4, %i4, 2
	add	%i31, %i20, %i4
	sw	%i5, 0(%i31)
cont.73271:
	movi	%i31, 2
	jeq	%i25, %i31, then.73272
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73272:
	movui	%i31, 260096
	mif	%f4, %i31
	lf	%f3, 0(%i26)
	fsub	%f3, %f4, %f3
	fmul	%f3, %f1, %f3
	addi	%i5, %i23, 1
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	fadd	%f2, %f2, %f1
	mov	%i23, %i5
	fmov	%f1, %f3
loop_start.68847:
	movi	%i31, 4
	jleq	%i23, %i31, then.73275
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68848
	set_label	%i31, loop_start.68847
	jmp	%i0, 0(%i31)
then.73275:
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f3, %i31
	lw	%i4, 160(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i22
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sf	%f1, 3(%i1)
	sf	%f2, 4(%i1)
	set_label	%i31, trace_or_matrix.3013
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lf	%f1, 3(%i1)
	lf	%f2, 4(%i1)
	addi	%i1, %i1, 24
	lw	%i4, 160(%i0)
	lf	%f4, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f3, %i31
	flt	%i4, %f3, %f4
	jeq	%i4, %i0, then.73277
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f3, %i31
	flt	%i4, %f4, %f3
	jzero	%i0, %i0, cont.73278
then.73277:
	mov	%i4, %i0
cont.73278:
	jeq	%i4, %i0, then.73279
	lw	%i4, 168(%i0)
	lw	%i27, 0(%i4)
	slli	%i5, %i27, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 9(%i4)
	lw	%i12, 8(%i4)
	lw	%i26, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i25, 2(%i4)
	lw	%i24, 1(%i4)
	lw	%i15, 0(%i4)
	lf	%f3, 0(%i26)
	fmul	%f17, %f3, %f1
	movi	%i31, 1
	jeq	%i24, %i31, then.73281
	movi	%i31, 2
	jeq	%i24, %i31, then.73283
	mov	%i4, %i15
	mov	%i5, %i24
	mov	%i6, %i25
	mov	%i11, %i26
	subi	%i1, %i1, 40
	sw	%i7, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i13, 5(%i1)
	sw	%i14, 6(%i1)
	sf	%f1, 7(%i1)
	sf	%f2, 8(%i1)
	set_label	%i31, get_nvector_second.3037
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i13, 5(%i1)
	lw	%i14, 6(%i1)
	lf	%f1, 7(%i1)
	lf	%f2, 8(%i1)
	addi	%i1, %i1, 40
	jzero	%i0, %i0, cont.73282
then.73283:
	lf	%f3, 0(%i8)
	fneg	%f3, %f3
	lw	%i4, 171(%i0)
	sf	%f3, 0(%i4)
	lf	%f3, 1(%i8)
	fneg	%f3, %f3
	lw	%i4, 171(%i0)
	sf	%f3, 1(%i4)
	lf	%f3, 2(%i8)
	fneg	%f3, %f3
	lw	%i4, 171(%i0)
	sf	%f3, 2(%i4)
cont.73284:
	jzero	%i0, %i0, cont.73282
then.73281:
	lw	%i4, 157(%i0)
	lw	%i5, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i5, %i5, 1
	slli	%i4, %i5, 2
	add	%i31, %i22, %i4
	lf	%f3, 0(%i31)
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.73285
	fmov	%f3, %f0
	jzero	%i0, %i0, cont.73286
then.73285:
	flt	%i4, %f0, %f3
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f3, %i4
cont.73286:
	fneg	%f3, %f3
	slli	%i5, %i5, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i5
	sf	%f3, 0(%i31)
cont.73282:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 202(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 202(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 202(%i0)
	sf	%f3, 2(%i4)
	lw	%i16, 163(%i0)
	mov	%i4, %i15
	mov	%i5, %i24
	mov	%i6, %i25
	mov	%i11, %i26
	mov	%i15, %i16
	subi	%i1, %i1, 8
	sf	%f1, 0(%i1)
	sf	%f2, 1(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lf	%f1, 0(%i1)
	lf	%f2, 1(%i1)
	addi	%i1, %i1, 8
	slli	%i5, %i27, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i5, %i5, %i4
	slli	%i4, %i23, 2
	add	%i31, %i20, %i4
	sw	%i5, 0(%i31)
	slli	%i4, %i23, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	sf	%f3, 0(%i5)
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	sf	%f3, 1(%i5)
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	sf	%f3, 2(%i5)
	lf	%f4, 0(%i26)
	movui	%i31, 258048
	mif	%f3, %i31
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.73287
	slli	%i4, %i23, 2
	add	%i31, %i19, %i4
	sw	%i0, 0(%i31)
	jzero	%i0, %i0, cont.73288
then.73287:
	movi	%i5, 1
	slli	%i4, %i23, 2
	add	%i31, %i19, %i4
	sw	%i5, 0(%i31)
	slli	%i4, %i23, 2
	add	%i31, %i18, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 176(%i0)
	lf	%f3, 0(%i4)
	sf	%f3, 0(%i5)
	lw	%i4, 176(%i0)
	lf	%f3, 1(%i4)
	sf	%f3, 1(%i5)
	lw	%i4, 176(%i0)
	lf	%f3, 2(%i4)
	sf	%f3, 2(%i5)
	slli	%i4, %i23, 2
	add	%i31, %i18, %i4
	lw	%i4, 0(%i31)
	movui	%i31, 243712
	mif	%f3, %i31
	fmul	%f4, %f3, %f17
	lf	%f3, 0(%i4)
	fmul	%f3, %f3, %f4
	sf	%f3, 0(%i4)
	lf	%f3, 1(%i4)
	fmul	%f3, %f3, %f4
	sf	%f3, 1(%i4)
	lf	%f3, 2(%i4)
	fmul	%f3, %f3, %f4
	sf	%f3, 2(%i4)
	slli	%i4, %i23, 2
	add	%i31, %i17, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	sf	%f3, 0(%i5)
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	sf	%f3, 1(%i5)
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	sf	%f3, 2(%i5)
cont.73288:
	movui	%i31, 786432
	mif	%f6, %i31
	lf	%f4, 0(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	fma	%f5, %f4, %f3, %f5
	lf	%f4, 2(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f4, %f3, %f5
	fmul	%f5, %f6, %f3
	lf	%f4, 0(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	fma	%f3, %f5, %f3, %f4
	sf	%f3, 0(%i22)
	lf	%f4, 1(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	fma	%f3, %f5, %f3, %f4
	sf	%f3, 1(%i22)
	lf	%f4, 2(%i22)
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f5, %f3, %f4
	sf	%f3, 2(%i22)
	lf	%f3, 1(%i26)
	fmul	%f16, %f1, %f3
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 32
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f1, 5(%i1)
	sf	%f2, 6(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f1, 5(%i1)
	lf	%f2, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73289
	lw	%i4, 171(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f3, 0(%i4)
	fmul	%f5, %f4, %f3
	lw	%i4, 171(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f3, 1(%i4)
	fma	%f5, %f4, %f3, %f5
	lw	%i4, 171(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f4, %f3, %f5
	fneg	%f3, %f3
	fmul	%f6, %f3, %f17
	lf	%f4, 0(%i22)
	lw	%i4, 87(%i0)
	lf	%f3, 0(%i4)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i22)
	lw	%i4, 87(%i0)
	lf	%f3, 1(%i4)
	fma	%f5, %f4, %f3, %f5
	lf	%f4, 2(%i22)
	lw	%i4, 87(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f4, %f3, %f5
	fneg	%f5, %f3
	flt	%i4, %f0, %f6
	jeq	%i4, %i0, cont.73290
	lw	%i4, 186(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 0(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 1(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73290:
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.73291
	fmul	%f3, %f5, %f5
	fmul	%f3, %f3, %f3
	fmul	%f4, %f3, %f16
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73291:
cont.73289:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 207(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 207(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 207(%i0)
	sf	%f3, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	lw	%i4, 163(%i0)
	subi	%i1, %i1, 8
	sf	%f1, 0(%i1)
	sf	%f2, 1(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f1, 0(%i1)
	lf	%f2, 1(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 496(%i0)
	lw	%i4, 0(%i4)
	subi	%i24, %i4, 1
	jleq	%i0, %i24, then.73292
	jzero	%i0, %i0, cont.73293
then.73292:
	slli	%i5, %i24, 2
	lw	%i4, 314(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lf	%f7, 4(%i4)
	lw	%i5, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i7, 0(%i4)
	mov	%i4, %i6
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	sw	%i20, 5(%i1)
	sw	%i21, 6(%i1)
	sf	%f1, 7(%i1)
	sf	%f2, 8(%i1)
	sf	%f7, 9(%i1)
	set_label	%i31, judge_intersection_fast.3031
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	lw	%i20, 5(%i1)
	lw	%i21, 6(%i1)
	lf	%f1, 7(%i1)
	lf	%f2, 8(%i1)
	lf	%f7, 9(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	jeq	%i4, %i0, cont.73294
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i4, %i5, %i4
	ceq	%i31, %i4, %i7
	jzero	%i0, %i31, cont.73295
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f1, 6(%i1)
	sf	%f2, 7(%i1)
	sf	%f7, 8(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f1, 6(%i1)
	lf	%f2, 7(%i1)
	lf	%f7, 8(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73296
	lw	%i4, 171(%i0)
	lf	%f4, 0(%i4)
	lf	%f3, 0(%i6)
	fmul	%f5, %f4, %f3
	lw	%i4, 171(%i0)
	lf	%f4, 1(%i4)
	lf	%f3, 1(%i6)
	fma	%f5, %f4, %f3, %f5
	lw	%i4, 171(%i0)
	lf	%f4, 2(%i4)
	lf	%f3, 2(%i6)
	fma	%f4, %f4, %f3, %f5
	fmul	%f3, %f7, %f17
	fmul	%f6, %f3, %f4
	lf	%f4, 0(%i22)
	lf	%f3, 0(%i6)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i22)
	lf	%f3, 1(%i6)
	fma	%f5, %f4, %f3, %f5
	lf	%f4, 2(%i22)
	lf	%f3, 2(%i6)
	fma	%f3, %f4, %f3, %f5
	fmul	%f5, %f7, %f3
	flt	%i4, %f0, %f6
	jeq	%i4, %i0, cont.73297
	lw	%i4, 186(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 0(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 1(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73297:
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.73298
	fmul	%f3, %f5, %f5
	fmul	%f3, %f3, %f3
	fmul	%f4, %f3, %f16
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73298:
cont.73296:
cont.73295:
cont.73294:
	subi	%i4, %i24, 1
	mov	%i24, %i4
loop_start.68865:
	jleq	%i0, %i24, then.73300
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68866
	set_label	%i31, loop_start.68865
	jmp	%i0, 0(%i31)
then.73300:
	slli	%i5, %i24, 2
	lw	%i4, 314(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lf	%f7, 4(%i4)
	lw	%i5, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i7, 0(%i4)
	mov	%i4, %i6
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	sw	%i20, 5(%i1)
	sw	%i21, 6(%i1)
	sf	%f1, 7(%i1)
	sf	%f2, 8(%i1)
	sf	%f7, 9(%i1)
	set_label	%i31, judge_intersection_fast.3031
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	lw	%i20, 5(%i1)
	lw	%i21, 6(%i1)
	lf	%f1, 7(%i1)
	lf	%f2, 8(%i1)
	lf	%f7, 9(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	jeq	%i4, %i0, cont.73302
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i4, %i5, %i4
	ceq	%i31, %i4, %i7
	jzero	%i0, %i31, cont.73303
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 40
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f1, 6(%i1)
	sf	%f2, 7(%i1)
	sf	%f7, 8(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f1, 6(%i1)
	lf	%f2, 7(%i1)
	lf	%f7, 8(%i1)
	addi	%i1, %i1, 40
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73304
	lw	%i4, 171(%i0)
	lf	%f4, 0(%i4)
	lf	%f3, 0(%i6)
	fmul	%f5, %f4, %f3
	lw	%i4, 171(%i0)
	lf	%f4, 1(%i4)
	lf	%f3, 1(%i6)
	fma	%f5, %f4, %f3, %f5
	lw	%i4, 171(%i0)
	lf	%f4, 2(%i4)
	lf	%f3, 2(%i6)
	fma	%f4, %f4, %f3, %f5
	fmul	%f3, %f7, %f17
	fmul	%f6, %f3, %f4
	lf	%f4, 0(%i22)
	lf	%f3, 0(%i6)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i22)
	lf	%f3, 1(%i6)
	fma	%f5, %f4, %f3, %f5
	lf	%f4, 2(%i22)
	lf	%f3, 2(%i6)
	fma	%f3, %f4, %f3, %f5
	fmul	%f5, %f7, %f3
	flt	%i4, %f0, %f6
	jeq	%i4, %i0, cont.73305
	lw	%i4, 186(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 0(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 1(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f3, 2(%i4)
	fma	%f3, %f6, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73305:
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.73306
	fmul	%f3, %f5, %f5
	fmul	%f3, %f3, %f3
	fmul	%f4, %f3, %f16
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	fadd	%f3, %f3, %f4
	lw	%i4, 186(%i0)
	sf	%f3, 2(%i4)
cont.73306:
cont.73304:
cont.73303:
cont.73302:
	subi	%i4, %i24, 1
	mov	%i24, %i4
cont.73301:
	set_label	%i30, loop_start.68865
	jmp	%i0, 0(%i30)
loop_end.68866:
	mov	%i0, %i31
cont.73293:
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f3, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.73307
	movi	%i4, 4
	jleq	%i4, %i23, cont.73309
	addi	%i4, %i23, 1
	movi	%i5, -1
	slli	%i4, %i4, 2
	add	%i31, %i20, %i4
	sw	%i5, 0(%i31)
cont.73309:
	movi	%i31, 2
	jeq	%i25, %i31, then.73310
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68848
	jzero	%i0, %i0, cont.73280
then.73310:
	movui	%i31, 260096
	mif	%f4, %i31
	lf	%f3, 0(%i26)
	fsub	%f3, %f4, %f3
	fmul	%f3, %f1, %f3
	addi	%i5, %i23, 1
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	fadd	%f2, %f2, %f1
	mov	%i23, %i5
	fmov	%f1, %f3
cont.73311:
	jzero	%i0, %i0, cont.73280
then.73307:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68848
then.73279:
	movi	%i5, -1
	slli	%i4, %i23, 2
	add	%i31, %i20, %i4
	sw	%i5, 0(%i31)
	jeq	%i23, %i0, then.73312
	lf	%f3, 0(%i22)
	lw	%i4, 87(%i0)
	lf	%f2, 0(%i4)
	fmul	%f4, %f3, %f2
	lf	%f3, 1(%i22)
	lw	%i4, 87(%i0)
	lf	%f2, 1(%i4)
	fma	%f4, %f3, %f2, %f4
	lf	%f3, 2(%i22)
	lw	%i4, 87(%i0)
	lf	%f2, 2(%i4)
	fma	%f2, %f3, %f2, %f4
	fneg	%f3, %f2
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.73314
	fmul	%f2, %f3, %f3
	fmul	%f2, %f2, %f3
	fmul	%f2, %f2, %f1
	lw	%i4, 92(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f2, %f1
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	fadd	%f1, %f1, %f2
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	fadd	%f1, %f1, %f2
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	fadd	%f1, %f1, %f2
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68848
	jzero	%i0, %i0, cont.73313
then.73314:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68848
then.73312:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68848
cont.73313:
cont.73280:
cont.73276:
	set_label	%i30, loop_start.68847
	jmp	%i0, 0(%i30)
loop_end.68848:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73270:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73243:
	movi	%i5, -1
	slli	%i4, %i23, 2
	add	%i31, %i20, %i4
	sw	%i5, 0(%i31)
	jeq	%i23, %i0, then.73317
	lf	%f3, 0(%i22)
	lw	%i4, 87(%i0)
	lf	%f2, 0(%i4)
	fmul	%f4, %f3, %f2
	lf	%f3, 1(%i22)
	lw	%i4, 87(%i0)
	lf	%f2, 1(%i4)
	fma	%f4, %f3, %f2, %f4
	lf	%f3, 2(%i22)
	lw	%i4, 87(%i0)
	lf	%f2, 2(%i4)
	fma	%f2, %f3, %f2, %f4
	fneg	%f3, %f2
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.73318
	fmul	%f2, %f3, %f3
	fmul	%f2, %f2, %f3
	fmul	%f2, %f2, %f1
	lw	%i4, 92(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f2, %f1
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	fadd	%f1, %f1, %f2
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	fadd	%f1, %f1, %f2
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	fadd	%f1, %f1, %f2
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73318:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73317:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
trace_diffuse_ray.3060:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i17, %i4
	mov	%i7, %i5
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f2, %i31
	lw	%i4, 160(%i0)
	sf	%f2, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 8
	sw	%i17, 0(%i1)
	sf	%f1, 1(%i1)
	set_label	%i31, trace_or_matrix_fast.3027
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lf	%f1, 1(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 160(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f2, %i31
	flt	%i4, %f2, %f3
	jeq	%i4, %i0, then.73322
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f2, %i31
	flt	%i4, %f3, %f2
	jzero	%i0, %i0, cont.73323
then.73322:
	mov	%i4, %i0
cont.73323:
	jeq	%i4, %i0, cont.73324
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 9(%i4)
	lw	%i12, 8(%i4)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i15, 0(%i4)
	movi	%i31, 1
	jeq	%i5, %i31, then.73325
	movi	%i31, 2
	jeq	%i5, %i31, then.73327
	mov	%i4, %i15
	subi	%i1, %i1, 48
	sw	%i5, 0(%i1)
	sw	%i6, 1(%i1)
	sw	%i7, 2(%i1)
	sw	%i8, 3(%i1)
	sw	%i9, 4(%i1)
	sw	%i10, 5(%i1)
	sw	%i11, 6(%i1)
	sw	%i12, 7(%i1)
	sw	%i13, 8(%i1)
	sw	%i14, 9(%i1)
	sf	%f1, 10(%i1)
	set_label	%i31, get_nvector_second.3037
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i6, 1(%i1)
	lw	%i7, 2(%i1)
	lw	%i8, 3(%i1)
	lw	%i9, 4(%i1)
	lw	%i10, 5(%i1)
	lw	%i11, 6(%i1)
	lw	%i12, 7(%i1)
	lw	%i13, 8(%i1)
	lw	%i14, 9(%i1)
	lf	%f1, 10(%i1)
	addi	%i1, %i1, 48
	jzero	%i0, %i0, cont.73326
then.73327:
	lf	%f2, 0(%i8)
	fneg	%f2, %f2
	lw	%i4, 171(%i0)
	sf	%f2, 0(%i4)
	lf	%f2, 1(%i8)
	fneg	%f2, %f2
	lw	%i4, 171(%i0)
	sf	%f2, 1(%i4)
	lf	%f2, 2(%i8)
	fneg	%f2, %f2
	lw	%i4, 171(%i0)
	sf	%f2, 2(%i4)
cont.73328:
	jzero	%i0, %i0, cont.73326
then.73325:
	lw	%i4, 157(%i0)
	lw	%i16, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i16, %i16, 1
	slli	%i4, %i16, 2
	add	%i31, %i17, %i4
	lf	%f2, 0(%i31)
	feq	%i4, %f2, %f0
	jeq	%i4, %i0, then.73329
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.73330
then.73329:
	flt	%i4, %f0, %f2
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f2, %i4
cont.73330:
	fneg	%f2, %f2
	slli	%i16, %i16, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i16
	sf	%f2, 0(%i31)
cont.73326:
	lw	%i16, 163(%i0)
	mov	%i4, %i15
	mov	%i15, %i16
	subi	%i1, %i1, 8
	sw	%i11, 0(%i1)
	sf	%f1, 1(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	lf	%f1, 1(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 8
	sw	%i11, 0(%i1)
	sf	%f1, 1(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	lf	%f1, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i4, %i30
	jeq	%i4, %i0, then.73331
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73331:
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f2, 0(%i4)
	fmul	%f4, %f3, %f2
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f2, 1(%i4)
	fma	%f4, %f3, %f2, %f4
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f2, 2(%i4)
	fma	%f2, %f3, %f2, %f4
	fneg	%f2, %f2
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, then.73333
	jzero	%i0, %i0, cont.73334
then.73333:
	fmov	%f2, %f0
cont.73334:
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i11)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
cont.73324:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
iter_trace_diffuse_rays.3063:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i19, %i4
	mov	%i18, %i5
	mov	%i17, %i7
	jleq	%i0, %i17, then.73336
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73336:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i18)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i18)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i18)
	fma	%f2, %f2, %f1, %f3
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73338
	addi	%i4, %i17, 1
	slli	%i4, %i4, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f4, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i4, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sf	%f4, 4(%i1)
	set_label	%i31, judge_intersection_fast.3031
	jmp	%i3, 0(%i31)
	lw	%i4, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lf	%f4, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i5, %i30
	jeq	%i5, %i0, cont.73340
	lw	%i5, 168(%i0)
	lw	%i5, 0(%i5)
	slli	%i6, %i5, 2
	lw	%i5, 15(%i0)
	add	%i31, %i5, %i6
	lw	%i5, 0(%i31)
	lw	%i14, 10(%i5)
	lw	%i13, 9(%i5)
	lw	%i12, 8(%i5)
	lw	%i20, 7(%i5)
	lw	%i11, 6(%i5)
	lw	%i10, 5(%i5)
	lw	%i9, 4(%i5)
	lw	%i8, 3(%i5)
	lw	%i7, 2(%i5)
	lw	%i6, 1(%i5)
	lw	%i5, 0(%i5)
	movi	%i31, 1
	jeq	%i6, %i31, then.73341
	movi	%i31, 2
	jeq	%i6, %i31, then.73343
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f9, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f8, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f7, %f2, %f1
	lf	%f1, 0(%i9)
	fmul	%f6, %f9, %f1
	lf	%f1, 1(%i9)
	fmul	%f5, %f8, %f1
	lf	%f1, 2(%i9)
	fmul	%f3, %f7, %f1
	jeq	%i8, %i0, then.73345
	lf	%f1, 2(%i13)
	fmul	%f2, %f8, %f1
	lf	%f1, 1(%i13)
	fma	%f2, %f7, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f6
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 2(%i13)
	fmul	%f2, %f9, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f7, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f5
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 1(%i13)
	fmul	%f2, %f9, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f8, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.73346
then.73345:
	lw	%i4, 171(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f5, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f3, 2(%i4)
cont.73346:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73347
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.73348
then.73347:
	jeq	%i11, %i0, then.73349
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.73350
then.73349:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.73350:
cont.73348:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.73342
then.73343:
	lf	%f1, 0(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.73344:
	jzero	%i0, %i0, cont.73342
then.73341:
	lw	%i15, 157(%i0)
	lw	%i16, 0(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 0(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 1(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 2(%i15)
	subi	%i16, %i16, 1
	slli	%i15, %i16, 2
	add	%i31, %i4, %i15
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73351
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.73352
then.73351:
	flt	%i4, %f0, %f1
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
cont.73352:
	fneg	%f1, %f1
	slli	%i15, %i16, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i15
	sf	%f1, 0(%i31)
cont.73342:
	lw	%i15, 163(%i0)
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i20
	subi	%i1, %i1, 8
	sf	%f4, 0(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lf	%f4, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sf	%f4, 4(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lf	%f4, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73353
	lw	%i4, 171(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fma	%f3, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73354
	jzero	%i0, %i0, cont.73355
then.73354:
	fmov	%f1, %f0
cont.73355:
	fmul	%f2, %f4, %f1
	lf	%f1, 0(%i20)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.73353:
cont.73340:
	jzero	%i0, %i0, cont.73339
then.73338:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f4, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i4, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sf	%f4, 4(%i1)
	set_label	%i31, judge_intersection_fast.3031
	jmp	%i3, 0(%i31)
	lw	%i4, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lf	%f4, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i5, %i30
	jeq	%i5, %i0, cont.73356
	lw	%i5, 168(%i0)
	lw	%i5, 0(%i5)
	slli	%i6, %i5, 2
	lw	%i5, 15(%i0)
	add	%i31, %i5, %i6
	lw	%i5, 0(%i31)
	lw	%i14, 10(%i5)
	lw	%i13, 9(%i5)
	lw	%i12, 8(%i5)
	lw	%i20, 7(%i5)
	lw	%i11, 6(%i5)
	lw	%i10, 5(%i5)
	lw	%i9, 4(%i5)
	lw	%i8, 3(%i5)
	lw	%i7, 2(%i5)
	lw	%i6, 1(%i5)
	lw	%i5, 0(%i5)
	movi	%i31, 1
	jeq	%i6, %i31, then.73357
	movi	%i31, 2
	jeq	%i6, %i31, then.73359
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f9, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f8, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f7, %f2, %f1
	lf	%f1, 0(%i9)
	fmul	%f6, %f9, %f1
	lf	%f1, 1(%i9)
	fmul	%f5, %f8, %f1
	lf	%f1, 2(%i9)
	fmul	%f3, %f7, %f1
	jeq	%i8, %i0, then.73361
	lf	%f1, 2(%i13)
	fmul	%f2, %f8, %f1
	lf	%f1, 1(%i13)
	fma	%f2, %f7, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f6
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 2(%i13)
	fmul	%f2, %f9, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f7, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f5
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 1(%i13)
	fmul	%f2, %f9, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f8, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.73362
then.73361:
	lw	%i4, 171(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f5, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f3, 2(%i4)
cont.73362:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73363
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.73364
then.73363:
	jeq	%i11, %i0, then.73365
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.73366
then.73365:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.73366:
cont.73364:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.73358
then.73359:
	lf	%f1, 0(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.73360:
	jzero	%i0, %i0, cont.73358
then.73357:
	lw	%i15, 157(%i0)
	lw	%i16, 0(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 0(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 1(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 2(%i15)
	subi	%i16, %i16, 1
	slli	%i15, %i16, 2
	add	%i31, %i4, %i15
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73367
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.73368
then.73367:
	flt	%i4, %f0, %f1
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
cont.73368:
	fneg	%f1, %f1
	slli	%i15, %i16, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i15
	sf	%f1, 0(%i31)
cont.73358:
	lw	%i15, 163(%i0)
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i20
	subi	%i1, %i1, 8
	sf	%f4, 0(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lf	%f4, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sf	%f4, 4(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lf	%f4, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73369
	lw	%i4, 171(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fma	%f3, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73370
	jzero	%i0, %i0, cont.73371
then.73370:
	fmov	%f1, %f0
cont.73371:
	fmul	%f2, %f4, %f1
	lf	%f1, 0(%i20)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.73369:
cont.73356:
cont.73339:
	subi	%i4, %i17, 2
	mov	%i17, %i4
loop_start.68914:
	jleq	%i0, %i17, then.73373
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68915
	set_label	%i31, loop_start.68914
	jmp	%i0, 0(%i31)
then.73373:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i18)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i18)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i18)
	fma	%f2, %f2, %f1, %f3
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73375
	addi	%i4, %i17, 1
	slli	%i4, %i4, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f4, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i4, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sf	%f4, 4(%i1)
	set_label	%i31, judge_intersection_fast.3031
	jmp	%i3, 0(%i31)
	lw	%i4, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lf	%f4, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i5, %i30
	jeq	%i5, %i0, cont.73377
	lw	%i5, 168(%i0)
	lw	%i5, 0(%i5)
	slli	%i6, %i5, 2
	lw	%i5, 15(%i0)
	add	%i31, %i5, %i6
	lw	%i5, 0(%i31)
	lw	%i14, 10(%i5)
	lw	%i13, 9(%i5)
	lw	%i12, 8(%i5)
	lw	%i20, 7(%i5)
	lw	%i11, 6(%i5)
	lw	%i10, 5(%i5)
	lw	%i9, 4(%i5)
	lw	%i8, 3(%i5)
	lw	%i7, 2(%i5)
	lw	%i6, 1(%i5)
	lw	%i5, 0(%i5)
	movi	%i31, 1
	jeq	%i6, %i31, then.73378
	movi	%i31, 2
	jeq	%i6, %i31, then.73380
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f9, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f8, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f7, %f2, %f1
	lf	%f1, 0(%i9)
	fmul	%f6, %f9, %f1
	lf	%f1, 1(%i9)
	fmul	%f5, %f8, %f1
	lf	%f1, 2(%i9)
	fmul	%f3, %f7, %f1
	jeq	%i8, %i0, then.73382
	lf	%f1, 2(%i13)
	fmul	%f2, %f8, %f1
	lf	%f1, 1(%i13)
	fma	%f2, %f7, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f6
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 2(%i13)
	fmul	%f2, %f9, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f7, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f5
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 1(%i13)
	fmul	%f2, %f9, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f8, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.73383
then.73382:
	lw	%i4, 171(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f5, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f3, 2(%i4)
cont.73383:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73384
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.73385
then.73384:
	jeq	%i11, %i0, then.73386
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.73387
then.73386:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.73387:
cont.73385:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.73379
then.73380:
	lf	%f1, 0(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.73381:
	jzero	%i0, %i0, cont.73379
then.73378:
	lw	%i15, 157(%i0)
	lw	%i16, 0(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 0(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 1(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 2(%i15)
	subi	%i16, %i16, 1
	slli	%i15, %i16, 2
	add	%i31, %i4, %i15
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73388
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.73389
then.73388:
	flt	%i4, %f0, %f1
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
cont.73389:
	fneg	%f1, %f1
	slli	%i15, %i16, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i15
	sf	%f1, 0(%i31)
cont.73379:
	lw	%i15, 163(%i0)
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i20
	subi	%i1, %i1, 8
	sf	%f4, 0(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lf	%f4, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sf	%f4, 4(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lf	%f4, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73390
	lw	%i4, 171(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fma	%f3, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73391
	jzero	%i0, %i0, cont.73392
then.73391:
	fmov	%f1, %f0
cont.73392:
	fmul	%f2, %f4, %f1
	lf	%f1, 0(%i20)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.73390:
cont.73377:
	jzero	%i0, %i0, cont.73376
then.73375:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f4, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i4, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sf	%f4, 4(%i1)
	set_label	%i31, judge_intersection_fast.3031
	jmp	%i3, 0(%i31)
	lw	%i4, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lf	%f4, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i5, %i30
	jeq	%i5, %i0, cont.73393
	lw	%i5, 168(%i0)
	lw	%i5, 0(%i5)
	slli	%i6, %i5, 2
	lw	%i5, 15(%i0)
	add	%i31, %i5, %i6
	lw	%i5, 0(%i31)
	lw	%i14, 10(%i5)
	lw	%i13, 9(%i5)
	lw	%i12, 8(%i5)
	lw	%i20, 7(%i5)
	lw	%i11, 6(%i5)
	lw	%i10, 5(%i5)
	lw	%i9, 4(%i5)
	lw	%i8, 3(%i5)
	lw	%i7, 2(%i5)
	lw	%i6, 1(%i5)
	lw	%i5, 0(%i5)
	movi	%i31, 1
	jeq	%i6, %i31, then.73394
	movi	%i31, 2
	jeq	%i6, %i31, then.73396
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f9, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f8, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f7, %f2, %f1
	lf	%f1, 0(%i9)
	fmul	%f6, %f9, %f1
	lf	%f1, 1(%i9)
	fmul	%f5, %f8, %f1
	lf	%f1, 2(%i9)
	fmul	%f3, %f7, %f1
	jeq	%i8, %i0, then.73398
	lf	%f1, 2(%i13)
	fmul	%f2, %f8, %f1
	lf	%f1, 1(%i13)
	fma	%f2, %f7, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f6
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 2(%i13)
	fmul	%f2, %f9, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f7, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f5
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 1(%i13)
	fmul	%f2, %f9, %f1
	lf	%f1, 0(%i13)
	fma	%f2, %f8, %f1, %f2
	movui	%i31, 258048
	mif	%f1, %i31
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.73399
then.73398:
	lw	%i4, 171(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f5, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f3, 2(%i4)
cont.73399:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73400
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.73401
then.73400:
	jeq	%i11, %i0, then.73402
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.73403
then.73402:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.73403:
cont.73401:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.73395
then.73396:
	lf	%f1, 0(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i9)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.73397:
	jzero	%i0, %i0, cont.73395
then.73394:
	lw	%i15, 157(%i0)
	lw	%i16, 0(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 0(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 1(%i15)
	lw	%i15, 171(%i0)
	sf	%f0, 2(%i15)
	subi	%i16, %i16, 1
	slli	%i15, %i16, 2
	add	%i31, %i4, %i15
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73404
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.73405
then.73404:
	flt	%i4, %f0, %f1
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
cont.73405:
	fneg	%f1, %f1
	slli	%i15, %i16, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i15
	sf	%f1, 0(%i31)
cont.73395:
	lw	%i15, 163(%i0)
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i20
	subi	%i1, %i1, 8
	sf	%f4, 0(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lf	%f4, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sf	%f4, 4(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lf	%f4, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73406
	lw	%i4, 171(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fma	%f3, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73407
	jzero	%i0, %i0, cont.73408
then.73407:
	fmov	%f1, %f0
cont.73408:
	fmul	%f2, %f4, %f1
	lf	%f1, 0(%i20)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.73406:
cont.73393:
cont.73376:
	subi	%i4, %i17, 2
	mov	%i17, %i4
cont.73374:
	set_label	%i30, loop_start.68914
	jmp	%i0, 0(%i30)
loop_end.68915:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
trace_diffuse_rays.3068:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i19, %i4
	mov	%i18, %i5
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	movi	%i17, 118
	lw	%i4, 118(%i19)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i18)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i18)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i18)
	fma	%f2, %f2, %f1, %f3
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73409
	lw	%i4, 119(%i19)
	lw	%i7, 1(%i4)
	lw	%i17, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f16, %f2, %f1
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, trace_or_matrix_fast.3027
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	lw	%i4, 160(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f2
	jeq	%i4, %i0, then.73411
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.73412
then.73411:
	mov	%i4, %i0
cont.73412:
	jeq	%i4, %i0, cont.73413
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 9(%i4)
	lw	%i12, 8(%i4)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i15, 0(%i4)
	movi	%i31, 1
	jeq	%i5, %i31, then.73414
	movi	%i31, 2
	jeq	%i5, %i31, then.73416
	mov	%i4, %i15
	subi	%i1, %i1, 40
	sw	%i5, 0(%i1)
	sw	%i6, 1(%i1)
	sw	%i7, 2(%i1)
	sw	%i8, 3(%i1)
	sw	%i9, 4(%i1)
	sw	%i10, 5(%i1)
	sw	%i11, 6(%i1)
	sw	%i12, 7(%i1)
	sw	%i13, 8(%i1)
	sw	%i14, 9(%i1)
	set_label	%i31, get_nvector_second.3037
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i6, 1(%i1)
	lw	%i7, 2(%i1)
	lw	%i8, 3(%i1)
	lw	%i9, 4(%i1)
	lw	%i10, 5(%i1)
	lw	%i11, 6(%i1)
	lw	%i12, 7(%i1)
	lw	%i13, 8(%i1)
	lw	%i14, 9(%i1)
	addi	%i1, %i1, 40
	jzero	%i0, %i0, cont.73415
then.73416:
	lf	%f1, 0(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.73417:
	jzero	%i0, %i0, cont.73415
then.73414:
	lw	%i4, 157(%i0)
	lw	%i16, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i16, %i16, 1
	slli	%i4, %i16, 2
	add	%i31, %i17, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73418
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.73419
then.73418:
	flt	%i4, %f0, %f1
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
cont.73419:
	fneg	%f1, %f1
	slli	%i16, %i16, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i16
	sf	%f1, 0(%i31)
cont.73415:
	lw	%i16, 163(%i0)
	mov	%i4, %i15
	mov	%i15, %i16
	subi	%i1, %i1, 8
	sw	%i11, 0(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i11, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73420
	lw	%i4, 171(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fma	%f3, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73421
	jzero	%i0, %i0, cont.73422
then.73421:
	fmov	%f1, %f0
cont.73422:
	fmul	%f2, %f16, %f1
	lf	%f1, 0(%i11)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.73420:
cont.73413:
	jzero	%i0, %i0, cont.73410
then.73409:
	lw	%i4, 118(%i19)
	lw	%i7, 1(%i4)
	lw	%i17, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f16, %f2, %f1
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i17
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, trace_or_matrix_fast.3027
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	lw	%i4, 160(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f2
	jeq	%i4, %i0, then.73423
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.73424
then.73423:
	mov	%i4, %i0
cont.73424:
	jeq	%i4, %i0, cont.73425
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 9(%i4)
	lw	%i12, 8(%i4)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i15, 0(%i4)
	movi	%i31, 1
	jeq	%i5, %i31, then.73426
	movi	%i31, 2
	jeq	%i5, %i31, then.73428
	mov	%i4, %i15
	subi	%i1, %i1, 40
	sw	%i5, 0(%i1)
	sw	%i6, 1(%i1)
	sw	%i7, 2(%i1)
	sw	%i8, 3(%i1)
	sw	%i9, 4(%i1)
	sw	%i10, 5(%i1)
	sw	%i11, 6(%i1)
	sw	%i12, 7(%i1)
	sw	%i13, 8(%i1)
	sw	%i14, 9(%i1)
	set_label	%i31, get_nvector_second.3037
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i6, 1(%i1)
	lw	%i7, 2(%i1)
	lw	%i8, 3(%i1)
	lw	%i9, 4(%i1)
	lw	%i10, 5(%i1)
	lw	%i11, 6(%i1)
	lw	%i12, 7(%i1)
	lw	%i13, 8(%i1)
	lw	%i14, 9(%i1)
	addi	%i1, %i1, 40
	jzero	%i0, %i0, cont.73427
then.73428:
	lf	%f1, 0(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.73429:
	jzero	%i0, %i0, cont.73427
then.73426:
	lw	%i4, 157(%i0)
	lw	%i16, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i16, %i16, 1
	slli	%i4, %i16, 2
	add	%i31, %i17, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73430
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.73431
then.73430:
	flt	%i4, %f0, %f1
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
cont.73431:
	fneg	%f1, %f1
	slli	%i16, %i16, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i16
	sf	%f1, 0(%i31)
cont.73427:
	lw	%i16, 163(%i0)
	mov	%i4, %i15
	mov	%i15, %i16
	subi	%i1, %i1, 8
	sw	%i11, 0(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i11, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73432
	lw	%i4, 171(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fma	%f3, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73433
	jzero	%i0, %i0, cont.73434
then.73433:
	fmov	%f1, %f0
cont.73434:
	fmul	%f2, %f16, %f1
	lf	%f1, 0(%i11)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.73432:
cont.73425:
cont.73410:
	movi	%i4, 116
	mov	%i17, %i4
loop_start.68963:
	jleq	%i0, %i17, then.73436
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68964
	set_label	%i31, loop_start.68963
	jmp	%i0, 0(%i31)
then.73436:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i18)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i18)
	fma	%f3, %f2, %f1, %f3
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i18)
	fma	%f2, %f2, %f1, %f3
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73438
	addi	%i4, %i17, 1
	slli	%i4, %i4, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i20, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f16, %f2, %f1
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i20
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	set_label	%i31, trace_or_matrix_fast.3027
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	addi	%i1, %i1, 16
	lw	%i4, 160(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f2
	jeq	%i4, %i0, then.73440
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.73441
then.73440:
	mov	%i4, %i0
cont.73441:
	jeq	%i4, %i0, cont.73442
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 9(%i4)
	lw	%i12, 8(%i4)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i15, 0(%i4)
	movi	%i31, 1
	jeq	%i5, %i31, then.73443
	movi	%i31, 2
	jeq	%i5, %i31, then.73445
	mov	%i4, %i15
	subi	%i1, %i1, 40
	sw	%i5, 0(%i1)
	sw	%i6, 1(%i1)
	sw	%i7, 2(%i1)
	sw	%i8, 3(%i1)
	sw	%i9, 4(%i1)
	sw	%i10, 5(%i1)
	sw	%i11, 6(%i1)
	sw	%i12, 7(%i1)
	sw	%i13, 8(%i1)
	sw	%i14, 9(%i1)
	set_label	%i31, get_nvector_second.3037
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i6, 1(%i1)
	lw	%i7, 2(%i1)
	lw	%i8, 3(%i1)
	lw	%i9, 4(%i1)
	lw	%i10, 5(%i1)
	lw	%i11, 6(%i1)
	lw	%i12, 7(%i1)
	lw	%i13, 8(%i1)
	lw	%i14, 9(%i1)
	addi	%i1, %i1, 40
	jzero	%i0, %i0, cont.73444
then.73445:
	lf	%f1, 0(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.73446:
	jzero	%i0, %i0, cont.73444
then.73443:
	lw	%i4, 157(%i0)
	lw	%i16, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i16, %i16, 1
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73447
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.73448
then.73447:
	flt	%i4, %f0, %f1
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
cont.73448:
	fneg	%f1, %f1
	slli	%i16, %i16, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i16
	sf	%f1, 0(%i31)
cont.73444:
	lw	%i16, 163(%i0)
	mov	%i4, %i15
	mov	%i15, %i16
	subi	%i1, %i1, 8
	sw	%i11, 0(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i11, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73449
	lw	%i4, 171(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fma	%f3, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73450
	jzero	%i0, %i0, cont.73451
then.73450:
	fmov	%f1, %f0
cont.73451:
	fmul	%f2, %f16, %f1
	lf	%f1, 0(%i11)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.73449:
cont.73442:
	jzero	%i0, %i0, cont.73439
then.73438:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i20, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f16, %f2, %f1
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i20
	subi	%i1, %i1, 16
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	set_label	%i31, trace_or_matrix_fast.3027
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	addi	%i1, %i1, 16
	lw	%i4, 160(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f2
	jeq	%i4, %i0, then.73452
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.73453
then.73452:
	mov	%i4, %i0
cont.73453:
	jeq	%i4, %i0, cont.73454
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 9(%i4)
	lw	%i12, 8(%i4)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i15, 0(%i4)
	movi	%i31, 1
	jeq	%i5, %i31, then.73455
	movi	%i31, 2
	jeq	%i5, %i31, then.73457
	mov	%i4, %i15
	subi	%i1, %i1, 40
	sw	%i5, 0(%i1)
	sw	%i6, 1(%i1)
	sw	%i7, 2(%i1)
	sw	%i8, 3(%i1)
	sw	%i9, 4(%i1)
	sw	%i10, 5(%i1)
	sw	%i11, 6(%i1)
	sw	%i12, 7(%i1)
	sw	%i13, 8(%i1)
	sw	%i14, 9(%i1)
	set_label	%i31, get_nvector_second.3037
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i6, 1(%i1)
	lw	%i7, 2(%i1)
	lw	%i8, 3(%i1)
	lw	%i9, 4(%i1)
	lw	%i10, 5(%i1)
	lw	%i11, 6(%i1)
	lw	%i12, 7(%i1)
	lw	%i13, 8(%i1)
	lw	%i14, 9(%i1)
	addi	%i1, %i1, 40
	jzero	%i0, %i0, cont.73456
then.73457:
	lf	%f1, 0(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i8)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.73458:
	jzero	%i0, %i0, cont.73456
then.73455:
	lw	%i4, 157(%i0)
	lw	%i16, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i16, %i16, 1
	slli	%i4, %i16, 2
	add	%i31, %i20, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73459
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.73460
then.73459:
	flt	%i4, %f0, %f1
	ceqi	%i4, %i4, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
cont.73460:
	fneg	%f1, %f1
	slli	%i16, %i16, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i16
	sf	%f1, 0(%i31)
cont.73456:
	lw	%i16, 163(%i0)
	mov	%i4, %i15
	mov	%i15, %i16
	subi	%i1, %i1, 8
	sw	%i11, 0(%i1)
	set_label	%i31, utexture.3042
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i11, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	set_label	%i31, shadow_check_one_or_matrix.3002
	jmp	%i3, 0(%i31)
	lw	%i11, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73461
	lw	%i4, 171(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fma	%f3, %f2, %f1, %f3
	lw	%i4, 171(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.73462
	jzero	%i0, %i0, cont.73463
then.73462:
	fmov	%f1, %f0
cont.73463:
	fmul	%f2, %f16, %f1
	lf	%f1, 0(%i11)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f3, %f1, %f2
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.73461:
cont.73454:
cont.73439:
	subi	%i4, %i17, 2
	mov	%i17, %i4
cont.73437:
	set_label	%i30, loop_start.68963
	jmp	%i0, 0(%i30)
loop_end.68964:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
do_without_neighbors.3085:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i23, %i5
	mov	%i22, %i6
	mov	%i21, %i7
	movi	%i31, 4
	jleq	%i12, %i31, then.73464
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73464:
	slli	%i4, %i12, 2
	add	%i31, %i22, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73466
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73466:
	slli	%i4, %i12, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73468
	slli	%i4, %i12, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i19, 0(%i10)
	slli	%i4, %i12, 2
	add	%i31, %i11, %i4
	lw	%i18, 0(%i31)
	slli	%i4, %i12, 2
	add	%i31, %i23, %i4
	lw	%i17, 0(%i31)
	jeq	%i19, %i0, cont.73469
	lw	%i4, 235(%i0)
	lw	%i6, 0(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i17, 5(%i1)
	sw	%i18, 6(%i1)
	sw	%i19, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i17, 5(%i1)
	lw	%i18, 6(%i1)
	lw	%i19, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73469:
	movi	%i31, 1
	jeq	%i19, %i31, cont.73470
	lw	%i4, 235(%i0)
	lw	%i6, 1(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i17, 5(%i1)
	sw	%i18, 6(%i1)
	sw	%i19, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i17, 5(%i1)
	lw	%i18, 6(%i1)
	lw	%i19, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73470:
	movi	%i31, 2
	jeq	%i19, %i31, cont.73471
	lw	%i4, 235(%i0)
	lw	%i6, 2(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i17, 5(%i1)
	sw	%i18, 6(%i1)
	sw	%i19, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i17, 5(%i1)
	lw	%i18, 6(%i1)
	lw	%i19, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73471:
	movi	%i31, 3
	jeq	%i19, %i31, cont.73472
	lw	%i4, 235(%i0)
	lw	%i6, 3(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i17, 5(%i1)
	sw	%i18, 6(%i1)
	sw	%i19, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i17, 5(%i1)
	lw	%i18, 6(%i1)
	lw	%i19, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73472:
	movi	%i31, 4
	jeq	%i19, %i31, cont.73473
	lw	%i4, 235(%i0)
	lw	%i6, 4(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73473:
	slli	%i4, %i12, 2
	add	%i31, %i8, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73468:
	addi	%i4, %i12, 1
	mov	%i12, %i4
loop_start.68994:
	movi	%i31, 4
	jleq	%i12, %i31, then.73475
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68995
	set_label	%i31, loop_start.68994
	jmp	%i0, 0(%i31)
then.73475:
	slli	%i4, %i12, 2
	add	%i31, %i22, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73477
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68995
	jzero	%i0, %i0, cont.73478
then.73477:
	slli	%i4, %i12, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73479
	slli	%i4, %i12, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i19, 0(%i10)
	slli	%i4, %i12, 2
	add	%i31, %i11, %i4
	lw	%i18, 0(%i31)
	slli	%i4, %i12, 2
	add	%i31, %i23, %i4
	lw	%i17, 0(%i31)
	jeq	%i19, %i0, cont.73480
	lw	%i4, 235(%i0)
	lw	%i6, 0(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i17, 5(%i1)
	sw	%i18, 6(%i1)
	sw	%i19, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i17, 5(%i1)
	lw	%i18, 6(%i1)
	lw	%i19, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73480:
	movi	%i31, 1
	jeq	%i19, %i31, cont.73481
	lw	%i4, 235(%i0)
	lw	%i6, 1(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i17, 5(%i1)
	sw	%i18, 6(%i1)
	sw	%i19, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i17, 5(%i1)
	lw	%i18, 6(%i1)
	lw	%i19, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73481:
	movi	%i31, 2
	jeq	%i19, %i31, cont.73482
	lw	%i4, 235(%i0)
	lw	%i6, 2(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i17, 5(%i1)
	sw	%i18, 6(%i1)
	sw	%i19, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i17, 5(%i1)
	lw	%i18, 6(%i1)
	lw	%i19, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73482:
	movi	%i31, 3
	jeq	%i19, %i31, cont.73483
	lw	%i4, 235(%i0)
	lw	%i6, 3(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i17, 5(%i1)
	sw	%i18, 6(%i1)
	sw	%i19, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i17, 5(%i1)
	lw	%i18, 6(%i1)
	lw	%i19, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73483:
	movi	%i31, 4
	jeq	%i19, %i31, cont.73484
	lw	%i4, 235(%i0)
	lw	%i6, 4(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i12, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i12, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73484:
	slli	%i4, %i12, 2
	add	%i31, %i8, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73479:
	addi	%i20, %i12, 1
	movi	%i31, 4
	jleq	%i20, %i31, then.73485
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68995
	jzero	%i0, %i0, cont.73486
then.73485:
	slli	%i4, %i20, 2
	add	%i31, %i22, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73487
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68995
	jzero	%i0, %i0, cont.73488
then.73487:
	slli	%i4, %i20, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73489
	slli	%i4, %i20, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i19, 0(%i10)
	slli	%i4, %i20, 2
	add	%i31, %i11, %i4
	lw	%i18, 0(%i31)
	slli	%i4, %i20, 2
	add	%i31, %i23, %i4
	lw	%i17, 0(%i31)
	jeq	%i19, %i0, cont.73490
	lw	%i4, 235(%i0)
	lw	%i6, 0(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73490:
	movi	%i31, 1
	jeq	%i19, %i31, cont.73491
	lw	%i4, 235(%i0)
	lw	%i6, 1(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73491:
	movi	%i31, 2
	jeq	%i19, %i31, cont.73492
	lw	%i4, 235(%i0)
	lw	%i6, 2(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73492:
	movi	%i31, 3
	jeq	%i19, %i31, cont.73493
	lw	%i4, 235(%i0)
	lw	%i6, 3(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73493:
	movi	%i31, 4
	jeq	%i19, %i31, cont.73494
	lw	%i4, 235(%i0)
	lw	%i6, 4(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73494:
	slli	%i4, %i20, 2
	add	%i31, %i8, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73489:
	addi	%i20, %i20, 1
	movi	%i31, 4
	jleq	%i20, %i31, then.73495
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68995
	jzero	%i0, %i0, cont.73496
then.73495:
	slli	%i4, %i20, 2
	add	%i31, %i22, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73497
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68995
	jzero	%i0, %i0, cont.73498
then.73497:
	slli	%i4, %i20, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73499
	slli	%i4, %i20, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i19, 0(%i10)
	slli	%i4, %i20, 2
	add	%i31, %i11, %i4
	lw	%i18, 0(%i31)
	slli	%i4, %i20, 2
	add	%i31, %i23, %i4
	lw	%i17, 0(%i31)
	jeq	%i19, %i0, cont.73500
	lw	%i4, 235(%i0)
	lw	%i6, 0(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73500:
	movi	%i31, 1
	jeq	%i19, %i31, cont.73501
	lw	%i4, 235(%i0)
	lw	%i6, 1(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73501:
	movi	%i31, 2
	jeq	%i19, %i31, cont.73502
	lw	%i4, 235(%i0)
	lw	%i6, 2(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73502:
	movi	%i31, 3
	jeq	%i19, %i31, cont.73503
	lw	%i4, 235(%i0)
	lw	%i6, 3(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73503:
	movi	%i31, 4
	jeq	%i19, %i31, cont.73504
	lw	%i4, 235(%i0)
	lw	%i6, 4(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73504:
	slli	%i4, %i20, 2
	add	%i31, %i8, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73499:
	addi	%i20, %i20, 1
	movi	%i31, 4
	jleq	%i20, %i31, then.73505
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68995
	jzero	%i0, %i0, cont.73506
then.73505:
	slli	%i4, %i20, 2
	add	%i31, %i22, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73507
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68995
	jzero	%i0, %i0, cont.73508
then.73507:
	slli	%i4, %i20, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73509
	slli	%i4, %i20, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i19, 0(%i10)
	slli	%i4, %i20, 2
	add	%i31, %i11, %i4
	lw	%i18, 0(%i31)
	slli	%i4, %i20, 2
	add	%i31, %i23, %i4
	lw	%i17, 0(%i31)
	jeq	%i19, %i0, cont.73510
	lw	%i4, 235(%i0)
	lw	%i6, 0(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73510:
	movi	%i31, 1
	jeq	%i19, %i31, cont.73511
	lw	%i4, 235(%i0)
	lw	%i6, 1(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73511:
	movi	%i31, 2
	jeq	%i19, %i31, cont.73512
	lw	%i4, 235(%i0)
	lw	%i6, 2(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73512:
	movi	%i31, 3
	jeq	%i19, %i31, cont.73513
	lw	%i4, 235(%i0)
	lw	%i6, 3(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sw	%i21, 8(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lw	%i21, 8(%i1)
	addi	%i1, %i1, 40
cont.73513:
	movi	%i31, 4
	jeq	%i19, %i31, cont.73514
	lw	%i4, 235(%i0)
	lw	%i6, 4(%i4)
	lf	%f1, 0(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i17)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i17
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	sw	%i11, 4(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	lw	%i11, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i6
	mov	%i5, %i18
	mov	%i6, %i17
	movi	%i7, 118
	subi	%i1, %i1, 24
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3063
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73514:
	slli	%i4, %i20, 2
	add	%i31, %i8, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73509:
	addi	%i4, %i20, 1
	mov	%i12, %i4
cont.73508:
cont.73506:
cont.73498:
cont.73496:
cont.73488:
cont.73486:
cont.73478:
cont.73476:
	set_label	%i30, loop_start.68994
	jmp	%i0, 0(%i30)
loop_end.68995:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
try_exploit_neighbors.3101:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	slli	%i5, %i4, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i10, 3(%i5)
	lw	%i11, 2(%i5)
	movi	%i31, 4
	jleq	%i9, %i31, then.73515
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73515:
	slli	%i5, %i9, 2
	add	%i31, %i11, %i5
	lw	%i5, 0(%i31)
	jleq	%i0, %i5, then.73517
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73517:
	slli	%i5, %i4, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i11, 2(%i5)
	slli	%i5, %i9, 2
	add	%i31, %i11, %i5
	lw	%i5, 0(%i31)
	slli	%i11, %i4, 2
	add	%i31, %i6, %i11
	lw	%i11, 0(%i31)
	lw	%i12, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i12, %i11
	lw	%i11, 0(%i31)
	jeq	%i11, %i5, then.73519
	mov	%i5, %i0
	jzero	%i0, %i0, cont.73520
then.73519:
	slli	%i11, %i4, 2
	add	%i31, %i8, %i11
	lw	%i11, 0(%i31)
	lw	%i12, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i12, %i11
	lw	%i11, 0(%i31)
	jeq	%i11, %i5, then.73521
	mov	%i5, %i0
	jzero	%i0, %i0, cont.73522
then.73521:
	subi	%i11, %i4, 1
	slli	%i11, %i11, 2
	add	%i31, %i7, %i11
	lw	%i11, 0(%i31)
	lw	%i12, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i12, %i11
	lw	%i11, 0(%i31)
	jeq	%i11, %i5, then.73523
	mov	%i5, %i0
	jzero	%i0, %i0, cont.73524
then.73523:
	addi	%i11, %i4, 1
	slli	%i11, %i11, 2
	add	%i31, %i7, %i11
	lw	%i11, 0(%i31)
	lw	%i12, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i12, %i11
	lw	%i11, 0(%i31)
	ceq	%i5, %i11, %i5
cont.73524:
cont.73522:
cont.73520:
	jeq	%i5, %i0, then.73525
	slli	%i5, %i9, 2
	add	%i31, %i10, %i5
	lw	%i5, 0(%i31)
	jeq	%i5, %i0, cont.73526
	slli	%i5, %i4, 2
	add	%i31, %i6, %i5
	lw	%i5, 0(%i31)
	lw	%i13, 5(%i5)
	subi	%i5, %i4, 1
	slli	%i5, %i5, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i14, 5(%i5)
	slli	%i5, %i4, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i11, 5(%i5)
	addi	%i5, %i4, 1
	slli	%i5, %i5, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i10, 5(%i5)
	slli	%i5, %i4, 2
	add	%i31, %i8, %i5
	lw	%i5, 0(%i31)
	lw	%i5, 5(%i5)
	slli	%i12, %i9, 2
	add	%i31, %i13, %i12
	lw	%i13, 0(%i31)
	lf	%f1, 0(%i13)
	lw	%i12, 181(%i0)
	sf	%f1, 0(%i12)
	lf	%f1, 1(%i13)
	lw	%i12, 181(%i0)
	sf	%f1, 1(%i12)
	lf	%f1, 2(%i13)
	lw	%i12, 181(%i0)
	sf	%f1, 2(%i12)
	slli	%i12, %i9, 2
	add	%i31, %i14, %i12
	lw	%i13, 0(%i31)
	lw	%i12, 181(%i0)
	lf	%f2, 0(%i12)
	lf	%f1, 0(%i13)
	fadd	%f1, %f2, %f1
	lw	%i12, 181(%i0)
	sf	%f1, 0(%i12)
	lw	%i12, 181(%i0)
	lf	%f2, 1(%i12)
	lf	%f1, 1(%i13)
	fadd	%f1, %f2, %f1
	lw	%i12, 181(%i0)
	sf	%f1, 1(%i12)
	lw	%i12, 181(%i0)
	lf	%f2, 2(%i12)
	lf	%f1, 2(%i13)
	fadd	%f1, %f2, %f1
	lw	%i12, 181(%i0)
	sf	%f1, 2(%i12)
	slli	%i12, %i9, 2
	add	%i31, %i11, %i12
	lw	%i12, 0(%i31)
	lw	%i11, 181(%i0)
	lf	%f2, 0(%i11)
	lf	%f1, 0(%i12)
	fadd	%f1, %f2, %f1
	lw	%i11, 181(%i0)
	sf	%f1, 0(%i11)
	lw	%i11, 181(%i0)
	lf	%f2, 1(%i11)
	lf	%f1, 1(%i12)
	fadd	%f1, %f2, %f1
	lw	%i11, 181(%i0)
	sf	%f1, 1(%i11)
	lw	%i11, 181(%i0)
	lf	%f2, 2(%i11)
	lf	%f1, 2(%i12)
	fadd	%f1, %f2, %f1
	lw	%i11, 181(%i0)
	sf	%f1, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i10, %i11
	lw	%i11, 0(%i31)
	lw	%i10, 181(%i0)
	lf	%f2, 0(%i10)
	lf	%f1, 0(%i11)
	fadd	%f1, %f2, %f1
	lw	%i10, 181(%i0)
	sf	%f1, 0(%i10)
	lw	%i10, 181(%i0)
	lf	%f2, 1(%i10)
	lf	%f1, 1(%i11)
	fadd	%f1, %f2, %f1
	lw	%i10, 181(%i0)
	sf	%f1, 1(%i10)
	lw	%i10, 181(%i0)
	lf	%f2, 2(%i10)
	lf	%f1, 2(%i11)
	fadd	%f1, %f2, %f1
	lw	%i10, 181(%i0)
	sf	%f1, 2(%i10)
	slli	%i10, %i9, 2
	add	%i31, %i5, %i10
	lw	%i10, 0(%i31)
	lw	%i5, 181(%i0)
	lf	%f2, 0(%i5)
	lf	%f1, 0(%i10)
	fadd	%f1, %f2, %f1
	lw	%i5, 181(%i0)
	sf	%f1, 0(%i5)
	lw	%i5, 181(%i0)
	lf	%f2, 1(%i5)
	lf	%f1, 1(%i10)
	fadd	%f1, %f2, %f1
	lw	%i5, 181(%i0)
	sf	%f1, 1(%i5)
	lw	%i5, 181(%i0)
	lf	%f2, 2(%i5)
	lf	%f1, 2(%i10)
	fadd	%f1, %f2, %f1
	lw	%i5, 181(%i0)
	sf	%f1, 2(%i5)
	slli	%i5, %i4, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i10, 4(%i5)
	slli	%i5, %i9, 2
	add	%i31, %i10, %i5
	lw	%i10, 0(%i31)
	lw	%i5, 186(%i0)
	lf	%f3, 0(%i5)
	lf	%f2, 0(%i10)
	lw	%i5, 181(%i0)
	lf	%f1, 0(%i5)
	fma	%f1, %f2, %f1, %f3
	lw	%i5, 186(%i0)
	sf	%f1, 0(%i5)
	lw	%i5, 186(%i0)
	lf	%f3, 1(%i5)
	lf	%f2, 1(%i10)
	lw	%i5, 181(%i0)
	lf	%f1, 1(%i5)
	fma	%f1, %f2, %f1, %f3
	lw	%i5, 186(%i0)
	sf	%f1, 1(%i5)
	lw	%i5, 186(%i0)
	lf	%f3, 2(%i5)
	lf	%f2, 2(%i10)
	lw	%i5, 181(%i0)
	lf	%f1, 2(%i5)
	fma	%f1, %f2, %f1, %f3
	lw	%i5, 186(%i0)
	sf	%f1, 2(%i5)
cont.73526:
	addi	%i5, %i9, 1
	mov	%i9, %i5
loop_start.69047:
	slli	%i5, %i4, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i10, 3(%i5)
	lw	%i11, 2(%i5)
	movi	%i31, 4
	jleq	%i9, %i31, then.73528
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69048
	set_label	%i31, loop_start.69047
	jmp	%i0, 0(%i31)
then.73528:
	slli	%i5, %i9, 2
	add	%i31, %i11, %i5
	lw	%i5, 0(%i31)
	jleq	%i0, %i5, then.73530
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69048
	jzero	%i0, %i0, cont.73531
then.73530:
	slli	%i5, %i4, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i11, 2(%i5)
	slli	%i5, %i9, 2
	add	%i31, %i11, %i5
	lw	%i5, 0(%i31)
	slli	%i11, %i4, 2
	add	%i31, %i6, %i11
	lw	%i11, 0(%i31)
	lw	%i12, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i12, %i11
	lw	%i11, 0(%i31)
	jeq	%i11, %i5, then.73532
	mov	%i5, %i0
	jzero	%i0, %i0, cont.73533
then.73532:
	slli	%i11, %i4, 2
	add	%i31, %i8, %i11
	lw	%i11, 0(%i31)
	lw	%i12, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i12, %i11
	lw	%i11, 0(%i31)
	jeq	%i11, %i5, then.73534
	mov	%i5, %i0
	jzero	%i0, %i0, cont.73535
then.73534:
	subi	%i11, %i4, 1
	slli	%i11, %i11, 2
	add	%i31, %i7, %i11
	lw	%i11, 0(%i31)
	lw	%i12, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i12, %i11
	lw	%i11, 0(%i31)
	jeq	%i11, %i5, then.73536
	mov	%i5, %i0
	jzero	%i0, %i0, cont.73537
then.73536:
	addi	%i11, %i4, 1
	slli	%i11, %i11, 2
	add	%i31, %i7, %i11
	lw	%i11, 0(%i31)
	lw	%i12, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i12, %i11
	lw	%i11, 0(%i31)
	ceq	%i5, %i11, %i5
cont.73537:
cont.73535:
cont.73533:
	jeq	%i5, %i0, then.73538
	slli	%i5, %i9, 2
	add	%i31, %i10, %i5
	lw	%i5, 0(%i31)
	jeq	%i5, %i0, cont.73540
	slli	%i5, %i4, 2
	add	%i31, %i6, %i5
	lw	%i5, 0(%i31)
	lw	%i13, 5(%i5)
	subi	%i5, %i4, 1
	slli	%i5, %i5, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i14, 5(%i5)
	slli	%i5, %i4, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i11, 5(%i5)
	addi	%i5, %i4, 1
	slli	%i5, %i5, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i10, 5(%i5)
	slli	%i5, %i4, 2
	add	%i31, %i8, %i5
	lw	%i5, 0(%i31)
	lw	%i5, 5(%i5)
	slli	%i12, %i9, 2
	add	%i31, %i13, %i12
	lw	%i13, 0(%i31)
	lf	%f1, 0(%i13)
	lw	%i12, 181(%i0)
	sf	%f1, 0(%i12)
	lf	%f1, 1(%i13)
	lw	%i12, 181(%i0)
	sf	%f1, 1(%i12)
	lf	%f1, 2(%i13)
	lw	%i12, 181(%i0)
	sf	%f1, 2(%i12)
	slli	%i12, %i9, 2
	add	%i31, %i14, %i12
	lw	%i13, 0(%i31)
	lw	%i12, 181(%i0)
	lf	%f2, 0(%i12)
	lf	%f1, 0(%i13)
	fadd	%f1, %f2, %f1
	lw	%i12, 181(%i0)
	sf	%f1, 0(%i12)
	lw	%i12, 181(%i0)
	lf	%f2, 1(%i12)
	lf	%f1, 1(%i13)
	fadd	%f1, %f2, %f1
	lw	%i12, 181(%i0)
	sf	%f1, 1(%i12)
	lw	%i12, 181(%i0)
	lf	%f2, 2(%i12)
	lf	%f1, 2(%i13)
	fadd	%f1, %f2, %f1
	lw	%i12, 181(%i0)
	sf	%f1, 2(%i12)
	slli	%i12, %i9, 2
	add	%i31, %i11, %i12
	lw	%i12, 0(%i31)
	lw	%i11, 181(%i0)
	lf	%f2, 0(%i11)
	lf	%f1, 0(%i12)
	fadd	%f1, %f2, %f1
	lw	%i11, 181(%i0)
	sf	%f1, 0(%i11)
	lw	%i11, 181(%i0)
	lf	%f2, 1(%i11)
	lf	%f1, 1(%i12)
	fadd	%f1, %f2, %f1
	lw	%i11, 181(%i0)
	sf	%f1, 1(%i11)
	lw	%i11, 181(%i0)
	lf	%f2, 2(%i11)
	lf	%f1, 2(%i12)
	fadd	%f1, %f2, %f1
	lw	%i11, 181(%i0)
	sf	%f1, 2(%i11)
	slli	%i11, %i9, 2
	add	%i31, %i10, %i11
	lw	%i11, 0(%i31)
	lw	%i10, 181(%i0)
	lf	%f2, 0(%i10)
	lf	%f1, 0(%i11)
	fadd	%f1, %f2, %f1
	lw	%i10, 181(%i0)
	sf	%f1, 0(%i10)
	lw	%i10, 181(%i0)
	lf	%f2, 1(%i10)
	lf	%f1, 1(%i11)
	fadd	%f1, %f2, %f1
	lw	%i10, 181(%i0)
	sf	%f1, 1(%i10)
	lw	%i10, 181(%i0)
	lf	%f2, 2(%i10)
	lf	%f1, 2(%i11)
	fadd	%f1, %f2, %f1
	lw	%i10, 181(%i0)
	sf	%f1, 2(%i10)
	slli	%i10, %i9, 2
	add	%i31, %i5, %i10
	lw	%i10, 0(%i31)
	lw	%i5, 181(%i0)
	lf	%f2, 0(%i5)
	lf	%f1, 0(%i10)
	fadd	%f1, %f2, %f1
	lw	%i5, 181(%i0)
	sf	%f1, 0(%i5)
	lw	%i5, 181(%i0)
	lf	%f2, 1(%i5)
	lf	%f1, 1(%i10)
	fadd	%f1, %f2, %f1
	lw	%i5, 181(%i0)
	sf	%f1, 1(%i5)
	lw	%i5, 181(%i0)
	lf	%f2, 2(%i5)
	lf	%f1, 2(%i10)
	fadd	%f1, %f2, %f1
	lw	%i5, 181(%i0)
	sf	%f1, 2(%i5)
	slli	%i5, %i4, 2
	add	%i31, %i7, %i5
	lw	%i5, 0(%i31)
	lw	%i10, 4(%i5)
	slli	%i5, %i9, 2
	add	%i31, %i10, %i5
	lw	%i10, 0(%i31)
	lw	%i5, 186(%i0)
	lf	%f3, 0(%i5)
	lf	%f2, 0(%i10)
	lw	%i5, 181(%i0)
	lf	%f1, 0(%i5)
	fma	%f1, %f2, %f1, %f3
	lw	%i5, 186(%i0)
	sf	%f1, 0(%i5)
	lw	%i5, 186(%i0)
	lf	%f3, 1(%i5)
	lf	%f2, 1(%i10)
	lw	%i5, 181(%i0)
	lf	%f1, 1(%i5)
	fma	%f1, %f2, %f1, %f3
	lw	%i5, 186(%i0)
	sf	%f1, 1(%i5)
	lw	%i5, 186(%i0)
	lf	%f3, 2(%i5)
	lf	%f2, 2(%i10)
	lw	%i5, 181(%i0)
	lf	%f1, 2(%i5)
	fma	%f1, %f2, %f1, %f3
	lw	%i5, 186(%i0)
	sf	%f1, 2(%i5)
cont.73540:
	addi	%i5, %i9, 1
	mov	%i9, %i5
	jzero	%i0, %i0, cont.73539
then.73538:
	slli	%i4, %i4, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	lw	%i24, 7(%i4)
	lw	%i23, 6(%i4)
	lw	%i22, 5(%i4)
	lw	%i21, 4(%i4)
	lw	%i20, 3(%i4)
	lw	%i19, 2(%i4)
	lw	%i18, 1(%i4)
	movi	%i31, 4
	jleq	%i9, %i31, then.73541
	jzero	%i0, %i0, cont.73542
then.73541:
	slli	%i4, %i9, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73543
	jzero	%i0, %i0, cont.73544
then.73543:
	slli	%i4, %i9, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73545
	slli	%i4, %i9, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i26, 0(%i23)
	slli	%i4, %i9, 2
	add	%i31, %i24, %i4
	lw	%i25, 0(%i31)
	slli	%i4, %i9, 2
	add	%i31, %i18, %i4
	lw	%i17, 0(%i31)
	jeq	%i26, %i0, cont.73546
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73546:
	movi	%i31, 1
	jeq	%i26, %i31, cont.73547
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73547:
	movi	%i31, 2
	jeq	%i26, %i31, cont.73548
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73548:
	movi	%i31, 3
	jeq	%i26, %i31, cont.73549
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73549:
	movi	%i31, 4
	jeq	%i26, %i31, cont.73550
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73550:
	slli	%i4, %i9, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73545:
	addi	%i4, %i9, 1
	mov	%i9, %i4
loop_start.69082:
	movi	%i31, 4
	jleq	%i9, %i31, then.73552
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	set_label	%i31, loop_start.69082
	jmp	%i0, 0(%i31)
then.73552:
	slli	%i4, %i9, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73554
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73555
then.73554:
	slli	%i4, %i9, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73556
	slli	%i4, %i9, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i26, 0(%i23)
	slli	%i4, %i9, 2
	add	%i31, %i24, %i4
	lw	%i25, 0(%i31)
	slli	%i4, %i9, 2
	add	%i31, %i18, %i4
	lw	%i17, 0(%i31)
	jeq	%i26, %i0, cont.73557
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73557:
	movi	%i31, 1
	jeq	%i26, %i31, cont.73558
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73558:
	movi	%i31, 2
	jeq	%i26, %i31, cont.73559
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73559:
	movi	%i31, 3
	jeq	%i26, %i31, cont.73560
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73560:
	movi	%i31, 4
	jeq	%i26, %i31, cont.73561
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73561:
	slli	%i4, %i9, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73556:
	addi	%i17, %i9, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73562
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73563
then.73562:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73564
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73565
then.73564:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73566
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73567
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73567:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73568
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73568:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73569
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73569:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73570
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73570:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73571
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73571:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73566:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73572
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73573
then.73572:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73574
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73575
then.73574:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73576
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73577
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73577:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73578
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73578:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73579
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73579:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73580
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73580:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73581
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73581:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73576:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73582
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73583
then.73582:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73584
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73585
then.73584:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73586
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73587
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73587:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73588
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73588:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73589
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73589:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73590
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73590:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73591
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73591:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73586:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73592
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73593
then.73592:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73594
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73595
then.73594:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73596
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73597
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73597:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73598
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73598:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73599
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73599:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73600
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73600:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73601
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73601:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73596:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73602
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73603
then.73602:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73604
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73605
then.73604:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73606
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73607
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73607:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73608
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73608:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73609
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73609:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73610
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73610:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73611
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73611:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73606:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73612
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73613
then.73612:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73614
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73615
then.73614:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73616
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73617
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73617:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73618
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73618:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73619
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73619:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73620
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73620:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73621
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73621:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73616:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73622
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73623
then.73622:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73624
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69083
	jzero	%i0, %i0, cont.73625
then.73624:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73626
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73627
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73627:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73628
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73628:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73629
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73629:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73630
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73630:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73631
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73631:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73626:
	addi	%i4, %i17, 1
	mov	%i9, %i4
cont.73625:
cont.73623:
cont.73615:
cont.73613:
cont.73605:
cont.73603:
cont.73595:
cont.73593:
cont.73585:
cont.73583:
cont.73575:
cont.73573:
cont.73565:
cont.73563:
cont.73555:
cont.73553:
	set_label	%i30, loop_start.69082
	jmp	%i0, 0(%i30)
loop_end.69083:
	mov	%i0, %i31
cont.73544:
cont.73542:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69048
cont.73539:
cont.73531:
cont.73529:
	set_label	%i30, loop_start.69047
	jmp	%i0, 0(%i30)
loop_end.69048:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73525:
	slli	%i4, %i4, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	lw	%i24, 7(%i4)
	lw	%i23, 6(%i4)
	lw	%i22, 5(%i4)
	lw	%i21, 4(%i4)
	lw	%i20, 3(%i4)
	lw	%i19, 2(%i4)
	lw	%i18, 1(%i4)
	movi	%i31, 4
	jleq	%i9, %i31, then.73632
	jzero	%i0, %i0, cont.73633
then.73632:
	slli	%i4, %i9, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73634
	jzero	%i0, %i0, cont.73635
then.73634:
	slli	%i4, %i9, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73636
	slli	%i4, %i9, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i26, 0(%i23)
	slli	%i4, %i9, 2
	add	%i31, %i24, %i4
	lw	%i25, 0(%i31)
	slli	%i4, %i9, 2
	add	%i31, %i18, %i4
	lw	%i17, 0(%i31)
	jeq	%i26, %i0, cont.73637
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73637:
	movi	%i31, 1
	jeq	%i26, %i31, cont.73638
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73638:
	movi	%i31, 2
	jeq	%i26, %i31, cont.73639
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73639:
	movi	%i31, 3
	jeq	%i26, %i31, cont.73640
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73640:
	movi	%i31, 4
	jeq	%i26, %i31, cont.73641
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73641:
	slli	%i4, %i9, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73636:
	addi	%i4, %i9, 1
	mov	%i9, %i4
loop_start.69142:
	movi	%i31, 4
	jleq	%i9, %i31, then.73643
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	set_label	%i31, loop_start.69142
	jmp	%i0, 0(%i31)
then.73643:
	slli	%i4, %i9, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73645
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73646
then.73645:
	slli	%i4, %i9, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73647
	slli	%i4, %i9, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i26, 0(%i23)
	slli	%i4, %i9, 2
	add	%i31, %i24, %i4
	lw	%i25, 0(%i31)
	slli	%i4, %i9, 2
	add	%i31, %i18, %i4
	lw	%i17, 0(%i31)
	jeq	%i26, %i0, cont.73648
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73648:
	movi	%i31, 1
	jeq	%i26, %i31, cont.73649
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73649:
	movi	%i31, 2
	jeq	%i26, %i31, cont.73650
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73650:
	movi	%i31, 3
	jeq	%i26, %i31, cont.73651
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.73651:
	movi	%i31, 4
	jeq	%i26, %i31, cont.73652
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i25
	mov	%i6, %i17
	subi	%i1, %i1, 24
	sw	%i9, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73652:
	slli	%i4, %i9, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73647:
	addi	%i17, %i9, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73653
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73654
then.73653:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73655
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73656
then.73655:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73657
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73658
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73658:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73659
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73659:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73660
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73660:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73661
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73661:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73662
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73662:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73657:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73663
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73664
then.73663:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73665
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73666
then.73665:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73667
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73668
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73668:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73669
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73669:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73670
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73670:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73671
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73671:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73672
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73672:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73667:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73673
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73674
then.73673:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73675
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73676
then.73675:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73677
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73678
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73678:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73679
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73679:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73680
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73680:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73681
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73681:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73682
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73682:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73677:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73683
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73684
then.73683:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73685
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73686
then.73685:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73687
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73688
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73688:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73689
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73689:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73690
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73690:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73691
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73691:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73692
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73692:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73687:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73693
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73694
then.73693:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73695
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73696
then.73695:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73697
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73698
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73698:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73699
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73699:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73700
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73700:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73701
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73701:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73702
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73702:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73697:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73703
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73704
then.73703:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73705
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73706
then.73705:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73707
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73708
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73708:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73709
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73709:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73710
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73710:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73711
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73711:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73712
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73712:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73707:
	addi	%i17, %i17, 1
	movi	%i31, 4
	jleq	%i17, %i31, then.73713
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73714
then.73713:
	slli	%i4, %i17, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73715
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69143
	jzero	%i0, %i0, cont.73716
then.73715:
	slli	%i4, %i17, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73717
	slli	%i4, %i17, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	lw	%i27, 0(%i23)
	slli	%i4, %i17, 2
	add	%i31, %i24, %i4
	lw	%i26, 0(%i31)
	slli	%i4, %i17, 2
	add	%i31, %i18, %i4
	lw	%i25, 0(%i31)
	jeq	%i27, %i0, cont.73718
	lw	%i4, 235(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73718:
	movi	%i31, 1
	jeq	%i27, %i31, cont.73719
	lw	%i4, 235(%i0)
	lw	%i4, 1(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73719:
	movi	%i31, 2
	jeq	%i27, %i31, cont.73720
	lw	%i4, 235(%i0)
	lw	%i4, 2(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73720:
	movi	%i31, 3
	jeq	%i27, %i31, cont.73721
	lw	%i4, 235(%i0)
	lw	%i4, 3(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73721:
	movi	%i31, 4
	jeq	%i27, %i31, cont.73722
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	mov	%i5, %i26
	mov	%i6, %i25
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	set_label	%i31, trace_diffuse_rays.3068
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	addi	%i1, %i1, 24
cont.73722:
	slli	%i4, %i17, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 186(%i0)
	lf	%f3, 0(%i4)
	lf	%f2, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 1(%i4)
	lf	%f2, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f3, 2(%i4)
	lf	%f2, 2(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73717:
	addi	%i4, %i17, 1
	mov	%i9, %i4
cont.73716:
cont.73714:
cont.73706:
cont.73704:
cont.73696:
cont.73694:
cont.73686:
cont.73684:
cont.73676:
cont.73674:
cont.73666:
cont.73664:
cont.73656:
cont.73654:
cont.73646:
cont.73644:
	set_label	%i30, loop_start.69142
	jmp	%i0, 0(%i30)
loop_end.69143:
	mov	%i0, %i31
cont.73635:
cont.73633:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
write_ppm_header.3108:
	mov	%i6, %i4
	movi	%i4, 80
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	addi	%i4, %i6, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 10
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 191(%i0)
	lw	%i6, 0(%i4)
	movi	%i4, 100
	jleq	%i4, %i6, then.73724
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73725
then.73724:
	movi	%i4, 200
	jleq	%i4, %i6, then.73726
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.73727
then.73726:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.73727:
cont.73725:
	movi	%i4, 40
	jleq	%i4, %i6, then.73728
	movi	%i4, 20
	jleq	%i4, %i6, then.73730
	movi	%i4, 10
	jleq	%i4, %i6, then.73732
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.73729
then.73732:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.73733:
	jzero	%i0, %i0, cont.73729
then.73730:
	movi	%i4, 30
	jleq	%i4, %i6, then.73734
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.73735
then.73734:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.73735:
cont.73731:
	jzero	%i0, %i0, cont.73729
then.73728:
	movi	%i4, 60
	jleq	%i4, %i6, then.73736
	movi	%i4, 50
	jleq	%i4, %i6, then.73738
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.73737
then.73738:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.73739:
	jzero	%i0, %i0, cont.73737
then.73736:
	movi	%i4, 80
	jleq	%i4, %i6, then.73740
	movi	%i4, 70
	jleq	%i4, %i6, then.73742
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.73741
then.73742:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.73743:
	jzero	%i0, %i0, cont.73741
then.73740:
	movi	%i4, 90
	jleq	%i4, %i6, then.73744
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.73745
then.73744:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.73745:
cont.73741:
cont.73737:
cont.73729:
	movi	%i4, 4
	jleq	%i4, %i5, then.73746
	movi	%i4, 2
	jleq	%i4, %i5, then.73748
	movi	%i4, 1
	jleq	%i4, %i5, then.73750
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73747
then.73750:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73751:
	jzero	%i0, %i0, cont.73747
then.73748:
	movi	%i4, 3
	jleq	%i4, %i5, then.73752
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73753
then.73752:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73753:
cont.73749:
	jzero	%i0, %i0, cont.73747
then.73746:
	movi	%i4, 6
	jleq	%i4, %i5, then.73754
	movi	%i4, 5
	jleq	%i4, %i5, then.73756
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73755
then.73756:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73757:
	jzero	%i0, %i0, cont.73755
then.73754:
	movi	%i4, 8
	jleq	%i4, %i5, then.73758
	movi	%i4, 7
	jleq	%i4, %i5, then.73760
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73759
then.73760:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73761:
	jzero	%i0, %i0, cont.73759
then.73758:
	movi	%i4, 9
	jleq	%i4, %i5, then.73762
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73763
then.73762:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73763:
cont.73759:
cont.73755:
cont.73747:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 191(%i0)
	lw	%i6, 1(%i4)
	movi	%i4, 100
	jleq	%i4, %i6, then.73764
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73765
then.73764:
	movi	%i4, 200
	jleq	%i4, %i6, then.73766
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.73767
then.73766:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.73767:
cont.73765:
	movi	%i4, 40
	jleq	%i4, %i6, then.73768
	movi	%i4, 20
	jleq	%i4, %i6, then.73770
	movi	%i4, 10
	jleq	%i4, %i6, then.73772
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.73769
then.73772:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.73773:
	jzero	%i0, %i0, cont.73769
then.73770:
	movi	%i4, 30
	jleq	%i4, %i6, then.73774
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.73775
then.73774:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.73775:
cont.73771:
	jzero	%i0, %i0, cont.73769
then.73768:
	movi	%i4, 60
	jleq	%i4, %i6, then.73776
	movi	%i4, 50
	jleq	%i4, %i6, then.73778
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.73777
then.73778:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.73779:
	jzero	%i0, %i0, cont.73777
then.73776:
	movi	%i4, 80
	jleq	%i4, %i6, then.73780
	movi	%i4, 70
	jleq	%i4, %i6, then.73782
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.73781
then.73782:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.73783:
	jzero	%i0, %i0, cont.73781
then.73780:
	movi	%i4, 90
	jleq	%i4, %i6, then.73784
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.73785
then.73784:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.73785:
cont.73781:
cont.73777:
cont.73769:
	movi	%i4, 4
	jleq	%i4, %i5, then.73786
	movi	%i4, 2
	jleq	%i4, %i5, then.73788
	movi	%i4, 1
	jleq	%i4, %i5, then.73790
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73787
then.73790:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73791:
	jzero	%i0, %i0, cont.73787
then.73788:
	movi	%i4, 3
	jleq	%i4, %i5, then.73792
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73793
then.73792:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73793:
cont.73789:
	jzero	%i0, %i0, cont.73787
then.73786:
	movi	%i4, 6
	jleq	%i4, %i5, then.73794
	movi	%i4, 5
	jleq	%i4, %i5, then.73796
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73795
then.73796:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73797:
	jzero	%i0, %i0, cont.73795
then.73794:
	movi	%i4, 8
	jleq	%i4, %i5, then.73798
	movi	%i4, 7
	jleq	%i4, %i5, then.73800
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73799
then.73800:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73801:
	jzero	%i0, %i0, cont.73799
then.73798:
	movi	%i4, 9
	jleq	%i4, %i5, then.73802
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73803
then.73802:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73803:
cont.73799:
cont.73795:
cont.73787:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 10
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
pretrace_pixels.3119:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i19, %i4
	mov	%i18, %i5
	mov	%i17, %i6
	fmov	%f17, %f1
	fmov	%f16, %f2
	jleq	%i0, %i18, then.73804
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73804:
	lw	%i4, 199(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 195(%i0)
	lw	%i4, 0(%i4)
	sub	%i4, %i18, %i4
	itof	%f1, %i4
	fmul	%f2, %f2, %f1
	lw	%i4, 212(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f17
	lw	%i4, 227(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 212(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f16
	lw	%i4, 227(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 212(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 227(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73806
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.73807
then.73806:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.73807:
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 227(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 227(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 227(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 186(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 186(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 186(%i0)
	sf	%f0, 2(%i4)
	lw	%i4, 82(%i0)
	lf	%f1, 0(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 82(%i0)
	lf	%f1, 1(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 82(%i0)
	lf	%f1, 2(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 2(%i4)
	movui	%i31, 260096
	mif	%f1, %i31
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i5, 227(%i0)
	mov	%i4, %i0
	fmov	%f2, %f0
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sf	%f3, 3(%i1)
	sf	%f16, 4(%i1)
	sf	%f17, 5(%i1)
	set_label	%i31, trace_ray.3054
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lf	%f3, 3(%i1)
	lf	%f16, 4(%i1)
	lf	%f17, 5(%i1)
	addi	%i1, %i1, 24
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	sw	%i17, 0(%i4)
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i28, 7(%i4)
	lw	%i27, 6(%i4)
	lw	%i26, 5(%i4)
	lw	%i25, 3(%i4)
	lw	%i24, 2(%i4)
	lw	%i23, 1(%i4)
	mov	%i22, %i0
	lw	%i4, 0(%i24)
	jleq	%i0, %i4, then.73808
	jzero	%i0, %i0, cont.73809
then.73808:
	lw	%i4, 0(%i25)
	jeq	%i4, %i0, cont.73810
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	lw	%i20, 0(%i28)
	lw	%i6, 0(%i23)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73811
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73812
then.73811:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73812:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69203:
	jleq	%i0, %i6, then.73814
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69204
	set_label	%i31, loop_start.69203
	jmp	%i0, 0(%i31)
then.73814:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73816
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73817
then.73816:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73817:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73815:
	set_label	%i30, loop_start.69203
	jmp	%i0, 0(%i30)
loop_end.69204:
	mov	%i0, %i31
	lw	%i5, 0(%i26)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73810:
	movi	%i4, 1
	mov	%i22, %i4
loop_start.69212:
	movi	%i31, 4
	jleq	%i22, %i31, then.73819
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69213
	set_label	%i31, loop_start.69212
	jmp	%i0, 0(%i31)
then.73819:
	slli	%i4, %i22, 2
	add	%i31, %i24, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73821
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69213
	jzero	%i0, %i0, cont.73822
then.73821:
	slli	%i4, %i22, 2
	add	%i31, %i25, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73823
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i28, %i4
	lw	%i20, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i23, %i4
	lw	%i6, 0(%i31)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73824
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73825
then.73824:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73825:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69221:
	jleq	%i0, %i6, then.73827
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69222
	set_label	%i31, loop_start.69221
	jmp	%i0, 0(%i31)
then.73827:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73829
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73830
then.73829:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73830:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73828:
	set_label	%i30, loop_start.69221
	jmp	%i0, 0(%i30)
loop_end.69222:
	mov	%i0, %i31
	slli	%i4, %i22, 2
	add	%i31, %i26, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73823:
	addi	%i22, %i22, 1
	movi	%i31, 4
	jleq	%i22, %i31, then.73831
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69213
	jzero	%i0, %i0, cont.73832
then.73831:
	slli	%i4, %i22, 2
	add	%i31, %i24, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73833
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69213
	jzero	%i0, %i0, cont.73834
then.73833:
	slli	%i4, %i22, 2
	add	%i31, %i25, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73835
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i28, %i4
	lw	%i20, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i23, %i4
	lw	%i6, 0(%i31)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73836
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73837
then.73836:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73837:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69238:
	jleq	%i0, %i6, then.73839
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69239
	set_label	%i31, loop_start.69238
	jmp	%i0, 0(%i31)
then.73839:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73841
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73842
then.73841:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73842:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73840:
	set_label	%i30, loop_start.69238
	jmp	%i0, 0(%i30)
loop_end.69239:
	mov	%i0, %i31
	slli	%i4, %i22, 2
	add	%i31, %i26, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73835:
	addi	%i22, %i22, 1
	movi	%i31, 4
	jleq	%i22, %i31, then.73843
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69213
	jzero	%i0, %i0, cont.73844
then.73843:
	slli	%i4, %i22, 2
	add	%i31, %i24, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73845
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69213
	jzero	%i0, %i0, cont.73846
then.73845:
	slli	%i4, %i22, 2
	add	%i31, %i25, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73847
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i28, %i4
	lw	%i20, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i23, %i4
	lw	%i6, 0(%i31)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73848
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73849
then.73848:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73849:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69255:
	jleq	%i0, %i6, then.73851
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69256
	set_label	%i31, loop_start.69255
	jmp	%i0, 0(%i31)
then.73851:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73853
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73854
then.73853:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73854:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73852:
	set_label	%i30, loop_start.69255
	jmp	%i0, 0(%i30)
loop_end.69256:
	mov	%i0, %i31
	slli	%i4, %i22, 2
	add	%i31, %i26, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73847:
	addi	%i22, %i22, 1
	movi	%i31, 4
	jleq	%i22, %i31, then.73855
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69213
	jzero	%i0, %i0, cont.73856
then.73855:
	slli	%i4, %i22, 2
	add	%i31, %i24, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73857
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69213
	jzero	%i0, %i0, cont.73858
then.73857:
	slli	%i4, %i22, 2
	add	%i31, %i25, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73859
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i28, %i4
	lw	%i20, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i23, %i4
	lw	%i6, 0(%i31)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73860
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73861
then.73860:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73861:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69272:
	jleq	%i0, %i6, then.73863
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69273
	set_label	%i31, loop_start.69272
	jmp	%i0, 0(%i31)
then.73863:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73865
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73866
then.73865:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73866:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73864:
	set_label	%i30, loop_start.69272
	jmp	%i0, 0(%i30)
loop_end.69273:
	mov	%i0, %i31
	slli	%i4, %i22, 2
	add	%i31, %i26, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73859:
	addi	%i4, %i22, 1
	mov	%i22, %i4
cont.73858:
cont.73856:
cont.73846:
cont.73844:
cont.73834:
cont.73832:
cont.73822:
cont.73820:
	set_label	%i30, loop_start.69212
	jmp	%i0, 0(%i30)
loop_end.69213:
	mov	%i0, %i31
cont.73809:
	subi	%i6, %i18, 1
	addi	%i5, %i17, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.73867
	mov	%i4, %i5
	jzero	%i0, %i0, cont.73868
then.73867:
	subi	%i4, %i5, 5
cont.73868:
	mov	%i18, %i6
	mov	%i17, %i4
loop_start.69284:
	jleq	%i0, %i18, then.73870
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69285
	set_label	%i31, loop_start.69284
	jmp	%i0, 0(%i31)
then.73870:
	lw	%i4, 199(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 195(%i0)
	lw	%i4, 0(%i4)
	sub	%i4, %i18, %i4
	itof	%f1, %i4
	fmul	%f2, %f2, %f1
	lw	%i4, 212(%i0)
	lf	%f1, 0(%i4)
	fma	%f1, %f2, %f1, %f17
	lw	%i4, 227(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 212(%i0)
	lf	%f1, 1(%i4)
	fma	%f1, %f2, %f1, %f16
	lw	%i4, 227(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 212(%i0)
	lf	%f1, 2(%i4)
	fma	%f1, %f2, %f1, %f3
	lw	%i4, 227(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.73872
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.73873
then.73872:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.73873:
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 227(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 227(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f2
	lw	%i4, 227(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 186(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 186(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 186(%i0)
	sf	%f0, 2(%i4)
	lw	%i4, 82(%i0)
	lf	%f1, 0(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 82(%i0)
	lf	%f1, 1(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 82(%i0)
	lf	%f1, 2(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 2(%i4)
	movui	%i31, 260096
	mif	%f1, %i31
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lw	%i5, 227(%i0)
	mov	%i4, %i0
	fmov	%f2, %f0
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sf	%f3, 3(%i1)
	sf	%f16, 4(%i1)
	sf	%f17, 5(%i1)
	set_label	%i31, trace_ray.3054
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lf	%f3, 3(%i1)
	lf	%f16, 4(%i1)
	lf	%f17, 5(%i1)
	addi	%i1, %i1, 24
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	sw	%i17, 0(%i4)
	slli	%i4, %i18, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i28, 7(%i4)
	lw	%i27, 6(%i4)
	lw	%i26, 5(%i4)
	lw	%i25, 3(%i4)
	lw	%i24, 2(%i4)
	lw	%i23, 1(%i4)
	mov	%i22, %i0
	lw	%i4, 0(%i24)
	jleq	%i0, %i4, then.73874
	jzero	%i0, %i0, cont.73875
then.73874:
	lw	%i4, 0(%i25)
	jeq	%i4, %i0, cont.73876
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	lw	%i20, 0(%i28)
	lw	%i6, 0(%i23)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73877
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73878
then.73877:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73878:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69295:
	jleq	%i0, %i6, then.73880
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69296
	set_label	%i31, loop_start.69295
	jmp	%i0, 0(%i31)
then.73880:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73882
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73883
then.73882:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73883:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73881:
	set_label	%i30, loop_start.69295
	jmp	%i0, 0(%i30)
loop_end.69296:
	mov	%i0, %i31
	lw	%i5, 0(%i26)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73876:
	movi	%i4, 1
	mov	%i22, %i4
loop_start.69304:
	movi	%i31, 4
	jleq	%i22, %i31, then.73885
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69305
	set_label	%i31, loop_start.69304
	jmp	%i0, 0(%i31)
then.73885:
	slli	%i4, %i22, 2
	add	%i31, %i24, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73887
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69305
	jzero	%i0, %i0, cont.73888
then.73887:
	slli	%i4, %i22, 2
	add	%i31, %i25, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73889
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i28, %i4
	lw	%i20, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i23, %i4
	lw	%i6, 0(%i31)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73890
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73891
then.73890:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73891:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69313:
	jleq	%i0, %i6, then.73893
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69314
	set_label	%i31, loop_start.69313
	jmp	%i0, 0(%i31)
then.73893:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73895
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73896
then.73895:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73896:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73894:
	set_label	%i30, loop_start.69313
	jmp	%i0, 0(%i30)
loop_end.69314:
	mov	%i0, %i31
	slli	%i4, %i22, 2
	add	%i31, %i26, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73889:
	addi	%i22, %i22, 1
	movi	%i31, 4
	jleq	%i22, %i31, then.73897
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69305
	jzero	%i0, %i0, cont.73898
then.73897:
	slli	%i4, %i22, 2
	add	%i31, %i24, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73899
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69305
	jzero	%i0, %i0, cont.73900
then.73899:
	slli	%i4, %i22, 2
	add	%i31, %i25, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73901
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i28, %i4
	lw	%i20, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i23, %i4
	lw	%i6, 0(%i31)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73902
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73903
then.73902:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73903:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69330:
	jleq	%i0, %i6, then.73905
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69331
	set_label	%i31, loop_start.69330
	jmp	%i0, 0(%i31)
then.73905:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73907
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73908
then.73907:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73908:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73906:
	set_label	%i30, loop_start.69330
	jmp	%i0, 0(%i30)
loop_end.69331:
	mov	%i0, %i31
	slli	%i4, %i22, 2
	add	%i31, %i26, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73901:
	addi	%i22, %i22, 1
	movi	%i31, 4
	jleq	%i22, %i31, then.73909
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69305
	jzero	%i0, %i0, cont.73910
then.73909:
	slli	%i4, %i22, 2
	add	%i31, %i24, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73911
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69305
	jzero	%i0, %i0, cont.73912
then.73911:
	slli	%i4, %i22, 2
	add	%i31, %i25, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73913
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i28, %i4
	lw	%i20, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i23, %i4
	lw	%i6, 0(%i31)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73914
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73915
then.73914:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73915:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69347:
	jleq	%i0, %i6, then.73917
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69348
	set_label	%i31, loop_start.69347
	jmp	%i0, 0(%i31)
then.73917:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73919
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73920
then.73919:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73920:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73918:
	set_label	%i30, loop_start.69347
	jmp	%i0, 0(%i30)
loop_end.69348:
	mov	%i0, %i31
	slli	%i4, %i22, 2
	add	%i31, %i26, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73913:
	addi	%i22, %i22, 1
	movi	%i31, 4
	jleq	%i22, %i31, then.73921
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69305
	jzero	%i0, %i0, cont.73922
then.73921:
	slli	%i4, %i22, 2
	add	%i31, %i24, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73923
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69305
	jzero	%i0, %i0, cont.73924
then.73923:
	slli	%i4, %i22, 2
	add	%i31, %i25, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73925
	lw	%i5, 0(%i27)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i21, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i28, %i4
	lw	%i20, 0(%i31)
	slli	%i4, %i22, 2
	add	%i31, %i23, %i4
	lw	%i6, 0(%i31)
	lf	%f1, 0(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i6
	subi	%i1, %i1, 8
	sf	%f3, 0(%i1)
	set_label	%i31, setup_startp_constants.2965
	jmp	%i3, 0(%i31)
	lf	%f3, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i6, 118
	lw	%i4, 118(%i21)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73926
	lw	%i4, 119(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
	jzero	%i0, %i0, cont.73927
then.73926:
	lw	%i4, 118(%i21)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sf	%f3, 5(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lf	%f3, 5(%i1)
	addi	%i1, %i1, 24
cont.73927:
	movi	%i4, 116
	mov	%i6, %i4
loop_start.69364:
	jleq	%i0, %i6, then.73929
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69365
	set_label	%i31, loop_start.69364
	jmp	%i0, 0(%i31)
then.73929:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i20)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i20)
	fma	%f4, %f2, %f1, %f4
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i20)
	fma	%f2, %f2, %f1, %f4
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.73931
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73932
then.73931:
	slli	%i4, %i6, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sf	%f3, 6(%i1)
	set_label	%i31, trace_diffuse_ray.3060
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lf	%f3, 6(%i1)
	addi	%i1, %i1, 32
cont.73932:
	subi	%i4, %i6, 2
	mov	%i6, %i4
cont.73930:
	set_label	%i30, loop_start.69364
	jmp	%i0, 0(%i30)
loop_end.69365:
	mov	%i0, %i31
	slli	%i4, %i22, 2
	add	%i31, %i26, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 181(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 181(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.73925:
	addi	%i4, %i22, 1
	mov	%i22, %i4
cont.73924:
cont.73922:
cont.73912:
cont.73910:
cont.73900:
cont.73898:
cont.73888:
cont.73886:
	set_label	%i30, loop_start.69304
	jmp	%i0, 0(%i30)
loop_end.69305:
	mov	%i0, %i31
cont.73875:
	subi	%i6, %i18, 1
	addi	%i5, %i17, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.73933
	mov	%i4, %i5
	jzero	%i0, %i0, cont.73934
then.73933:
	subi	%i4, %i5, 5
cont.73934:
	mov	%i18, %i6
	mov	%i17, %i4
cont.73871:
	set_label	%i30, loop_start.69284
	jmp	%i0, 0(%i30)
loop_end.69285:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
scan_line.3137:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i22, %i4
	mov	%i26, %i5
	mov	%i19, %i6
	mov	%i25, %i7
	mov	%i18, %i8
	mov	%i24, %i9
	lw	%i4, 191(%i0)
	lw	%i23, 1(%i4)
	cleq	%i30, %i23, %i22
	jzero	%i0, %i30, Lrelax_skip_10
	set_label	%i30, then.73935
	jmp	%i0, 0(%i30)
Lrelax_skip_10:
	lw	%i4, 191(%i0)
	lw	%i4, 1(%i4)
	subi	%i4, %i4, 1
	jleq	%i4, %i22, cont.73936
	addi	%i5, %i22, 1
	lw	%i4, 199(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 195(%i0)
	lw	%i4, 1(%i4)
	sub	%i4, %i5, %i4
	itof	%f1, %i4
	fmul	%f3, %f2, %f1
	lw	%i4, 217(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f3, %f1
	lw	%i4, 222(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lw	%i4, 217(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f3, %f1
	lw	%i4, 222(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 217(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f3, %f1
	lw	%i4, 222(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	lw	%i4, 191(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i25
	mov	%i6, %i18
	fmov	%f1, %f5
	fmov	%f2, %f4
	subi	%i1, %i1, 32
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i22, 2(%i1)
	sw	%i23, 3(%i1)
	sw	%i24, 4(%i1)
	sw	%i25, 5(%i1)
	sw	%i26, 6(%i1)
	set_label	%i31, pretrace_pixels.3119
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i22, 2(%i1)
	lw	%i23, 3(%i1)
	lw	%i24, 4(%i1)
	lw	%i25, 5(%i1)
	lw	%i26, 6(%i1)
	addi	%i1, %i1, 32
cont.73936:
	mov	%i13, %i0
	lw	%i4, 191(%i0)
	lw	%i17, 0(%i4)
	jleq	%i17, %i13, then.73937
	lw	%i4, 0(%i19)
	lw	%i5, 0(%i4)
	lf	%f1, 0(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 191(%i0)
	lw	%i5, 1(%i4)
	addi	%i4, %i22, 1
	jleq	%i5, %i4, then.73939
	jleq	%i22, %i0, then.73941
	lw	%i4, 191(%i0)
	lw	%i4, 0(%i4)
	movi	%i31, 1
	jleq	%i4, %i31, then.73943
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73940
then.73943:
	mov	%i4, %i0
cont.73944:
	jzero	%i0, %i0, cont.73940
then.73941:
	mov	%i4, %i0
cont.73942:
	jzero	%i0, %i0, cont.73940
then.73939:
	mov	%i4, %i0
cont.73940:
	jeq	%i4, %i0, then.73945
	mov	%i4, %i13
	mov	%i5, %i22
	mov	%i6, %i26
	mov	%i7, %i19
	mov	%i8, %i25
	mov	%i9, %i0
	subi	%i1, %i1, 32
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i22, 3(%i1)
	sw	%i23, 4(%i1)
	sw	%i24, 5(%i1)
	sw	%i25, 6(%i1)
	sw	%i26, 7(%i1)
	set_label	%i31, try_exploit_neighbors.3101
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i22, 3(%i1)
	lw	%i23, 4(%i1)
	lw	%i24, 5(%i1)
	lw	%i25, 6(%i1)
	lw	%i26, 7(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.73946
then.73945:
	lw	%i4, 0(%i19)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	mov	%i12, %i0
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i22, 3(%i1)
	sw	%i23, 4(%i1)
	set_label	%i31, do_without_neighbors.3085
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i22, 3(%i1)
	lw	%i23, 4(%i1)
	addi	%i1, %i1, 24
cont.73946:
	movi	%i31, 3
	jeq	%i24, %i31, then.73947
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.73949
	movi	%i4, 255
	jzero	%i0, %i0, cont.73950
then.73949:
	jleq	%i0, %i4, then.73951
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73952
then.73951:
cont.73952:
cont.73950:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.73953
	movi	%i4, 255
	jzero	%i0, %i0, cont.73954
then.73953:
	jleq	%i0, %i4, then.73955
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73956
then.73955:
cont.73956:
cont.73954:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.73957
	movi	%i4, 255
	jzero	%i0, %i0, cont.73958
then.73957:
	jleq	%i0, %i4, then.73959
	mov	%i4, %i0
	jzero	%i0, %i0, cont.73960
then.73959:
cont.73960:
cont.73958:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73948
then.73947:
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.73961
	movi	%i6, 255
	jzero	%i0, %i0, cont.73962
then.73961:
	jleq	%i0, %i4, then.73963
	mov	%i6, %i0
	jzero	%i0, %i0, cont.73964
then.73963:
	mov	%i6, %i4
cont.73964:
cont.73962:
	movi	%i4, 100
	jleq	%i4, %i6, then.73965
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73966
then.73965:
	movi	%i4, 200
	jleq	%i4, %i6, then.73967
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.73968
then.73967:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.73968:
cont.73966:
	movi	%i4, 40
	jleq	%i4, %i6, then.73969
	movi	%i4, 20
	jleq	%i4, %i6, then.73971
	movi	%i4, 10
	jleq	%i4, %i6, then.73973
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.73970
then.73973:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.73974:
	jzero	%i0, %i0, cont.73970
then.73971:
	movi	%i4, 30
	jleq	%i4, %i6, then.73975
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.73976
then.73975:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.73976:
cont.73972:
	jzero	%i0, %i0, cont.73970
then.73969:
	movi	%i4, 60
	jleq	%i4, %i6, then.73977
	movi	%i4, 50
	jleq	%i4, %i6, then.73979
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.73978
then.73979:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.73980:
	jzero	%i0, %i0, cont.73978
then.73977:
	movi	%i4, 80
	jleq	%i4, %i6, then.73981
	movi	%i4, 70
	jleq	%i4, %i6, then.73983
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.73982
then.73983:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.73984:
	jzero	%i0, %i0, cont.73982
then.73981:
	movi	%i4, 90
	jleq	%i4, %i6, then.73985
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.73986
then.73985:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.73986:
cont.73982:
cont.73978:
cont.73970:
	movi	%i4, 4
	jleq	%i4, %i5, then.73987
	movi	%i4, 2
	jleq	%i4, %i5, then.73989
	movi	%i4, 1
	jleq	%i4, %i5, then.73991
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73988
then.73991:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73992:
	jzero	%i0, %i0, cont.73988
then.73989:
	movi	%i4, 3
	jleq	%i4, %i5, then.73993
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73994
then.73993:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73994:
cont.73990:
	jzero	%i0, %i0, cont.73988
then.73987:
	movi	%i4, 6
	jleq	%i4, %i5, then.73995
	movi	%i4, 5
	jleq	%i4, %i5, then.73997
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.73996
then.73997:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73998:
	jzero	%i0, %i0, cont.73996
then.73995:
	movi	%i4, 8
	jleq	%i4, %i5, then.73999
	movi	%i4, 7
	jleq	%i4, %i5, then.74001
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74000
then.74001:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74002:
	jzero	%i0, %i0, cont.74000
then.73999:
	movi	%i4, 9
	jleq	%i4, %i5, then.74003
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74004
then.74003:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74004:
cont.74000:
cont.73996:
cont.73988:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74005
	movi	%i6, 255
	jzero	%i0, %i0, cont.74006
then.74005:
	jleq	%i0, %i4, then.74007
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74008
then.74007:
	mov	%i6, %i4
cont.74008:
cont.74006:
	movi	%i4, 100
	jleq	%i4, %i6, then.74009
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74010
then.74009:
	movi	%i4, 200
	jleq	%i4, %i6, then.74011
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74012
then.74011:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74012:
cont.74010:
	movi	%i4, 40
	jleq	%i4, %i6, then.74013
	movi	%i4, 20
	jleq	%i4, %i6, then.74015
	movi	%i4, 10
	jleq	%i4, %i6, then.74017
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74014
then.74017:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74018:
	jzero	%i0, %i0, cont.74014
then.74015:
	movi	%i4, 30
	jleq	%i4, %i6, then.74019
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74020
then.74019:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74020:
cont.74016:
	jzero	%i0, %i0, cont.74014
then.74013:
	movi	%i4, 60
	jleq	%i4, %i6, then.74021
	movi	%i4, 50
	jleq	%i4, %i6, then.74023
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74022
then.74023:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74024:
	jzero	%i0, %i0, cont.74022
then.74021:
	movi	%i4, 80
	jleq	%i4, %i6, then.74025
	movi	%i4, 70
	jleq	%i4, %i6, then.74027
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74026
then.74027:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74028:
	jzero	%i0, %i0, cont.74026
then.74025:
	movi	%i4, 90
	jleq	%i4, %i6, then.74029
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74030
then.74029:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74030:
cont.74026:
cont.74022:
cont.74014:
	movi	%i4, 4
	jleq	%i4, %i5, then.74031
	movi	%i4, 2
	jleq	%i4, %i5, then.74033
	movi	%i4, 1
	jleq	%i4, %i5, then.74035
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74032
then.74035:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74036:
	jzero	%i0, %i0, cont.74032
then.74033:
	movi	%i4, 3
	jleq	%i4, %i5, then.74037
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74038
then.74037:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74038:
cont.74034:
	jzero	%i0, %i0, cont.74032
then.74031:
	movi	%i4, 6
	jleq	%i4, %i5, then.74039
	movi	%i4, 5
	jleq	%i4, %i5, then.74041
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74040
then.74041:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74042:
	jzero	%i0, %i0, cont.74040
then.74039:
	movi	%i4, 8
	jleq	%i4, %i5, then.74043
	movi	%i4, 7
	jleq	%i4, %i5, then.74045
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74044
then.74045:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74046:
	jzero	%i0, %i0, cont.74044
then.74043:
	movi	%i4, 9
	jleq	%i4, %i5, then.74047
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74048
then.74047:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74048:
cont.74044:
cont.74040:
cont.74032:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74049
	movi	%i6, 255
	jzero	%i0, %i0, cont.74050
then.74049:
	jleq	%i0, %i4, then.74051
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74052
then.74051:
	mov	%i6, %i4
cont.74052:
cont.74050:
	movi	%i4, 100
	jleq	%i4, %i6, then.74053
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74054
then.74053:
	movi	%i4, 200
	jleq	%i4, %i6, then.74055
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74056
then.74055:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74056:
cont.74054:
	movi	%i4, 40
	jleq	%i4, %i6, then.74057
	movi	%i4, 20
	jleq	%i4, %i6, then.74059
	movi	%i4, 10
	jleq	%i4, %i6, then.74061
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74058
then.74061:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74062:
	jzero	%i0, %i0, cont.74058
then.74059:
	movi	%i4, 30
	jleq	%i4, %i6, then.74063
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74064
then.74063:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74064:
cont.74060:
	jzero	%i0, %i0, cont.74058
then.74057:
	movi	%i4, 60
	jleq	%i4, %i6, then.74065
	movi	%i4, 50
	jleq	%i4, %i6, then.74067
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74066
then.74067:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74068:
	jzero	%i0, %i0, cont.74066
then.74065:
	movi	%i4, 80
	jleq	%i4, %i6, then.74069
	movi	%i4, 70
	jleq	%i4, %i6, then.74071
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74070
then.74071:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74072:
	jzero	%i0, %i0, cont.74070
then.74069:
	movi	%i4, 90
	jleq	%i4, %i6, then.74073
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74074
then.74073:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74074:
cont.74070:
cont.74066:
cont.74058:
	movi	%i4, 4
	jleq	%i4, %i5, then.74075
	movi	%i4, 2
	jleq	%i4, %i5, then.74077
	movi	%i4, 1
	jleq	%i4, %i5, then.74079
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74076
then.74079:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74080:
	jzero	%i0, %i0, cont.74076
then.74077:
	movi	%i4, 3
	jleq	%i4, %i5, then.74081
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74082
then.74081:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74082:
cont.74078:
	jzero	%i0, %i0, cont.74076
then.74075:
	movi	%i4, 6
	jleq	%i4, %i5, then.74083
	movi	%i4, 5
	jleq	%i4, %i5, then.74085
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74084
then.74085:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74086:
	jzero	%i0, %i0, cont.74084
then.74083:
	movi	%i4, 8
	jleq	%i4, %i5, then.74087
	movi	%i4, 7
	jleq	%i4, %i5, then.74089
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74088
then.74089:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74090:
	jzero	%i0, %i0, cont.74088
then.74087:
	movi	%i4, 9
	jleq	%i4, %i5, then.74091
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74092
then.74091:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74092:
cont.74088:
cont.74084:
cont.74076:
	movi	%i4, 10
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.73948:
	movi	%i4, 1
	mov	%i13, %i4
loop_start.69380:
	jleq	%i17, %i13, then.74094
	slli	%i4, %i13, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 0(%i4)
	lf	%f1, 0(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 191(%i0)
	lw	%i5, 1(%i4)
	addi	%i4, %i22, 1
	jleq	%i5, %i4, then.74096
	jleq	%i22, %i0, then.74098
	lw	%i4, 191(%i0)
	lw	%i5, 0(%i4)
	addi	%i4, %i13, 1
	jleq	%i5, %i4, then.74100
	clt	%i4, %i0, %i13
	jzero	%i0, %i0, cont.74097
then.74100:
	mov	%i4, %i0
cont.74101:
	jzero	%i0, %i0, cont.74097
then.74098:
	mov	%i4, %i0
cont.74099:
	jzero	%i0, %i0, cont.74097
then.74096:
	mov	%i4, %i0
cont.74097:
	jeq	%i4, %i0, then.74102
	mov	%i4, %i13
	mov	%i5, %i22
	mov	%i6, %i26
	mov	%i7, %i19
	mov	%i8, %i25
	mov	%i9, %i0
	subi	%i1, %i1, 40
	sw	%i13, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i22, 4(%i1)
	sw	%i23, 5(%i1)
	sw	%i24, 6(%i1)
	sw	%i25, 7(%i1)
	sw	%i26, 8(%i1)
	set_label	%i31, try_exploit_neighbors.3101
	jmp	%i3, 0(%i31)
	lw	%i13, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i22, 4(%i1)
	lw	%i23, 5(%i1)
	lw	%i24, 6(%i1)
	lw	%i25, 7(%i1)
	lw	%i26, 8(%i1)
	addi	%i1, %i1, 40
	jzero	%i0, %i0, cont.74103
then.74102:
	slli	%i4, %i13, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	mov	%i12, %i0
	subi	%i1, %i1, 24
	sw	%i13, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i22, 4(%i1)
	sw	%i23, 5(%i1)
	set_label	%i31, do_without_neighbors.3085
	jmp	%i3, 0(%i31)
	lw	%i13, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i22, 4(%i1)
	lw	%i23, 5(%i1)
	addi	%i1, %i1, 24
cont.74103:
	movi	%i31, 3
	jeq	%i24, %i31, then.74104
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74106
	movi	%i4, 255
	jzero	%i0, %i0, cont.74107
then.74106:
	jleq	%i0, %i4, then.74108
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74109
then.74108:
cont.74109:
cont.74107:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74110
	movi	%i4, 255
	jzero	%i0, %i0, cont.74111
then.74110:
	jleq	%i0, %i4, then.74112
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74113
then.74112:
cont.74113:
cont.74111:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74114
	movi	%i4, 255
	jzero	%i0, %i0, cont.74115
then.74114:
	jleq	%i0, %i4, then.74116
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74117
then.74116:
cont.74117:
cont.74115:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74105
then.74104:
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74118
	movi	%i6, 255
	jzero	%i0, %i0, cont.74119
then.74118:
	jleq	%i0, %i4, then.74120
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74121
then.74120:
	mov	%i6, %i4
cont.74121:
cont.74119:
	movi	%i4, 100
	jleq	%i4, %i6, then.74122
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74123
then.74122:
	movi	%i4, 200
	jleq	%i4, %i6, then.74124
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74125
then.74124:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74125:
cont.74123:
	movi	%i4, 40
	jleq	%i4, %i6, then.74126
	movi	%i4, 20
	jleq	%i4, %i6, then.74128
	movi	%i4, 10
	jleq	%i4, %i6, then.74130
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74127
then.74130:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74131:
	jzero	%i0, %i0, cont.74127
then.74128:
	movi	%i4, 30
	jleq	%i4, %i6, then.74132
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74133
then.74132:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74133:
cont.74129:
	jzero	%i0, %i0, cont.74127
then.74126:
	movi	%i4, 60
	jleq	%i4, %i6, then.74134
	movi	%i4, 50
	jleq	%i4, %i6, then.74136
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74135
then.74136:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74137:
	jzero	%i0, %i0, cont.74135
then.74134:
	movi	%i4, 80
	jleq	%i4, %i6, then.74138
	movi	%i4, 70
	jleq	%i4, %i6, then.74140
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74139
then.74140:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74141:
	jzero	%i0, %i0, cont.74139
then.74138:
	movi	%i4, 90
	jleq	%i4, %i6, then.74142
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74143
then.74142:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74143:
cont.74139:
cont.74135:
cont.74127:
	movi	%i4, 4
	jleq	%i4, %i5, then.74144
	movi	%i4, 2
	jleq	%i4, %i5, then.74146
	movi	%i4, 1
	jleq	%i4, %i5, then.74148
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74145
then.74148:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74149:
	jzero	%i0, %i0, cont.74145
then.74146:
	movi	%i4, 3
	jleq	%i4, %i5, then.74150
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74151
then.74150:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74151:
cont.74147:
	jzero	%i0, %i0, cont.74145
then.74144:
	movi	%i4, 6
	jleq	%i4, %i5, then.74152
	movi	%i4, 5
	jleq	%i4, %i5, then.74154
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74153
then.74154:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74155:
	jzero	%i0, %i0, cont.74153
then.74152:
	movi	%i4, 8
	jleq	%i4, %i5, then.74156
	movi	%i4, 7
	jleq	%i4, %i5, then.74158
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74157
then.74158:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74159:
	jzero	%i0, %i0, cont.74157
then.74156:
	movi	%i4, 9
	jleq	%i4, %i5, then.74160
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74161
then.74160:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74161:
cont.74157:
cont.74153:
cont.74145:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74162
	movi	%i6, 255
	jzero	%i0, %i0, cont.74163
then.74162:
	jleq	%i0, %i4, then.74164
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74165
then.74164:
	mov	%i6, %i4
cont.74165:
cont.74163:
	movi	%i4, 100
	jleq	%i4, %i6, then.74166
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74167
then.74166:
	movi	%i4, 200
	jleq	%i4, %i6, then.74168
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74169
then.74168:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74169:
cont.74167:
	movi	%i4, 40
	jleq	%i4, %i6, then.74170
	movi	%i4, 20
	jleq	%i4, %i6, then.74172
	movi	%i4, 10
	jleq	%i4, %i6, then.74174
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74171
then.74174:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74175:
	jzero	%i0, %i0, cont.74171
then.74172:
	movi	%i4, 30
	jleq	%i4, %i6, then.74176
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74177
then.74176:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74177:
cont.74173:
	jzero	%i0, %i0, cont.74171
then.74170:
	movi	%i4, 60
	jleq	%i4, %i6, then.74178
	movi	%i4, 50
	jleq	%i4, %i6, then.74180
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74179
then.74180:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74181:
	jzero	%i0, %i0, cont.74179
then.74178:
	movi	%i4, 80
	jleq	%i4, %i6, then.74182
	movi	%i4, 70
	jleq	%i4, %i6, then.74184
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74183
then.74184:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74185:
	jzero	%i0, %i0, cont.74183
then.74182:
	movi	%i4, 90
	jleq	%i4, %i6, then.74186
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74187
then.74186:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74187:
cont.74183:
cont.74179:
cont.74171:
	movi	%i4, 4
	jleq	%i4, %i5, then.74188
	movi	%i4, 2
	jleq	%i4, %i5, then.74190
	movi	%i4, 1
	jleq	%i4, %i5, then.74192
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74189
then.74192:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74193:
	jzero	%i0, %i0, cont.74189
then.74190:
	movi	%i4, 3
	jleq	%i4, %i5, then.74194
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74195
then.74194:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74195:
cont.74191:
	jzero	%i0, %i0, cont.74189
then.74188:
	movi	%i4, 6
	jleq	%i4, %i5, then.74196
	movi	%i4, 5
	jleq	%i4, %i5, then.74198
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74197
then.74198:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74199:
	jzero	%i0, %i0, cont.74197
then.74196:
	movi	%i4, 8
	jleq	%i4, %i5, then.74200
	movi	%i4, 7
	jleq	%i4, %i5, then.74202
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74201
then.74202:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74203:
	jzero	%i0, %i0, cont.74201
then.74200:
	movi	%i4, 9
	jleq	%i4, %i5, then.74204
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74205
then.74204:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74205:
cont.74201:
cont.74197:
cont.74189:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74206
	movi	%i6, 255
	jzero	%i0, %i0, cont.74207
then.74206:
	jleq	%i0, %i4, then.74208
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74209
then.74208:
	mov	%i6, %i4
cont.74209:
cont.74207:
	movi	%i4, 100
	jleq	%i4, %i6, then.74210
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74211
then.74210:
	movi	%i4, 200
	jleq	%i4, %i6, then.74212
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74213
then.74212:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74213:
cont.74211:
	movi	%i4, 40
	jleq	%i4, %i6, then.74214
	movi	%i4, 20
	jleq	%i4, %i6, then.74216
	movi	%i4, 10
	jleq	%i4, %i6, then.74218
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74215
then.74218:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74219:
	jzero	%i0, %i0, cont.74215
then.74216:
	movi	%i4, 30
	jleq	%i4, %i6, then.74220
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74221
then.74220:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74221:
cont.74217:
	jzero	%i0, %i0, cont.74215
then.74214:
	movi	%i4, 60
	jleq	%i4, %i6, then.74222
	movi	%i4, 50
	jleq	%i4, %i6, then.74224
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74223
then.74224:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74225:
	jzero	%i0, %i0, cont.74223
then.74222:
	movi	%i4, 80
	jleq	%i4, %i6, then.74226
	movi	%i4, 70
	jleq	%i4, %i6, then.74228
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74227
then.74228:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74229:
	jzero	%i0, %i0, cont.74227
then.74226:
	movi	%i4, 90
	jleq	%i4, %i6, then.74230
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74231
then.74230:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74231:
cont.74227:
cont.74223:
cont.74215:
	movi	%i4, 4
	jleq	%i4, %i5, then.74232
	movi	%i4, 2
	jleq	%i4, %i5, then.74234
	movi	%i4, 1
	jleq	%i4, %i5, then.74236
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74233
then.74236:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74237:
	jzero	%i0, %i0, cont.74233
then.74234:
	movi	%i4, 3
	jleq	%i4, %i5, then.74238
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74239
then.74238:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74239:
cont.74235:
	jzero	%i0, %i0, cont.74233
then.74232:
	movi	%i4, 6
	jleq	%i4, %i5, then.74240
	movi	%i4, 5
	jleq	%i4, %i5, then.74242
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74241
then.74242:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74243:
	jzero	%i0, %i0, cont.74241
then.74240:
	movi	%i4, 8
	jleq	%i4, %i5, then.74244
	movi	%i4, 7
	jleq	%i4, %i5, then.74246
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74245
then.74246:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74247:
	jzero	%i0, %i0, cont.74245
then.74244:
	movi	%i4, 9
	jleq	%i4, %i5, then.74248
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74249
then.74248:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74249:
cont.74245:
cont.74241:
cont.74233:
	movi	%i4, 10
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74105:
	addi	%i4, %i13, 1
	mov	%i13, %i4
	set_label	%i31, loop_start.69380
	jmp	%i0, 0(%i31)
then.74094:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69381
loop_end.69381:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.73938
then.73937:
cont.73938:
	addi	%i7, %i22, 1
	addi	%i5, %i18, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.74250
	mov	%i6, %i5
	jzero	%i0, %i0, cont.74251
then.74250:
	subi	%i6, %i5, 5
cont.74251:
	mov	%i5, %i19
	mov	%i4, %i26
	mov	%i22, %i7
	mov	%i26, %i5
	mov	%i19, %i25
	mov	%i25, %i4
	mov	%i18, %i6
loop_start.69386:
	cleq	%i30, %i23, %i22
	jzero	%i0, %i30, Lrelax_skip_11
	set_label	%i30, then.74253
	jmp	%i0, 0(%i30)
Lrelax_skip_11:
	lw	%i4, 191(%i0)
	lw	%i4, 1(%i4)
	subi	%i4, %i4, 1
	jleq	%i4, %i22, cont.74255
	addi	%i5, %i22, 1
	lw	%i4, 199(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 195(%i0)
	lw	%i4, 1(%i4)
	sub	%i4, %i5, %i4
	itof	%f1, %i4
	fmul	%f3, %f2, %f1
	lw	%i4, 217(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f3, %f1
	lw	%i4, 222(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lw	%i4, 217(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f3, %f1
	lw	%i4, 222(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 217(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f3, %f1
	lw	%i4, 222(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	lw	%i4, 191(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i25
	mov	%i6, %i18
	fmov	%f1, %f5
	fmov	%f2, %f4
	subi	%i1, %i1, 32
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i22, 2(%i1)
	sw	%i23, 3(%i1)
	sw	%i24, 4(%i1)
	sw	%i25, 5(%i1)
	sw	%i26, 6(%i1)
	set_label	%i31, pretrace_pixels.3119
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i22, 2(%i1)
	lw	%i23, 3(%i1)
	lw	%i24, 4(%i1)
	lw	%i25, 5(%i1)
	lw	%i26, 6(%i1)
	addi	%i1, %i1, 32
cont.74255:
	mov	%i13, %i0
	lw	%i4, 191(%i0)
	lw	%i17, 0(%i4)
	jleq	%i17, %i13, then.74256
	lw	%i4, 0(%i19)
	lw	%i5, 0(%i4)
	lf	%f1, 0(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 191(%i0)
	lw	%i5, 1(%i4)
	addi	%i4, %i22, 1
	jleq	%i5, %i4, then.74258
	jleq	%i22, %i0, then.74260
	lw	%i4, 191(%i0)
	lw	%i4, 0(%i4)
	movi	%i31, 1
	jleq	%i4, %i31, then.74262
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74259
then.74262:
	mov	%i4, %i0
cont.74263:
	jzero	%i0, %i0, cont.74259
then.74260:
	mov	%i4, %i0
cont.74261:
	jzero	%i0, %i0, cont.74259
then.74258:
	mov	%i4, %i0
cont.74259:
	jeq	%i4, %i0, then.74264
	mov	%i4, %i13
	mov	%i5, %i22
	mov	%i6, %i26
	mov	%i7, %i19
	mov	%i8, %i25
	mov	%i9, %i0
	subi	%i1, %i1, 32
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i22, 3(%i1)
	sw	%i23, 4(%i1)
	sw	%i24, 5(%i1)
	sw	%i25, 6(%i1)
	sw	%i26, 7(%i1)
	set_label	%i31, try_exploit_neighbors.3101
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i22, 3(%i1)
	lw	%i23, 4(%i1)
	lw	%i24, 5(%i1)
	lw	%i25, 6(%i1)
	lw	%i26, 7(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.74265
then.74264:
	lw	%i4, 0(%i19)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	mov	%i12, %i0
	subi	%i1, %i1, 24
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i22, 3(%i1)
	sw	%i23, 4(%i1)
	set_label	%i31, do_without_neighbors.3085
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i22, 3(%i1)
	lw	%i23, 4(%i1)
	addi	%i1, %i1, 24
cont.74265:
	movi	%i31, 3
	jeq	%i24, %i31, then.74266
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74268
	movi	%i4, 255
	jzero	%i0, %i0, cont.74269
then.74268:
	jleq	%i0, %i4, then.74270
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74271
then.74270:
cont.74271:
cont.74269:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74272
	movi	%i4, 255
	jzero	%i0, %i0, cont.74273
then.74272:
	jleq	%i0, %i4, then.74274
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74275
then.74274:
cont.74275:
cont.74273:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74276
	movi	%i4, 255
	jzero	%i0, %i0, cont.74277
then.74276:
	jleq	%i0, %i4, then.74278
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74279
then.74278:
cont.74279:
cont.74277:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74267
then.74266:
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74280
	movi	%i6, 255
	jzero	%i0, %i0, cont.74281
then.74280:
	jleq	%i0, %i4, then.74282
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74283
then.74282:
	mov	%i6, %i4
cont.74283:
cont.74281:
	movi	%i4, 100
	jleq	%i4, %i6, then.74284
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74285
then.74284:
	movi	%i4, 200
	jleq	%i4, %i6, then.74286
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74287
then.74286:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74287:
cont.74285:
	movi	%i4, 40
	jleq	%i4, %i6, then.74288
	movi	%i4, 20
	jleq	%i4, %i6, then.74290
	movi	%i4, 10
	jleq	%i4, %i6, then.74292
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74289
then.74292:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74293:
	jzero	%i0, %i0, cont.74289
then.74290:
	movi	%i4, 30
	jleq	%i4, %i6, then.74294
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74295
then.74294:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74295:
cont.74291:
	jzero	%i0, %i0, cont.74289
then.74288:
	movi	%i4, 60
	jleq	%i4, %i6, then.74296
	movi	%i4, 50
	jleq	%i4, %i6, then.74298
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74297
then.74298:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74299:
	jzero	%i0, %i0, cont.74297
then.74296:
	movi	%i4, 80
	jleq	%i4, %i6, then.74300
	movi	%i4, 70
	jleq	%i4, %i6, then.74302
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74301
then.74302:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74303:
	jzero	%i0, %i0, cont.74301
then.74300:
	movi	%i4, 90
	jleq	%i4, %i6, then.74304
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74305
then.74304:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74305:
cont.74301:
cont.74297:
cont.74289:
	movi	%i4, 4
	jleq	%i4, %i5, then.74306
	movi	%i4, 2
	jleq	%i4, %i5, then.74308
	movi	%i4, 1
	jleq	%i4, %i5, then.74310
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74307
then.74310:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74311:
	jzero	%i0, %i0, cont.74307
then.74308:
	movi	%i4, 3
	jleq	%i4, %i5, then.74312
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74313
then.74312:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74313:
cont.74309:
	jzero	%i0, %i0, cont.74307
then.74306:
	movi	%i4, 6
	jleq	%i4, %i5, then.74314
	movi	%i4, 5
	jleq	%i4, %i5, then.74316
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74315
then.74316:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74317:
	jzero	%i0, %i0, cont.74315
then.74314:
	movi	%i4, 8
	jleq	%i4, %i5, then.74318
	movi	%i4, 7
	jleq	%i4, %i5, then.74320
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74319
then.74320:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74321:
	jzero	%i0, %i0, cont.74319
then.74318:
	movi	%i4, 9
	jleq	%i4, %i5, then.74322
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74323
then.74322:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74323:
cont.74319:
cont.74315:
cont.74307:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74324
	movi	%i6, 255
	jzero	%i0, %i0, cont.74325
then.74324:
	jleq	%i0, %i4, then.74326
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74327
then.74326:
	mov	%i6, %i4
cont.74327:
cont.74325:
	movi	%i4, 100
	jleq	%i4, %i6, then.74328
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74329
then.74328:
	movi	%i4, 200
	jleq	%i4, %i6, then.74330
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74331
then.74330:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74331:
cont.74329:
	movi	%i4, 40
	jleq	%i4, %i6, then.74332
	movi	%i4, 20
	jleq	%i4, %i6, then.74334
	movi	%i4, 10
	jleq	%i4, %i6, then.74336
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74333
then.74336:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74337:
	jzero	%i0, %i0, cont.74333
then.74334:
	movi	%i4, 30
	jleq	%i4, %i6, then.74338
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74339
then.74338:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74339:
cont.74335:
	jzero	%i0, %i0, cont.74333
then.74332:
	movi	%i4, 60
	jleq	%i4, %i6, then.74340
	movi	%i4, 50
	jleq	%i4, %i6, then.74342
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74341
then.74342:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74343:
	jzero	%i0, %i0, cont.74341
then.74340:
	movi	%i4, 80
	jleq	%i4, %i6, then.74344
	movi	%i4, 70
	jleq	%i4, %i6, then.74346
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74345
then.74346:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74347:
	jzero	%i0, %i0, cont.74345
then.74344:
	movi	%i4, 90
	jleq	%i4, %i6, then.74348
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74349
then.74348:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74349:
cont.74345:
cont.74341:
cont.74333:
	movi	%i4, 4
	jleq	%i4, %i5, then.74350
	movi	%i4, 2
	jleq	%i4, %i5, then.74352
	movi	%i4, 1
	jleq	%i4, %i5, then.74354
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74351
then.74354:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74355:
	jzero	%i0, %i0, cont.74351
then.74352:
	movi	%i4, 3
	jleq	%i4, %i5, then.74356
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74357
then.74356:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74357:
cont.74353:
	jzero	%i0, %i0, cont.74351
then.74350:
	movi	%i4, 6
	jleq	%i4, %i5, then.74358
	movi	%i4, 5
	jleq	%i4, %i5, then.74360
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74359
then.74360:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74361:
	jzero	%i0, %i0, cont.74359
then.74358:
	movi	%i4, 8
	jleq	%i4, %i5, then.74362
	movi	%i4, 7
	jleq	%i4, %i5, then.74364
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74363
then.74364:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74365:
	jzero	%i0, %i0, cont.74363
then.74362:
	movi	%i4, 9
	jleq	%i4, %i5, then.74366
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74367
then.74366:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74367:
cont.74363:
cont.74359:
cont.74351:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74368
	movi	%i6, 255
	jzero	%i0, %i0, cont.74369
then.74368:
	jleq	%i0, %i4, then.74370
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74371
then.74370:
	mov	%i6, %i4
cont.74371:
cont.74369:
	movi	%i4, 100
	jleq	%i4, %i6, then.74372
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74373
then.74372:
	movi	%i4, 200
	jleq	%i4, %i6, then.74374
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74375
then.74374:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74375:
cont.74373:
	movi	%i4, 40
	jleq	%i4, %i6, then.74376
	movi	%i4, 20
	jleq	%i4, %i6, then.74378
	movi	%i4, 10
	jleq	%i4, %i6, then.74380
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74377
then.74380:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74381:
	jzero	%i0, %i0, cont.74377
then.74378:
	movi	%i4, 30
	jleq	%i4, %i6, then.74382
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74383
then.74382:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74383:
cont.74379:
	jzero	%i0, %i0, cont.74377
then.74376:
	movi	%i4, 60
	jleq	%i4, %i6, then.74384
	movi	%i4, 50
	jleq	%i4, %i6, then.74386
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74385
then.74386:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74387:
	jzero	%i0, %i0, cont.74385
then.74384:
	movi	%i4, 80
	jleq	%i4, %i6, then.74388
	movi	%i4, 70
	jleq	%i4, %i6, then.74390
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74389
then.74390:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74391:
	jzero	%i0, %i0, cont.74389
then.74388:
	movi	%i4, 90
	jleq	%i4, %i6, then.74392
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74393
then.74392:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74393:
cont.74389:
cont.74385:
cont.74377:
	movi	%i4, 4
	jleq	%i4, %i5, then.74394
	movi	%i4, 2
	jleq	%i4, %i5, then.74396
	movi	%i4, 1
	jleq	%i4, %i5, then.74398
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74395
then.74398:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74399:
	jzero	%i0, %i0, cont.74395
then.74396:
	movi	%i4, 3
	jleq	%i4, %i5, then.74400
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74401
then.74400:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74401:
cont.74397:
	jzero	%i0, %i0, cont.74395
then.74394:
	movi	%i4, 6
	jleq	%i4, %i5, then.74402
	movi	%i4, 5
	jleq	%i4, %i5, then.74404
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74403
then.74404:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74405:
	jzero	%i0, %i0, cont.74403
then.74402:
	movi	%i4, 8
	jleq	%i4, %i5, then.74406
	movi	%i4, 7
	jleq	%i4, %i5, then.74408
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74407
then.74408:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74409:
	jzero	%i0, %i0, cont.74407
then.74406:
	movi	%i4, 9
	jleq	%i4, %i5, then.74410
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74411
then.74410:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74411:
cont.74407:
cont.74403:
cont.74395:
	movi	%i4, 10
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74267:
	movi	%i4, 1
	mov	%i13, %i4
loop_start.69388:
	jleq	%i17, %i13, then.74413
	slli	%i4, %i13, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 0(%i4)
	lf	%f1, 0(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 191(%i0)
	lw	%i5, 1(%i4)
	addi	%i4, %i22, 1
	jleq	%i5, %i4, then.74415
	jleq	%i22, %i0, then.74417
	lw	%i4, 191(%i0)
	lw	%i5, 0(%i4)
	addi	%i4, %i13, 1
	jleq	%i5, %i4, then.74419
	clt	%i4, %i0, %i13
	jzero	%i0, %i0, cont.74416
then.74419:
	mov	%i4, %i0
cont.74420:
	jzero	%i0, %i0, cont.74416
then.74417:
	mov	%i4, %i0
cont.74418:
	jzero	%i0, %i0, cont.74416
then.74415:
	mov	%i4, %i0
cont.74416:
	jeq	%i4, %i0, then.74421
	mov	%i4, %i13
	mov	%i5, %i22
	mov	%i6, %i26
	mov	%i7, %i19
	mov	%i8, %i25
	mov	%i9, %i0
	subi	%i1, %i1, 40
	sw	%i13, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i22, 4(%i1)
	sw	%i23, 5(%i1)
	sw	%i24, 6(%i1)
	sw	%i25, 7(%i1)
	sw	%i26, 8(%i1)
	set_label	%i31, try_exploit_neighbors.3101
	jmp	%i3, 0(%i31)
	lw	%i13, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i22, 4(%i1)
	lw	%i23, 5(%i1)
	lw	%i24, 6(%i1)
	lw	%i25, 7(%i1)
	lw	%i26, 8(%i1)
	addi	%i1, %i1, 40
	jzero	%i0, %i0, cont.74422
then.74421:
	slli	%i4, %i13, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	mov	%i12, %i0
	subi	%i1, %i1, 24
	sw	%i13, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i22, 4(%i1)
	sw	%i23, 5(%i1)
	set_label	%i31, do_without_neighbors.3085
	jmp	%i3, 0(%i31)
	lw	%i13, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i22, 4(%i1)
	lw	%i23, 5(%i1)
	addi	%i1, %i1, 24
cont.74422:
	movi	%i31, 3
	jeq	%i24, %i31, then.74423
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74425
	movi	%i4, 255
	jzero	%i0, %i0, cont.74426
then.74425:
	jleq	%i0, %i4, then.74427
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74428
then.74427:
cont.74428:
cont.74426:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74429
	movi	%i4, 255
	jzero	%i0, %i0, cont.74430
then.74429:
	jleq	%i0, %i4, then.74431
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74432
then.74431:
cont.74432:
cont.74430:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74433
	movi	%i4, 255
	jzero	%i0, %i0, cont.74434
then.74433:
	jleq	%i0, %i4, then.74435
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74436
then.74435:
cont.74436:
cont.74434:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74424
then.74423:
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74437
	movi	%i6, 255
	jzero	%i0, %i0, cont.74438
then.74437:
	jleq	%i0, %i4, then.74439
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74440
then.74439:
	mov	%i6, %i4
cont.74440:
cont.74438:
	movi	%i4, 100
	jleq	%i4, %i6, then.74441
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74442
then.74441:
	movi	%i4, 200
	jleq	%i4, %i6, then.74443
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74444
then.74443:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74444:
cont.74442:
	movi	%i4, 40
	jleq	%i4, %i6, then.74445
	movi	%i4, 20
	jleq	%i4, %i6, then.74447
	movi	%i4, 10
	jleq	%i4, %i6, then.74449
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74446
then.74449:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74450:
	jzero	%i0, %i0, cont.74446
then.74447:
	movi	%i4, 30
	jleq	%i4, %i6, then.74451
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74452
then.74451:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74452:
cont.74448:
	jzero	%i0, %i0, cont.74446
then.74445:
	movi	%i4, 60
	jleq	%i4, %i6, then.74453
	movi	%i4, 50
	jleq	%i4, %i6, then.74455
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74454
then.74455:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74456:
	jzero	%i0, %i0, cont.74454
then.74453:
	movi	%i4, 80
	jleq	%i4, %i6, then.74457
	movi	%i4, 70
	jleq	%i4, %i6, then.74459
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74458
then.74459:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74460:
	jzero	%i0, %i0, cont.74458
then.74457:
	movi	%i4, 90
	jleq	%i4, %i6, then.74461
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74462
then.74461:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74462:
cont.74458:
cont.74454:
cont.74446:
	movi	%i4, 4
	jleq	%i4, %i5, then.74463
	movi	%i4, 2
	jleq	%i4, %i5, then.74465
	movi	%i4, 1
	jleq	%i4, %i5, then.74467
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74464
then.74467:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74468:
	jzero	%i0, %i0, cont.74464
then.74465:
	movi	%i4, 3
	jleq	%i4, %i5, then.74469
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74470
then.74469:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74470:
cont.74466:
	jzero	%i0, %i0, cont.74464
then.74463:
	movi	%i4, 6
	jleq	%i4, %i5, then.74471
	movi	%i4, 5
	jleq	%i4, %i5, then.74473
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74472
then.74473:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74474:
	jzero	%i0, %i0, cont.74472
then.74471:
	movi	%i4, 8
	jleq	%i4, %i5, then.74475
	movi	%i4, 7
	jleq	%i4, %i5, then.74477
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74476
then.74477:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74478:
	jzero	%i0, %i0, cont.74476
then.74475:
	movi	%i4, 9
	jleq	%i4, %i5, then.74479
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74480
then.74479:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74480:
cont.74476:
cont.74472:
cont.74464:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74481
	movi	%i6, 255
	jzero	%i0, %i0, cont.74482
then.74481:
	jleq	%i0, %i4, then.74483
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74484
then.74483:
	mov	%i6, %i4
cont.74484:
cont.74482:
	movi	%i4, 100
	jleq	%i4, %i6, then.74485
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74486
then.74485:
	movi	%i4, 200
	jleq	%i4, %i6, then.74487
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74488
then.74487:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74488:
cont.74486:
	movi	%i4, 40
	jleq	%i4, %i6, then.74489
	movi	%i4, 20
	jleq	%i4, %i6, then.74491
	movi	%i4, 10
	jleq	%i4, %i6, then.74493
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74490
then.74493:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74494:
	jzero	%i0, %i0, cont.74490
then.74491:
	movi	%i4, 30
	jleq	%i4, %i6, then.74495
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74496
then.74495:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74496:
cont.74492:
	jzero	%i0, %i0, cont.74490
then.74489:
	movi	%i4, 60
	jleq	%i4, %i6, then.74497
	movi	%i4, 50
	jleq	%i4, %i6, then.74499
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74498
then.74499:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74500:
	jzero	%i0, %i0, cont.74498
then.74497:
	movi	%i4, 80
	jleq	%i4, %i6, then.74501
	movi	%i4, 70
	jleq	%i4, %i6, then.74503
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74502
then.74503:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74504:
	jzero	%i0, %i0, cont.74502
then.74501:
	movi	%i4, 90
	jleq	%i4, %i6, then.74505
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74506
then.74505:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74506:
cont.74502:
cont.74498:
cont.74490:
	movi	%i4, 4
	jleq	%i4, %i5, then.74507
	movi	%i4, 2
	jleq	%i4, %i5, then.74509
	movi	%i4, 1
	jleq	%i4, %i5, then.74511
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74508
then.74511:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74512:
	jzero	%i0, %i0, cont.74508
then.74509:
	movi	%i4, 3
	jleq	%i4, %i5, then.74513
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74514
then.74513:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74514:
cont.74510:
	jzero	%i0, %i0, cont.74508
then.74507:
	movi	%i4, 6
	jleq	%i4, %i5, then.74515
	movi	%i4, 5
	jleq	%i4, %i5, then.74517
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74516
then.74517:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74518:
	jzero	%i0, %i0, cont.74516
then.74515:
	movi	%i4, 8
	jleq	%i4, %i5, then.74519
	movi	%i4, 7
	jleq	%i4, %i5, then.74521
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74520
then.74521:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74522:
	jzero	%i0, %i0, cont.74520
then.74519:
	movi	%i4, 9
	jleq	%i4, %i5, then.74523
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74524
then.74523:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74524:
cont.74520:
cont.74516:
cont.74508:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74525
	movi	%i6, 255
	jzero	%i0, %i0, cont.74526
then.74525:
	jleq	%i0, %i4, then.74527
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74528
then.74527:
	mov	%i6, %i4
cont.74528:
cont.74526:
	movi	%i4, 100
	jleq	%i4, %i6, then.74529
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74530
then.74529:
	movi	%i4, 200
	jleq	%i4, %i6, then.74531
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74532
then.74531:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74532:
cont.74530:
	movi	%i4, 40
	jleq	%i4, %i6, then.74533
	movi	%i4, 20
	jleq	%i4, %i6, then.74535
	movi	%i4, 10
	jleq	%i4, %i6, then.74537
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74534
then.74537:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74538:
	jzero	%i0, %i0, cont.74534
then.74535:
	movi	%i4, 30
	jleq	%i4, %i6, then.74539
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74540
then.74539:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74540:
cont.74536:
	jzero	%i0, %i0, cont.74534
then.74533:
	movi	%i4, 60
	jleq	%i4, %i6, then.74541
	movi	%i4, 50
	jleq	%i4, %i6, then.74543
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74542
then.74543:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74544:
	jzero	%i0, %i0, cont.74542
then.74541:
	movi	%i4, 80
	jleq	%i4, %i6, then.74545
	movi	%i4, 70
	jleq	%i4, %i6, then.74547
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74546
then.74547:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74548:
	jzero	%i0, %i0, cont.74546
then.74545:
	movi	%i4, 90
	jleq	%i4, %i6, then.74549
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74550
then.74549:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74550:
cont.74546:
cont.74542:
cont.74534:
	movi	%i4, 4
	jleq	%i4, %i5, then.74551
	movi	%i4, 2
	jleq	%i4, %i5, then.74553
	movi	%i4, 1
	jleq	%i4, %i5, then.74555
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74552
then.74555:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74556:
	jzero	%i0, %i0, cont.74552
then.74553:
	movi	%i4, 3
	jleq	%i4, %i5, then.74557
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74558
then.74557:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74558:
cont.74554:
	jzero	%i0, %i0, cont.74552
then.74551:
	movi	%i4, 6
	jleq	%i4, %i5, then.74559
	movi	%i4, 5
	jleq	%i4, %i5, then.74561
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74560
then.74561:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74562:
	jzero	%i0, %i0, cont.74560
then.74559:
	movi	%i4, 8
	jleq	%i4, %i5, then.74563
	movi	%i4, 7
	jleq	%i4, %i5, then.74565
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74564
then.74565:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74566:
	jzero	%i0, %i0, cont.74564
then.74563:
	movi	%i4, 9
	jleq	%i4, %i5, then.74567
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74568
then.74567:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74568:
cont.74564:
cont.74560:
cont.74552:
	movi	%i4, 10
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74424:
	addi	%i4, %i13, 1
	mov	%i13, %i4
	set_label	%i31, loop_start.69388
	jmp	%i0, 0(%i31)
then.74413:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69389
loop_end.69389:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.74257
then.74256:
cont.74257:
	addi	%i22, %i22, 1
	addi	%i5, %i18, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.74569
	mov	%i21, %i5
	jzero	%i0, %i0, cont.74570
then.74569:
	subi	%i21, %i5, 5
cont.74570:
	mov	%i20, %i19
	mov	%i19, %i25
	mov	%i18, %i26
	jleq	%i23, %i22, then.74571
	lw	%i4, 191(%i0)
	lw	%i4, 1(%i4)
	subi	%i4, %i4, 1
	jleq	%i4, %i22, cont.74573
	addi	%i5, %i22, 1
	lw	%i4, 199(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 195(%i0)
	lw	%i4, 1(%i4)
	sub	%i4, %i5, %i4
	itof	%f1, %i4
	fmul	%f3, %f2, %f1
	lw	%i4, 217(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f3, %f1
	lw	%i4, 222(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lw	%i4, 217(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f3, %f1
	lw	%i4, 222(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 217(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f3, %f1
	lw	%i4, 222(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	lw	%i4, 191(%i0)
	lw	%i4, 0(%i4)
	subi	%i5, %i4, 1
	mov	%i4, %i18
	mov	%i6, %i21
	fmov	%f1, %f5
	fmov	%f2, %f4
	subi	%i1, %i1, 32
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	sw	%i21, 3(%i1)
	sw	%i22, 4(%i1)
	sw	%i23, 5(%i1)
	sw	%i24, 6(%i1)
	set_label	%i31, pretrace_pixels.3119
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	lw	%i21, 3(%i1)
	lw	%i22, 4(%i1)
	lw	%i23, 5(%i1)
	lw	%i24, 6(%i1)
	addi	%i1, %i1, 32
cont.74573:
	mov	%i13, %i0
	lw	%i4, 191(%i0)
	lw	%i17, 0(%i4)
	jleq	%i17, %i13, then.74574
	lw	%i4, 0(%i19)
	lw	%i5, 0(%i4)
	lf	%f1, 0(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 191(%i0)
	lw	%i5, 1(%i4)
	addi	%i4, %i22, 1
	jleq	%i5, %i4, then.74576
	jleq	%i22, %i0, then.74578
	lw	%i4, 191(%i0)
	lw	%i4, 0(%i4)
	movi	%i31, 1
	jleq	%i4, %i31, then.74580
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74577
then.74580:
	mov	%i4, %i0
cont.74581:
	jzero	%i0, %i0, cont.74577
then.74578:
	mov	%i4, %i0
cont.74579:
	jzero	%i0, %i0, cont.74577
then.74576:
	mov	%i4, %i0
cont.74577:
	jeq	%i4, %i0, then.74582
	mov	%i4, %i13
	mov	%i5, %i22
	mov	%i6, %i20
	mov	%i7, %i19
	mov	%i8, %i18
	mov	%i9, %i0
	subi	%i1, %i1, 32
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sw	%i22, 5(%i1)
	sw	%i23, 6(%i1)
	sw	%i24, 7(%i1)
	set_label	%i31, try_exploit_neighbors.3101
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lw	%i22, 5(%i1)
	lw	%i23, 6(%i1)
	lw	%i24, 7(%i1)
	addi	%i1, %i1, 32
	jzero	%i0, %i0, cont.74583
then.74582:
	lw	%i4, 0(%i19)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	mov	%i12, %i0
	subi	%i1, %i1, 32
	sw	%i17, 0(%i1)
	sw	%i18, 1(%i1)
	sw	%i19, 2(%i1)
	sw	%i20, 3(%i1)
	sw	%i21, 4(%i1)
	sw	%i22, 5(%i1)
	sw	%i23, 6(%i1)
	set_label	%i31, do_without_neighbors.3085
	jmp	%i3, 0(%i31)
	lw	%i17, 0(%i1)
	lw	%i18, 1(%i1)
	lw	%i19, 2(%i1)
	lw	%i20, 3(%i1)
	lw	%i21, 4(%i1)
	lw	%i22, 5(%i1)
	lw	%i23, 6(%i1)
	addi	%i1, %i1, 32
cont.74583:
	movi	%i31, 3
	jeq	%i24, %i31, then.74584
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74586
	movi	%i4, 255
	jzero	%i0, %i0, cont.74587
then.74586:
	jleq	%i0, %i4, then.74588
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74589
then.74588:
cont.74589:
cont.74587:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74590
	movi	%i4, 255
	jzero	%i0, %i0, cont.74591
then.74590:
	jleq	%i0, %i4, then.74592
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74593
then.74592:
cont.74593:
cont.74591:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74594
	movi	%i4, 255
	jzero	%i0, %i0, cont.74595
then.74594:
	jleq	%i0, %i4, then.74596
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74597
then.74596:
cont.74597:
cont.74595:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74585
then.74584:
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74598
	movi	%i6, 255
	jzero	%i0, %i0, cont.74599
then.74598:
	jleq	%i0, %i4, then.74600
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74601
then.74600:
	mov	%i6, %i4
cont.74601:
cont.74599:
	movi	%i4, 100
	jleq	%i4, %i6, then.74602
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74603
then.74602:
	movi	%i4, 200
	jleq	%i4, %i6, then.74604
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74605
then.74604:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74605:
cont.74603:
	movi	%i4, 40
	jleq	%i4, %i6, then.74606
	movi	%i4, 20
	jleq	%i4, %i6, then.74608
	movi	%i4, 10
	jleq	%i4, %i6, then.74610
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74607
then.74610:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74611:
	jzero	%i0, %i0, cont.74607
then.74608:
	movi	%i4, 30
	jleq	%i4, %i6, then.74612
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74613
then.74612:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74613:
cont.74609:
	jzero	%i0, %i0, cont.74607
then.74606:
	movi	%i4, 60
	jleq	%i4, %i6, then.74614
	movi	%i4, 50
	jleq	%i4, %i6, then.74616
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74615
then.74616:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74617:
	jzero	%i0, %i0, cont.74615
then.74614:
	movi	%i4, 80
	jleq	%i4, %i6, then.74618
	movi	%i4, 70
	jleq	%i4, %i6, then.74620
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74619
then.74620:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74621:
	jzero	%i0, %i0, cont.74619
then.74618:
	movi	%i4, 90
	jleq	%i4, %i6, then.74622
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74623
then.74622:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74623:
cont.74619:
cont.74615:
cont.74607:
	movi	%i4, 4
	jleq	%i4, %i5, then.74624
	movi	%i4, 2
	jleq	%i4, %i5, then.74626
	movi	%i4, 1
	jleq	%i4, %i5, then.74628
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74625
then.74628:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74629:
	jzero	%i0, %i0, cont.74625
then.74626:
	movi	%i4, 3
	jleq	%i4, %i5, then.74630
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74631
then.74630:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74631:
cont.74627:
	jzero	%i0, %i0, cont.74625
then.74624:
	movi	%i4, 6
	jleq	%i4, %i5, then.74632
	movi	%i4, 5
	jleq	%i4, %i5, then.74634
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74633
then.74634:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74635:
	jzero	%i0, %i0, cont.74633
then.74632:
	movi	%i4, 8
	jleq	%i4, %i5, then.74636
	movi	%i4, 7
	jleq	%i4, %i5, then.74638
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74637
then.74638:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74639:
	jzero	%i0, %i0, cont.74637
then.74636:
	movi	%i4, 9
	jleq	%i4, %i5, then.74640
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74641
then.74640:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74641:
cont.74637:
cont.74633:
cont.74625:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74642
	movi	%i6, 255
	jzero	%i0, %i0, cont.74643
then.74642:
	jleq	%i0, %i4, then.74644
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74645
then.74644:
	mov	%i6, %i4
cont.74645:
cont.74643:
	movi	%i4, 100
	jleq	%i4, %i6, then.74646
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74647
then.74646:
	movi	%i4, 200
	jleq	%i4, %i6, then.74648
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74649
then.74648:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74649:
cont.74647:
	movi	%i4, 40
	jleq	%i4, %i6, then.74650
	movi	%i4, 20
	jleq	%i4, %i6, then.74652
	movi	%i4, 10
	jleq	%i4, %i6, then.74654
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74651
then.74654:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74655:
	jzero	%i0, %i0, cont.74651
then.74652:
	movi	%i4, 30
	jleq	%i4, %i6, then.74656
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74657
then.74656:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74657:
cont.74653:
	jzero	%i0, %i0, cont.74651
then.74650:
	movi	%i4, 60
	jleq	%i4, %i6, then.74658
	movi	%i4, 50
	jleq	%i4, %i6, then.74660
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74659
then.74660:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74661:
	jzero	%i0, %i0, cont.74659
then.74658:
	movi	%i4, 80
	jleq	%i4, %i6, then.74662
	movi	%i4, 70
	jleq	%i4, %i6, then.74664
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74663
then.74664:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74665:
	jzero	%i0, %i0, cont.74663
then.74662:
	movi	%i4, 90
	jleq	%i4, %i6, then.74666
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74667
then.74666:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74667:
cont.74663:
cont.74659:
cont.74651:
	movi	%i4, 4
	jleq	%i4, %i5, then.74668
	movi	%i4, 2
	jleq	%i4, %i5, then.74670
	movi	%i4, 1
	jleq	%i4, %i5, then.74672
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74669
then.74672:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74673:
	jzero	%i0, %i0, cont.74669
then.74670:
	movi	%i4, 3
	jleq	%i4, %i5, then.74674
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74675
then.74674:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74675:
cont.74671:
	jzero	%i0, %i0, cont.74669
then.74668:
	movi	%i4, 6
	jleq	%i4, %i5, then.74676
	movi	%i4, 5
	jleq	%i4, %i5, then.74678
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74677
then.74678:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74679:
	jzero	%i0, %i0, cont.74677
then.74676:
	movi	%i4, 8
	jleq	%i4, %i5, then.74680
	movi	%i4, 7
	jleq	%i4, %i5, then.74682
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74681
then.74682:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74683:
	jzero	%i0, %i0, cont.74681
then.74680:
	movi	%i4, 9
	jleq	%i4, %i5, then.74684
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74685
then.74684:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74685:
cont.74681:
cont.74677:
cont.74669:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74686
	movi	%i6, 255
	jzero	%i0, %i0, cont.74687
then.74686:
	jleq	%i0, %i4, then.74688
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74689
then.74688:
	mov	%i6, %i4
cont.74689:
cont.74687:
	movi	%i4, 100
	jleq	%i4, %i6, then.74690
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74691
then.74690:
	movi	%i4, 200
	jleq	%i4, %i6, then.74692
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74693
then.74692:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74693:
cont.74691:
	movi	%i4, 40
	jleq	%i4, %i6, then.74694
	movi	%i4, 20
	jleq	%i4, %i6, then.74696
	movi	%i4, 10
	jleq	%i4, %i6, then.74698
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74695
then.74698:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74699:
	jzero	%i0, %i0, cont.74695
then.74696:
	movi	%i4, 30
	jleq	%i4, %i6, then.74700
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74701
then.74700:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74701:
cont.74697:
	jzero	%i0, %i0, cont.74695
then.74694:
	movi	%i4, 60
	jleq	%i4, %i6, then.74702
	movi	%i4, 50
	jleq	%i4, %i6, then.74704
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74703
then.74704:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74705:
	jzero	%i0, %i0, cont.74703
then.74702:
	movi	%i4, 80
	jleq	%i4, %i6, then.74706
	movi	%i4, 70
	jleq	%i4, %i6, then.74708
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74707
then.74708:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74709:
	jzero	%i0, %i0, cont.74707
then.74706:
	movi	%i4, 90
	jleq	%i4, %i6, then.74710
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74711
then.74710:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74711:
cont.74707:
cont.74703:
cont.74695:
	movi	%i4, 4
	jleq	%i4, %i5, then.74712
	movi	%i4, 2
	jleq	%i4, %i5, then.74714
	movi	%i4, 1
	jleq	%i4, %i5, then.74716
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74713
then.74716:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74717:
	jzero	%i0, %i0, cont.74713
then.74714:
	movi	%i4, 3
	jleq	%i4, %i5, then.74718
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74719
then.74718:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74719:
cont.74715:
	jzero	%i0, %i0, cont.74713
then.74712:
	movi	%i4, 6
	jleq	%i4, %i5, then.74720
	movi	%i4, 5
	jleq	%i4, %i5, then.74722
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74721
then.74722:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74723:
	jzero	%i0, %i0, cont.74721
then.74720:
	movi	%i4, 8
	jleq	%i4, %i5, then.74724
	movi	%i4, 7
	jleq	%i4, %i5, then.74726
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74725
then.74726:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74727:
	jzero	%i0, %i0, cont.74725
then.74724:
	movi	%i4, 9
	jleq	%i4, %i5, then.74728
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74729
then.74728:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74729:
cont.74725:
cont.74721:
cont.74713:
	movi	%i4, 10
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74585:
	movi	%i4, 1
	mov	%i13, %i4
	mov	%i26, %i20
	mov	%i25, %i18
loop_start.69394:
	jleq	%i17, %i13, then.74731
	slli	%i4, %i13, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 0(%i4)
	lf	%f1, 0(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i5)
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 191(%i0)
	lw	%i5, 1(%i4)
	addi	%i4, %i22, 1
	jleq	%i5, %i4, then.74733
	jleq	%i22, %i0, then.74735
	lw	%i4, 191(%i0)
	lw	%i5, 0(%i4)
	addi	%i4, %i13, 1
	jleq	%i5, %i4, then.74737
	clt	%i4, %i0, %i13
	jzero	%i0, %i0, cont.74734
then.74737:
	mov	%i4, %i0
cont.74738:
	jzero	%i0, %i0, cont.74734
then.74735:
	mov	%i4, %i0
cont.74736:
	jzero	%i0, %i0, cont.74734
then.74733:
	mov	%i4, %i0
cont.74734:
	jeq	%i4, %i0, then.74739
	mov	%i4, %i13
	mov	%i5, %i22
	mov	%i6, %i26
	mov	%i7, %i19
	mov	%i8, %i25
	mov	%i9, %i0
	subi	%i1, %i1, 48
	sw	%i13, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sw	%i22, 6(%i1)
	sw	%i23, 7(%i1)
	sw	%i24, 8(%i1)
	sw	%i25, 9(%i1)
	sw	%i26, 10(%i1)
	set_label	%i31, try_exploit_neighbors.3101
	jmp	%i3, 0(%i31)
	lw	%i13, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lw	%i22, 6(%i1)
	lw	%i23, 7(%i1)
	lw	%i24, 8(%i1)
	lw	%i25, 9(%i1)
	lw	%i26, 10(%i1)
	addi	%i1, %i1, 48
	jzero	%i0, %i0, cont.74740
then.74739:
	slli	%i4, %i13, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	lw	%i11, 7(%i4)
	lw	%i10, 6(%i4)
	lw	%i9, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i6, 2(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	mov	%i12, %i0
	subi	%i1, %i1, 32
	sw	%i13, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	sw	%i22, 6(%i1)
	sw	%i23, 7(%i1)
	set_label	%i31, do_without_neighbors.3085
	jmp	%i3, 0(%i31)
	lw	%i13, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	lw	%i22, 6(%i1)
	lw	%i23, 7(%i1)
	addi	%i1, %i1, 32
cont.74740:
	movi	%i31, 3
	jeq	%i24, %i31, then.74741
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74743
	movi	%i4, 255
	jzero	%i0, %i0, cont.74744
then.74743:
	jleq	%i0, %i4, then.74745
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74746
then.74745:
cont.74746:
cont.74744:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74747
	movi	%i4, 255
	jzero	%i0, %i0, cont.74748
then.74747:
	jleq	%i0, %i4, then.74749
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74750
then.74749:
cont.74750:
cont.74748:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74751
	movi	%i4, 255
	jzero	%i0, %i0, cont.74752
then.74751:
	jleq	%i0, %i4, then.74753
	mov	%i4, %i0
	jzero	%i0, %i0, cont.74754
then.74753:
cont.74754:
cont.74752:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74742
then.74741:
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74755
	movi	%i6, 255
	jzero	%i0, %i0, cont.74756
then.74755:
	jleq	%i0, %i4, then.74757
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74758
then.74757:
	mov	%i6, %i4
cont.74758:
cont.74756:
	movi	%i4, 100
	jleq	%i4, %i6, then.74759
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74760
then.74759:
	movi	%i4, 200
	jleq	%i4, %i6, then.74761
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74762
then.74761:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74762:
cont.74760:
	movi	%i4, 40
	jleq	%i4, %i6, then.74763
	movi	%i4, 20
	jleq	%i4, %i6, then.74765
	movi	%i4, 10
	jleq	%i4, %i6, then.74767
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74764
then.74767:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74768:
	jzero	%i0, %i0, cont.74764
then.74765:
	movi	%i4, 30
	jleq	%i4, %i6, then.74769
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74770
then.74769:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74770:
cont.74766:
	jzero	%i0, %i0, cont.74764
then.74763:
	movi	%i4, 60
	jleq	%i4, %i6, then.74771
	movi	%i4, 50
	jleq	%i4, %i6, then.74773
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74772
then.74773:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74774:
	jzero	%i0, %i0, cont.74772
then.74771:
	movi	%i4, 80
	jleq	%i4, %i6, then.74775
	movi	%i4, 70
	jleq	%i4, %i6, then.74777
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74776
then.74777:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74778:
	jzero	%i0, %i0, cont.74776
then.74775:
	movi	%i4, 90
	jleq	%i4, %i6, then.74779
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74780
then.74779:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74780:
cont.74776:
cont.74772:
cont.74764:
	movi	%i4, 4
	jleq	%i4, %i5, then.74781
	movi	%i4, 2
	jleq	%i4, %i5, then.74783
	movi	%i4, 1
	jleq	%i4, %i5, then.74785
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74782
then.74785:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74786:
	jzero	%i0, %i0, cont.74782
then.74783:
	movi	%i4, 3
	jleq	%i4, %i5, then.74787
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74788
then.74787:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74788:
cont.74784:
	jzero	%i0, %i0, cont.74782
then.74781:
	movi	%i4, 6
	jleq	%i4, %i5, then.74789
	movi	%i4, 5
	jleq	%i4, %i5, then.74791
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74790
then.74791:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74792:
	jzero	%i0, %i0, cont.74790
then.74789:
	movi	%i4, 8
	jleq	%i4, %i5, then.74793
	movi	%i4, 7
	jleq	%i4, %i5, then.74795
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74794
then.74795:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74796:
	jzero	%i0, %i0, cont.74794
then.74793:
	movi	%i4, 9
	jleq	%i4, %i5, then.74797
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74798
then.74797:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74798:
cont.74794:
cont.74790:
cont.74782:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74799
	movi	%i6, 255
	jzero	%i0, %i0, cont.74800
then.74799:
	jleq	%i0, %i4, then.74801
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74802
then.74801:
	mov	%i6, %i4
cont.74802:
cont.74800:
	movi	%i4, 100
	jleq	%i4, %i6, then.74803
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74804
then.74803:
	movi	%i4, 200
	jleq	%i4, %i6, then.74805
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74806
then.74805:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74806:
cont.74804:
	movi	%i4, 40
	jleq	%i4, %i6, then.74807
	movi	%i4, 20
	jleq	%i4, %i6, then.74809
	movi	%i4, 10
	jleq	%i4, %i6, then.74811
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74808
then.74811:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74812:
	jzero	%i0, %i0, cont.74808
then.74809:
	movi	%i4, 30
	jleq	%i4, %i6, then.74813
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74814
then.74813:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74814:
cont.74810:
	jzero	%i0, %i0, cont.74808
then.74807:
	movi	%i4, 60
	jleq	%i4, %i6, then.74815
	movi	%i4, 50
	jleq	%i4, %i6, then.74817
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74816
then.74817:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74818:
	jzero	%i0, %i0, cont.74816
then.74815:
	movi	%i4, 80
	jleq	%i4, %i6, then.74819
	movi	%i4, 70
	jleq	%i4, %i6, then.74821
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74820
then.74821:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74822:
	jzero	%i0, %i0, cont.74820
then.74819:
	movi	%i4, 90
	jleq	%i4, %i6, then.74823
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74824
then.74823:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74824:
cont.74820:
cont.74816:
cont.74808:
	movi	%i4, 4
	jleq	%i4, %i5, then.74825
	movi	%i4, 2
	jleq	%i4, %i5, then.74827
	movi	%i4, 1
	jleq	%i4, %i5, then.74829
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74826
then.74829:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74830:
	jzero	%i0, %i0, cont.74826
then.74827:
	movi	%i4, 3
	jleq	%i4, %i5, then.74831
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74832
then.74831:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74832:
cont.74828:
	jzero	%i0, %i0, cont.74826
then.74825:
	movi	%i4, 6
	jleq	%i4, %i5, then.74833
	movi	%i4, 5
	jleq	%i4, %i5, then.74835
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74834
then.74835:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74836:
	jzero	%i0, %i0, cont.74834
then.74833:
	movi	%i4, 8
	jleq	%i4, %i5, then.74837
	movi	%i4, 7
	jleq	%i4, %i5, then.74839
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74838
then.74839:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74840:
	jzero	%i0, %i0, cont.74838
then.74837:
	movi	%i4, 9
	jleq	%i4, %i5, then.74841
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74842
then.74841:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74842:
cont.74838:
cont.74834:
cont.74826:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.74843
	movi	%i6, 255
	jzero	%i0, %i0, cont.74844
then.74843:
	jleq	%i0, %i4, then.74845
	mov	%i6, %i0
	jzero	%i0, %i0, cont.74846
then.74845:
	mov	%i6, %i4
cont.74846:
cont.74844:
	movi	%i4, 100
	jleq	%i4, %i6, then.74847
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74848
then.74847:
	movi	%i4, 200
	jleq	%i4, %i6, then.74849
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.74850
then.74849:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.74850:
cont.74848:
	movi	%i4, 40
	jleq	%i4, %i6, then.74851
	movi	%i4, 20
	jleq	%i4, %i6, then.74853
	movi	%i4, 10
	jleq	%i4, %i6, then.74855
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.74852
then.74855:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.74856:
	jzero	%i0, %i0, cont.74852
then.74853:
	movi	%i4, 30
	jleq	%i4, %i6, then.74857
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.74858
then.74857:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.74858:
cont.74854:
	jzero	%i0, %i0, cont.74852
then.74851:
	movi	%i4, 60
	jleq	%i4, %i6, then.74859
	movi	%i4, 50
	jleq	%i4, %i6, then.74861
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.74860
then.74861:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.74862:
	jzero	%i0, %i0, cont.74860
then.74859:
	movi	%i4, 80
	jleq	%i4, %i6, then.74863
	movi	%i4, 70
	jleq	%i4, %i6, then.74865
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.74864
then.74865:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.74866:
	jzero	%i0, %i0, cont.74864
then.74863:
	movi	%i4, 90
	jleq	%i4, %i6, then.74867
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.74868
then.74867:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.74868:
cont.74864:
cont.74860:
cont.74852:
	movi	%i4, 4
	jleq	%i4, %i5, then.74869
	movi	%i4, 2
	jleq	%i4, %i5, then.74871
	movi	%i4, 1
	jleq	%i4, %i5, then.74873
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74870
then.74873:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74874:
	jzero	%i0, %i0, cont.74870
then.74871:
	movi	%i4, 3
	jleq	%i4, %i5, then.74875
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74876
then.74875:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74876:
cont.74872:
	jzero	%i0, %i0, cont.74870
then.74869:
	movi	%i4, 6
	jleq	%i4, %i5, then.74877
	movi	%i4, 5
	jleq	%i4, %i5, then.74879
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74878
then.74879:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74880:
	jzero	%i0, %i0, cont.74878
then.74877:
	movi	%i4, 8
	jleq	%i4, %i5, then.74881
	movi	%i4, 7
	jleq	%i4, %i5, then.74883
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74882
then.74883:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74884:
	jzero	%i0, %i0, cont.74882
then.74881:
	movi	%i4, 9
	jleq	%i4, %i5, then.74885
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.74886
then.74885:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74886:
cont.74882:
cont.74878:
cont.74870:
	movi	%i4, 10
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.74742:
	addi	%i4, %i13, 1
	mov	%i13, %i4
	set_label	%i31, loop_start.69394
	jmp	%i0, 0(%i31)
then.74731:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69395
loop_end.69395:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.74575
then.74574:
cont.74575:
	addi	%i6, %i22, 1
	addi	%i5, %i21, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.74887
	mov	%i4, %i5
	jzero	%i0, %i0, cont.74888
then.74887:
	subi	%i4, %i5, 5
cont.74888:
	mov	%i22, %i6
	mov	%i26, %i19
	mov	%i19, %i18
	mov	%i25, %i20
	mov	%i18, %i4
	set_label	%i31, loop_start.69386
	jmp	%i0, 0(%i31)
then.74571:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69387
then.74253:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69387
loop_end.69387:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.73935:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
create_pixel.3146:
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i10, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i5, 3
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i9, 5
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 1(%i9)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 2(%i9)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 3(%i9)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 4(%i9)
	mov	%i5, %i0
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i8, 5
	mov	%i5, %i0
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i7, 5
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i5, 3
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i6, 5
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 1(%i6)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 2(%i6)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 3(%i6)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 4(%i6)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i5, 3
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i4, 5
	movi	%i11, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i11, 1(%i4)
	movi	%i11, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i11, 2(%i4)
	movi	%i11, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i11, 3(%i4)
	movi	%i11, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i11, 4(%i4)
	mov	%i5, %i0
	mov	%i11, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	movi	%i13, 1
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i5, 3
	mov	%i11, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i12, 5
	movi	%i11, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i11, 1(%i12)
	movi	%i11, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i11, 2(%i12)
	movi	%i11, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i11, 3(%i12)
	movi	%i11, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i11, 4(%i12)
	mov	%i5, %i2
	addi	%i2, %i2, 32
	sw	%i12, 7(%i5)
	sw	%i13, 6(%i5)
	sw	%i4, 5(%i5)
	sw	%i6, 4(%i5)
	sw	%i7, 3(%i5)
	sw	%i8, 2(%i5)
	sw	%i9, 1(%i5)
	sw	%i10, 0(%i5)
	mov	%i30, %i5
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
create_pixelline.3151:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	lw	%i4, 191(%i0)
	lw	%i11, 0(%i4)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i10, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i5, 3
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i9, 5
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 1(%i9)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 2(%i9)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 3(%i9)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 4(%i9)
	mov	%i5, %i0
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i8, 5
	mov	%i5, %i0
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i7, 5
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i5, 3
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i6, 5
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 1(%i6)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 2(%i6)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 3(%i6)
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i5, 4(%i6)
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i5, 3
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i4, 5
	movi	%i12, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i12, 1(%i4)
	movi	%i12, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i12, 2(%i4)
	movi	%i12, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i12, 3(%i4)
	movi	%i12, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i12, 4(%i4)
	mov	%i5, %i0
	mov	%i12, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	movi	%i14, 1
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i5, 3
	mov	%i12, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	movi	%i13, 5
	movi	%i12, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i12, 1(%i13)
	movi	%i12, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i12, 2(%i13)
	movi	%i12, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i12, 3(%i13)
	movi	%i12, 3
	fmov	%f1, %f0
	mov	%i5, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	sw	%i12, 4(%i13)
	mov	%i5, %i2
	addi	%i2, %i2, 32
	sw	%i13, 7(%i5)
	sw	%i14, 6(%i5)
	sw	%i4, 5(%i5)
	sw	%i6, 4(%i5)
	sw	%i7, 3(%i5)
	sw	%i8, 2(%i5)
	sw	%i9, 1(%i5)
	sw	%i10, 0(%i5)
	mov	%i15, %i11
	mov	%i4, %i2
ca_loop.74890:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.74891
	jzero	%i0, %i0, ca_done.74892
ca_cont.74891:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.74890
	jmp	%i0, 0(%i31)
ca_done.74892:
	mov	%i16, %i4
	lw	%i4, 191(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 2
	jleq	%i0, %i6, then.74893
	mov	%i30, %i16
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.74893:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i4, %i6, 1
	mov	%i6, %i4
loop_start.69433:
	jleq	%i0, %i6, then.74895
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	set_label	%i31, loop_start.69433
	jmp	%i0, 0(%i31)
then.74895:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74897
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74898
then.74897:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74899
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74900
then.74899:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74901
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74902
then.74901:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74903
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74904
then.74903:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74905
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74906
then.74905:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74907
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74908
then.74907:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74909
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74910
then.74909:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74911
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74912
then.74911:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74913
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74914
then.74913:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74915
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74916
then.74915:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74917
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74918
then.74917:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74919
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74920
then.74919:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74921
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74922
then.74921:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74923
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74924
then.74923:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i6, %i6, 1
	jleq	%i0, %i6, then.74925
	mov	%i31, %i16
	jzero	%i0, %i0, loop_end.69434
	jzero	%i0, %i0, cont.74926
then.74925:
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	set_label	%i31, create_pixel.3146
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i6, 2
	add	%i31, %i16, %i4
	sw	%i5, 0(%i31)
	subi	%i4, %i6, 1
	mov	%i6, %i4
cont.74926:
cont.74924:
cont.74922:
cont.74920:
cont.74918:
cont.74916:
cont.74914:
cont.74912:
cont.74910:
cont.74908:
cont.74906:
cont.74904:
cont.74902:
cont.74900:
cont.74898:
cont.74896:
	set_label	%i30, loop_start.69433
	jmp	%i0, 0(%i30)
loop_end.69434:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
calc_dirvec.3156:
	fmov	%f5, %f1
	movi	%i7, 5
	cleq	%i30, %i7, %i4
	jzero	%i0, %i30, Lrelax_skip_12
	set_label	%i30, then.74927
	jmp	%i0, 0(%i30)
Lrelax_skip_12:
	fmul	%f2, %f2, %f2
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f5, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f5
	fmul	%f7, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f7, %f1
	jzero	%i0, %i31, else.74928
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f7
	jzero	%i0, %i31, else.74930
	fmul	%f6, %f7, %f7
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f7
	jzero	%i0, %i0, cont.74929
else.74930:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f7
	fmul	%f7, %f2, %f1
	fmul	%f6, %f7, %f7
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	lf	%f1, 2(%i0)
	fadd	%f1, %f2, %f1
cont.74931:
	jzero	%i0, %i0, cont.74929
else.74928:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f7
	fmul	%f7, %f2, %f1
	fmul	%f6, %f7, %f7
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	lf	%f1, 1(%i0)
	fadd	%f1, %f2, %f1
cont.74929:
	fmul	%f2, %f1, %f3
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74932
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.74934
	fmul	%f7, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f6, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f2
	jzero	%i0, %i0, cont.74933
else.74934:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74936
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74938
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.74939
else.74938:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.74939:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
	jzero	%i0, %i0, cont.74937
else.74936:
	lf	%f1, 3(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
cont.74937:
cont.74935:
	jzero	%i0, %i0, cont.74933
else.74932:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.74940
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74942
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.74943
else.74942:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.74943:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
	jzero	%i0, %i0, cont.74941
else.74940:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
cont.74941:
cont.74933:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f6, %f6
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f6, %f1
	fmul	%f6, %f1, %f5
	addi	%i4, %i4, 1
	fmul	%f2, %f6, %f6
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f5, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f5
	fmul	%f8, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f8, %f1
	jzero	%i0, %i31, else.74944
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.74946
	fmul	%f7, %f8, %f8
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f8
	jzero	%i0, %i0, cont.74945
else.74946:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f8
	fmul	%f8, %f2, %f1
	fmul	%f7, %f8, %f8
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	lf	%f1, 2(%i0)
	fadd	%f1, %f2, %f1
cont.74947:
	jzero	%i0, %i0, cont.74945
else.74944:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f8
	fmul	%f8, %f2, %f1
	fmul	%f7, %f8, %f8
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	lf	%f1, 1(%i0)
	fadd	%f1, %f2, %f1
cont.74945:
	fmul	%f2, %f1, %f4
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74948
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.74950
	fmul	%f8, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f7, %f1, %f8
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f7, %f1
	fmul	%f7, %f1, %f8
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f7, %f1
	fmul	%f7, %f1, %f8
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f7, %f1
	fmul	%f7, %f1, %f2
	jzero	%i0, %i0, cont.74949
else.74950:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74952
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f7, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f7, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74954
	fmov	%f8, %f2
	jzero	%i0, %i0, cont.74955
else.74954:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
cont.74955:
	fmul	%f7, %f8, %f8
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f8
	jzero	%i0, %i0, cont.74953
else.74952:
	lf	%f1, 3(%i0)
	fsub	%f8, %f1, %f2
	fmul	%f7, %f8, %f8
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f8
cont.74953:
cont.74951:
	jzero	%i0, %i0, cont.74949
else.74948:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.74956
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f7, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f7, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74958
	fmov	%f8, %f2
	jzero	%i0, %i0, cont.74959
else.74958:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
cont.74959:
	fmul	%f7, %f8, %f8
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f8
	jzero	%i0, %i0, cont.74957
else.74956:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
	fmul	%f7, %f8, %f8
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f8
cont.74957:
cont.74949:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f7, %f7
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmov	%f5, %f6
	fmov	%f2, %f1
loop_start.69465:
	jleq	%i7, %i4, then.74961
	fmul	%f2, %f2, %f2
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f5, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f5
	fmul	%f7, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f7, %f1
	jzero	%i0, %i31, else.74963
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f7
	jzero	%i0, %i31, else.74965
	fmul	%f6, %f7, %f7
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f7
	jzero	%i0, %i0, cont.74964
else.74965:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f7
	fmul	%f7, %f2, %f1
	fmul	%f6, %f7, %f7
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	lf	%f1, 2(%i0)
	fadd	%f1, %f2, %f1
cont.74966:
	jzero	%i0, %i0, cont.74964
else.74963:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f7
	fmul	%f7, %f2, %f1
	fmul	%f6, %f7, %f7
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	lf	%f1, 1(%i0)
	fadd	%f1, %f2, %f1
cont.74964:
	fmul	%f2, %f1, %f3
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74967
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.74969
	fmul	%f7, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f6, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f2
	jzero	%i0, %i0, cont.74968
else.74969:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74971
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74973
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.74974
else.74973:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.74974:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
	jzero	%i0, %i0, cont.74972
else.74971:
	lf	%f1, 3(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
cont.74972:
cont.74970:
	jzero	%i0, %i0, cont.74968
else.74967:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.74975
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74977
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.74978
else.74977:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.74978:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
	jzero	%i0, %i0, cont.74976
else.74975:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
cont.74976:
cont.74968:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f6, %f6
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f6, %f1
	fmul	%f7, %f1, %f5
	addi	%i4, %i4, 1
	fmul	%f6, %f7, %f7
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f5, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f5
	fmul	%f1, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.74979
	movui	%i31, 784384
	mif	%f2, %i31
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74981
	fmul	%f9, %f1, %f1
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f2, %i31
	fmul	%f8, %f2, %f9
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f2, %i31
	fadd	%f2, %f8, %f2
	fmul	%f8, %f2, %f9
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f2, %i31
	fadd	%f2, %f8, %f2
	fmul	%f8, %f2, %f9
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f2, %i31
	fadd	%f2, %f8, %f2
	fmul	%f8, %f2, %f9
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f2, %i31
	fadd	%f2, %f8, %f2
	fmul	%f8, %f2, %f9
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f2, %i31
	fadd	%f2, %f8, %f2
	fmul	%f8, %f2, %f9
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f2, %i31
	fadd	%f2, %f8, %f2
	fmul	%f1, %f2, %f1
	jzero	%i0, %i0, cont.74980
else.74981:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f9, %f2, %f1
	fmul	%f8, %f9, %f9
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f8
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f9
	lf	%f1, 2(%i0)
	fadd	%f1, %f2, %f1
cont.74982:
	jzero	%i0, %i0, cont.74980
else.74979:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f9, %f2, %f1
	fmul	%f8, %f9, %f9
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f8
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f9
	lf	%f1, 1(%i0)
	fadd	%f1, %f2, %f1
cont.74980:
	fmul	%f2, %f1, %f4
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74983
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.74985
	fmul	%f9, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f8, %f1, %f9
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f8, %f1
	fmul	%f8, %f1, %f9
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f8, %f1
	fmul	%f8, %f1, %f9
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f8, %f1
	fmul	%f8, %f1, %f2
	jzero	%i0, %i0, cont.74984
else.74985:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74987
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f8, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f8, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74989
	fmov	%f9, %f2
	jzero	%i0, %i0, cont.74990
else.74989:
	lf	%f1, 0(%i0)
	fsub	%f9, %f1, %f2
cont.74990:
	fmul	%f8, %f9, %f9
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f8
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f8, %f1, %f9
	jzero	%i0, %i0, cont.74988
else.74987:
	lf	%f1, 3(%i0)
	fsub	%f9, %f1, %f2
	fmul	%f8, %f9, %f9
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f8
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f8, %f1, %f9
cont.74988:
cont.74986:
	jzero	%i0, %i0, cont.74984
else.74983:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.74991
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f8, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f8, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.74993
	fmov	%f9, %f2
	jzero	%i0, %i0, cont.74994
else.74993:
	lf	%f1, 0(%i0)
	fsub	%f9, %f1, %f2
cont.74994:
	fmul	%f8, %f9, %f9
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f8
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f8, %f1, %f9
	jzero	%i0, %i0, cont.74992
else.74991:
	lf	%f1, 0(%i0)
	fsub	%f9, %f1, %f2
	fmul	%f8, %f9, %f9
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f8
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f8, %f1, %f9
cont.74992:
cont.74984:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f8, %f8
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f8, %f1
	fmul	%f8, %f1, %f5
	jleq	%i7, %i4, then.74995
	fmul	%f2, %f8, %f8
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f5, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f5
	fmul	%f7, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f7, %f1
	jzero	%i0, %i31, else.74997
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f7
	jzero	%i0, %i31, else.74999
	fmul	%f6, %f7, %f7
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f7
	jzero	%i0, %i0, cont.74998
else.74999:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f7
	fmul	%f7, %f2, %f1
	fmul	%f6, %f7, %f7
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	lf	%f1, 2(%i0)
	fadd	%f1, %f2, %f1
cont.75000:
	jzero	%i0, %i0, cont.74998
else.74997:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f7
	fmul	%f7, %f2, %f1
	fmul	%f6, %f7, %f7
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	lf	%f1, 1(%i0)
	fadd	%f1, %f2, %f1
cont.74998:
	fmul	%f2, %f1, %f3
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.75001
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.75003
	fmul	%f7, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f6, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f2
	jzero	%i0, %i0, cont.75002
else.75003:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.75005
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.75007
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.75008
else.75007:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.75008:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
	jzero	%i0, %i0, cont.75006
else.75005:
	lf	%f1, 3(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
cont.75006:
cont.75004:
	jzero	%i0, %i0, cont.75002
else.75001:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.75009
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f6, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f6, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.75011
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.75012
else.75011:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.75012:
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
	jzero	%i0, %i0, cont.75010
else.75009:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
	fmul	%f6, %f7, %f7
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f6, %f1, %f7
cont.75010:
cont.75002:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f6, %f6
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f6, %f1
	fmul	%f6, %f1, %f5
	addi	%i4, %i4, 1
	fmul	%f2, %f6, %f6
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f5, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f5
	fmul	%f8, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f8, %f1
	jzero	%i0, %i31, else.75013
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.75015
	fmul	%f7, %f8, %f8
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f1, %f1, %f8
	jzero	%i0, %i0, cont.75014
else.75015:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f8
	fmul	%f8, %f2, %f1
	fmul	%f7, %f8, %f8
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	lf	%f1, 2(%i0)
	fadd	%f1, %f2, %f1
cont.75016:
	jzero	%i0, %i0, cont.75014
else.75013:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f8
	fmul	%f8, %f2, %f1
	fmul	%f7, %f8, %f8
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f8
	lf	%f1, 1(%i0)
	fadd	%f1, %f2, %f1
cont.75014:
	fmul	%f2, %f1, %f4
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.75017
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.75019
	fmul	%f8, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f7, %f1, %f8
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f7, %f1
	fmul	%f7, %f1, %f8
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f7, %f1
	fmul	%f7, %f1, %f8
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f7, %f1
	fmul	%f7, %f1, %f2
	jzero	%i0, %i0, cont.75018
else.75019:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.75021
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f7, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f7, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.75023
	fmov	%f8, %f2
	jzero	%i0, %i0, cont.75024
else.75023:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
cont.75024:
	fmul	%f7, %f8, %f8
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f8
	jzero	%i0, %i0, cont.75022
else.75021:
	lf	%f1, 3(%i0)
	fsub	%f8, %f1, %f2
	fmul	%f7, %f8, %f8
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f8
cont.75022:
cont.75020:
	jzero	%i0, %i0, cont.75018
else.75017:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.75025
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmov	%f7, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f7, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.75027
	fmov	%f8, %f2
	jzero	%i0, %i0, cont.75028
else.75027:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
cont.75028:
	fmul	%f7, %f8, %f8
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f8
	jzero	%i0, %i0, cont.75026
else.75025:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
	fmul	%f7, %f8, %f8
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f7
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f7
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f7, %f1, %f8
cont.75026:
cont.75018:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f7, %f7
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f7, %f1
	fmul	%f1, %f1, %f5
	fmov	%f5, %f6
	fmov	%f2, %f1
	set_label	%i31, loop_start.69465
	jmp	%i0, 0(%i31)
then.74995:
	fmul	%f1, %f8, %f8
	fadd	%f2, %f6, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	finv	%f1, %f3
	fmul	%f5, %f7, %f1
	finv	%f1, %f3
	fmul	%f4, %f8, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	slli	%i4, %i6, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	sf	%f5, 0(%i4)
	sf	%f4, 1(%i4)
	sf	%f1, 2(%i4)
	addi	%i4, %i6, 40
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	fneg	%f3, %f4
	sf	%f5, 0(%i4)
	sf	%f1, 1(%i4)
	sf	%f3, 2(%i4)
	addi	%i4, %i6, 80
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	fneg	%f2, %f5
	sf	%f1, 0(%i4)
	sf	%f2, 1(%i4)
	sf	%f3, 2(%i4)
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	fneg	%f1, %f1
	sf	%f2, 0(%i4)
	sf	%f3, 1(%i4)
	sf	%f1, 2(%i4)
	addi	%i4, %i6, 41
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	sf	%f2, 0(%i4)
	sf	%f1, 1(%i4)
	sf	%f4, 2(%i4)
	addi	%i4, %i6, 81
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	sf	%f1, 0(%i4)
	sf	%f5, 1(%i4)
	sf	%f4, 2(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69466
then.74961:
	fmul	%f3, %f5, %f5
	fmul	%f1, %f2, %f2
	fadd	%f3, %f3, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	finv	%f1, %f3
	fmul	%f5, %f5, %f1
	finv	%f1, %f3
	fmul	%f4, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	slli	%i4, %i6, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	sf	%f5, 0(%i4)
	sf	%f4, 1(%i4)
	sf	%f1, 2(%i4)
	addi	%i4, %i6, 40
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	fneg	%f3, %f4
	sf	%f5, 0(%i4)
	sf	%f1, 1(%i4)
	sf	%f3, 2(%i4)
	addi	%i4, %i6, 80
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	fneg	%f2, %f5
	sf	%f1, 0(%i4)
	sf	%f2, 1(%i4)
	sf	%f3, 2(%i4)
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	fneg	%f1, %f1
	sf	%f2, 0(%i4)
	sf	%f3, 1(%i4)
	sf	%f1, 2(%i4)
	addi	%i4, %i6, 41
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	sf	%f2, 0(%i4)
	sf	%f1, 1(%i4)
	sf	%f4, 2(%i4)
	addi	%i4, %i6, 81
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	sf	%f1, 0(%i4)
	sf	%f5, 1(%i4)
	sf	%f4, 2(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69466
loop_end.69466:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	jmp	%i0, 0(%i3)
then.74927:
	fmul	%f3, %f5, %f5
	fmul	%f1, %f2, %f2
	fadd	%f3, %f3, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	finv	%f1, %f3
	fmul	%f5, %f5, %f1
	finv	%f1, %f3
	fmul	%f4, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	slli	%i4, %i6, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	sf	%f5, 0(%i4)
	sf	%f4, 1(%i4)
	sf	%f1, 2(%i4)
	addi	%i4, %i6, 40
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	fneg	%f3, %f4
	sf	%f5, 0(%i4)
	sf	%f1, 1(%i4)
	sf	%f3, 2(%i4)
	addi	%i4, %i6, 80
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	fneg	%f2, %f5
	sf	%f1, 0(%i4)
	sf	%f2, 1(%i4)
	sf	%f3, 2(%i4)
	addi	%i4, %i6, 1
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	fneg	%f1, %f1
	sf	%f2, 0(%i4)
	sf	%f3, 1(%i4)
	sf	%f1, 2(%i4)
	addi	%i4, %i6, 41
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	sf	%f2, 0(%i4)
	sf	%f1, 1(%i4)
	sf	%f4, 2(%i4)
	addi	%i4, %i6, 81
	slli	%i4, %i4, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	sf	%f1, 0(%i4)
	sf	%f5, 1(%i4)
	sf	%f4, 2(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
calc_dirvecs.3164:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i18, %i4
	mov	%i17, %i6
	fmov	%f16, %f1
	jleq	%i0, %i18, then.75030
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.75030:
	mov	%i4, %i18
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f5, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f3, %f5, %f1
	mov	%i4, %i0
	mov	%i6, %i17
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 8
	sw	%i5, 0(%i1)
	sf	%f5, 1(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lf	%f5, 1(%i1)
	addi	%i1, %i1, 8
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f3, %f5, %f1
	addi	%i6, %i17, 2
	mov	%i4, %i0
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 8
	sw	%i5, 0(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i6, %i18, 1
	addi	%i5, %i5, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.75032
	mov	%i4, %i5
	jzero	%i0, %i0, cont.75033
then.75032:
	subi	%i4, %i5, 5
cont.75033:
	mov	%i18, %i6
	mov	%i5, %i4
loop_start.69530:
	jleq	%i0, %i18, then.75035
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69531
	set_label	%i31, loop_start.69530
	jmp	%i0, 0(%i31)
then.75035:
	mov	%i4, %i18
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f5, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f3, %f5, %f1
	mov	%i4, %i0
	mov	%i6, %i17
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 8
	sw	%i5, 0(%i1)
	sf	%f5, 1(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lf	%f5, 1(%i1)
	addi	%i1, %i1, 8
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f3, %f5, %f1
	addi	%i16, %i17, 2
	mov	%i4, %i0
	mov	%i6, %i16
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 8
	sw	%i5, 0(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i7, %i18, 1
	addi	%i5, %i5, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.75037
	jzero	%i0, %i0, cont.75038
then.75037:
	subi	%i5, %i5, 5
cont.75038:
	jleq	%i0, %i7, then.75039
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69531
	jzero	%i0, %i0, cont.75040
then.75039:
	mov	%i4, %i7
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f5, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f3, %f5, %f1
	mov	%i4, %i0
	mov	%i6, %i17
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 16
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sf	%f5, 2(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lf	%f5, 2(%i1)
	addi	%i1, %i1, 16
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f3, %f5, %f1
	mov	%i4, %i0
	mov	%i6, %i16
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 8
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	addi	%i1, %i1, 8
	subi	%i7, %i7, 1
	addi	%i5, %i5, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.75041
	jzero	%i0, %i0, cont.75042
then.75041:
	subi	%i5, %i5, 5
cont.75042:
	jleq	%i0, %i7, then.75043
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69531
	jzero	%i0, %i0, cont.75044
then.75043:
	mov	%i4, %i7
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f5, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f3, %f5, %f1
	mov	%i4, %i0
	mov	%i6, %i17
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 16
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sf	%f5, 2(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lf	%f5, 2(%i1)
	addi	%i1, %i1, 16
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f3, %f5, %f1
	mov	%i4, %i0
	mov	%i6, %i16
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 8
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	addi	%i1, %i1, 8
	subi	%i7, %i7, 1
	addi	%i5, %i5, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.75045
	jzero	%i0, %i0, cont.75046
then.75045:
	subi	%i5, %i5, 5
cont.75046:
	jleq	%i0, %i7, then.75047
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69531
	jzero	%i0, %i0, cont.75048
then.75047:
	mov	%i4, %i7
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f5, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f3, %f5, %f1
	mov	%i4, %i0
	mov	%i6, %i17
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 16
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sf	%f5, 2(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lf	%f5, 2(%i1)
	addi	%i1, %i1, 16
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f3, %f5, %f1
	mov	%i4, %i0
	mov	%i6, %i16
	fmov	%f1, %f0
	fmov	%f2, %f0
	fmov	%f4, %f16
	subi	%i1, %i1, 8
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	set_label	%i31, calc_dirvec.3156
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	addi	%i1, %i1, 8
	subi	%i6, %i7, 1
	addi	%i5, %i5, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.75049
	mov	%i4, %i5
	jzero	%i0, %i0, cont.75050
then.75049:
	subi	%i4, %i5, 5
cont.75050:
	mov	%i18, %i6
	mov	%i5, %i4
cont.75048:
cont.75044:
cont.75040:
cont.75036:
	set_label	%i30, loop_start.69530
	jmp	%i0, 0(%i30)
loop_end.69531:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
create_dirvec_elements.3175:
	mov	%i6, %i4
	mov	%i8, %i5
	jleq	%i0, %i8, then.75051
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.75051:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75053:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75054
	jzero	%i0, %i0, ca_done.75055
ca_cont.75054:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75053
	jmp	%i0, 0(%i31)
ca_done.75055:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i4, %i8, 1
	mov	%i8, %i4
loop_start.69540:
	jleq	%i0, %i8, then.75057
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	set_label	%i31, loop_start.69540
	jmp	%i0, 0(%i31)
then.75057:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75059:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75060
	jzero	%i0, %i0, ca_done.75061
ca_cont.75060:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75059
	jmp	%i0, 0(%i31)
ca_done.75061:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75062
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75063
then.75062:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75064:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75065
	jzero	%i0, %i0, ca_done.75066
ca_cont.75065:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75064
	jmp	%i0, 0(%i31)
ca_done.75066:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75067
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75068
then.75067:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75069:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75070
	jzero	%i0, %i0, ca_done.75071
ca_cont.75070:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75069
	jmp	%i0, 0(%i31)
ca_done.75071:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75072
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75073
then.75072:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75074:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75075
	jzero	%i0, %i0, ca_done.75076
ca_cont.75075:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75074
	jmp	%i0, 0(%i31)
ca_done.75076:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75077
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75078
then.75077:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75079:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75080
	jzero	%i0, %i0, ca_done.75081
ca_cont.75080:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75079
	jmp	%i0, 0(%i31)
ca_done.75081:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75082
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75083
then.75082:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75084:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75085
	jzero	%i0, %i0, ca_done.75086
ca_cont.75085:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75084
	jmp	%i0, 0(%i31)
ca_done.75086:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75087
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75088
then.75087:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75089:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75090
	jzero	%i0, %i0, ca_done.75091
ca_cont.75090:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75089
	jmp	%i0, 0(%i31)
ca_done.75091:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75092
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75093
then.75092:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75094:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75095
	jzero	%i0, %i0, ca_done.75096
ca_cont.75095:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75094
	jmp	%i0, 0(%i31)
ca_done.75096:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75097
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75098
then.75097:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75099:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75100
	jzero	%i0, %i0, ca_done.75101
ca_cont.75100:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75099
	jmp	%i0, 0(%i31)
ca_done.75101:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75102
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75103
then.75102:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75104:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75105
	jzero	%i0, %i0, ca_done.75106
ca_cont.75105:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75104
	jmp	%i0, 0(%i31)
ca_done.75106:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75107
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75108
then.75107:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75109:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75110
	jzero	%i0, %i0, ca_done.75111
ca_cont.75110:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75109
	jmp	%i0, 0(%i31)
ca_done.75111:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75112
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75113
then.75112:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75114:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75115
	jzero	%i0, %i0, ca_done.75116
ca_cont.75115:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75114
	jmp	%i0, 0(%i31)
ca_done.75116:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75117
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75118
then.75117:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75119:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75120
	jzero	%i0, %i0, ca_done.75121
ca_cont.75120:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75119
	jmp	%i0, 0(%i31)
ca_done.75121:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75122
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75123
then.75122:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75124:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75125
	jzero	%i0, %i0, ca_done.75126
ca_cont.75125:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75124
	jmp	%i0, 0(%i31)
ca_done.75126:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75127
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75128
then.75127:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75129:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75130
	jzero	%i0, %i0, ca_done.75131
ca_cont.75130:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75129
	jmp	%i0, 0(%i31)
ca_done.75131:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75132
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69541
	jzero	%i0, %i0, cont.75133
then.75132:
	movi	%i5, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	mov	%i7, %i5
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75134:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75135
	jzero	%i0, %i0, ca_done.75136
ca_cont.75135:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75134
	jmp	%i0, 0(%i31)
ca_done.75136:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75133:
cont.75128:
cont.75123:
cont.75118:
cont.75113:
cont.75108:
cont.75103:
cont.75098:
cont.75093:
cont.75088:
cont.75083:
cont.75078:
cont.75073:
cont.75068:
cont.75063:
cont.75058:
	set_label	%i30, loop_start.69540
	jmp	%i0, 0(%i30)
loop_end.69541:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	jmp	%i0, 0(%i3)
init_dirvecs.3185:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	movi	%i8, 4
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75137:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75138
	jzero	%i0, %i0, ca_done.75139
ca_cont.75138:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75137
	jmp	%i0, 0(%i31)
ca_done.75139:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75140:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75141
	jzero	%i0, %i0, ca_done.75142
ca_cont.75141:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75140
	jmp	%i0, 0(%i31)
ca_done.75142:
	mov	%i5, %i4
	lw	%i4, 235(%i0)
	sw	%i5, 4(%i4)
	lw	%i4, 235(%i0)
	lw	%i4, 4(%i4)
	movi	%i5, 118
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	movi	%i8, 3
loop_start.69611:
	jleq	%i0, %i8, then.75144
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	set_label	%i31, loop_start.69611
	jmp	%i0, 0(%i31)
then.75144:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75146:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75147
	jzero	%i0, %i0, ca_done.75148
ca_cont.75147:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75146
	jmp	%i0, 0(%i31)
ca_done.75148:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75149:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75150
	jzero	%i0, %i0, ca_done.75151
ca_cont.75150:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75149
	jmp	%i0, 0(%i31)
ca_done.75151:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75152
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75153
then.75152:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75154:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75155
	jzero	%i0, %i0, ca_done.75156
ca_cont.75155:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75154
	jmp	%i0, 0(%i31)
ca_done.75156:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75157:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75158
	jzero	%i0, %i0, ca_done.75159
ca_cont.75158:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75157
	jmp	%i0, 0(%i31)
ca_done.75159:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75160
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75161
then.75160:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75162:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75163
	jzero	%i0, %i0, ca_done.75164
ca_cont.75163:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75162
	jmp	%i0, 0(%i31)
ca_done.75164:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75165:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75166
	jzero	%i0, %i0, ca_done.75167
ca_cont.75166:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75165
	jmp	%i0, 0(%i31)
ca_done.75167:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75168
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75169
then.75168:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75170:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75171
	jzero	%i0, %i0, ca_done.75172
ca_cont.75171:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75170
	jmp	%i0, 0(%i31)
ca_done.75172:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75173:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75174
	jzero	%i0, %i0, ca_done.75175
ca_cont.75174:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75173
	jmp	%i0, 0(%i31)
ca_done.75175:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75176
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75177
then.75176:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75178:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75179
	jzero	%i0, %i0, ca_done.75180
ca_cont.75179:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75178
	jmp	%i0, 0(%i31)
ca_done.75180:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75181:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75182
	jzero	%i0, %i0, ca_done.75183
ca_cont.75182:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75181
	jmp	%i0, 0(%i31)
ca_done.75183:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75184
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75185
then.75184:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75186:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75187
	jzero	%i0, %i0, ca_done.75188
ca_cont.75187:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75186
	jmp	%i0, 0(%i31)
ca_done.75188:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75189:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75190
	jzero	%i0, %i0, ca_done.75191
ca_cont.75190:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75189
	jmp	%i0, 0(%i31)
ca_done.75191:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75192
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75193
then.75192:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75194:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75195
	jzero	%i0, %i0, ca_done.75196
ca_cont.75195:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75194
	jmp	%i0, 0(%i31)
ca_done.75196:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75197:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75198
	jzero	%i0, %i0, ca_done.75199
ca_cont.75198:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75197
	jmp	%i0, 0(%i31)
ca_done.75199:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75200
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75201
then.75200:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75202:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75203
	jzero	%i0, %i0, ca_done.75204
ca_cont.75203:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75202
	jmp	%i0, 0(%i31)
ca_done.75204:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75205:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75206
	jzero	%i0, %i0, ca_done.75207
ca_cont.75206:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75205
	jmp	%i0, 0(%i31)
ca_done.75207:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75208
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75209
then.75208:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75210:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75211
	jzero	%i0, %i0, ca_done.75212
ca_cont.75211:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75210
	jmp	%i0, 0(%i31)
ca_done.75212:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75213:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75214
	jzero	%i0, %i0, ca_done.75215
ca_cont.75214:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75213
	jmp	%i0, 0(%i31)
ca_done.75215:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75216
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75217
then.75216:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75218:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75219
	jzero	%i0, %i0, ca_done.75220
ca_cont.75219:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75218
	jmp	%i0, 0(%i31)
ca_done.75220:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75221:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75222
	jzero	%i0, %i0, ca_done.75223
ca_cont.75222:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75221
	jmp	%i0, 0(%i31)
ca_done.75223:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75224
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75225
then.75224:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75226:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75227
	jzero	%i0, %i0, ca_done.75228
ca_cont.75227:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75226
	jmp	%i0, 0(%i31)
ca_done.75228:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75229:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75230
	jzero	%i0, %i0, ca_done.75231
ca_cont.75230:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75229
	jmp	%i0, 0(%i31)
ca_done.75231:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75232
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75233
then.75232:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75234:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75235
	jzero	%i0, %i0, ca_done.75236
ca_cont.75235:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75234
	jmp	%i0, 0(%i31)
ca_done.75236:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75237:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75238
	jzero	%i0, %i0, ca_done.75239
ca_cont.75238:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75237
	jmp	%i0, 0(%i31)
ca_done.75239:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75240
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75241
then.75240:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75242:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75243
	jzero	%i0, %i0, ca_done.75244
ca_cont.75243:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75242
	jmp	%i0, 0(%i31)
ca_done.75244:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75245:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75246
	jzero	%i0, %i0, ca_done.75247
ca_cont.75246:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75245
	jmp	%i0, 0(%i31)
ca_done.75247:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75248
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75249
then.75248:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75250:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75251
	jzero	%i0, %i0, ca_done.75252
ca_cont.75251:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75250
	jmp	%i0, 0(%i31)
ca_done.75252:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75253:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75254
	jzero	%i0, %i0, ca_done.75255
ca_cont.75254:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75253
	jmp	%i0, 0(%i31)
ca_done.75255:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75256
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75257
then.75256:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75258:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75259
	jzero	%i0, %i0, ca_done.75260
ca_cont.75259:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75258
	jmp	%i0, 0(%i31)
ca_done.75260:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75261:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75262
	jzero	%i0, %i0, ca_done.75263
ca_cont.75262:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75261
	jmp	%i0, 0(%i31)
ca_done.75263:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i8, %i8, 1
	jleq	%i0, %i8, then.75264
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69612
	jzero	%i0, %i0, cont.75265
then.75264:
	movi	%i7, 120
	fmov	%f1, %f0
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	sf	%f1, 1(%i2)
	sf	%f1, 2(%i2)
	addi	%i2, %i2, 12
	movi	%i6, 3
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.75266:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75267
	jzero	%i0, %i0, ca_done.75268
ca_cont.75267:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75266
	jmp	%i0, 0(%i31)
ca_done.75268:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i6, 0(%i4)
	mov	%i5, %i4
	mov	%i15, %i7
	mov	%i4, %i2
ca_loop.75269:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.75270
	jzero	%i0, %i0, ca_done.75271
ca_cont.75270:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.75269
	jmp	%i0, 0(%i31)
ca_done.75271:
	mov	%i6, %i4
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	sw	%i6, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	movi	%i5, 118
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	set_label	%i31, create_dirvec_elements.3175
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75265:
cont.75257:
cont.75249:
cont.75241:
cont.75233:
cont.75225:
cont.75217:
cont.75209:
cont.75201:
cont.75193:
cont.75185:
cont.75177:
cont.75169:
cont.75161:
cont.75153:
cont.75145:
	set_label	%i30, loop_start.69611
	jmp	%i0, 0(%i30)
loop_end.69612:
	mov	%i0, %i31
	movi	%i4, 9
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	movi	%i4, 4
	mov	%i5, %i0
	mov	%i6, %i0
	set_label	%i31, calc_dirvecs.3164
	jmp	%i3, 0(%i31)
	movi	%i9, 8
	movi	%i8, 2
	movi	%i7, 4
loop_start.69695:
	jleq	%i0, %i9, then.75273
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69696
	set_label	%i31, loop_start.69695
	jmp	%i0, 0(%i31)
then.75273:
	mov	%i4, %i9
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	movi	%i4, 4
	mov	%i5, %i8
	mov	%i6, %i7
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, calc_dirvecs.3164
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i9, %i9, 1
	addi	%i5, %i8, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.75275
	mov	%i8, %i5
	jzero	%i0, %i0, cont.75276
then.75275:
	subi	%i8, %i5, 5
cont.75276:
	addi	%i7, %i7, 4
	jleq	%i0, %i9, then.75277
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69696
	jzero	%i0, %i0, cont.75278
then.75277:
	mov	%i4, %i9
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	movi	%i4, 4
	mov	%i5, %i8
	mov	%i6, %i7
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, calc_dirvecs.3164
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i9, %i9, 1
	addi	%i5, %i8, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.75279
	mov	%i8, %i5
	jzero	%i0, %i0, cont.75280
then.75279:
	subi	%i8, %i5, 5
cont.75280:
	addi	%i7, %i7, 4
	jleq	%i0, %i9, then.75281
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69696
	jzero	%i0, %i0, cont.75282
then.75281:
	mov	%i4, %i9
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	movi	%i4, 4
	mov	%i5, %i8
	mov	%i6, %i7
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, calc_dirvecs.3164
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i9, %i9, 1
	addi	%i5, %i8, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.75283
	mov	%i8, %i5
	jzero	%i0, %i0, cont.75284
then.75283:
	subi	%i8, %i5, 5
cont.75284:
	addi	%i7, %i7, 4
	jleq	%i0, %i9, then.75285
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69696
	jzero	%i0, %i0, cont.75286
then.75285:
	mov	%i4, %i9
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	movi	%i4, 4
	mov	%i5, %i8
	mov	%i6, %i7
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, calc_dirvecs.3164
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i9, %i9, 1
	addi	%i5, %i8, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.75287
	mov	%i8, %i5
	jzero	%i0, %i0, cont.75288
then.75287:
	subi	%i8, %i5, 5
cont.75288:
	addi	%i7, %i7, 4
	jleq	%i0, %i9, then.75289
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69696
	jzero	%i0, %i0, cont.75290
then.75289:
	mov	%i4, %i9
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	movi	%i4, 4
	mov	%i5, %i8
	mov	%i6, %i7
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, calc_dirvecs.3164
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i9, %i9, 1
	addi	%i5, %i8, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.75291
	mov	%i8, %i5
	jzero	%i0, %i0, cont.75292
then.75291:
	subi	%i8, %i5, 5
cont.75292:
	addi	%i7, %i7, 4
	jleq	%i0, %i9, then.75293
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69696
	jzero	%i0, %i0, cont.75294
then.75293:
	mov	%i4, %i9
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	movi	%i4, 4
	mov	%i5, %i8
	mov	%i6, %i7
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, calc_dirvecs.3164
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i9, %i9, 1
	addi	%i5, %i8, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.75295
	mov	%i8, %i5
	jzero	%i0, %i0, cont.75296
then.75295:
	subi	%i8, %i5, 5
cont.75296:
	addi	%i7, %i7, 4
	jleq	%i0, %i9, then.75297
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69696
	jzero	%i0, %i0, cont.75298
then.75297:
	mov	%i4, %i9
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	movi	%i4, 4
	mov	%i5, %i8
	mov	%i6, %i7
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, calc_dirvecs.3164
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i9, %i9, 1
	addi	%i5, %i8, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.75299
	mov	%i8, %i5
	jzero	%i0, %i0, cont.75300
then.75299:
	subi	%i8, %i5, 5
cont.75300:
	addi	%i7, %i7, 4
	jleq	%i0, %i9, then.75301
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69696
	jzero	%i0, %i0, cont.75302
then.75301:
	mov	%i4, %i9
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	movi	%i4, 4
	mov	%i5, %i8
	mov	%i6, %i7
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, calc_dirvecs.3164
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	subi	%i6, %i9, 1
	addi	%i5, %i8, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.75303
	jzero	%i0, %i0, cont.75304
then.75303:
	subi	%i5, %i5, 5
cont.75304:
	addi	%i4, %i7, 4
	mov	%i9, %i6
	mov	%i8, %i5
	mov	%i7, %i4
cont.75302:
cont.75298:
cont.75294:
cont.75290:
cont.75286:
cont.75282:
cont.75278:
cont.75274:
	set_label	%i30, loop_start.69695
	jmp	%i0, 0(%i30)
loop_end.69696:
	mov	%i0, %i31
	movi	%i10, 4
	lw	%i4, 235(%i0)
	lw	%i9, 4(%i4)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69703:
	jleq	%i0, %i8, then.75306
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69704
	set_label	%i31, loop_start.69703
	jmp	%i0, 0(%i31)
then.75306:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	addi	%i1, %i1, 8
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75307:
	set_label	%i30, loop_start.69703
	jmp	%i0, 0(%i30)
loop_end.69704:
	mov	%i0, %i31
	movi	%i10, 3
loop_start.69708:
	jleq	%i0, %i10, then.75309
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	set_label	%i31, loop_start.69708
	jmp	%i0, 0(%i31)
then.75309:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69711:
	jleq	%i0, %i8, then.75312
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69712
	set_label	%i31, loop_start.69711
	jmp	%i0, 0(%i31)
then.75312:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75313:
	set_label	%i30, loop_start.69711
	jmp	%i0, 0(%i30)
loop_end.69712:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75314
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75315
then.75314:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69717:
	jleq	%i0, %i8, then.75317
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69718
	set_label	%i31, loop_start.69717
	jmp	%i0, 0(%i31)
then.75317:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75318:
	set_label	%i30, loop_start.69717
	jmp	%i0, 0(%i30)
loop_end.69718:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75319
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75320
then.75319:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69723:
	jleq	%i0, %i8, then.75322
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69724
	set_label	%i31, loop_start.69723
	jmp	%i0, 0(%i31)
then.75322:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75323:
	set_label	%i30, loop_start.69723
	jmp	%i0, 0(%i30)
loop_end.69724:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75324
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75325
then.75324:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69729:
	jleq	%i0, %i8, then.75327
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69730
	set_label	%i31, loop_start.69729
	jmp	%i0, 0(%i31)
then.75327:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75328:
	set_label	%i30, loop_start.69729
	jmp	%i0, 0(%i30)
loop_end.69730:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75329
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75330
then.75329:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69735:
	jleq	%i0, %i8, then.75332
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69736
	set_label	%i31, loop_start.69735
	jmp	%i0, 0(%i31)
then.75332:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75333:
	set_label	%i30, loop_start.69735
	jmp	%i0, 0(%i30)
loop_end.69736:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75334
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75335
then.75334:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69741:
	jleq	%i0, %i8, then.75337
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69742
	set_label	%i31, loop_start.69741
	jmp	%i0, 0(%i31)
then.75337:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75338:
	set_label	%i30, loop_start.69741
	jmp	%i0, 0(%i30)
loop_end.69742:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75339
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75340
then.75339:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69747:
	jleq	%i0, %i8, then.75342
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69748
	set_label	%i31, loop_start.69747
	jmp	%i0, 0(%i31)
then.75342:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75343:
	set_label	%i30, loop_start.69747
	jmp	%i0, 0(%i30)
loop_end.69748:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75344
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75345
then.75344:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69753:
	jleq	%i0, %i8, then.75347
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69754
	set_label	%i31, loop_start.69753
	jmp	%i0, 0(%i31)
then.75347:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75348:
	set_label	%i30, loop_start.69753
	jmp	%i0, 0(%i30)
loop_end.69754:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75349
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75350
then.75349:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69759:
	jleq	%i0, %i8, then.75352
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69760
	set_label	%i31, loop_start.69759
	jmp	%i0, 0(%i31)
then.75352:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75353:
	set_label	%i30, loop_start.69759
	jmp	%i0, 0(%i30)
loop_end.69760:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75354
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75355
then.75354:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69765:
	jleq	%i0, %i8, then.75357
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69766
	set_label	%i31, loop_start.69765
	jmp	%i0, 0(%i31)
then.75357:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75358:
	set_label	%i30, loop_start.69765
	jmp	%i0, 0(%i30)
loop_end.69766:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75359
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75360
then.75359:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69771:
	jleq	%i0, %i8, then.75362
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69772
	set_label	%i31, loop_start.69771
	jmp	%i0, 0(%i31)
then.75362:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75363:
	set_label	%i30, loop_start.69771
	jmp	%i0, 0(%i30)
loop_end.69772:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75364
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75365
then.75364:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69777:
	jleq	%i0, %i8, then.75367
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69778
	set_label	%i31, loop_start.69777
	jmp	%i0, 0(%i31)
then.75367:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75368:
	set_label	%i30, loop_start.69777
	jmp	%i0, 0(%i30)
loop_end.69778:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75369
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75370
then.75369:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69783:
	jleq	%i0, %i8, then.75372
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69784
	set_label	%i31, loop_start.69783
	jmp	%i0, 0(%i31)
then.75372:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75373:
	set_label	%i30, loop_start.69783
	jmp	%i0, 0(%i30)
loop_end.69784:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75374
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75375
then.75374:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69789:
	jleq	%i0, %i8, then.75377
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69790
	set_label	%i31, loop_start.69789
	jmp	%i0, 0(%i31)
then.75377:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75378:
	set_label	%i30, loop_start.69789
	jmp	%i0, 0(%i30)
loop_end.69790:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75379
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75380
then.75379:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69795:
	jleq	%i0, %i8, then.75382
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69796
	set_label	%i31, loop_start.69795
	jmp	%i0, 0(%i31)
then.75382:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75383:
	set_label	%i30, loop_start.69795
	jmp	%i0, 0(%i30)
loop_end.69796:
	mov	%i0, %i31
	subi	%i10, %i10, 1
	jleq	%i0, %i10, then.75384
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69709
	jzero	%i0, %i0, cont.75385
then.75384:
	slli	%i5, %i10, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	movi	%i8, 119
	lw	%i4, 119(%i9)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 8
	sw	%i9, 0(%i1)
	sw	%i10, 1(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i9, 0(%i1)
	lw	%i10, 1(%i1)
	addi	%i1, %i1, 8
	movi	%i8, 118
loop_start.69801:
	jleq	%i0, %i8, then.75387
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.69802
	set_label	%i31, loop_start.69801
	jmp	%i0, 0(%i31)
then.75387:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i5, 0(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i6, %i4, 1
	mov	%i4, %i5
	mov	%i5, %i7
	subi	%i1, %i1, 16
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	set_label	%i31, iter_setup_dirvec_constants.2960
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.75388:
	set_label	%i30, loop_start.69801
	jmp	%i0, 0(%i30)
loop_end.69802:
	mov	%i0, %i31
	subi	%i4, %i10, 1
	mov	%i10, %i4
cont.75385:
cont.75380:
cont.75375:
cont.75370:
cont.75365:
cont.75360:
cont.75355:
cont.75350:
cont.75345:
cont.75340:
cont.75335:
cont.75330:
cont.75325:
cont.75320:
cont.75315:
cont.75310:
	set_label	%i30, loop_start.69708
	jmp	%i0, 0(%i30)
loop_end.69709:
	mov	%i4, %i31
	mov	%i30, %i4
	fmov	%f30, %f31
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
.section	".text"
.global	min_caml_print_newline
min_caml_print_newline:
	movui	%i5, 0xf0000
	movi	%i4, 10
	sb	%i4, 0(%i5)
	jmp	%i0, 0(%i3)
.global	min_caml_print_char
min_caml_print_char:
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jmp	%i0, 0(%i3)
min_caml_read_char:
	movui	%i5, 0xf0000
	lb	%i30, 0(%i5)
	jmp	%i0, 0(%i3)
.global	min_caml_create_array
min_caml_create_array:
	mov	%i15, %i4
	mov	%i30, %i2
create_array_loop:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, create_array_cont
	jmp	%i0, 0(%i3)
create_array_cont:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, create_array_loop
	jmp	%i0, 0(%i31)
.global	min_caml_create_float_array
min_caml_create_float_array:
	mov	%i15, %i4
	mov	%i30, %i2
create_float_array_loop:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, create_float_array_cont
	jmp	%i0, 0(%i3)
create_float_array_cont:
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, create_float_array_loop
	jmp	%i0, 0(%i31)
.global	min_caml_rsqrt
min_caml_rsqrt:
	frsqrt	%f30, %f1
	jmp	%i0, 0(%i3)
.global	min_caml_floor
min_caml_floor:
	ffloor	%f30, %f1
	jmp	%i0, 0(%i3)
