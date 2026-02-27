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
	subi	%i1, %i1, 96
	subi	%i1, %i1, 8
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f9, %i31
	sf	%f9, 0(%i0)
	movui	%i31, 261264
	ori	%i31, %i31, -37
	mif	%f8, %i31
	sf	%f8, 1(%i0)
	movui	%i31, 785552
	ori	%i31, %i31, -37
	mif	%f7, %i31
	sf	%f7, 2(%i0)
	movui	%i31, 787600
	ori	%i31, %i31, -37
	mif	%f6, %i31
	sf	%f6, 3(%i0)
	movi	%i4, 1
	sw	%i4, 4(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i31, %i4
	sw	%i31, 0(%i1)
	lw	%i31, 0(%i1)
	sw	%i31, 6(%i0)
	mov	%i4, %i0
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 0
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
	mov	%i4, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69090:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69091
	jzero	%i0, %i0, ca_done.69092
ca_cont.69091:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69090
	jmp	%i0, 0(%i31)
ca_done.69092:
	mov	%i31, %i4
	sw	%i31, 1(%i1)
	lw	%i31, 1(%i1)
	sw	%i31, 15(%i0)
	movi	%i4, 3
	sw	%i4, 75(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i8, %i4
	sw	%i8, 77(%i0)
	movi	%i4, 3
	sw	%i4, 80(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i27, %i4
	sw	%i27, 82(%i0)
	movi	%i4, 3
	sw	%i4, 85(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i26, %i4
	sw	%i26, 87(%i0)
	movi	%i4, 1
	sw	%i4, 90(%i0)
	movui	%i31, 276464
	mif	%f1, %i31
	sf	%f1, 91(%i0)
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i7, %i4
	sw	%i7, 92(%i0)
	movi	%i6, 50
	sw	%i6, 93(%i0)
	movi	%i4, 1
	sw	%i4, 94(%i0)
	movi	%i5, -1
	sw	%i5, 95(%i0)
	mov	%i31, %i5
	mov	%i4, %i2
	sw	%i31, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i5, %i4
	sw	%i5, 96(%i0)
	mov	%i4, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69093:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69094
	jzero	%i0, %i0, ca_done.69095
ca_cont.69094:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69093
	jmp	%i0, 0(%i31)
ca_done.69095:
	mov	%i6, %i4
	sw	%i6, 97(%i0)
	movi	%i9, 1
	sw	%i9, 147(%i0)
	mov	%i4, %i9
	sw	%i4, 148(%i0)
	lw	%i5, 0(%i6)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i5, %i4
	sw	%i5, 150(%i0)
	mov	%i4, %i9
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	mov	%i25, %i4
	sw	%i25, 151(%i0)
	mov	%i4, %i9
	sw	%i4, 152(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	sw	%i4, 154(%i0)
	mov	%i4, %i9
	sw	%i4, 155(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i24, %i4
	sw	%i24, 157(%i0)
	mov	%i4, %i9
	sw	%i4, 158(%i0)
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	sf	%f1, 159(%i0)
	mov	%i4, %i2
	sf	%f1, 0(%i2)
	addi	%i2, %i2, 4
	sw	%i4, 160(%i0)
	movi	%i4, 3
	sw	%i4, 161(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i23, %i4
	sw	%i23, 163(%i0)
	mov	%i4, %i9
	sw	%i4, 166(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i22, %i4
	sw	%i22, 168(%i0)
	movi	%i4, 3
	sw	%i4, 169(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 2(%i1)
	lw	%i31, 2(%i1)
	sw	%i31, 171(%i0)
	movi	%i4, 3
	sw	%i4, 174(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 3(%i1)
	lw	%i31, 3(%i1)
	sw	%i31, 176(%i0)
	movi	%i4, 3
	sw	%i4, 179(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 4(%i1)
	lw	%i31, 4(%i1)
	sw	%i31, 181(%i0)
	movi	%i4, 3
	sw	%i4, 184(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 5(%i1)
	lw	%i31, 5(%i1)
	sw	%i31, 186(%i0)
	movi	%i4, 2
	sw	%i4, 189(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 8
	mov	%i31, %i4
	sw	%i31, 6(%i1)
	lw	%i31, 6(%i1)
	sw	%i31, 191(%i0)
	movi	%i4, 2
	sw	%i4, 193(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 8
	mov	%i31, %i4
	sw	%i31, 7(%i1)
	lw	%i31, 7(%i1)
	sw	%i31, 195(%i0)
	mov	%i4, %i9
	sw	%i4, 197(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i31, %i4
	sw	%i31, 8(%i1)
	lw	%i31, 8(%i1)
	sw	%i31, 199(%i0)
	movi	%i4, 3
	sw	%i4, 200(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 9(%i1)
	lw	%i31, 9(%i1)
	sw	%i31, 202(%i0)
	movi	%i4, 3
	sw	%i4, 205(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 10(%i1)
	lw	%i31, 10(%i1)
	sw	%i31, 207(%i0)
	movi	%i4, 3
	sw	%i4, 210(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 11(%i1)
	lw	%i31, 11(%i1)
	sw	%i31, 212(%i0)
	movi	%i4, 3
	sw	%i4, 215(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 12(%i1)
	lw	%i31, 12(%i1)
	sw	%i31, 217(%i0)
	movi	%i4, 3
	sw	%i4, 220(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 13(%i1)
	lw	%i31, 13(%i1)
	sw	%i31, 222(%i0)
	movi	%i4, 3
	sw	%i4, 225(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i31, %i4
	sw	%i31, 14(%i1)
	lw	%i31, 14(%i1)
	sw	%i31, 227(%i0)
	mov	%i4, %i0
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 0
	mov	%i9, %i4
	sw	%i9, 232(%i0)
	mov	%i4, %i0
	mov	%i5, %i9
	mov	%i4, %i2
	addi	%i2, %i2, 0
	mov	%i5, %i4
	sw	%i5, 233(%i0)
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i9, 0(%i4)
	mov	%i5, %i4
	mov	%i4, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 0
	mov	%i5, %i4
	sw	%i5, 234(%i0)
	movi	%i4, 5
	sw	%i4, 234(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i31, %i4
	sw	%i31, 15(%i1)
	lw	%i31, 15(%i1)
	sw	%i31, 235(%i0)
	mov	%i4, %i0
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 0
	mov	%i5, %i4
	sw	%i5, 242(%i0)
	movi	%i4, 3
	sw	%i4, 242(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i19, %i4
	sw	%i19, 244(%i0)
	movi	%i4, 60
	sw	%i4, 247(%i0)
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69096:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69097
	jzero	%i0, %i0, ca_done.69098
ca_cont.69097:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69096
	jmp	%i0, 0(%i31)
ca_done.69098:
	mov	%i18, %i4
	sw	%i18, 248(%i0)
	mov	%i4, %i0
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 0
	mov	%i10, %i4
	sw	%i10, 310(%i0)
	mov	%i4, %i0
	mov	%i5, %i10
	mov	%i4, %i2
	addi	%i2, %i2, 0
	mov	%i5, %i4
	sw	%i5, 311(%i0)
	movi	%i9, 180
	sw	%i9, 311(%i0)
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f0, 4(%i4)
	sw	%i5, 2(%i4)
	sw	%i10, 1(%i4)
	sw	%i0, 0(%i4)
	mov	%i5, %i4
	mov	%i4, %i9
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69099:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69100
	jzero	%i0, %i0, ca_done.69101
ca_cont.69100:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69099
	jmp	%i0, 0(%i31)
ca_done.69101:
	mov	%i17, %i4
	sw	%i17, 314(%i0)
	movi	%i4, 1
	sw	%i4, 494(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i16, %i4
	sw	%i16, 496(%i0)
	movi	%i5, 32
	sw	%i5, 497(%i0)
	mov	%i4, %i5
	sw	%i4, 498(%i0)
	lw	%i31, 6(%i1)
	sw	%i5, 0(%i31)
	lw	%i31, 6(%i1)
	sw	%i4, 1(%i31)
	sari	%i4, %i5, 1
	sw	%i4, 503(%i0)
	lw	%i31, 7(%i1)
	sw	%i4, 0(%i31)
	lw	%i31, 7(%i1)
	sw	%i4, 1(%i31)
	movui	%i31, 274432
	mif	%f2, %i31
	sf	%f2, 506(%i0)
	mov	%i4, %i5
	itof	%f1, %i4
	sf	%f1, 507(%i0)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 508(%i0)
	lw	%i31, 8(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 6(%i1)
	lw	%i20, 0(%i31)
	sw	%i20, 510(%i0)
	movi	%i4, 3
	sw	%i4, 511(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i15, %i4
	sw	%i15, 513(%i0)
	movi	%i4, 3
	sw	%i4, 516(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 518(%i0)
	movi	%i4, 5
	sw	%i4, 521(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i14, %i4
	sw	%i14, 522(%i0)
	movi	%i4, 3
	sw	%i4, 528(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 530(%i0)
	sw	%i4, 1(%i14)
	movi	%i4, 3
	sw	%i4, 534(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 536(%i0)
	sw	%i4, 2(%i14)
	movi	%i4, 3
	sw	%i4, 540(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 542(%i0)
	sw	%i4, 3(%i14)
	movi	%i4, 3
	sw	%i4, 546(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 548(%i0)
	sw	%i4, 4(%i14)
	movi	%i4, 5
	sw	%i4, 551(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i13, %i4
	sw	%i13, 553(%i0)
	movi	%i4, 5
	sw	%i4, 558(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i12, %i4
	sw	%i12, 560(%i0)
	movi	%i4, 3
	sw	%i4, 565(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 567(%i0)
	movi	%i4, 5
	sw	%i4, 570(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i11, %i4
	sw	%i11, 571(%i0)
	movi	%i4, 3
	sw	%i4, 577(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 579(%i0)
	sw	%i4, 1(%i11)
	movi	%i4, 3
	sw	%i4, 583(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 585(%i0)
	sw	%i4, 2(%i11)
	movi	%i4, 3
	sw	%i4, 589(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 591(%i0)
	sw	%i4, 3(%i11)
	movi	%i4, 3
	sw	%i4, 595(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 597(%i0)
	sw	%i4, 4(%i11)
	movi	%i4, 3
	sw	%i4, 600(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 602(%i0)
	movi	%i4, 5
	sw	%i4, 605(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i10, %i4
	sw	%i10, 606(%i0)
	movi	%i4, 3
	sw	%i4, 612(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 614(%i0)
	sw	%i4, 1(%i10)
	movi	%i4, 3
	sw	%i4, 618(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 620(%i0)
	sw	%i4, 2(%i10)
	movi	%i4, 3
	sw	%i4, 624(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 626(%i0)
	sw	%i4, 3(%i10)
	movi	%i4, 3
	sw	%i4, 630(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 632(%i0)
	sw	%i4, 4(%i10)
	movi	%i4, 1
	sw	%i4, 635(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i9, %i4
	sw	%i9, 637(%i0)
	movi	%i4, 3
	sw	%i4, 638(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 640(%i0)
	movi	%i4, 5
	sw	%i4, 643(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i5, %i4
	sw	%i5, 644(%i0)
	movi	%i4, 3
	sw	%i4, 650(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 652(%i0)
	sw	%i4, 1(%i5)
	movi	%i4, 3
	sw	%i4, 656(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 658(%i0)
	sw	%i4, 2(%i5)
	movi	%i4, 3
	sw	%i4, 662(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 664(%i0)
	sw	%i4, 3(%i5)
	movi	%i4, 3
	sw	%i4, 668(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 670(%i0)
	sw	%i4, 4(%i5)
	mov	%i4, %i2
	addi	%i2, %i2, 32
	sw	%i5, 7(%i4)
	sw	%i9, 6(%i4)
	sw	%i10, 5(%i4)
	sw	%i11, 4(%i4)
	sw	%i12, 3(%i4)
	sw	%i13, 2(%i4)
	sw	%i14, 1(%i4)
	sw	%i15, 0(%i4)
	mov	%i5, %i4
	mov	%i4, %i20
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69102:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69103
	jzero	%i0, %i0, ca_done.69104
ca_cont.69103:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69102
	jmp	%i0, 0(%i31)
ca_done.69104:
	mov	%i21, %i4
	lw	%i31, 6(%i1)
	lw	%i4, 0(%i31)
	sw	%i4, 674(%i0)
	subi	%i20, %i4, 2
	sw	%i20, 676(%i0)
loop_start.68068:
	jleq	%i0, %i20, then.69106
	mov	%i31, %i21
	jzero	%i0, %i0, loop_end.68069
then.69106:
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i15, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i14, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i14)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i14)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i14)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i14)
	movi	%i4, 5
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i13, %i4
	movi	%i4, 5
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i12, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i11, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i10, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i10)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i10)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i10)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i10)
	movi	%i4, 1
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i9, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i5, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i5)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i5)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i5)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i5)
	mov	%i4, %i2
	addi	%i2, %i2, 32
	sw	%i5, 7(%i4)
	sw	%i9, 6(%i4)
	sw	%i10, 5(%i4)
	sw	%i11, 4(%i4)
	sw	%i12, 3(%i4)
	sw	%i13, 2(%i4)
	sw	%i14, 1(%i4)
	sw	%i15, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i20, 2
	add	%i31, %i21, %i4
	sw	%i5, 0(%i31)
	subi	%i4, %i20, 1
	mov	%i20, %i4
cont.69107:
	set_label	%i30, loop_start.68068
	jmp	%i0, 0(%i30)
loop_end.68069:
	mov	%i30, %i31
	sw	%i30, 16(%i1)
	lw	%i31, 6(%i1)
	lw	%i20, 0(%i31)
	sw	%i20, 679(%i0)
	movi	%i4, 3
	sw	%i4, 680(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i15, %i4
	sw	%i15, 682(%i0)
	movi	%i4, 3
	sw	%i4, 685(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 687(%i0)
	movi	%i4, 5
	sw	%i4, 690(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i14, %i4
	sw	%i14, 691(%i0)
	movi	%i4, 3
	sw	%i4, 697(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 699(%i0)
	sw	%i4, 1(%i14)
	movi	%i4, 3
	sw	%i4, 703(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 705(%i0)
	sw	%i4, 2(%i14)
	movi	%i4, 3
	sw	%i4, 709(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 711(%i0)
	sw	%i4, 3(%i14)
	movi	%i4, 3
	sw	%i4, 715(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 717(%i0)
	sw	%i4, 4(%i14)
	movi	%i4, 5
	sw	%i4, 720(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i13, %i4
	sw	%i13, 722(%i0)
	movi	%i4, 5
	sw	%i4, 727(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i12, %i4
	sw	%i12, 729(%i0)
	movi	%i4, 3
	sw	%i4, 734(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 736(%i0)
	movi	%i4, 5
	sw	%i4, 739(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i11, %i4
	sw	%i11, 740(%i0)
	movi	%i4, 3
	sw	%i4, 746(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 748(%i0)
	sw	%i4, 1(%i11)
	movi	%i4, 3
	sw	%i4, 752(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 754(%i0)
	sw	%i4, 2(%i11)
	movi	%i4, 3
	sw	%i4, 758(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 760(%i0)
	sw	%i4, 3(%i11)
	movi	%i4, 3
	sw	%i4, 764(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 766(%i0)
	sw	%i4, 4(%i11)
	movi	%i4, 3
	sw	%i4, 769(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 771(%i0)
	movi	%i4, 5
	sw	%i4, 774(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i10, %i4
	sw	%i10, 775(%i0)
	movi	%i4, 3
	sw	%i4, 781(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 783(%i0)
	sw	%i4, 1(%i10)
	movi	%i4, 3
	sw	%i4, 787(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 789(%i0)
	sw	%i4, 2(%i10)
	movi	%i4, 3
	sw	%i4, 793(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 795(%i0)
	sw	%i4, 3(%i10)
	movi	%i4, 3
	sw	%i4, 799(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 801(%i0)
	sw	%i4, 4(%i10)
	movi	%i4, 1
	sw	%i4, 804(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i9, %i4
	sw	%i9, 806(%i0)
	movi	%i4, 3
	sw	%i4, 807(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 809(%i0)
	movi	%i4, 5
	sw	%i4, 812(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i5, %i4
	sw	%i5, 813(%i0)
	movi	%i4, 3
	sw	%i4, 819(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 821(%i0)
	sw	%i4, 1(%i5)
	movi	%i4, 3
	sw	%i4, 825(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 827(%i0)
	sw	%i4, 2(%i5)
	movi	%i4, 3
	sw	%i4, 831(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 833(%i0)
	sw	%i4, 3(%i5)
	movi	%i4, 3
	sw	%i4, 837(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 839(%i0)
	sw	%i4, 4(%i5)
	mov	%i4, %i2
	addi	%i2, %i2, 32
	sw	%i5, 7(%i4)
	sw	%i9, 6(%i4)
	sw	%i10, 5(%i4)
	sw	%i11, 4(%i4)
	sw	%i12, 3(%i4)
	sw	%i13, 2(%i4)
	sw	%i14, 1(%i4)
	sw	%i15, 0(%i4)
	mov	%i5, %i4
	mov	%i4, %i20
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69108:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69109
	jzero	%i0, %i0, ca_done.69110
ca_cont.69109:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69108
	jmp	%i0, 0(%i31)
ca_done.69110:
	mov	%i21, %i4
	lw	%i31, 6(%i1)
	lw	%i4, 0(%i31)
	sw	%i4, 843(%i0)
	subi	%i20, %i4, 2
	sw	%i20, 845(%i0)
loop_start.68090:
	jleq	%i0, %i20, then.69112
	mov	%i31, %i21
	jzero	%i0, %i0, loop_end.68091
then.69112:
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i15, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i14, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i14)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i14)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i14)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i14)
	movi	%i4, 5
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i13, %i4
	movi	%i4, 5
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i12, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i11, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i10, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i10)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i10)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i10)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i10)
	movi	%i4, 1
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i9, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i5, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i5)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i5)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i5)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i5)
	mov	%i4, %i2
	addi	%i2, %i2, 32
	sw	%i5, 7(%i4)
	sw	%i9, 6(%i4)
	sw	%i10, 5(%i4)
	sw	%i11, 4(%i4)
	sw	%i12, 3(%i4)
	sw	%i13, 2(%i4)
	sw	%i14, 1(%i4)
	sw	%i15, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i20, 2
	add	%i31, %i21, %i4
	sw	%i5, 0(%i31)
	subi	%i4, %i20, 1
	mov	%i20, %i4
cont.69113:
	set_label	%i30, loop_start.68090
	jmp	%i0, 0(%i30)
loop_end.68091:
	mov	%i30, %i31
	sw	%i30, 17(%i1)
	lw	%i31, 6(%i1)
	lw	%i20, 0(%i31)
	sw	%i20, 848(%i0)
	movi	%i4, 3
	sw	%i4, 849(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i15, %i4
	sw	%i15, 851(%i0)
	movi	%i4, 3
	sw	%i4, 854(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 856(%i0)
	movi	%i4, 5
	sw	%i4, 859(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i14, %i4
	sw	%i14, 860(%i0)
	movi	%i4, 3
	sw	%i4, 866(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 868(%i0)
	sw	%i4, 1(%i14)
	movi	%i4, 3
	sw	%i4, 872(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 874(%i0)
	sw	%i4, 2(%i14)
	movi	%i4, 3
	sw	%i4, 878(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 880(%i0)
	sw	%i4, 3(%i14)
	movi	%i4, 3
	sw	%i4, 884(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 886(%i0)
	sw	%i4, 4(%i14)
	movi	%i4, 5
	sw	%i4, 889(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i13, %i4
	sw	%i13, 891(%i0)
	movi	%i4, 5
	sw	%i4, 896(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i12, %i4
	sw	%i12, 898(%i0)
	movi	%i4, 3
	sw	%i4, 903(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 905(%i0)
	movi	%i4, 5
	sw	%i4, 908(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i11, %i4
	sw	%i11, 909(%i0)
	movi	%i4, 3
	sw	%i4, 915(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 917(%i0)
	sw	%i4, 1(%i11)
	movi	%i4, 3
	sw	%i4, 921(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 923(%i0)
	sw	%i4, 2(%i11)
	movi	%i4, 3
	sw	%i4, 927(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 929(%i0)
	sw	%i4, 3(%i11)
	movi	%i4, 3
	sw	%i4, 933(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 935(%i0)
	sw	%i4, 4(%i11)
	movi	%i4, 3
	sw	%i4, 938(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 940(%i0)
	movi	%i4, 5
	sw	%i4, 943(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i10, %i4
	sw	%i10, 944(%i0)
	movi	%i4, 3
	sw	%i4, 950(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 952(%i0)
	sw	%i4, 1(%i10)
	movi	%i4, 3
	sw	%i4, 956(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 958(%i0)
	sw	%i4, 2(%i10)
	movi	%i4, 3
	sw	%i4, 962(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 964(%i0)
	sw	%i4, 3(%i10)
	movi	%i4, 3
	sw	%i4, 968(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 970(%i0)
	sw	%i4, 4(%i10)
	movi	%i4, 1
	sw	%i4, 973(%i0)
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i9, %i4
	sw	%i9, 975(%i0)
	movi	%i4, 3
	sw	%i4, 976(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	sw	%i5, 978(%i0)
	movi	%i4, 5
	sw	%i4, 981(%i0)
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i5, %i4
	sw	%i5, 982(%i0)
	movi	%i4, 3
	sw	%i4, 988(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 990(%i0)
	sw	%i4, 1(%i5)
	movi	%i4, 3
	sw	%i4, 994(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 996(%i0)
	sw	%i4, 2(%i5)
	movi	%i4, 3
	sw	%i4, 1000(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1002(%i0)
	sw	%i4, 3(%i5)
	movi	%i4, 3
	sw	%i4, 1006(%i0)
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1008(%i0)
	sw	%i4, 4(%i5)
	mov	%i4, %i2
	addi	%i2, %i2, 32
	sw	%i5, 7(%i4)
	sw	%i9, 6(%i4)
	sw	%i10, 5(%i4)
	sw	%i11, 4(%i4)
	sw	%i12, 3(%i4)
	sw	%i13, 2(%i4)
	sw	%i14, 1(%i4)
	sw	%i15, 0(%i4)
	mov	%i5, %i4
	mov	%i4, %i20
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69114:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69115
	jzero	%i0, %i0, ca_done.69116
ca_cont.69115:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69114
	jmp	%i0, 0(%i31)
ca_done.69116:
	mov	%i21, %i4
	lw	%i31, 6(%i1)
	lw	%i4, 0(%i31)
	sw	%i4, 1012(%i0)
	subi	%i20, %i4, 2
	sw	%i20, 1014(%i0)
loop_start.68112:
	jleq	%i0, %i20, then.69118
	mov	%i31, %i21
	jzero	%i0, %i0, loop_end.68113
then.69118:
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i15, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i14, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i14)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i14)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i14)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i14)
	movi	%i4, 5
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i13, %i4
	movi	%i4, 5
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i12, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i11, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i11)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i10, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i10)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i10)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i10)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i10)
	movi	%i4, 1
	mov	%i5, %i0
	mov	%i4, %i2
	addi	%i2, %i2, 4
	mov	%i9, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i5, %i4
	movi	%i4, 5
	mov	%i4, %i2
	sw	%i5, 0(%i2)
	sw	%i5, 1(%i2)
	sw	%i5, 2(%i2)
	sw	%i5, 3(%i2)
	sw	%i5, 4(%i2)
	addi	%i2, %i2, 20
	mov	%i5, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 1(%i5)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 2(%i5)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 3(%i5)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	sw	%i4, 4(%i5)
	mov	%i4, %i2
	addi	%i2, %i2, 32
	sw	%i5, 7(%i4)
	sw	%i9, 6(%i4)
	sw	%i10, 5(%i4)
	sw	%i11, 4(%i4)
	sw	%i12, 3(%i4)
	sw	%i13, 2(%i4)
	sw	%i14, 1(%i4)
	sw	%i15, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i20, 2
	add	%i31, %i21, %i4
	sw	%i5, 0(%i31)
	subi	%i4, %i20, 1
	mov	%i20, %i4
cont.69119:
	set_label	%i30, loop_start.68112
	jmp	%i0, 0(%i30)
loop_end.68113:
	mov	%i30, %i31
	sw	%i30, 18(%i1)
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
	sf	%f1, 1017(%i0)
	sf	%f1, 0(%i8)
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
	sf	%f1, 1019(%i0)
	sf	%f1, 1(%i8)
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
	sf	%f1, 1021(%i0)
	sf	%f1, 2(%i8)
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
	fmov	%f2, %f1
	sf	%f2, 1022(%i0)
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	sf	%f1, 1023(%i0)
	fmul	%f2, %f2, %f1
	sf	%f2, 1024(%i0)
	fsub	%f5, %f8, %f2
	sf	%f5, 1025(%i0)
	fleq	%i31, %f5, %f8
	jzero	%i0, %i31, else.69120
	fleq	%i31, %f7, %f5
	jzero	%i0, %i31, else.69122
	fmul	%f4, %f5, %f5
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
	fmul	%f5, %f1, %f5
	jzero	%i0, %i0, cont.69121
else.69122:
	fleq	%i31, %f5, %f6
	jzero	%i0, %i31, else.69124
	finv	%f1, %f9
	fmul	%f1, %f5, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f5, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69126
	fmov	%f5, %f1
	jzero	%i0, %i0, cont.69127
else.69126:
	fsub	%f5, %f9, %f1
cont.69127:
	fmul	%f4, %f5, %f5
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
	fmul	%f5, %f1, %f5
	jzero	%i0, %i0, cont.69125
else.69124:
	fsub	%f5, %f6, %f5
	fmul	%f4, %f5, %f5
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
	fmul	%f5, %f1, %f5
cont.69125:
cont.69123:
	jzero	%i0, %i0, cont.69121
else.69120:
	fleq	%i31, %f9, %f5
	jzero	%i0, %i31, else.69128
	finv	%f1, %f9
	fmul	%f1, %f5, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f5, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69130
	fmov	%f5, %f1
	jzero	%i0, %i0, cont.69131
else.69130:
	fsub	%f5, %f9, %f1
cont.69131:
	fmul	%f4, %f5, %f5
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
	fmul	%f5, %f1, %f5
	jzero	%i0, %i0, cont.69129
else.69128:
	fsub	%f5, %f9, %f5
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f5, %f1, %f5
cont.69129:
cont.69121:
	sf	%f5, 1026(%i0)
	fleq	%i31, %f2, %f8
	jzero	%i0, %i31, else.69132
	fleq	%i31, %f7, %f2
	jzero	%i0, %i31, else.69134
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
	jzero	%i0, %i0, cont.69133
else.69134:
	fleq	%i31, %f2, %f6
	jzero	%i0, %i31, else.69136
	finv	%f1, %f9
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f2, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69138
	fmov	%f4, %f1
	jzero	%i0, %i0, cont.69139
else.69138:
	fsub	%f4, %f9, %f1
cont.69139:
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
	jzero	%i0, %i0, cont.69137
else.69136:
	fsub	%f4, %f6, %f2
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
cont.69137:
cont.69135:
	jzero	%i0, %i0, cont.69133
else.69132:
	fleq	%i31, %f9, %f2
	jzero	%i0, %i31, else.69140
	finv	%f1, %f9
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f2, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69142
	fmov	%f4, %f1
	jzero	%i0, %i0, cont.69143
else.69142:
	fsub	%f4, %f9, %f1
cont.69143:
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
	jzero	%i0, %i0, cont.69141
else.69140:
	fsub	%f4, %f9, %f2
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
cont.69141:
cont.69133:
	sf	%f4, 1027(%i0)
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
	fmov	%f2, %f1
	sf	%f2, 1028(%i0)
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	sf	%f1, 1029(%i0)
	fmul	%f3, %f2, %f1
	sf	%f3, 1030(%i0)
	fsub	%f11, %f8, %f3
	sf	%f11, 1031(%i0)
	fleq	%i31, %f11, %f8
	jzero	%i0, %i31, else.69144
	fleq	%i31, %f7, %f11
	jzero	%i0, %i31, else.69146
	fmul	%f10, %f11, %f11
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f10
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f11
	jzero	%i0, %i0, cont.69145
else.69146:
	fleq	%i31, %f11, %f6
	jzero	%i0, %i31, else.69148
	finv	%f1, %f9
	fmul	%f1, %f11, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f11, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69150
	fmov	%f11, %f1
	jzero	%i0, %i0, cont.69151
else.69150:
	fsub	%f11, %f9, %f1
cont.69151:
	fmul	%f10, %f11, %f11
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f10
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f11
	jzero	%i0, %i0, cont.69149
else.69148:
	fsub	%f11, %f6, %f11
	fmul	%f10, %f11, %f11
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f10
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f11
cont.69149:
cont.69147:
	jzero	%i0, %i0, cont.69145
else.69144:
	fleq	%i31, %f9, %f11
	jzero	%i0, %i31, else.69152
	finv	%f1, %f9
	fmul	%f1, %f11, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f11, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69154
	fmov	%f11, %f1
	jzero	%i0, %i0, cont.69155
else.69154:
	fsub	%f11, %f9, %f1
cont.69155:
	fmul	%f10, %f11, %f11
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f10
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f11
	jzero	%i0, %i0, cont.69153
else.69152:
	fsub	%f11, %f9, %f11
	fmul	%f10, %f11, %f11
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f2, %f1, %f10
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
	fmul	%f2, %f1, %f10
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f11
cont.69153:
cont.69145:
	sf	%f2, 1032(%i0)
	fleq	%i31, %f3, %f8
	jzero	%i0, %i31, else.69156
	fleq	%i31, %f7, %f3
	jzero	%i0, %i31, else.69158
	fmul	%f11, %f3, %f3
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f10, %f1, %f11
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f10, %f1
	fmul	%f10, %f1, %f11
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f10, %f1
	fmul	%f10, %f1, %f11
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f10, %f1
	fmul	%f10, %f1, %f3
	jzero	%i0, %i0, cont.69157
else.69158:
	fleq	%i31, %f3, %f6
	jzero	%i0, %i31, else.69160
	finv	%f1, %f9
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f3, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69162
	fmov	%f11, %f1
	jzero	%i0, %i0, cont.69163
else.69162:
	fsub	%f11, %f9, %f1
cont.69163:
	fmul	%f10, %f11, %f11
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f10
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f10
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f10
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f10, %f1, %f11
	jzero	%i0, %i0, cont.69161
else.69160:
	fsub	%f11, %f6, %f3
	fmul	%f10, %f11, %f11
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f10
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f10
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f10
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f10, %f1, %f11
cont.69161:
cont.69159:
	jzero	%i0, %i0, cont.69157
else.69156:
	fleq	%i31, %f9, %f3
	jzero	%i0, %i31, else.69164
	finv	%f1, %f9
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f3, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69166
	fmov	%f11, %f1
	jzero	%i0, %i0, cont.69167
else.69166:
	fsub	%f11, %f9, %f1
cont.69167:
	fmul	%f10, %f11, %f11
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f10
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f10
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f10
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f10, %f1, %f11
	jzero	%i0, %i0, cont.69165
else.69164:
	fsub	%f11, %f9, %f3
	fmul	%f10, %f11, %f11
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f10
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f10
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f10
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f10, %f1, %f11
cont.69165:
cont.69157:
	sf	%f10, 1033(%i0)
	fmul	%f3, %f5, %f10
	sf	%f3, 1035(%i0)
	movui	%i31, 275584
	mif	%f1, %i31
	sf	%f1, 1036(%i0)
	fmul	%f1, %f3, %f1
	sf	%f1, 1037(%i0)
	lw	%i31, 13(%i1)
	sf	%f1, 0(%i31)
	movui	%i31, 799872
	mif	%f1, %i31
	sf	%f1, 1039(%i0)
	fmul	%f1, %f4, %f1
	sf	%f1, 1040(%i0)
	lw	%i31, 13(%i1)
	sf	%f1, 1(%i31)
	fmul	%f3, %f5, %f2
	sf	%f3, 1042(%i0)
	movui	%i31, 275584
	mif	%f1, %i31
	sf	%f1, 1043(%i0)
	fmul	%f1, %f3, %f1
	sf	%f1, 1044(%i0)
	lw	%i31, 13(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 11(%i1)
	sf	%f2, 0(%i31)
	lw	%i31, 11(%i1)
	sf	%f0, 1(%i31)
	fneg	%f1, %f10
	sf	%f1, 1049(%i0)
	lw	%i31, 11(%i1)
	sf	%f1, 2(%i31)
	fneg	%f3, %f4
	sf	%f3, 1051(%i0)
	fmul	%f1, %f3, %f10
	sf	%f1, 1052(%i0)
	lw	%i31, 12(%i1)
	sf	%f1, 0(%i31)
	fneg	%f1, %f5
	sf	%f1, 1054(%i0)
	lw	%i31, 12(%i1)
	sf	%f1, 1(%i31)
	fmul	%f1, %f3, %f2
	sf	%f1, 1056(%i0)
	lw	%i31, 12(%i1)
	sf	%f1, 2(%i31)
	lf	%f2, 0(%i8)
	sf	%f2, 1059(%i0)
	lw	%i31, 13(%i1)
	lf	%f1, 0(%i31)
	sf	%f1, 1061(%i0)
	fsub	%f1, %f2, %f1
	sf	%f1, 1062(%i0)
	sf	%f1, 0(%i27)
	lf	%f2, 1(%i8)
	sf	%f2, 1065(%i0)
	lw	%i31, 13(%i1)
	lf	%f1, 1(%i31)
	sf	%f1, 1067(%i0)
	fsub	%f1, %f2, %f1
	sf	%f1, 1068(%i0)
	sf	%f1, 1(%i27)
	lf	%f2, 2(%i8)
	sf	%f2, 1071(%i0)
	lw	%i31, 13(%i1)
	lf	%f1, 2(%i31)
	sf	%f1, 1073(%i0)
	fsub	%f1, %f2, %f1
	sf	%f1, 1074(%i0)
	sf	%f1, 2(%i27)
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
	sw	%i4, 1075(%i0)
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
	fmov	%f2, %f1
	sf	%f2, 1076(%i0)
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	sf	%f1, 1077(%i0)
	fmul	%f2, %f2, %f1
	sf	%f2, 1078(%i0)
	fleq	%i31, %f2, %f8
	jzero	%i0, %i31, else.69168
	fleq	%i31, %f7, %f2
	jzero	%i0, %i31, else.69170
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
	jzero	%i0, %i0, cont.69169
else.69170:
	fleq	%i31, %f2, %f6
	jzero	%i0, %i31, else.69172
	finv	%f1, %f9
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f2, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69174
	fmov	%f5, %f1
	jzero	%i0, %i0, cont.69175
else.69174:
	fsub	%f5, %f9, %f1
cont.69175:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.69173
else.69172:
	fsub	%f5, %f6, %f2
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
cont.69173:
cont.69171:
	jzero	%i0, %i0, cont.69169
else.69168:
	fleq	%i31, %f9, %f2
	jzero	%i0, %i31, else.69176
	finv	%f1, %f9
	fmul	%f1, %f2, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f2, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69178
	fmov	%f5, %f1
	jzero	%i0, %i0, cont.69179
else.69178:
	fsub	%f5, %f9, %f1
cont.69179:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.69177
else.69176:
	fsub	%f5, %f9, %f2
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f5
cont.69177:
cont.69169:
	sf	%f1, 1079(%i0)
	fneg	%f1, %f1
	sf	%f1, 1081(%i0)
	sf	%f1, 1(%i26)
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
	fmov	%f3, %f1
	sf	%f3, 1082(%i0)
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	sf	%f1, 1083(%i0)
	fmul	%f3, %f3, %f1
	sf	%f3, 1084(%i0)
	fsub	%f5, %f8, %f2
	sf	%f5, 1085(%i0)
	fleq	%i31, %f5, %f8
	jzero	%i0, %i31, else.69180
	fleq	%i31, %f7, %f5
	jzero	%i0, %i31, else.69182
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
	fmul	%f2, %f1, %f5
	jzero	%i0, %i0, cont.69181
else.69182:
	fleq	%i31, %f5, %f6
	jzero	%i0, %i31, else.69184
	finv	%f1, %f9
	fmul	%f1, %f5, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f5, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69186
	fmov	%f5, %f1
	jzero	%i0, %i0, cont.69187
else.69186:
	fsub	%f5, %f9, %f1
cont.69187:
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
	fmul	%f2, %f1, %f5
	jzero	%i0, %i0, cont.69185
else.69184:
	fsub	%f5, %f6, %f5
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
	fmul	%f2, %f1, %f5
cont.69185:
cont.69183:
	jzero	%i0, %i0, cont.69181
else.69180:
	fleq	%i31, %f9, %f5
	jzero	%i0, %i31, else.69188
	finv	%f1, %f9
	fmul	%f1, %f5, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f5, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69190
	fmov	%f5, %f1
	jzero	%i0, %i0, cont.69191
else.69190:
	fsub	%f5, %f9, %f1
cont.69191:
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
	fmul	%f2, %f1, %f5
	jzero	%i0, %i0, cont.69189
else.69188:
	fsub	%f5, %f9, %f5
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
	fmul	%f2, %f1, %f5
cont.69189:
cont.69181:
	sf	%f2, 1086(%i0)
	fleq	%i31, %f3, %f8
	jzero	%i0, %i31, else.69192
	fleq	%i31, %f7, %f3
	jzero	%i0, %i31, else.69194
	fmul	%f5, %f3, %f3
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
	fmul	%f1, %f1, %f3
	jzero	%i0, %i0, cont.69193
else.69194:
	fleq	%i31, %f3, %f6
	jzero	%i0, %i31, else.69196
	finv	%f1, %f9
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f3, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69198
	fmov	%f10, %f1
	jzero	%i0, %i0, cont.69199
else.69198:
	fsub	%f10, %f9, %f1
cont.69199:
	fmul	%f5, %f10, %f10
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
	fmul	%f1, %f1, %f10
	jzero	%i0, %i0, cont.69197
else.69196:
	fsub	%f10, %f6, %f3
	fmul	%f5, %f10, %f10
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
	fmul	%f1, %f1, %f10
cont.69197:
cont.69195:
	jzero	%i0, %i0, cont.69193
else.69192:
	fleq	%i31, %f9, %f3
	jzero	%i0, %i31, else.69200
	finv	%f1, %f9
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f3, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69202
	fmov	%f10, %f1
	jzero	%i0, %i0, cont.69203
else.69202:
	fsub	%f10, %f9, %f1
cont.69203:
	fmul	%f5, %f10, %f10
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
	fmul	%f1, %f1, %f10
	jzero	%i0, %i0, cont.69201
else.69200:
	fsub	%f10, %f9, %f3
	fmul	%f5, %f10, %f10
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f1, %f1, %f10
cont.69201:
cont.69193:
	sf	%f1, 1087(%i0)
	fmul	%f1, %f2, %f1
	sf	%f1, 1089(%i0)
	sf	%f1, 0(%i26)
	fsub	%f5, %f8, %f3
	sf	%f5, 1090(%i0)
	fleq	%i31, %f5, %f8
	jzero	%i0, %i31, else.69204
	fleq	%i31, %f7, %f5
	jzero	%i0, %i31, else.69206
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.69205
else.69206:
	fleq	%i31, %f5, %f6
	jzero	%i0, %i31, else.69208
	finv	%f1, %f9
	fmul	%f1, %f5, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f5, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69210
	fmov	%f5, %f1
	jzero	%i0, %i0, cont.69211
else.69210:
	fsub	%f5, %f9, %f1
cont.69211:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.69209
else.69208:
	fsub	%f5, %f6, %f5
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
cont.69209:
cont.69207:
	jzero	%i0, %i0, cont.69205
else.69204:
	fleq	%i31, %f9, %f5
	jzero	%i0, %i31, else.69212
	finv	%f1, %f9
	fmul	%f1, %f5, %f1
	ffloor	%f1, %f1
	fmul	%f1, %f1, %f9
	fsub	%f1, %f5, %f1
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.69214
	fmov	%f5, %f1
	jzero	%i0, %i0, cont.69215
else.69214:
	fsub	%f5, %f9, %f1
cont.69215:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.69213
else.69212:
	fsub	%f5, %f9, %f5
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f5
cont.69213:
cont.69205:
	sf	%f1, 1091(%i0)
	fmul	%f1, %f2, %f1
	sf	%f1, 1093(%i0)
	sf	%f1, 2(%i26)
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
	sf	%f1, 1095(%i0)
	sf	%f1, 0(%i7)
	mov	%i28, %i0
	sw	%i28, 1096(%i0)
	movi	%i21, 60
	sw	%i21, 1097(%i0)
loop_start.68141:
	jleq	%i21, %i28, then.69217
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
	mov	%i20, %i4
	movi	%i31, -1
	jeq	%i20, %i31, then.69219
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
	mov	%i15, %i4
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
	mov	%i14, %i4
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
	mov	%i13, %i4
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i12, %i4
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
	sf	%f1, 0(%i12)
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
	sf	%f1, 1(%i12)
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
	sf	%f1, 2(%i12)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i11, %i4
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
	sf	%f1, 0(%i11)
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
	sf	%f1, 1(%i11)
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
	sf	%f1, 2(%i11)
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
	flt	%i10, %f1, %f0
	movi	%i4, 2
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 8
	mov	%i9, %i4
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
	sf	%f1, 0(%i9)
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
	sf	%f1, 1(%i9)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i8, %i4
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
	sf	%f1, 0(%i8)
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
	sf	%f1, 1(%i8)
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
	sf	%f1, 2(%i8)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i7, %i4
	jeq	%i13, %i0, cont.69221
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
	fmov	%f2, %f1
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	sf	%f1, 0(%i7)
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
	fmov	%f2, %f1
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i7)
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
	fmov	%f2, %f1
	movui	%i31, 248047
	ori	%i31, %i31, -1483
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	sf	%f1, 2(%i7)
cont.69221:
	movi	%i31, 2
	jeq	%i15, %i31, then.69222
	mov	%i5, %i10
	jzero	%i0, %i0, cont.69223
then.69222:
	movi	%i5, 1
cont.69223:
	movi	%i4, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 16
	mov	%i29, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 48
	sw	%i29, 10(%i4)
	sw	%i7, 9(%i4)
	sw	%i8, 8(%i4)
	sw	%i9, 7(%i4)
	sw	%i5, 6(%i4)
	sw	%i11, 5(%i4)
	sw	%i12, 4(%i4)
	sw	%i13, 3(%i4)
	sw	%i14, 2(%i4)
	sw	%i15, 1(%i4)
	sw	%i20, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i28, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	sw	%i5, 0(%i31)
	movi	%i31, 3
	jeq	%i15, %i31, then.69224
	ceqi	%i31, %i15, 2
	jzero	%i0, %i31, cont.69226
	ceqi	%i5, %i10, 0
	lf	%f1, 0(%i12)
	fmul	%f2, %f1, %f1
	lf	%f1, 1(%i12)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i12)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69227
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.69228
then.69227:
	jeq	%i5, %i0, then.69229
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.69230
then.69229:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.69230:
cont.69228:
	lf	%f1, 0(%i12)
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i12)
	lf	%f1, 1(%i12)
	fmul	%f1, %f1, %f2
	sf	%f1, 1(%i12)
	lf	%f1, 2(%i12)
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i12)
cont.69226:
	jzero	%i0, %i0, cont.69225
then.69224:
	lf	%f3, 0(%i12)
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.69231
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.69232
then.69231:
	jeq	%i4, %i0, then.69233
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.69234
then.69233:
	flt	%i4, %f0, %f3
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmov	%f2, %f1
cont.69234:
	fmul	%f1, %f3, %f3
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
cont.69232:
	sf	%f1, 0(%i12)
	lf	%f3, 1(%i12)
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.69235
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.69236
then.69235:
	jeq	%i4, %i0, then.69237
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.69238
then.69237:
	flt	%i4, %f0, %f3
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmov	%f2, %f1
cont.69238:
	fmul	%f1, %f3, %f3
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
cont.69236:
	sf	%f1, 1(%i12)
	lf	%f3, 2(%i12)
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.69239
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.69240
then.69239:
	jeq	%i4, %i0, then.69241
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.69242
then.69241:
	flt	%i4, %f0, %f3
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmov	%f2, %f1
cont.69242:
	fmul	%f1, %f3, %f3
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
cont.69240:
	sf	%f1, 2(%i12)
cont.69225:
	jeq	%i13, %i0, cont.69243
	mov	%i4, %i12
	mov	%i5, %i7
	set_label	%i31, rotate_quadratic_matrix.2804
	jmp	%i3, 0(%i31)
cont.69243:
	movi	%i4, 1
	jzero	%i0, %i0, cont.69220
then.69219:
	mov	%i4, %i0
cont.69220:
	jeq	%i4, %i0, then.69244
	addi	%i4, %i28, 1
	mov	%i28, %i4
	set_label	%i31, loop_start.68141
	jmp	%i0, 0(%i31)
then.69244:
	lw	%i31, 0(%i1)
	sw	%i28, 0(%i31)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68142
then.69217:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68142
loop_end.68142:
	mov	%i0, %i31
	mov	%i7, %i0
	sw	%i7, 1098(%i0)
loop_start.68178:
	mov	%i4, %i0
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	set_label	%i31, read_net_item.2813
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	lw	%i4, 0(%i5)
	movi	%i31, -1
	jeq	%i4, %i31, then.69247
	slli	%i4, %i7, 2
	add	%i31, %i6, %i4
	sw	%i5, 0(%i31)
	addi	%i4, %i7, 1
	mov	%i7, %i4
	set_label	%i31, loop_start.68178
	jmp	%i0, 0(%i31)
then.69247:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68179
loop_end.68179:
	mov	%i0, %i31
	mov	%i4, %i0
	set_label	%i31, read_or_network.2815
	jmp	%i3, 0(%i31)
	mov	%i4, %i30
	sw	%i4, 0(%i25)
	movi	%i4, 80
	sw	%i4, 1104(%i0)
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 51
	sw	%i4, 1105(%i0)
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 10
	sw	%i4, 1106(%i0)
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i31, 6(%i1)
	lw	%i6, 0(%i31)
	sw	%i6, 1108(%i0)
	movi	%i4, 100
	sw	%i4, 1109(%i0)
	jleq	%i4, %i6, then.69249
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69250
then.69249:
	movi	%i4, 200
	jleq	%i4, %i6, then.69251
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.69252
then.69251:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.69252:
cont.69250:
	sw	%i6, 1110(%i0)
	movi	%i4, 40
	sw	%i4, 1111(%i0)
	jleq	%i4, %i6, then.69253
	movi	%i4, 20
	jleq	%i4, %i6, then.69255
	movi	%i4, 10
	jleq	%i4, %i6, then.69257
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.69254
then.69257:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.69258:
	jzero	%i0, %i0, cont.69254
then.69255:
	movi	%i4, 30
	jleq	%i4, %i6, then.69259
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.69260
then.69259:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.69260:
cont.69256:
	jzero	%i0, %i0, cont.69254
then.69253:
	movi	%i4, 60
	jleq	%i4, %i6, then.69261
	movi	%i4, 50
	jleq	%i4, %i6, then.69263
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.69262
then.69263:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.69264:
	jzero	%i0, %i0, cont.69262
then.69261:
	movi	%i4, 80
	jleq	%i4, %i6, then.69265
	movi	%i4, 70
	jleq	%i4, %i6, then.69267
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.69266
then.69267:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.69268:
	jzero	%i0, %i0, cont.69266
then.69265:
	movi	%i4, 90
	jleq	%i4, %i6, then.69269
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.69270
then.69269:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.69270:
cont.69266:
cont.69262:
cont.69254:
	sw	%i5, 1112(%i0)
	movi	%i4, 4
	sw	%i4, 1113(%i0)
	jleq	%i4, %i5, then.69271
	movi	%i4, 2
	jleq	%i4, %i5, then.69273
	movi	%i4, 1
	jleq	%i4, %i5, then.69275
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69272
then.69275:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69276:
	jzero	%i0, %i0, cont.69272
then.69273:
	movi	%i4, 3
	jleq	%i4, %i5, then.69277
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69278
then.69277:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69278:
cont.69274:
	jzero	%i0, %i0, cont.69272
then.69271:
	movi	%i4, 6
	jleq	%i4, %i5, then.69279
	movi	%i4, 5
	jleq	%i4, %i5, then.69281
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69280
then.69281:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69282:
	jzero	%i0, %i0, cont.69280
then.69279:
	movi	%i4, 8
	jleq	%i4, %i5, then.69283
	movi	%i4, 7
	jleq	%i4, %i5, then.69285
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69284
then.69285:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69286:
	jzero	%i0, %i0, cont.69284
then.69283:
	movi	%i4, 9
	jleq	%i4, %i5, then.69287
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69288
then.69287:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69288:
cont.69284:
cont.69280:
cont.69272:
	movi	%i4, 32
	sw	%i4, 1114(%i0)
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i31, 6(%i1)
	lw	%i6, 1(%i31)
	sw	%i6, 1116(%i0)
	movi	%i4, 100
	sw	%i4, 1117(%i0)
	jleq	%i4, %i6, then.69289
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69290
then.69289:
	movi	%i4, 200
	jleq	%i4, %i6, then.69291
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.69292
then.69291:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.69292:
cont.69290:
	sw	%i6, 1118(%i0)
	movi	%i4, 40
	sw	%i4, 1119(%i0)
	jleq	%i4, %i6, then.69293
	movi	%i4, 20
	jleq	%i4, %i6, then.69295
	movi	%i4, 10
	jleq	%i4, %i6, then.69297
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.69294
then.69297:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.69298:
	jzero	%i0, %i0, cont.69294
then.69295:
	movi	%i4, 30
	jleq	%i4, %i6, then.69299
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.69300
then.69299:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.69300:
cont.69296:
	jzero	%i0, %i0, cont.69294
then.69293:
	movi	%i4, 60
	jleq	%i4, %i6, then.69301
	movi	%i4, 50
	jleq	%i4, %i6, then.69303
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.69302
then.69303:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.69304:
	jzero	%i0, %i0, cont.69302
then.69301:
	movi	%i4, 80
	jleq	%i4, %i6, then.69305
	movi	%i4, 70
	jleq	%i4, %i6, then.69307
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.69306
then.69307:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.69308:
	jzero	%i0, %i0, cont.69306
then.69305:
	movi	%i4, 90
	jleq	%i4, %i6, then.69309
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.69310
then.69309:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.69310:
cont.69306:
cont.69302:
cont.69294:
	sw	%i5, 1120(%i0)
	movi	%i4, 4
	sw	%i4, 1121(%i0)
	jleq	%i4, %i5, then.69311
	movi	%i4, 2
	jleq	%i4, %i5, then.69313
	movi	%i4, 1
	jleq	%i4, %i5, then.69315
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69312
then.69315:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69316:
	jzero	%i0, %i0, cont.69312
then.69313:
	movi	%i4, 3
	jleq	%i4, %i5, then.69317
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69318
then.69317:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69318:
cont.69314:
	jzero	%i0, %i0, cont.69312
then.69311:
	movi	%i4, 6
	jleq	%i4, %i5, then.69319
	movi	%i4, 5
	jleq	%i4, %i5, then.69321
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69320
then.69321:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69322:
	jzero	%i0, %i0, cont.69320
then.69319:
	movi	%i4, 8
	jleq	%i4, %i5, then.69323
	movi	%i4, 7
	jleq	%i4, %i5, then.69325
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69324
then.69325:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69326:
	jzero	%i0, %i0, cont.69324
then.69323:
	movi	%i4, 9
	jleq	%i4, %i5, then.69327
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69328
then.69327:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69328:
cont.69324:
cont.69320:
cont.69312:
	movi	%i4, 32
	sw	%i4, 1122(%i0)
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 50
	sw	%i4, 1123(%i0)
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 53
	sw	%i4, 1124(%i0)
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	sw	%i4, 1125(%i0)
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i4, 10
	sw	%i4, 1126(%i0)
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	movi	%i6, 4
	sw	%i6, 1127(%i0)
loop_start.68182:
	jleq	%i0, %i6, then.69330
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68183
then.69330:
	movi	%i8, 120
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i7, %i4
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69332:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69333
	jzero	%i0, %i0, ca_done.69334
ca_cont.69333:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69332
	jmp	%i0, 0(%i31)
ca_done.69334:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	mov	%i4, %i8
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69335:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69336
	jzero	%i0, %i0, ca_done.69337
ca_cont.69336:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69335
	jmp	%i0, 0(%i31)
ca_done.69337:
	mov	%i5, %i4
	slli	%i4, %i6, 2
	lw	%i30, 15(%i1)
	add	%i31, %i30, %i4
	sw	%i5, 0(%i31)
	slli	%i4, %i6, 2
	lw	%i30, 15(%i1)
	add	%i31, %i30, %i4
	lw	%i9, 0(%i31)
	movi	%i8, 118
loop_start.68189:
	jleq	%i0, %i8, then.69339
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68190
then.69339:
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i7, %i4
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i7
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69341:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69342
	jzero	%i0, %i0, ca_done.69343
ca_cont.69342:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69341
	jmp	%i0, 0(%i31)
ca_done.69343:
	mov	%i5, %i4
	mov	%i4, %i2
	addi	%i2, %i2, 8
	sw	%i5, 1(%i4)
	sw	%i7, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	sw	%i5, 0(%i31)
	subi	%i4, %i8, 1
	mov	%i8, %i4
cont.69340:
	set_label	%i30, loop_start.68189
	jmp	%i0, 0(%i30)
loop_end.68190:
	mov	%i0, %i31
	subi	%i4, %i6, 1
	mov	%i6, %i4
cont.69331:
	set_label	%i30, loop_start.68182
	jmp	%i0, 0(%i30)
loop_end.68183:
	mov	%i0, %i31
	movi	%i8, 9
	sw	%i8, 1129(%i0)
	mov	%i5, %i0
	sw	%i5, 1130(%i0)
	mov	%i7, %i0
	sw	%i7, 1131(%i0)
loop_start.68197:
	jleq	%i0, %i8, then.69345
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68198
then.69345:
	mov	%i4, %i8
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
	mov	%i6, %i7
	subi	%i1, %i1, 16
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	set_label	%i31, calc_dirvecs.3118
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	addi	%i1, %i1, 16
	subi	%i6, %i8, 1
	addi	%i5, %i5, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.69347
	jzero	%i0, %i0, cont.69348
then.69347:
	subi	%i5, %i5, 5
cont.69348:
	addi	%i4, %i7, 4
	mov	%i8, %i6
	mov	%i7, %i4
cont.69346:
	set_label	%i30, loop_start.68197
	jmp	%i0, 0(%i30)
loop_end.68198:
	mov	%i0, %i31
	movi	%i14, 4
	sw	%i14, 1133(%i0)
loop_start.68202:
	jleq	%i0, %i14, then.69350
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68203
then.69350:
	slli	%i4, %i14, 2
	lw	%i30, 15(%i1)
	add	%i31, %i30, %i4
	lw	%i13, 0(%i31)
	movi	%i12, 119
loop_start.68205:
	jleq	%i0, %i12, then.69353
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68206
then.69353:
	slli	%i4, %i12, 2
	add	%i31, %i13, %i4
	lw	%i4, 0(%i31)
	lw	%i11, 1(%i4)
	lw	%i10, 0(%i4)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i9, %i4, 1
loop_start.68208:
	jleq	%i0, %i9, then.69356
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68209
then.69356:
	slli	%i4, %i9, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i15, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i7, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i4, 1(%i4)
	movi	%i31, 1
	jeq	%i4, %i31, then.69358
	movi	%i31, 2
	jeq	%i4, %i31, then.69360
	movi	%i4, 5
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i5, %i4
	lf	%f6, 0(%i10)
	lf	%f5, 1(%i10)
	lf	%f4, 2(%i10)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i6, %i0, then.69362
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69363
then.69362:
	fmov	%f2, %f3
cont.69363:
	lf	%f3, 0(%i10)
	lf	%f1, 0(%i7)
	fmul	%f1, %f3, %f1
	fneg	%f7, %f1
	lf	%f3, 1(%i10)
	lf	%f1, 1(%i7)
	fmul	%f1, %f3, %f1
	fneg	%f6, %f1
	lf	%f3, 2(%i10)
	lf	%f1, 2(%i7)
	fmul	%f1, %f3, %f1
	fneg	%f1, %f1
	sf	%f2, 0(%i5)
	jeq	%i6, %i0, then.69364
	lf	%f4, 2(%i10)
	lf	%f3, 1(%i15)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i10)
	lf	%f3, 2(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f7, %f3
	sf	%f3, 1(%i5)
	lf	%f4, 2(%i10)
	lf	%f3, 0(%i15)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i10)
	lf	%f3, 2(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f6, %f3
	sf	%f3, 2(%i5)
	lf	%f4, 1(%i10)
	lf	%f3, 0(%i15)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i10)
	lf	%f3, 1(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.69365
then.69364:
	sf	%f7, 1(%i5)
	sf	%f6, 2(%i5)
	sf	%f1, 3(%i5)
cont.69365:
	feq	%i4, %f2, %f0
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.69366
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f2
	fmul	%f1, %f3, %f1
	sf	%f1, 4(%i5)
cont.69366:
	slli	%i4, %i9, 2
	add	%i31, %i11, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.69359
then.69360:
	movi	%i4, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 16
	mov	%i5, %i4
	lf	%f2, 0(%i10)
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i10)
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i10)
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.69367
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	sf	%f1, 0(%i5)
	lf	%f2, 0(%i7)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 1(%i5)
	lf	%f2, 1(%i7)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 2(%i5)
	lf	%f2, 2(%i7)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.69368
then.69367:
	sf	%f0, 0(%i5)
cont.69368:
	slli	%i4, %i9, 2
	add	%i31, %i11, %i4
	sw	%i5, 0(%i31)
cont.69361:
	jzero	%i0, %i0, cont.69359
then.69358:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 24
	mov	%i6, %i4
	lf	%f1, 0(%i10)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69369
	sf	%f0, 1(%i6)
	jzero	%i0, %i0, cont.69370
then.69369:
	lf	%f1, 0(%i10)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i10)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i6)
cont.69370:
	lf	%f1, 1(%i10)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69371
	sf	%f0, 3(%i6)
	jzero	%i0, %i0, cont.69372
then.69371:
	lf	%f1, 1(%i10)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i10)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i6)
cont.69372:
	lf	%f1, 2(%i10)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69373
	sf	%f0, 5(%i6)
	jzero	%i0, %i0, cont.69374
then.69373:
	lf	%f1, 2(%i10)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i10)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i6)
cont.69374:
	slli	%i4, %i9, 2
	add	%i31, %i11, %i4
	sw	%i6, 0(%i31)
cont.69359:
	subi	%i4, %i9, 1
	mov	%i9, %i4
cont.69357:
	set_label	%i30, loop_start.68208
	jmp	%i0, 0(%i30)
loop_end.68209:
	mov	%i0, %i31
	subi	%i4, %i12, 1
	mov	%i12, %i4
cont.69354:
	set_label	%i30, loop_start.68205
	jmp	%i0, 0(%i30)
loop_end.68206:
	mov	%i0, %i31
	subi	%i4, %i14, 1
	mov	%i14, %i4
cont.69351:
	set_label	%i30, loop_start.68202
	jmp	%i0, 0(%i30)
loop_end.68203:
	mov	%i0, %i31
	lf	%f1, 0(%i26)
	sf	%f1, 1137(%i0)
	sf	%f1, 0(%i19)
	lf	%f1, 1(%i26)
	sf	%f1, 1140(%i0)
	sf	%f1, 1(%i19)
	lf	%f1, 2(%i26)
	sf	%f1, 1143(%i0)
	sf	%f1, 2(%i19)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	sw	%i4, 1145(%i0)
	subi	%i9, %i4, 1
	sw	%i9, 1147(%i0)
loop_start.68240:
	jleq	%i0, %i9, then.69376
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68241
then.69376:
	slli	%i4, %i9, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i7, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i4, 1(%i4)
	movi	%i31, 1
	jeq	%i4, %i31, then.69378
	movi	%i31, 2
	jeq	%i4, %i31, then.69380
	movi	%i4, 5
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i5, %i4
	lf	%f6, 0(%i19)
	lf	%f5, 1(%i19)
	lf	%f4, 2(%i19)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i6, %i0, then.69382
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i10)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i10)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i10)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69383
then.69382:
	fmov	%f2, %f3
cont.69383:
	lf	%f3, 0(%i19)
	lf	%f1, 0(%i7)
	fmul	%f1, %f3, %f1
	fneg	%f7, %f1
	lf	%f3, 1(%i19)
	lf	%f1, 1(%i7)
	fmul	%f1, %f3, %f1
	fneg	%f6, %f1
	lf	%f3, 2(%i19)
	lf	%f1, 2(%i7)
	fmul	%f1, %f3, %f1
	fneg	%f1, %f1
	sf	%f2, 0(%i5)
	jeq	%i6, %i0, then.69384
	lf	%f4, 2(%i19)
	lf	%f3, 1(%i10)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i19)
	lf	%f3, 2(%i10)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f7, %f3
	sf	%f3, 1(%i5)
	lf	%f4, 2(%i19)
	lf	%f3, 0(%i10)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i19)
	lf	%f3, 2(%i10)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f6, %f3
	sf	%f3, 2(%i5)
	lf	%f4, 1(%i19)
	lf	%f3, 0(%i10)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i19)
	lf	%f3, 1(%i10)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.69385
then.69384:
	sf	%f7, 1(%i5)
	sf	%f6, 2(%i5)
	sf	%f1, 3(%i5)
cont.69385:
	feq	%i4, %f2, %f0
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.69386
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f2
	fmul	%f1, %f3, %f1
	sf	%f1, 4(%i5)
cont.69386:
	slli	%i4, %i9, 2
	add	%i31, %i18, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.69379
then.69380:
	movi	%i4, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 16
	mov	%i5, %i4
	lf	%f2, 0(%i19)
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i19)
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i19)
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.69387
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	sf	%f1, 0(%i5)
	lf	%f2, 0(%i7)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 1(%i5)
	lf	%f2, 1(%i7)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 2(%i5)
	lf	%f2, 2(%i7)
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.69388
then.69387:
	sf	%f0, 0(%i5)
cont.69388:
	slli	%i4, %i9, 2
	add	%i31, %i18, %i4
	sw	%i5, 0(%i31)
cont.69381:
	jzero	%i0, %i0, cont.69379
then.69378:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 24
	mov	%i6, %i4
	lf	%f1, 0(%i19)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69389
	sf	%f0, 1(%i6)
	jzero	%i0, %i0, cont.69390
then.69389:
	lf	%f1, 0(%i19)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i19)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i6)
cont.69390:
	lf	%f1, 1(%i19)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69391
	sf	%f0, 3(%i6)
	jzero	%i0, %i0, cont.69392
then.69391:
	lf	%f1, 1(%i19)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i19)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i6)
cont.69392:
	lf	%f1, 2(%i19)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69393
	sf	%f0, 5(%i6)
	jzero	%i0, %i0, cont.69394
then.69393:
	lf	%f1, 2(%i19)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i19)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i6)
cont.69394:
	slli	%i4, %i9, 2
	add	%i31, %i18, %i4
	sw	%i6, 0(%i31)
cont.69379:
	subi	%i4, %i9, 1
	mov	%i9, %i4
cont.69377:
	set_label	%i30, loop_start.68240
	jmp	%i0, 0(%i30)
loop_end.68241:
	mov	%i0, %i31
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	sw	%i4, 1150(%i0)
	subi	%i8, %i4, 1
	sw	%i8, 1152(%i0)
	jlt	%i8, %i0, cont.69395
	slli	%i4, %i8, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	lw	%i5, 0(%i31)
	lw	%i7, 7(%i5)
	lw	%i6, 4(%i5)
	lw	%i4, 2(%i5)
	lw	%i5, 1(%i5)
	ceqi	%i31, %i4, 2
	jzero	%i0, %i31, cont.69396
	lf	%f2, 0(%i7)
	movui	%i31, 260096
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.69397
	movi	%i31, 1
	jeq	%i5, %i31, then.69398
	ceqi	%i31, %i5, 2
	jzero	%i0, %i31, cont.69400
	slli	%i4, %i8, 2
	addi	%i13, %i4, 1
	lw	%i12, 0(%i16)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i7)
	fsub	%f3, %f2, %f1
	lf	%f2, 0(%i26)
	lf	%f1, 0(%i6)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i26)
	lf	%f1, 1(%i6)
	fmul	%f1, %f2, %f1
	fadd	%f4, %f4, %f1
	lf	%f2, 2(%i26)
	lf	%f1, 2(%i6)
	fmul	%f1, %f2, %f1
	fadd	%f6, %f4, %f1
	movui	%i31, 262144
	mif	%f2, %i31
	lf	%f1, 0(%i6)
	fmul	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	lf	%f1, 0(%i26)
	fsub	%f5, %f2, %f1
	movui	%i31, 262144
	mif	%f2, %i31
	lf	%f1, 1(%i6)
	fmul	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i26)
	fsub	%f4, %f2, %f1
	movui	%i31, 262144
	mif	%f2, %i31
	lf	%f1, 2(%i6)
	fmul	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	lf	%f1, 2(%i26)
	fsub	%f2, %f2, %f1
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i11, %i4
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i11
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69401:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69402
	jzero	%i0, %i0, ca_done.69403
ca_cont.69402:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69401
	jmp	%i0, 0(%i31)
ca_done.69403:
	mov	%i10, %i4
	sf	%f5, 0(%i11)
	sf	%f4, 1(%i11)
	sf	%f2, 2(%i11)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i9, %i4, 1
loop_start.68271:
	jleq	%i0, %i9, then.69405
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68272
then.69405:
	slli	%i4, %i9, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i14, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i7, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i4, 1(%i4)
	movi	%i31, 1
	jeq	%i4, %i31, then.69407
	movi	%i31, 2
	jeq	%i4, %i31, then.69409
	movi	%i4, 5
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i5, %i4
	lf	%f7, 0(%i11)
	lf	%f6, 1(%i11)
	lf	%f5, 2(%i11)
	fmul	%f2, %f7, %f7
	lf	%f1, 0(%i7)
	fmul	%f4, %f2, %f1
	fmul	%f2, %f6, %f6
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f4, %f4, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f4, %f4, %f1
	jeq	%i6, %i0, then.69411
	fmul	%f2, %f6, %f5
	lf	%f1, 0(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f4, %f4, %f1
	fmul	%f2, %f5, %f7
	lf	%f1, 1(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f4, %f4, %f1
	fmul	%f2, %f7, %f6
	lf	%f1, 2(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f4, %f1
	jzero	%i0, %i0, cont.69412
then.69411:
	fmov	%f2, %f4
cont.69412:
	lf	%f4, 0(%i11)
	lf	%f1, 0(%i7)
	fmul	%f1, %f4, %f1
	fneg	%f8, %f1
	lf	%f4, 1(%i11)
	lf	%f1, 1(%i7)
	fmul	%f1, %f4, %f1
	fneg	%f7, %f1
	lf	%f4, 2(%i11)
	lf	%f1, 2(%i7)
	fmul	%f1, %f4, %f1
	fneg	%f1, %f1
	sf	%f2, 0(%i5)
	jeq	%i6, %i0, then.69413
	lf	%f5, 2(%i11)
	lf	%f4, 1(%i14)
	fmul	%f6, %f5, %f4
	lf	%f5, 1(%i11)
	lf	%f4, 2(%i14)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f6, %f4
	movui	%i31, 258048
	mif	%f4, %i31
	fmul	%f4, %f5, %f4
	fsub	%f4, %f8, %f4
	sf	%f4, 1(%i5)
	lf	%f5, 2(%i11)
	lf	%f4, 0(%i14)
	fmul	%f6, %f5, %f4
	lf	%f5, 0(%i11)
	lf	%f4, 2(%i14)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f6, %f4
	movui	%i31, 258048
	mif	%f4, %i31
	fmul	%f4, %f5, %f4
	fsub	%f4, %f7, %f4
	sf	%f4, 2(%i5)
	lf	%f5, 1(%i11)
	lf	%f4, 0(%i14)
	fmul	%f6, %f5, %f4
	lf	%f5, 0(%i11)
	lf	%f4, 1(%i14)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f6, %f4
	movui	%i31, 258048
	mif	%f4, %i31
	fmul	%f4, %f5, %f4
	fsub	%f1, %f1, %f4
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.69414
then.69413:
	sf	%f8, 1(%i5)
	sf	%f7, 2(%i5)
	sf	%f1, 3(%i5)
cont.69414:
	feq	%i4, %f2, %f0
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.69415
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f2
	fmul	%f1, %f4, %f1
	sf	%f1, 4(%i5)
cont.69415:
	slli	%i4, %i9, 2
	add	%i31, %i10, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.69408
then.69409:
	movi	%i4, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 16
	mov	%i5, %i4
	lf	%f2, 0(%i11)
	lf	%f1, 0(%i7)
	fmul	%f4, %f2, %f1
	lf	%f2, 1(%i11)
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f4, %f4, %f1
	lf	%f2, 2(%i11)
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f4, %f4, %f1
	flt	%i4, %f0, %f4
	jeq	%i4, %i0, then.69416
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f4
	fmul	%f1, %f2, %f1
	sf	%f1, 0(%i5)
	lf	%f2, 0(%i7)
	finv	%f1, %f4
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 1(%i5)
	lf	%f2, 1(%i7)
	finv	%f1, %f4
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 2(%i5)
	lf	%f2, 2(%i7)
	finv	%f1, %f4
	fmul	%f1, %f2, %f1
	fneg	%f1, %f1
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.69417
then.69416:
	sf	%f0, 0(%i5)
cont.69417:
	slli	%i4, %i9, 2
	add	%i31, %i10, %i4
	sw	%i5, 0(%i31)
cont.69410:
	jzero	%i0, %i0, cont.69408
then.69407:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 24
	mov	%i6, %i4
	lf	%f1, 0(%i11)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69418
	sf	%f0, 1(%i6)
	jzero	%i0, %i0, cont.69419
then.69418:
	lf	%f1, 0(%i11)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i11)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i6)
cont.69419:
	lf	%f1, 1(%i11)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69420
	sf	%f0, 3(%i6)
	jzero	%i0, %i0, cont.69421
then.69420:
	lf	%f1, 1(%i11)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i11)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i6)
cont.69421:
	lf	%f1, 2(%i11)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69422
	sf	%f0, 5(%i6)
	jzero	%i0, %i0, cont.69423
then.69422:
	lf	%f1, 2(%i11)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i6)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i11)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i6)
cont.69423:
	slli	%i4, %i9, 2
	add	%i31, %i10, %i4
	sw	%i6, 0(%i31)
cont.69408:
	subi	%i4, %i9, 1
	mov	%i9, %i4
cont.69406:
	set_label	%i30, loop_start.68271
	jmp	%i0, 0(%i30)
loop_end.68272:
	mov	%i0, %i31
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f3, 4(%i4)
	sw	%i10, 2(%i4)
	sw	%i11, 1(%i4)
	sw	%i13, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i12, 2
	add	%i31, %i17, %i4
	sw	%i5, 0(%i31)
	addi	%i4, %i12, 1
	sw	%i4, 0(%i16)
cont.69400:
	jzero	%i0, %i0, cont.69399
then.69398:
	slli	%i18, %i8, 2
	lw	%i6, 0(%i16)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i7)
	fsub	%f7, %f2, %f1
	lf	%f1, 0(%i26)
	fneg	%f6, %f1
	lf	%f1, 1(%i26)
	fneg	%f5, %f1
	lf	%f1, 2(%i26)
	fneg	%f4, %f1
	addi	%i13, %i18, 1
	lf	%f2, 0(%i26)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i12, %i4
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i12
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69424:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69425
	jzero	%i0, %i0, ca_done.69426
ca_cont.69425:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69424
	jmp	%i0, 0(%i31)
ca_done.69426:
	mov	%i11, %i4
	sf	%f2, 0(%i12)
	sf	%f5, 1(%i12)
	sf	%f4, 2(%i12)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i10, %i4, 1
loop_start.68307:
	jleq	%i0, %i10, then.69428
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68308
then.69428:
	slli	%i4, %i10, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i14, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i4, 1(%i4)
	movi	%i31, 1
	jeq	%i4, %i31, then.69430
	movi	%i31, 2
	jeq	%i4, %i31, then.69432
	movi	%i4, 5
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i5, %i4
	lf	%f10, 0(%i12)
	lf	%f9, 1(%i12)
	lf	%f8, 2(%i12)
	fmul	%f2, %f10, %f10
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f9, %f9
	lf	%f1, 1(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f8, %f8
	lf	%f1, 2(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i7, %i0, then.69434
	fmul	%f2, %f9, %f8
	lf	%f1, 0(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f8, %f10
	lf	%f1, 1(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f10, %f9
	lf	%f1, 2(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jzero	%i0, %i0, cont.69435
then.69434:
cont.69435:
	lf	%f2, 0(%i12)
	lf	%f1, 0(%i8)
	fmul	%f1, %f2, %f1
	fneg	%f11, %f1
	lf	%f2, 1(%i12)
	lf	%f1, 1(%i8)
	fmul	%f1, %f2, %f1
	fneg	%f2, %f1
	lf	%f8, 2(%i12)
	lf	%f1, 2(%i8)
	fmul	%f1, %f8, %f1
	fneg	%f1, %f1
	sf	%f3, 0(%i5)
	jeq	%i7, %i0, then.69436
	lf	%f9, 2(%i12)
	lf	%f8, 1(%i14)
	fmul	%f10, %f9, %f8
	lf	%f9, 1(%i12)
	lf	%f8, 2(%i14)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	movui	%i31, 258048
	mif	%f8, %i31
	fmul	%f8, %f9, %f8
	fsub	%f8, %f11, %f8
	sf	%f8, 1(%i5)
	lf	%f9, 2(%i12)
	lf	%f8, 0(%i14)
	fmul	%f10, %f9, %f8
	lf	%f9, 0(%i12)
	lf	%f8, 2(%i14)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	movui	%i31, 258048
	mif	%f8, %i31
	fmul	%f8, %f9, %f8
	fsub	%f2, %f2, %f8
	sf	%f2, 2(%i5)
	lf	%f8, 1(%i12)
	lf	%f2, 0(%i14)
	fmul	%f9, %f8, %f2
	lf	%f8, 0(%i12)
	lf	%f2, 1(%i14)
	fmul	%f2, %f8, %f2
	fadd	%f8, %f9, %f2
	movui	%i31, 258048
	mif	%f2, %i31
	fmul	%f2, %f8, %f2
	fsub	%f1, %f1, %f2
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.69437
then.69436:
	sf	%f11, 1(%i5)
	sf	%f2, 2(%i5)
	sf	%f1, 3(%i5)
cont.69437:
	feq	%i4, %f3, %f0
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.69438
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	sf	%f1, 4(%i5)
cont.69438:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.69431
then.69432:
	movi	%i4, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 16
	mov	%i5, %i4
	lf	%f2, 0(%i12)
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i12)
	lf	%f1, 1(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i12)
	lf	%f1, 2(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.69439
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
	jzero	%i0, %i0, cont.69440
then.69439:
	sf	%f0, 0(%i5)
cont.69440:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	sw	%i5, 0(%i31)
cont.69433:
	jzero	%i0, %i0, cont.69431
then.69430:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 24
	mov	%i7, %i4
	lf	%f1, 0(%i12)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69441
	sf	%f0, 1(%i7)
	jzero	%i0, %i0, cont.69442
then.69441:
	lf	%f1, 0(%i12)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i8)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i12)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i7)
cont.69442:
	lf	%f1, 1(%i12)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69443
	sf	%f0, 3(%i7)
	jzero	%i0, %i0, cont.69444
then.69443:
	lf	%f1, 1(%i12)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i8)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i12)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i7)
cont.69444:
	lf	%f1, 2(%i12)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69445
	sf	%f0, 5(%i7)
	jzero	%i0, %i0, cont.69446
then.69445:
	lf	%f1, 2(%i12)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i8)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i12)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i7)
cont.69446:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	sw	%i7, 0(%i31)
cont.69431:
	subi	%i4, %i10, 1
	mov	%i10, %i4
cont.69429:
	set_label	%i30, loop_start.68307
	jmp	%i0, 0(%i30)
loop_end.68308:
	mov	%i0, %i31
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f7, 4(%i4)
	sw	%i11, 2(%i4)
	sw	%i12, 1(%i4)
	sw	%i13, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i6, 2
	add	%i31, %i17, %i4
	sw	%i5, 0(%i31)
	addi	%i14, %i6, 1
	addi	%i13, %i18, 2
	lf	%f2, 1(%i26)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i12, %i4
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i12
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69447:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69448
	jzero	%i0, %i0, ca_done.69449
ca_cont.69448:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69447
	jmp	%i0, 0(%i31)
ca_done.69449:
	mov	%i11, %i4
	sf	%f6, 0(%i12)
	sf	%f2, 1(%i12)
	sf	%f4, 2(%i12)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i10, %i4, 1
loop_start.68343:
	jleq	%i0, %i10, then.69451
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68344
then.69451:
	slli	%i4, %i10, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i15, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i4, 1(%i4)
	movi	%i31, 1
	jeq	%i4, %i31, then.69453
	movi	%i31, 2
	jeq	%i4, %i31, then.69455
	movi	%i4, 5
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i5, %i4
	lf	%f9, 0(%i12)
	lf	%f8, 1(%i12)
	lf	%f4, 2(%i12)
	fmul	%f2, %f9, %f9
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f8, %f8
	lf	%f1, 1(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i7, %i0, then.69457
	fmul	%f2, %f8, %f4
	lf	%f1, 0(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f9
	lf	%f1, 1(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f9, %f8
	lf	%f1, 2(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69458
then.69457:
	fmov	%f2, %f3
cont.69458:
	lf	%f3, 0(%i12)
	lf	%f1, 0(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f10, %f1
	lf	%f3, 1(%i12)
	lf	%f1, 1(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f9, %f1
	lf	%f3, 2(%i12)
	lf	%f1, 2(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f1, %f1
	sf	%f2, 0(%i5)
	jeq	%i7, %i0, then.69459
	lf	%f4, 2(%i12)
	lf	%f3, 1(%i15)
	fmul	%f8, %f4, %f3
	lf	%f4, 1(%i12)
	lf	%f3, 2(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f8, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f10, %f3
	sf	%f3, 1(%i5)
	lf	%f4, 2(%i12)
	lf	%f3, 0(%i15)
	fmul	%f8, %f4, %f3
	lf	%f4, 0(%i12)
	lf	%f3, 2(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f8, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f9, %f3
	sf	%f3, 2(%i5)
	lf	%f4, 1(%i12)
	lf	%f3, 0(%i15)
	fmul	%f8, %f4, %f3
	lf	%f4, 0(%i12)
	lf	%f3, 1(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f8, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.69460
then.69459:
	sf	%f10, 1(%i5)
	sf	%f9, 2(%i5)
	sf	%f1, 3(%i5)
cont.69460:
	feq	%i4, %f2, %f0
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.69461
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f2
	fmul	%f1, %f3, %f1
	sf	%f1, 4(%i5)
cont.69461:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.69454
then.69455:
	movi	%i4, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 16
	mov	%i5, %i4
	lf	%f2, 0(%i12)
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i12)
	lf	%f1, 1(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i12)
	lf	%f1, 2(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.69462
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
	jzero	%i0, %i0, cont.69463
then.69462:
	sf	%f0, 0(%i5)
cont.69463:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	sw	%i5, 0(%i31)
cont.69456:
	jzero	%i0, %i0, cont.69454
then.69453:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 24
	mov	%i7, %i4
	lf	%f1, 0(%i12)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69464
	sf	%f0, 1(%i7)
	jzero	%i0, %i0, cont.69465
then.69464:
	lf	%f1, 0(%i12)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i8)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i12)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i7)
cont.69465:
	lf	%f1, 1(%i12)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69466
	sf	%f0, 3(%i7)
	jzero	%i0, %i0, cont.69467
then.69466:
	lf	%f1, 1(%i12)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i8)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i12)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i7)
cont.69467:
	lf	%f1, 2(%i12)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69468
	sf	%f0, 5(%i7)
	jzero	%i0, %i0, cont.69469
then.69468:
	lf	%f1, 2(%i12)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i8)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i12)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i7)
cont.69469:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	sw	%i7, 0(%i31)
cont.69454:
	subi	%i4, %i10, 1
	mov	%i10, %i4
cont.69452:
	set_label	%i30, loop_start.68343
	jmp	%i0, 0(%i30)
loop_end.68344:
	mov	%i0, %i31
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f7, 4(%i4)
	sw	%i11, 2(%i4)
	sw	%i12, 1(%i4)
	sw	%i13, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i14, 2
	add	%i31, %i17, %i4
	sw	%i5, 0(%i31)
	addi	%i14, %i6, 2
	addi	%i13, %i18, 3
	lf	%f2, 2(%i26)
	movi	%i4, 3
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 12
	mov	%i12, %i4
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	mov	%i5, %i12
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69470:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69471
	jzero	%i0, %i0, ca_done.69472
ca_cont.69471:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69470
	jmp	%i0, 0(%i31)
ca_done.69472:
	mov	%i11, %i4
	sf	%f6, 0(%i12)
	sf	%f5, 1(%i12)
	sf	%f2, 2(%i12)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i10, %i4, 1
loop_start.68379:
	jleq	%i0, %i10, then.69474
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68380
then.69474:
	slli	%i4, %i10, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i15, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i8, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i4, 1(%i4)
	movi	%i31, 1
	jeq	%i4, %i31, then.69476
	movi	%i31, 2
	jeq	%i4, %i31, then.69478
	movi	%i4, 5
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 20
	mov	%i5, %i4
	lf	%f6, 0(%i12)
	lf	%f5, 1(%i12)
	lf	%f4, 2(%i12)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i7, %i0, then.69480
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69481
then.69480:
	fmov	%f2, %f3
cont.69481:
	lf	%f3, 0(%i12)
	lf	%f1, 0(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f8, %f1
	lf	%f3, 1(%i12)
	lf	%f1, 1(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f6, %f1
	lf	%f3, 2(%i12)
	lf	%f1, 2(%i8)
	fmul	%f1, %f3, %f1
	fneg	%f1, %f1
	sf	%f2, 0(%i5)
	jeq	%i7, %i0, then.69482
	lf	%f4, 2(%i12)
	lf	%f3, 1(%i15)
	fmul	%f5, %f4, %f3
	lf	%f4, 1(%i12)
	lf	%f3, 2(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f8, %f3
	sf	%f3, 1(%i5)
	lf	%f4, 2(%i12)
	lf	%f3, 0(%i15)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i12)
	lf	%f3, 2(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f3, %f6, %f3
	sf	%f3, 2(%i5)
	lf	%f4, 1(%i12)
	lf	%f3, 0(%i15)
	fmul	%f5, %f4, %f3
	lf	%f4, 0(%i12)
	lf	%f3, 1(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fsub	%f1, %f1, %f3
	sf	%f1, 3(%i5)
	jzero	%i0, %i0, cont.69483
then.69482:
	sf	%f8, 1(%i5)
	sf	%f6, 2(%i5)
	sf	%f1, 3(%i5)
cont.69483:
	feq	%i4, %f2, %f0
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.69484
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f2
	fmul	%f1, %f3, %f1
	sf	%f1, 4(%i5)
cont.69484:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	sw	%i5, 0(%i31)
	jzero	%i0, %i0, cont.69477
then.69478:
	movi	%i4, 4
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 16
	mov	%i5, %i4
	lf	%f2, 0(%i12)
	lf	%f1, 0(%i8)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i12)
	lf	%f1, 1(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i12)
	lf	%f1, 2(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.69485
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
	jzero	%i0, %i0, cont.69486
then.69485:
	sf	%f0, 0(%i5)
cont.69486:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	sw	%i5, 0(%i31)
cont.69479:
	jzero	%i0, %i0, cont.69477
then.69476:
	movi	%i4, 6
	fmov	%f1, %f0
	mov	%i4, %i2
	addi	%i2, %i2, 24
	mov	%i7, %i4
	lf	%f1, 0(%i12)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69487
	sf	%f0, 1(%i7)
	jzero	%i0, %i0, cont.69488
then.69487:
	lf	%f1, 0(%i12)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i8)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i12)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 1(%i7)
cont.69488:
	lf	%f1, 1(%i12)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69489
	sf	%f0, 3(%i7)
	jzero	%i0, %i0, cont.69490
then.69489:
	lf	%f1, 1(%i12)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i8)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 1(%i12)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 3(%i7)
cont.69490:
	lf	%f1, 2(%i12)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69491
	sf	%f0, 5(%i7)
	jzero	%i0, %i0, cont.69492
then.69491:
	lf	%f1, 2(%i12)
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i8)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	sf	%f1, 4(%i7)
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 2(%i12)
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	sf	%f1, 5(%i7)
cont.69492:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	sw	%i7, 0(%i31)
cont.69477:
	subi	%i4, %i10, 1
	mov	%i10, %i4
cont.69475:
	set_label	%i30, loop_start.68379
	jmp	%i0, 0(%i30)
loop_end.68380:
	mov	%i0, %i31
	mov	%i4, %i2
	addi	%i2, %i2, 24
	sf	%f7, 4(%i4)
	sw	%i11, 2(%i4)
	sw	%i12, 1(%i4)
	sw	%i13, 0(%i4)
	mov	%i5, %i4
	slli	%i4, %i14, 2
	add	%i31, %i17, %i4
	sw	%i5, 0(%i31)
	addi	%i4, %i6, 3
	sw	%i4, 0(%i16)
cont.69399:
cont.69397:
cont.69396:
cont.69395:
	mov	%i21, %i0
	sw	%i21, 1155(%i0)
	lw	%i31, 8(%i1)
	lf	%f2, 0(%i31)
	sf	%f2, 1157(%i0)
	lw	%i31, 7(%i1)
	lw	%i4, 1(%i31)
	sw	%i4, 1159(%i0)
	sub	%i4, %i0, %i4
	sw	%i4, 1160(%i0)
	itof	%f1, %i4
	sf	%f1, 1161(%i0)
	fmul	%f3, %f2, %f1
	sf	%f3, 1162(%i0)
	lw	%i31, 12(%i1)
	lf	%f1, 0(%i31)
	sf	%f1, 1164(%i0)
	fmul	%f2, %f3, %f1
	sf	%f2, 1165(%i0)
	lw	%i31, 13(%i1)
	lf	%f1, 0(%i31)
	sf	%f1, 1167(%i0)
	fadd	%f18, %f2, %f1
	sf	%f18, 1168(%i0)
	lw	%i31, 12(%i1)
	lf	%f1, 1(%i31)
	sf	%f1, 1170(%i0)
	fmul	%f2, %f3, %f1
	sf	%f2, 1171(%i0)
	lw	%i31, 13(%i1)
	lf	%f1, 1(%i31)
	sf	%f1, 1173(%i0)
	fadd	%f17, %f2, %f1
	sf	%f17, 1174(%i0)
	lw	%i31, 12(%i1)
	lf	%f1, 2(%i31)
	sf	%f1, 1176(%i0)
	fmul	%f2, %f3, %f1
	sf	%f2, 1177(%i0)
	lw	%i31, 13(%i1)
	lf	%f1, 2(%i31)
	sf	%f1, 1179(%i0)
	fadd	%f16, %f2, %f1
	sf	%f16, 1180(%i0)
	lw	%i31, 6(%i1)
	lw	%i4, 0(%i31)
	sw	%i4, 1182(%i0)
	subi	%i20, %i4, 1
	sw	%i20, 1184(%i0)
loop_start.68415:
	jleq	%i0, %i20, then.69494
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68416
then.69494:
	lw	%i31, 8(%i1)
	lf	%f2, 0(%i31)
	lw	%i31, 7(%i1)
	lw	%i4, 0(%i31)
	sub	%i4, %i20, %i4
	itof	%f1, %i4
	fmul	%f2, %f2, %f1
	lw	%i31, 11(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f1, %f18
	lw	%i31, 14(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 11(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f1, %f17
	lw	%i31, 14(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 11(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f1, %f16
	lw	%i31, 14(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 14(%i1)
	lf	%f1, 0(%i31)
	fmul	%f2, %f1, %f1
	lw	%i31, 14(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i31, 14(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69496
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.69497
then.69496:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.69497:
	lw	%i31, 14(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f1, %f2
	lw	%i31, 14(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 14(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f1, %f2
	lw	%i31, 14(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 14(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f1, %f2
	lw	%i31, 14(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 5(%i1)
	sf	%f0, 0(%i31)
	lw	%i31, 5(%i1)
	sf	%f0, 1(%i31)
	lw	%i31, 5(%i1)
	sf	%f0, 2(%i31)
	lf	%f1, 0(%i27)
	lw	%i31, 9(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i27)
	lw	%i31, 9(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i27)
	lw	%i31, 9(%i1)
	sf	%f1, 2(%i31)
	movui	%i31, 260096
	mif	%f1, %i31
	slli	%i4, %i20, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i13, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	mov	%i4, %i0
	lw	%i31, 14(%i1)
	mov	%i5, %i31
	fmov	%f2, %f0
	subi	%i1, %i1, 40
	sw	%i20, 0(%i1)
	sw	%i21, 1(%i1)
	sw	%i22, 2(%i1)
	sw	%i23, 3(%i1)
	sw	%i24, 4(%i1)
	sw	%i25, 5(%i1)
	sw	%i26, 6(%i1)
	sw	%i27, 7(%i1)
	sf	%f16, 8(%i1)
	sf	%f17, 9(%i1)
	set_label	%i31, trace_ray.3008
	jmp	%i3, 0(%i31)
	lw	%i20, 0(%i1)
	lw	%i21, 1(%i1)
	lw	%i22, 2(%i1)
	lw	%i23, 3(%i1)
	lw	%i24, 4(%i1)
	lw	%i25, 5(%i1)
	lw	%i26, 6(%i1)
	lw	%i27, 7(%i1)
	lf	%f16, 8(%i1)
	lf	%f17, 9(%i1)
	addi	%i1, %i1, 40
	slli	%i4, %i20, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lw	%i31, 5(%i1)
	lf	%f1, 0(%i31)
	sf	%f1, 0(%i4)
	lw	%i31, 5(%i1)
	lf	%f1, 1(%i31)
	sf	%f1, 1(%i4)
	lw	%i31, 5(%i1)
	lf	%f1, 2(%i31)
	sf	%f1, 2(%i4)
	slli	%i4, %i20, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	sw	%i21, 0(%i4)
	slli	%i4, %i20, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i19, 7(%i4)
	lw	%i18, 6(%i4)
	lw	%i17, 5(%i4)
	lw	%i16, 3(%i4)
	lw	%i31, 2(%i4)
	sw	%i31, 19(%i1)
	lw	%i31, 1(%i4)
	sw	%i31, 20(%i1)
	mov	%i31, %i0
	sw	%i31, 21(%i1)
loop_start.68423:
	movi	%i31, 4
	lw	%i30, 21(%i1)
	jleq	%i30, %i31, then.69499
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68424
then.69499:
	lw	%i31, 21(%i1)
	slli	%i4, %i31, 2
	lw	%i30, 19(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.69501
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68424
then.69501:
	lw	%i31, 21(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.69503
	lw	%i4, 0(%i18)
	lw	%i31, 4(%i1)
	sf	%f0, 0(%i31)
	lw	%i31, 4(%i1)
	sf	%f0, 1(%i31)
	lw	%i31, 4(%i1)
	sf	%f0, 2(%i31)
	slli	%i4, %i4, 2
	lw	%i30, 15(%i1)
	add	%i31, %i30, %i4
	lw	%i30, 0(%i31)
	sw	%i30, 22(%i1)
	lw	%i31, 21(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i19, %i4
	lw	%i30, 0(%i31)
	sw	%i30, 23(%i1)
	lw	%i31, 21(%i1)
	slli	%i4, %i31, 2
	lw	%i30, 20(%i1)
	add	%i31, %i30, %i4
	lw	%i11, 0(%i31)
	lf	%f1, 0(%i11)
	lw	%i31, 10(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i11)
	lw	%i31, 10(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i11)
	lw	%i31, 10(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 0(%i1)
	lw	%i4, 0(%i31)
	subi	%i10, %i4, 1
loop_start.68430:
	jleq	%i0, %i10, then.69505
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68431
then.69505:
	slli	%i4, %i10, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i9, 10(%i4)
	lw	%i8, 9(%i4)
	lw	%i7, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f2, 0(%i11)
	lf	%f1, 0(%i7)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i9)
	lf	%f2, 1(%i11)
	lf	%f1, 1(%i7)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i9)
	lf	%f2, 2(%i11)
	lf	%f1, 2(%i7)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i9)
	movi	%i31, 2
	jeq	%i4, %i31, then.69507
	movi	%i31, 2
	jleq	%i4, %i31, cont.69509
	lf	%f6, 0(%i9)
	lf	%f5, 1(%i9)
	lf	%f4, 2(%i9)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i6)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i6)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i6)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i5, %i0, then.69510
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i8)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69511
then.69510:
	fmov	%f2, %f3
cont.69511:
	movi	%i31, 3
	jeq	%i4, %i31, then.69512
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.69513
then.69512:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.69513:
	sf	%f1, 3(%i9)
cont.69509:
	jzero	%i0, %i0, cont.69508
then.69507:
	lf	%f2, 0(%i9)
	lf	%f4, 1(%i9)
	lf	%f3, 2(%i9)
	lf	%f1, 0(%i6)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i6)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i6)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	sf	%f1, 3(%i9)
cont.69508:
	subi	%i4, %i10, 1
	mov	%i10, %i4
cont.69506:
	set_label	%i30, loop_start.68430
	jmp	%i0, 0(%i30)
loop_end.68431:
	mov	%i0, %i31
	movi	%i31, 118
	sw	%i31, 24(%i1)
loop_start.68434:
	lw	%i31, 24(%i1)
	jleq	%i0, %i31, then.69515
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68435
then.69515:
	lw	%i31, 24(%i1)
	slli	%i4, %i31, 2
	lw	%i30, 22(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lw	%i31, 23(%i1)
	lf	%f1, 0(%i31)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i4)
	lw	%i31, 23(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i4)
	lw	%i31, 23(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.69517
	lw	%i31, 24(%i1)
	addi	%i4, %i31, 1
	slli	%i4, %i4, 2
	lw	%i30, 22(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f4, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i4, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	sw	%i20, 5(%i1)
	sf	%f4, 6(%i1)
	set_label	%i31, judge_intersection_fast.2985
	jmp	%i3, 0(%i31)
	lw	%i4, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	lw	%i20, 5(%i1)
	lf	%f4, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i5, %i30
	jeq	%i5, %i0, cont.69519
	lw	%i5, 0(%i22)
	slli	%i5, %i5, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i5
	lw	%i5, 0(%i31)
	lw	%i15, 10(%i5)
	lw	%i14, 9(%i5)
	lw	%i13, 8(%i5)
	lw	%i28, 7(%i5)
	lw	%i12, 6(%i5)
	lw	%i11, 5(%i5)
	lw	%i10, 4(%i5)
	lw	%i9, 3(%i5)
	lw	%i8, 2(%i5)
	lw	%i7, 1(%i5)
	lw	%i6, 0(%i5)
	movi	%i31, 1
	jeq	%i7, %i31, then.69520
	movi	%i31, 2
	jeq	%i7, %i31, then.69522
	lf	%f2, 0(%i23)
	lf	%f1, 0(%i11)
	fsub	%f3, %f2, %f1
	lf	%f2, 1(%i23)
	lf	%f1, 1(%i11)
	fsub	%f2, %f2, %f1
	lf	%f5, 2(%i23)
	lf	%f1, 2(%i11)
	fsub	%f9, %f5, %f1
	lf	%f1, 0(%i10)
	fmul	%f8, %f3, %f1
	lf	%f1, 1(%i10)
	fmul	%f7, %f2, %f1
	lf	%f1, 2(%i10)
	fmul	%f1, %f9, %f1
	jeq	%i9, %i0, then.69524
	lf	%f5, 2(%i14)
	fmul	%f6, %f2, %f5
	lf	%f5, 1(%i14)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f8, %f5
	lw	%i31, 2(%i1)
	sf	%f5, 0(%i31)
	lf	%f5, 2(%i14)
	fmul	%f6, %f3, %f5
	lf	%f5, 0(%i14)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f7, %f5
	lw	%i31, 2(%i1)
	sf	%f5, 1(%i31)
	lf	%f5, 1(%i14)
	fmul	%f5, %f3, %f5
	lf	%f3, 0(%i14)
	fmul	%f2, %f2, %f3
	fadd	%f3, %f5, %f2
	movui	%i31, 258048
	mif	%f2, %i31
	fmul	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
	lw	%i31, 2(%i1)
	sf	%f1, 2(%i31)
	jzero	%i0, %i0, cont.69525
then.69524:
	lw	%i31, 2(%i1)
	sf	%f8, 0(%i31)
	lw	%i31, 2(%i1)
	sf	%f7, 1(%i31)
	lw	%i31, 2(%i1)
	sf	%f1, 2(%i31)
cont.69525:
	lw	%i31, 2(%i1)
	lf	%f1, 0(%i31)
	fmul	%f2, %f1, %f1
	lw	%i31, 2(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i31, 2(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69526
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.69527
then.69526:
	jeq	%i12, %i0, then.69528
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.69529
then.69528:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.69529:
cont.69527:
	lw	%i31, 2(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f1, %f2
	lw	%i31, 2(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 2(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f1, %f2
	lw	%i31, 2(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 2(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f1, %f2
	lw	%i31, 2(%i1)
	sf	%f1, 2(%i31)
	jzero	%i0, %i0, cont.69521
then.69522:
	lf	%f1, 0(%i10)
	fneg	%f1, %f1
	lw	%i31, 2(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i10)
	fneg	%f1, %f1
	lw	%i31, 2(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i10)
	fneg	%f1, %f1
	lw	%i31, 2(%i1)
	sf	%f1, 2(%i31)
cont.69523:
	jzero	%i0, %i0, cont.69521
then.69520:
	lw	%i5, 0(%i24)
	lw	%i31, 2(%i1)
	sf	%f0, 0(%i31)
	lw	%i31, 2(%i1)
	sf	%f0, 1(%i31)
	lw	%i31, 2(%i1)
	sf	%f0, 2(%i31)
	subi	%i5, %i5, 1
	slli	%i29, %i5, 2
	add	%i31, %i4, %i29
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69530
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.69531
then.69530:
	flt	%i4, %f0, %f1
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
cont.69531:
	fneg	%f1, %f1
	slli	%i4, %i5, 2
	lw	%i30, 2(%i1)
	add	%i31, %i30, %i4
	sf	%f1, 0(%i31)
cont.69521:
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i28
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i23
	subi	%i1, %i1, 8
	sf	%f4, 0(%i1)
	set_label	%i31, utexture.2996
	jmp	%i3, 0(%i31)
	lf	%f4, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i5, 0(%i25)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i16, 0(%i1)
	sw	%i17, 1(%i1)
	sf	%f4, 2(%i1)
	set_label	%i31, shadow_check_one_or_matrix.2956
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	lw	%i17, 1(%i1)
	lf	%f4, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.69532
	lw	%i31, 2(%i1)
	lf	%f2, 0(%i31)
	lf	%f1, 0(%i26)
	fmul	%f3, %f2, %f1
	lw	%i31, 2(%i1)
	lf	%f2, 1(%i31)
	lf	%f1, 1(%i26)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lw	%i31, 2(%i1)
	lf	%f2, 2(%i31)
	lf	%f1, 2(%i26)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.69533
	jzero	%i0, %i0, cont.69534
then.69533:
	fmov	%f1, %f0
cont.69534:
	fmul	%f2, %f4, %f1
	lf	%f1, 0(%i28)
	fmul	%f3, %f2, %f1
	lw	%i31, 4(%i1)
	lf	%f2, 0(%i31)
	lw	%i31, 3(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 1(%i31)
	lw	%i31, 3(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 2(%i31)
	lw	%i31, 3(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 2(%i31)
cont.69532:
cont.69519:
	jzero	%i0, %i0, cont.69518
then.69517:
	lw	%i31, 24(%i1)
	slli	%i4, %i31, 2
	lw	%i30, 22(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f4, %f2, %f1
	subi	%i1, %i1, 32
	sw	%i4, 0(%i1)
	sw	%i16, 1(%i1)
	sw	%i17, 2(%i1)
	sw	%i18, 3(%i1)
	sw	%i19, 4(%i1)
	sw	%i20, 5(%i1)
	sf	%f4, 6(%i1)
	set_label	%i31, judge_intersection_fast.2985
	jmp	%i3, 0(%i31)
	lw	%i4, 0(%i1)
	lw	%i16, 1(%i1)
	lw	%i17, 2(%i1)
	lw	%i18, 3(%i1)
	lw	%i19, 4(%i1)
	lw	%i20, 5(%i1)
	lf	%f4, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i5, %i30
	jeq	%i5, %i0, cont.69535
	lw	%i5, 0(%i22)
	slli	%i5, %i5, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i5
	lw	%i5, 0(%i31)
	lw	%i15, 10(%i5)
	lw	%i14, 9(%i5)
	lw	%i13, 8(%i5)
	lw	%i28, 7(%i5)
	lw	%i12, 6(%i5)
	lw	%i11, 5(%i5)
	lw	%i10, 4(%i5)
	lw	%i9, 3(%i5)
	lw	%i8, 2(%i5)
	lw	%i7, 1(%i5)
	lw	%i6, 0(%i5)
	movi	%i31, 1
	jeq	%i7, %i31, then.69536
	movi	%i31, 2
	jeq	%i7, %i31, then.69538
	lf	%f2, 0(%i23)
	lf	%f1, 0(%i11)
	fsub	%f3, %f2, %f1
	lf	%f2, 1(%i23)
	lf	%f1, 1(%i11)
	fsub	%f2, %f2, %f1
	lf	%f5, 2(%i23)
	lf	%f1, 2(%i11)
	fsub	%f9, %f5, %f1
	lf	%f1, 0(%i10)
	fmul	%f8, %f3, %f1
	lf	%f1, 1(%i10)
	fmul	%f7, %f2, %f1
	lf	%f1, 2(%i10)
	fmul	%f1, %f9, %f1
	jeq	%i9, %i0, then.69540
	lf	%f5, 2(%i14)
	fmul	%f6, %f2, %f5
	lf	%f5, 1(%i14)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f8, %f5
	lw	%i31, 2(%i1)
	sf	%f5, 0(%i31)
	lf	%f5, 2(%i14)
	fmul	%f6, %f3, %f5
	lf	%f5, 0(%i14)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f7, %f5
	lw	%i31, 2(%i1)
	sf	%f5, 1(%i31)
	lf	%f5, 1(%i14)
	fmul	%f5, %f3, %f5
	lf	%f3, 0(%i14)
	fmul	%f2, %f2, %f3
	fadd	%f3, %f5, %f2
	movui	%i31, 258048
	mif	%f2, %i31
	fmul	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
	lw	%i31, 2(%i1)
	sf	%f1, 2(%i31)
	jzero	%i0, %i0, cont.69541
then.69540:
	lw	%i31, 2(%i1)
	sf	%f8, 0(%i31)
	lw	%i31, 2(%i1)
	sf	%f7, 1(%i31)
	lw	%i31, 2(%i1)
	sf	%f1, 2(%i31)
cont.69541:
	lw	%i31, 2(%i1)
	lf	%f1, 0(%i31)
	fmul	%f2, %f1, %f1
	lw	%i31, 2(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i31, 2(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69542
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.69543
then.69542:
	jeq	%i12, %i0, then.69544
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.69545
then.69544:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.69545:
cont.69543:
	lw	%i31, 2(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f1, %f2
	lw	%i31, 2(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 2(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f1, %f2
	lw	%i31, 2(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 2(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f1, %f2
	lw	%i31, 2(%i1)
	sf	%f1, 2(%i31)
	jzero	%i0, %i0, cont.69537
then.69538:
	lf	%f1, 0(%i10)
	fneg	%f1, %f1
	lw	%i31, 2(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i10)
	fneg	%f1, %f1
	lw	%i31, 2(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i10)
	fneg	%f1, %f1
	lw	%i31, 2(%i1)
	sf	%f1, 2(%i31)
cont.69539:
	jzero	%i0, %i0, cont.69537
then.69536:
	lw	%i5, 0(%i24)
	lw	%i31, 2(%i1)
	sf	%f0, 0(%i31)
	lw	%i31, 2(%i1)
	sf	%f0, 1(%i31)
	lw	%i31, 2(%i1)
	sf	%f0, 2(%i31)
	subi	%i5, %i5, 1
	slli	%i29, %i5, 2
	add	%i31, %i4, %i29
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69546
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.69547
then.69546:
	flt	%i4, %f0, %f1
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
cont.69547:
	fneg	%f1, %f1
	slli	%i4, %i5, 2
	lw	%i30, 2(%i1)
	add	%i31, %i30, %i4
	sf	%f1, 0(%i31)
cont.69537:
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i8
	mov	%i7, %i9
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i28
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i23
	subi	%i1, %i1, 8
	sf	%f4, 0(%i1)
	set_label	%i31, utexture.2996
	jmp	%i3, 0(%i31)
	lf	%f4, 0(%i1)
	addi	%i1, %i1, 8
	lw	%i5, 0(%i25)
	mov	%i4, %i0
	subi	%i1, %i1, 16
	sw	%i16, 0(%i1)
	sw	%i17, 1(%i1)
	sf	%f4, 2(%i1)
	set_label	%i31, shadow_check_one_or_matrix.2956
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	lw	%i17, 1(%i1)
	lf	%f4, 2(%i1)
	addi	%i1, %i1, 16
	mov	%i4, %i30
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.69548
	lw	%i31, 2(%i1)
	lf	%f2, 0(%i31)
	lf	%f1, 0(%i26)
	fmul	%f3, %f2, %f1
	lw	%i31, 2(%i1)
	lf	%f2, 1(%i31)
	lf	%f1, 1(%i26)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lw	%i31, 2(%i1)
	lf	%f2, 2(%i31)
	lf	%f1, 2(%i26)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.69549
	jzero	%i0, %i0, cont.69550
then.69549:
	fmov	%f1, %f0
cont.69550:
	fmul	%f2, %f4, %f1
	lf	%f1, 0(%i28)
	fmul	%f3, %f2, %f1
	lw	%i31, 4(%i1)
	lf	%f2, 0(%i31)
	lw	%i31, 3(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 1(%i31)
	lw	%i31, 3(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 2(%i31)
	lw	%i31, 3(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 2(%i31)
cont.69548:
cont.69535:
cont.69518:
	lw	%i31, 24(%i1)
	subi	%i4, %i31, 2
	mov	%i31, %i4
	sw	%i31, 24(%i1)
cont.69516:
	set_label	%i30, loop_start.68434
	jmp	%i0, 0(%i30)
loop_end.68435:
	mov	%i0, %i31
	lw	%i31, 21(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i17, %i4
	lw	%i4, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f1, 0(%i31)
	sf	%f1, 0(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 1(%i31)
	sf	%f1, 1(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 2(%i31)
	sf	%f1, 2(%i4)
cont.69503:
	lw	%i31, 21(%i1)
	addi	%i4, %i31, 1
	mov	%i31, %i4
	sw	%i31, 21(%i1)
cont.69502:
cont.69500:
	set_label	%i30, loop_start.68423
	jmp	%i0, 0(%i30)
loop_end.68424:
	mov	%i0, %i31
	subi	%i6, %i20, 1
	addi	%i5, %i21, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.69551
	mov	%i4, %i5
	jzero	%i0, %i0, cont.69552
then.69551:
	subi	%i4, %i5, 5
cont.69552:
	mov	%i20, %i6
	mov	%i21, %i4
cont.69495:
	set_label	%i30, loop_start.68415
	jmp	%i0, 0(%i30)
loop_end.68416:
	mov	%i0, %i31
	mov	%i20, %i0
	sw	%i20, 1186(%i0)
	movi	%i19, 2
	sw	%i19, 1187(%i0)
	lw	%i31, 6(%i1)
	lw	%i18, 1(%i31)
	sw	%i18, 1189(%i0)
loop_start.68468:
	jleq	%i18, %i20, then.69554
	lw	%i31, 6(%i1)
	lw	%i4, 1(%i31)
	subi	%i4, %i4, 1
	jleq	%i4, %i20, cont.69556
	addi	%i5, %i20, 1
	lw	%i31, 8(%i1)
	lf	%f2, 0(%i31)
	lw	%i31, 7(%i1)
	lw	%i4, 1(%i31)
	sub	%i4, %i5, %i4
	itof	%f1, %i4
	fmul	%f3, %f2, %f1
	lw	%i31, 12(%i1)
	lf	%f1, 0(%i31)
	fmul	%f2, %f3, %f1
	lw	%i31, 13(%i1)
	lf	%f1, 0(%i31)
	fadd	%f5, %f2, %f1
	lw	%i31, 12(%i1)
	lf	%f1, 1(%i31)
	fmul	%f2, %f3, %f1
	lw	%i31, 13(%i1)
	lf	%f1, 1(%i31)
	fadd	%f4, %f2, %f1
	lw	%i31, 12(%i1)
	lf	%f1, 2(%i31)
	fmul	%f2, %f3, %f1
	lw	%i31, 13(%i1)
	lf	%f1, 2(%i31)
	fadd	%f3, %f2, %f1
	lw	%i31, 6(%i1)
	lw	%i4, 0(%i31)
	subi	%i5, %i4, 1
	lw	%i31, 18(%i1)
	mov	%i4, %i31
	mov	%i6, %i19
	fmov	%f1, %f5
	fmov	%f2, %f4
	subi	%i1, %i1, 16
	sw	%i18, 0(%i1)
	sw	%i19, 1(%i1)
	sw	%i20, 2(%i1)
	set_label	%i31, pretrace_pixels.3073
	jmp	%i3, 0(%i31)
	lw	%i18, 0(%i1)
	lw	%i19, 1(%i1)
	lw	%i20, 2(%i1)
	addi	%i1, %i1, 16
cont.69556:
	mov	%i17, %i0
	lw	%i31, 6(%i1)
	lw	%i16, 0(%i31)
loop_start.68470:
	jleq	%i16, %i17, then.69558
	slli	%i4, %i17, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f1, 0(%i4)
	lw	%i31, 5(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i4)
	lw	%i31, 5(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i4)
	lw	%i31, 5(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 6(%i1)
	lw	%i5, 1(%i31)
	addi	%i4, %i20, 1
	jleq	%i5, %i4, then.69560
	jleq	%i20, %i0, then.69562
	lw	%i31, 6(%i1)
	lw	%i5, 0(%i31)
	addi	%i4, %i17, 1
	jleq	%i5, %i4, then.69564
	clt	%i4, %i0, %i17
	jzero	%i0, %i0, cont.69561
then.69564:
	mov	%i4, %i0
cont.69565:
	jzero	%i0, %i0, cont.69561
then.69562:
	mov	%i4, %i0
cont.69563:
	jzero	%i0, %i0, cont.69561
then.69560:
	mov	%i4, %i0
cont.69561:
	jeq	%i4, %i0, then.69566
	mov	%i28, %i0
	slli	%i4, %i17, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i6, 3(%i4)
	lw	%i5, 2(%i4)
loop_start.68474:
	movi	%i31, 4
	jleq	%i28, %i31, then.69569
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68475
then.69569:
	slli	%i4, %i28, 2
	add	%i31, %i5, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.69571
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68475
then.69571:
	slli	%i4, %i17, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 2(%i4)
	slli	%i4, %i28, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	slli	%i7, %i17, 2
	lw	%i30, 16(%i1)
	add	%i31, %i30, %i7
	lw	%i7, 0(%i31)
	lw	%i8, 2(%i7)
	slli	%i7, %i28, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	jeq	%i7, %i4, then.69573
	mov	%i4, %i0
	jzero	%i0, %i0, cont.69574
then.69573:
	slli	%i7, %i17, 2
	lw	%i30, 18(%i1)
	add	%i31, %i30, %i7
	lw	%i7, 0(%i31)
	lw	%i8, 2(%i7)
	slli	%i7, %i28, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	jeq	%i7, %i4, then.69575
	mov	%i4, %i0
	jzero	%i0, %i0, cont.69576
then.69575:
	subi	%i7, %i17, 1
	slli	%i7, %i7, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i7
	lw	%i7, 0(%i31)
	lw	%i8, 2(%i7)
	slli	%i7, %i28, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	jeq	%i7, %i4, then.69577
	mov	%i4, %i0
	jzero	%i0, %i0, cont.69578
then.69577:
	addi	%i7, %i17, 1
	slli	%i7, %i7, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i7
	lw	%i7, 0(%i31)
	lw	%i8, 2(%i7)
	slli	%i7, %i28, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	ceq	%i4, %i7, %i4
cont.69578:
cont.69576:
cont.69574:
	jeq	%i4, %i0, then.69579
	slli	%i4, %i28, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.69581
	slli	%i4, %i17, 2
	lw	%i30, 16(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i11, 5(%i4)
	subi	%i4, %i17, 1
	slli	%i4, %i4, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i10, 5(%i4)
	slli	%i4, %i17, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i9, 5(%i4)
	addi	%i4, %i17, 1
	slli	%i4, %i4, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i8, 5(%i4)
	slli	%i4, %i17, 2
	lw	%i30, 18(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 5(%i4)
	slli	%i4, %i28, 2
	add	%i31, %i11, %i4
	lw	%i4, 0(%i31)
	lf	%f1, 0(%i4)
	lw	%i31, 4(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i4)
	lw	%i31, 4(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i4)
	lw	%i31, 4(%i1)
	sf	%f1, 2(%i31)
	slli	%i4, %i28, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 0(%i31)
	lf	%f1, 0(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 1(%i31)
	lf	%f1, 1(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 2(%i31)
	lf	%f1, 2(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 2(%i31)
	slli	%i4, %i28, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 0(%i31)
	lf	%f1, 0(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 1(%i31)
	lf	%f1, 1(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 2(%i31)
	lf	%f1, 2(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 2(%i31)
	slli	%i4, %i28, 2
	add	%i31, %i8, %i4
	lw	%i4, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 0(%i31)
	lf	%f1, 0(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 1(%i31)
	lf	%f1, 1(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 2(%i31)
	lf	%f1, 2(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 2(%i31)
	slli	%i4, %i28, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 0(%i31)
	lf	%f1, 0(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 1(%i31)
	lf	%f1, 1(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 4(%i1)
	lf	%f2, 2(%i31)
	lf	%f1, 2(%i4)
	fadd	%f1, %f2, %f1
	lw	%i31, 4(%i1)
	sf	%f1, 2(%i31)
	slli	%i4, %i17, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 4(%i4)
	slli	%i4, %i28, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	lw	%i31, 5(%i1)
	lf	%f3, 0(%i31)
	lf	%f2, 0(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i31, 5(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 5(%i1)
	lf	%f3, 1(%i31)
	lf	%f2, 1(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i31, 5(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 5(%i1)
	lf	%f3, 2(%i31)
	lf	%f2, 2(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i31, 5(%i1)
	sf	%f1, 2(%i31)
cont.69581:
	addi	%i4, %i28, 1
	mov	%i28, %i4
	jzero	%i0, %i0, cont.69580
then.69579:
	slli	%i4, %i17, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i27, 7(%i4)
	lw	%i26, 6(%i4)
	lw	%i25, 5(%i4)
	lw	%i24, 4(%i4)
	lw	%i23, 3(%i4)
	lw	%i22, 2(%i4)
	lw	%i21, 1(%i4)
loop_start.68502:
	movi	%i31, 4
	jleq	%i28, %i31, then.69583
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68503
then.69583:
	slli	%i4, %i28, 2
	add	%i31, %i22, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.69585
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68503
then.69585:
	slli	%i4, %i28, 2
	add	%i31, %i23, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.69587
	slli	%i4, %i28, 2
	add	%i31, %i25, %i4
	lw	%i4, 0(%i31)
	lf	%f1, 0(%i4)
	lw	%i31, 4(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i4)
	lw	%i31, 4(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i4)
	lw	%i31, 4(%i1)
	sf	%f1, 2(%i31)
	lw	%i7, 0(%i26)
	slli	%i4, %i28, 2
	add	%i31, %i27, %i4
	lw	%i5, 0(%i31)
	slli	%i4, %i28, 2
	add	%i31, %i21, %i4
	lw	%i29, 0(%i31)
	jeq	%i7, %i0, cont.69588
	lw	%i31, 15(%i1)
	lw	%i4, 0(%i31)
	mov	%i6, %i29
	subi	%i1, %i1, 32
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	set_label	%i31, trace_diffuse_rays.3022
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	addi	%i1, %i1, 32
cont.69588:
	movi	%i31, 1
	jeq	%i7, %i31, cont.69589
	lw	%i31, 15(%i1)
	lw	%i4, 1(%i31)
	mov	%i6, %i29
	subi	%i1, %i1, 32
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	set_label	%i31, trace_diffuse_rays.3022
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	addi	%i1, %i1, 32
cont.69589:
	movi	%i31, 2
	jeq	%i7, %i31, cont.69590
	lw	%i31, 15(%i1)
	lw	%i4, 2(%i31)
	mov	%i6, %i29
	subi	%i1, %i1, 32
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	set_label	%i31, trace_diffuse_rays.3022
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	addi	%i1, %i1, 32
cont.69590:
	movi	%i31, 3
	jeq	%i7, %i31, cont.69591
	lw	%i31, 15(%i1)
	lw	%i4, 3(%i31)
	mov	%i6, %i29
	subi	%i1, %i1, 32
	sw	%i5, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	set_label	%i31, trace_diffuse_rays.3022
	jmp	%i3, 0(%i31)
	lw	%i5, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	addi	%i1, %i1, 32
cont.69591:
	movi	%i31, 4
	jeq	%i7, %i31, cont.69592
	lw	%i31, 15(%i1)
	lw	%i4, 4(%i31)
	mov	%i6, %i29
	subi	%i1, %i1, 24
	sw	%i16, 0(%i1)
	sw	%i17, 1(%i1)
	sw	%i18, 2(%i1)
	sw	%i19, 3(%i1)
	sw	%i20, 4(%i1)
	sw	%i21, 5(%i1)
	set_label	%i31, trace_diffuse_rays.3022
	jmp	%i3, 0(%i31)
	lw	%i16, 0(%i1)
	lw	%i17, 1(%i1)
	lw	%i18, 2(%i1)
	lw	%i19, 3(%i1)
	lw	%i20, 4(%i1)
	lw	%i21, 5(%i1)
	addi	%i1, %i1, 24
cont.69592:
	slli	%i4, %i28, 2
	add	%i31, %i24, %i4
	lw	%i4, 0(%i31)
	lw	%i31, 5(%i1)
	lf	%f3, 0(%i31)
	lf	%f2, 0(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i31, 5(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 5(%i1)
	lf	%f3, 1(%i31)
	lf	%f2, 1(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i31, 5(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 5(%i1)
	lf	%f3, 2(%i31)
	lf	%f2, 2(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i31, 5(%i1)
	sf	%f1, 2(%i31)
cont.69587:
	addi	%i4, %i28, 1
	mov	%i28, %i4
cont.69586:
cont.69584:
	set_label	%i30, loop_start.68502
	jmp	%i0, 0(%i30)
loop_end.68503:
	mov	%i0, %i31
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68475
cont.69580:
cont.69572:
cont.69570:
	set_label	%i30, loop_start.68474
	jmp	%i0, 0(%i30)
loop_end.68475:
	mov	%i0, %i31
	jzero	%i0, %i0, cont.69567
then.69566:
	slli	%i4, %i17, 2
	lw	%i30, 17(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	lw	%i9, 7(%i4)
	lw	%i8, 6(%i4)
	lw	%i29, 5(%i4)
	lw	%i28, 4(%i4)
	lw	%i27, 3(%i4)
	lw	%i26, 2(%i4)
	lw	%i25, 1(%i4)
	mov	%i24, %i0
loop_start.68512:
	movi	%i31, 4
	jleq	%i24, %i31, then.69594
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68513
then.69594:
	slli	%i4, %i24, 2
	add	%i31, %i26, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.69596
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68513
then.69596:
	slli	%i4, %i24, 2
	add	%i31, %i27, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.69598
	slli	%i4, %i24, 2
	add	%i31, %i29, %i4
	lw	%i4, 0(%i31)
	lf	%f1, 0(%i4)
	lw	%i31, 4(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i4)
	lw	%i31, 4(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i4)
	lw	%i31, 4(%i1)
	sf	%f1, 2(%i31)
	lw	%i23, 0(%i8)
	slli	%i4, %i24, 2
	add	%i31, %i9, %i4
	lw	%i22, 0(%i31)
	slli	%i4, %i24, 2
	add	%i31, %i25, %i4
	lw	%i21, 0(%i31)
	jeq	%i23, %i0, cont.69599
	lw	%i31, 15(%i1)
	lw	%i4, 0(%i31)
	lf	%f1, 0(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 0(%i1)
	lw	%i5, 0(%i31)
	subi	%i13, %i5, 1
loop_start.68519:
	jleq	%i0, %i13, then.69601
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68520
then.69601:
	slli	%i5, %i13, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i5
	lw	%i5, 0(%i31)
	lw	%i12, 10(%i5)
	lw	%i11, 9(%i5)
	lw	%i10, 5(%i5)
	lw	%i7, 4(%i5)
	lw	%i6, 3(%i5)
	lw	%i5, 1(%i5)
	lf	%f2, 0(%i21)
	lf	%f1, 0(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i12)
	lf	%f2, 1(%i21)
	lf	%f1, 1(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i12)
	lf	%f2, 2(%i21)
	lf	%f1, 2(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i12)
	movi	%i31, 2
	jeq	%i5, %i31, then.69603
	movi	%i31, 2
	jleq	%i5, %i31, cont.69605
	lf	%f6, 0(%i12)
	lf	%f5, 1(%i12)
	lf	%f4, 2(%i12)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i6, %i0, then.69606
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69607
then.69606:
	fmov	%f2, %f3
cont.69607:
	movi	%i31, 3
	jeq	%i5, %i31, then.69608
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.69609
then.69608:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.69609:
	sf	%f1, 3(%i12)
cont.69605:
	jzero	%i0, %i0, cont.69604
then.69603:
	lf	%f2, 0(%i12)
	lf	%f4, 1(%i12)
	lf	%f3, 2(%i12)
	lf	%f1, 0(%i7)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	sf	%f1, 3(%i12)
cont.69604:
	subi	%i5, %i13, 1
	mov	%i13, %i5
cont.69602:
	set_label	%i30, loop_start.68519
	jmp	%i0, 0(%i30)
loop_end.68520:
	mov	%i0, %i31
	movi	%i7, 118
	mov	%i5, %i22
	mov	%i6, %i21
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	sw	%i22, 8(%i1)
	sw	%i23, 9(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3017
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	lw	%i22, 8(%i1)
	lw	%i23, 9(%i1)
	addi	%i1, %i1, 40
cont.69599:
	movi	%i31, 1
	jeq	%i23, %i31, cont.69610
	lw	%i31, 15(%i1)
	lw	%i4, 1(%i31)
	lf	%f1, 0(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 0(%i1)
	lw	%i5, 0(%i31)
	subi	%i13, %i5, 1
loop_start.68523:
	jleq	%i0, %i13, then.69612
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68524
then.69612:
	slli	%i5, %i13, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i5
	lw	%i5, 0(%i31)
	lw	%i12, 10(%i5)
	lw	%i11, 9(%i5)
	lw	%i10, 5(%i5)
	lw	%i7, 4(%i5)
	lw	%i6, 3(%i5)
	lw	%i5, 1(%i5)
	lf	%f2, 0(%i21)
	lf	%f1, 0(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i12)
	lf	%f2, 1(%i21)
	lf	%f1, 1(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i12)
	lf	%f2, 2(%i21)
	lf	%f1, 2(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i12)
	movi	%i31, 2
	jeq	%i5, %i31, then.69614
	movi	%i31, 2
	jleq	%i5, %i31, cont.69616
	lf	%f6, 0(%i12)
	lf	%f5, 1(%i12)
	lf	%f4, 2(%i12)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i6, %i0, then.69617
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69618
then.69617:
	fmov	%f2, %f3
cont.69618:
	movi	%i31, 3
	jeq	%i5, %i31, then.69619
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.69620
then.69619:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.69620:
	sf	%f1, 3(%i12)
cont.69616:
	jzero	%i0, %i0, cont.69615
then.69614:
	lf	%f2, 0(%i12)
	lf	%f4, 1(%i12)
	lf	%f3, 2(%i12)
	lf	%f1, 0(%i7)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	sf	%f1, 3(%i12)
cont.69615:
	subi	%i5, %i13, 1
	mov	%i13, %i5
cont.69613:
	set_label	%i30, loop_start.68523
	jmp	%i0, 0(%i30)
loop_end.68524:
	mov	%i0, %i31
	movi	%i7, 118
	mov	%i5, %i22
	mov	%i6, %i21
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	sw	%i22, 8(%i1)
	sw	%i23, 9(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3017
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	lw	%i22, 8(%i1)
	lw	%i23, 9(%i1)
	addi	%i1, %i1, 40
cont.69610:
	movi	%i31, 2
	jeq	%i23, %i31, cont.69621
	lw	%i31, 15(%i1)
	lw	%i4, 2(%i31)
	lf	%f1, 0(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 0(%i1)
	lw	%i5, 0(%i31)
	subi	%i13, %i5, 1
loop_start.68527:
	jleq	%i0, %i13, then.69623
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68528
then.69623:
	slli	%i5, %i13, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i5
	lw	%i5, 0(%i31)
	lw	%i12, 10(%i5)
	lw	%i11, 9(%i5)
	lw	%i10, 5(%i5)
	lw	%i7, 4(%i5)
	lw	%i6, 3(%i5)
	lw	%i5, 1(%i5)
	lf	%f2, 0(%i21)
	lf	%f1, 0(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i12)
	lf	%f2, 1(%i21)
	lf	%f1, 1(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i12)
	lf	%f2, 2(%i21)
	lf	%f1, 2(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i12)
	movi	%i31, 2
	jeq	%i5, %i31, then.69625
	movi	%i31, 2
	jleq	%i5, %i31, cont.69627
	lf	%f6, 0(%i12)
	lf	%f5, 1(%i12)
	lf	%f4, 2(%i12)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i6, %i0, then.69628
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69629
then.69628:
	fmov	%f2, %f3
cont.69629:
	movi	%i31, 3
	jeq	%i5, %i31, then.69630
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.69631
then.69630:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.69631:
	sf	%f1, 3(%i12)
cont.69627:
	jzero	%i0, %i0, cont.69626
then.69625:
	lf	%f2, 0(%i12)
	lf	%f4, 1(%i12)
	lf	%f3, 2(%i12)
	lf	%f1, 0(%i7)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	sf	%f1, 3(%i12)
cont.69626:
	subi	%i5, %i13, 1
	mov	%i13, %i5
cont.69624:
	set_label	%i30, loop_start.68527
	jmp	%i0, 0(%i30)
loop_end.68528:
	mov	%i0, %i31
	movi	%i7, 118
	mov	%i5, %i22
	mov	%i6, %i21
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	sw	%i22, 8(%i1)
	sw	%i23, 9(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3017
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	lw	%i22, 8(%i1)
	lw	%i23, 9(%i1)
	addi	%i1, %i1, 40
cont.69621:
	movi	%i31, 3
	jeq	%i23, %i31, cont.69632
	lw	%i31, 15(%i1)
	lw	%i4, 3(%i31)
	lf	%f1, 0(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 0(%i1)
	lw	%i5, 0(%i31)
	subi	%i13, %i5, 1
loop_start.68531:
	jleq	%i0, %i13, then.69634
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68532
then.69634:
	slli	%i5, %i13, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i5
	lw	%i5, 0(%i31)
	lw	%i12, 10(%i5)
	lw	%i11, 9(%i5)
	lw	%i10, 5(%i5)
	lw	%i7, 4(%i5)
	lw	%i6, 3(%i5)
	lw	%i5, 1(%i5)
	lf	%f2, 0(%i21)
	lf	%f1, 0(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i12)
	lf	%f2, 1(%i21)
	lf	%f1, 1(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i12)
	lf	%f2, 2(%i21)
	lf	%f1, 2(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i12)
	movi	%i31, 2
	jeq	%i5, %i31, then.69636
	movi	%i31, 2
	jleq	%i5, %i31, cont.69638
	lf	%f6, 0(%i12)
	lf	%f5, 1(%i12)
	lf	%f4, 2(%i12)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i6, %i0, then.69639
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69640
then.69639:
	fmov	%f2, %f3
cont.69640:
	movi	%i31, 3
	jeq	%i5, %i31, then.69641
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.69642
then.69641:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.69642:
	sf	%f1, 3(%i12)
cont.69638:
	jzero	%i0, %i0, cont.69637
then.69636:
	lf	%f2, 0(%i12)
	lf	%f4, 1(%i12)
	lf	%f3, 2(%i12)
	lf	%f1, 0(%i7)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	sf	%f1, 3(%i12)
cont.69637:
	subi	%i5, %i13, 1
	mov	%i13, %i5
cont.69635:
	set_label	%i30, loop_start.68531
	jmp	%i0, 0(%i30)
loop_end.68532:
	mov	%i0, %i31
	movi	%i7, 118
	mov	%i5, %i22
	mov	%i6, %i21
	subi	%i1, %i1, 40
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	sw	%i21, 7(%i1)
	sw	%i22, 8(%i1)
	sw	%i23, 9(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3017
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	lw	%i21, 7(%i1)
	lw	%i22, 8(%i1)
	lw	%i23, 9(%i1)
	addi	%i1, %i1, 40
cont.69632:
	movi	%i31, 4
	jeq	%i23, %i31, cont.69643
	lw	%i31, 15(%i1)
	lw	%i4, 4(%i31)
	lf	%f1, 0(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 0(%i31)
	lf	%f1, 1(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 1(%i31)
	lf	%f1, 2(%i21)
	lw	%i31, 10(%i1)
	sf	%f1, 2(%i31)
	lw	%i31, 0(%i1)
	lw	%i5, 0(%i31)
	subi	%i13, %i5, 1
loop_start.68535:
	jleq	%i0, %i13, then.69645
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68536
then.69645:
	slli	%i5, %i13, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i5
	lw	%i5, 0(%i31)
	lw	%i12, 10(%i5)
	lw	%i11, 9(%i5)
	lw	%i10, 5(%i5)
	lw	%i7, 4(%i5)
	lw	%i6, 3(%i5)
	lw	%i5, 1(%i5)
	lf	%f2, 0(%i21)
	lf	%f1, 0(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i12)
	lf	%f2, 1(%i21)
	lf	%f1, 1(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i12)
	lf	%f2, 2(%i21)
	lf	%f1, 2(%i10)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i12)
	movi	%i31, 2
	jeq	%i5, %i31, then.69647
	movi	%i31, 2
	jleq	%i5, %i31, cont.69649
	lf	%f6, 0(%i12)
	lf	%f5, 1(%i12)
	lf	%f4, 2(%i12)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i6, %i0, then.69650
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.69651
then.69650:
	fmov	%f2, %f3
cont.69651:
	movi	%i31, 3
	jeq	%i5, %i31, then.69652
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.69653
then.69652:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.69653:
	sf	%f1, 3(%i12)
cont.69649:
	jzero	%i0, %i0, cont.69648
then.69647:
	lf	%f2, 0(%i12)
	lf	%f4, 1(%i12)
	lf	%f3, 2(%i12)
	lf	%f1, 0(%i7)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	sf	%f1, 3(%i12)
cont.69648:
	subi	%i5, %i13, 1
	mov	%i13, %i5
cont.69646:
	set_label	%i30, loop_start.68535
	jmp	%i0, 0(%i30)
loop_end.68536:
	mov	%i0, %i31
	movi	%i7, 118
	mov	%i5, %i22
	mov	%i6, %i21
	subi	%i1, %i1, 32
	sw	%i8, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i16, 2(%i1)
	sw	%i17, 3(%i1)
	sw	%i18, 4(%i1)
	sw	%i19, 5(%i1)
	sw	%i20, 6(%i1)
	set_label	%i31, iter_trace_diffuse_rays.3017
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i16, 2(%i1)
	lw	%i17, 3(%i1)
	lw	%i18, 4(%i1)
	lw	%i19, 5(%i1)
	lw	%i20, 6(%i1)
	addi	%i1, %i1, 32
cont.69643:
	slli	%i4, %i24, 2
	add	%i31, %i28, %i4
	lw	%i4, 0(%i31)
	lw	%i31, 5(%i1)
	lf	%f3, 0(%i31)
	lf	%f2, 0(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i31, 5(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 5(%i1)
	lf	%f3, 1(%i31)
	lf	%f2, 1(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i31, 5(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 5(%i1)
	lf	%f3, 2(%i31)
	lf	%f2, 2(%i4)
	lw	%i31, 4(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i31, 5(%i1)
	sf	%f1, 2(%i31)
cont.69598:
	addi	%i4, %i24, 1
	mov	%i24, %i4
cont.69597:
cont.69595:
	set_label	%i30, loop_start.68512
	jmp	%i0, 0(%i30)
loop_end.68513:
	mov	%i0, %i31
cont.69567:
	lw	%i31, 5(%i1)
	lf	%f1, 0(%i31)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.69654
	movi	%i6, 255
	jzero	%i0, %i0, cont.69655
then.69654:
	jleq	%i0, %i4, then.69656
	mov	%i6, %i0
	jzero	%i0, %i0, cont.69657
then.69656:
	mov	%i6, %i4
cont.69657:
cont.69655:
	movi	%i4, 100
	jleq	%i4, %i6, then.69658
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69659
then.69658:
	movi	%i4, 200
	jleq	%i4, %i6, then.69660
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.69661
then.69660:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.69661:
cont.69659:
	movi	%i4, 40
	jleq	%i4, %i6, then.69662
	movi	%i4, 20
	jleq	%i4, %i6, then.69664
	movi	%i4, 10
	jleq	%i4, %i6, then.69666
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.69663
then.69666:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.69667:
	jzero	%i0, %i0, cont.69663
then.69664:
	movi	%i4, 30
	jleq	%i4, %i6, then.69668
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.69669
then.69668:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.69669:
cont.69665:
	jzero	%i0, %i0, cont.69663
then.69662:
	movi	%i4, 60
	jleq	%i4, %i6, then.69670
	movi	%i4, 50
	jleq	%i4, %i6, then.69672
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.69671
then.69672:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.69673:
	jzero	%i0, %i0, cont.69671
then.69670:
	movi	%i4, 80
	jleq	%i4, %i6, then.69674
	movi	%i4, 70
	jleq	%i4, %i6, then.69676
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.69675
then.69676:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.69677:
	jzero	%i0, %i0, cont.69675
then.69674:
	movi	%i4, 90
	jleq	%i4, %i6, then.69678
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.69679
then.69678:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.69679:
cont.69675:
cont.69671:
cont.69663:
	movi	%i4, 4
	jleq	%i4, %i5, then.69680
	movi	%i4, 2
	jleq	%i4, %i5, then.69682
	movi	%i4, 1
	jleq	%i4, %i5, then.69684
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69681
then.69684:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69685:
	jzero	%i0, %i0, cont.69681
then.69682:
	movi	%i4, 3
	jleq	%i4, %i5, then.69686
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69687
then.69686:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69687:
cont.69683:
	jzero	%i0, %i0, cont.69681
then.69680:
	movi	%i4, 6
	jleq	%i4, %i5, then.69688
	movi	%i4, 5
	jleq	%i4, %i5, then.69690
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69689
then.69690:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69691:
	jzero	%i0, %i0, cont.69689
then.69688:
	movi	%i4, 8
	jleq	%i4, %i5, then.69692
	movi	%i4, 7
	jleq	%i4, %i5, then.69694
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69693
then.69694:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69695:
	jzero	%i0, %i0, cont.69693
then.69692:
	movi	%i4, 9
	jleq	%i4, %i5, then.69696
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69697
then.69696:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69697:
cont.69693:
cont.69689:
cont.69681:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i31, 5(%i1)
	lf	%f1, 1(%i31)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.69698
	movi	%i6, 255
	jzero	%i0, %i0, cont.69699
then.69698:
	jleq	%i0, %i4, then.69700
	mov	%i6, %i0
	jzero	%i0, %i0, cont.69701
then.69700:
	mov	%i6, %i4
cont.69701:
cont.69699:
	movi	%i4, 100
	jleq	%i4, %i6, then.69702
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69703
then.69702:
	movi	%i4, 200
	jleq	%i4, %i6, then.69704
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.69705
then.69704:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.69705:
cont.69703:
	movi	%i4, 40
	jleq	%i4, %i6, then.69706
	movi	%i4, 20
	jleq	%i4, %i6, then.69708
	movi	%i4, 10
	jleq	%i4, %i6, then.69710
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.69707
then.69710:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.69711:
	jzero	%i0, %i0, cont.69707
then.69708:
	movi	%i4, 30
	jleq	%i4, %i6, then.69712
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.69713
then.69712:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.69713:
cont.69709:
	jzero	%i0, %i0, cont.69707
then.69706:
	movi	%i4, 60
	jleq	%i4, %i6, then.69714
	movi	%i4, 50
	jleq	%i4, %i6, then.69716
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.69715
then.69716:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.69717:
	jzero	%i0, %i0, cont.69715
then.69714:
	movi	%i4, 80
	jleq	%i4, %i6, then.69718
	movi	%i4, 70
	jleq	%i4, %i6, then.69720
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.69719
then.69720:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.69721:
	jzero	%i0, %i0, cont.69719
then.69718:
	movi	%i4, 90
	jleq	%i4, %i6, then.69722
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.69723
then.69722:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.69723:
cont.69719:
cont.69715:
cont.69707:
	movi	%i4, 4
	jleq	%i4, %i5, then.69724
	movi	%i4, 2
	jleq	%i4, %i5, then.69726
	movi	%i4, 1
	jleq	%i4, %i5, then.69728
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69725
then.69728:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69729:
	jzero	%i0, %i0, cont.69725
then.69726:
	movi	%i4, 3
	jleq	%i4, %i5, then.69730
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69731
then.69730:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69731:
cont.69727:
	jzero	%i0, %i0, cont.69725
then.69724:
	movi	%i4, 6
	jleq	%i4, %i5, then.69732
	movi	%i4, 5
	jleq	%i4, %i5, then.69734
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69733
then.69734:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69735:
	jzero	%i0, %i0, cont.69733
then.69732:
	movi	%i4, 8
	jleq	%i4, %i5, then.69736
	movi	%i4, 7
	jleq	%i4, %i5, then.69738
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69737
then.69738:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69739:
	jzero	%i0, %i0, cont.69737
then.69736:
	movi	%i4, 9
	jleq	%i4, %i5, then.69740
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69741
then.69740:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69741:
cont.69737:
cont.69733:
cont.69725:
	movi	%i4, 32
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	lw	%i31, 5(%i1)
	lf	%f1, 2(%i31)
	ftoi	%i4, %f1
	movi	%i31, 255
	jleq	%i4, %i31, then.69742
	movi	%i6, 255
	jzero	%i0, %i0, cont.69743
then.69742:
	jleq	%i0, %i4, then.69744
	mov	%i6, %i0
	jzero	%i0, %i0, cont.69745
then.69744:
	mov	%i6, %i4
cont.69745:
cont.69743:
	movi	%i4, 100
	jleq	%i4, %i6, then.69746
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69747
then.69746:
	movi	%i4, 200
	jleq	%i4, %i6, then.69748
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 100
	jzero	%i0, %i0, cont.69749
then.69748:
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i6, %i6, 200
cont.69749:
cont.69747:
	movi	%i4, 40
	jleq	%i4, %i6, then.69750
	movi	%i4, 20
	jleq	%i4, %i6, then.69752
	movi	%i4, 10
	jleq	%i4, %i6, then.69754
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	mov	%i5, %i6
	jzero	%i0, %i0, cont.69751
then.69754:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 10
cont.69755:
	jzero	%i0, %i0, cont.69751
then.69752:
	movi	%i4, 30
	jleq	%i4, %i6, then.69756
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 20
	jzero	%i0, %i0, cont.69757
then.69756:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 30
cont.69757:
cont.69753:
	jzero	%i0, %i0, cont.69751
then.69750:
	movi	%i4, 60
	jleq	%i4, %i6, then.69758
	movi	%i4, 50
	jleq	%i4, %i6, then.69760
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 40
	jzero	%i0, %i0, cont.69759
then.69760:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 50
cont.69761:
	jzero	%i0, %i0, cont.69759
then.69758:
	movi	%i4, 80
	jleq	%i4, %i6, then.69762
	movi	%i4, 70
	jleq	%i4, %i6, then.69764
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 60
	jzero	%i0, %i0, cont.69763
then.69764:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 70
cont.69765:
	jzero	%i0, %i0, cont.69763
then.69762:
	movi	%i4, 90
	jleq	%i4, %i6, then.69766
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 80
	jzero	%i0, %i0, cont.69767
then.69766:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	subi	%i5, %i6, 90
cont.69767:
cont.69763:
cont.69759:
cont.69751:
	movi	%i4, 4
	jleq	%i4, %i5, then.69768
	movi	%i4, 2
	jleq	%i4, %i5, then.69770
	movi	%i4, 1
	jleq	%i4, %i5, then.69772
	movi	%i4, 48
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69769
then.69772:
	movi	%i4, 49
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69773:
	jzero	%i0, %i0, cont.69769
then.69770:
	movi	%i4, 3
	jleq	%i4, %i5, then.69774
	movi	%i4, 50
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69775
then.69774:
	movi	%i4, 51
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69775:
cont.69771:
	jzero	%i0, %i0, cont.69769
then.69768:
	movi	%i4, 6
	jleq	%i4, %i5, then.69776
	movi	%i4, 5
	jleq	%i4, %i5, then.69778
	movi	%i4, 52
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69777
then.69778:
	movi	%i4, 53
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69779:
	jzero	%i0, %i0, cont.69777
then.69776:
	movi	%i4, 8
	jleq	%i4, %i5, then.69780
	movi	%i4, 7
	jleq	%i4, %i5, then.69782
	movi	%i4, 54
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69781
then.69782:
	movi	%i4, 55
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69783:
	jzero	%i0, %i0, cont.69781
then.69780:
	movi	%i4, 9
	jleq	%i4, %i5, then.69784
	movi	%i4, 56
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	jzero	%i0, %i0, cont.69785
then.69784:
	movi	%i4, 57
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
cont.69785:
cont.69781:
cont.69777:
cont.69769:
	movi	%i4, 10
	movui	%i5, 0xf0000
	sb	%i4, 0(%i5)
	addi	%i4, %i17, 1
	mov	%i17, %i4
	set_label	%i31, loop_start.68470
	jmp	%i0, 0(%i31)
then.69558:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68471
loop_end.68471:
	mov	%i0, %i31
	addi	%i8, %i20, 1
	addi	%i5, %i19, 2
	movi	%i4, 5
	jleq	%i4, %i5, then.69786
	mov	%i7, %i5
	jzero	%i0, %i0, cont.69787
then.69786:
	subi	%i7, %i5, 5
cont.69787:
	lw	%i31, 17(%i1)
	mov	%i6, %i31
	lw	%i31, 18(%i1)
	mov	%i5, %i31
	lw	%i31, 16(%i1)
	mov	%i4, %i31
	mov	%i20, %i8
	mov	%i31, %i6
	sw	%i31, 16(%i1)
	mov	%i31, %i5
	sw	%i31, 17(%i1)
	mov	%i31, %i4
	sw	%i31, 18(%i1)
	mov	%i19, %i7
	set_label	%i31, loop_start.68468
	jmp	%i0, 0(%i31)
then.69554:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68469
loop_end.68469:
	mov	%i0, %i31
fin:
	set_label	%i31, fin
	jmp	%i0, 0(%i31)
rotate_quadratic_matrix.2804:
	lf	%f2, 0(%i5)
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f2
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69788
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69790
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
	fmul	%f3, %f1, %f2
	jzero	%i0, %i0, cont.69789
else.69790:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69792
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
	jzero	%i0, %i31, else.69794
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.69795
else.69794:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.69795:
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
	fmul	%f3, %f1, %f4
	jzero	%i0, %i0, cont.69793
else.69792:
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
	fmul	%f3, %f1, %f4
cont.69793:
cont.69791:
	jzero	%i0, %i0, cont.69789
else.69788:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69796
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
	jzero	%i0, %i31, else.69798
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.69799
else.69798:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.69799:
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
	fmul	%f3, %f1, %f4
	jzero	%i0, %i0, cont.69797
else.69796:
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
	fmul	%f3, %f1, %f4
cont.69797:
cont.69789:
	lf	%f2, 0(%i5)
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69800
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69802
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
	fmul	%f14, %f1, %f2
	jzero	%i0, %i0, cont.69801
else.69802:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69804
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
	jzero	%i0, %i31, else.69806
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.69807
else.69806:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.69807:
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
	fmul	%f14, %f1, %f5
	jzero	%i0, %i0, cont.69805
else.69804:
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
	fmul	%f14, %f1, %f5
cont.69805:
cont.69803:
	jzero	%i0, %i0, cont.69801
else.69800:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69808
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
	jzero	%i0, %i31, else.69810
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.69811
else.69810:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.69811:
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
	fmul	%f14, %f1, %f5
	jzero	%i0, %i0, cont.69809
else.69808:
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
	fmul	%f14, %f1, %f5
cont.69809:
cont.69801:
	lf	%f2, 1(%i5)
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f2
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69812
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69814
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
	fmul	%f13, %f1, %f2
	jzero	%i0, %i0, cont.69813
else.69814:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69816
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
	jzero	%i0, %i31, else.69818
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.69819
else.69818:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.69819:
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
	fmul	%f13, %f1, %f5
	jzero	%i0, %i0, cont.69817
else.69816:
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
	fmul	%f13, %f1, %f5
cont.69817:
cont.69815:
	jzero	%i0, %i0, cont.69813
else.69812:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69820
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
	jzero	%i0, %i31, else.69822
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.69823
else.69822:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.69823:
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
	fmul	%f13, %f1, %f5
	jzero	%i0, %i0, cont.69821
else.69820:
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
	fmul	%f13, %f1, %f5
cont.69821:
cont.69813:
	lf	%f2, 1(%i5)
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69824
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69826
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
	jzero	%i0, %i0, cont.69825
else.69826:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69828
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
	jzero	%i0, %i31, else.69830
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.69831
else.69830:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.69831:
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
	jzero	%i0, %i0, cont.69829
else.69828:
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
cont.69829:
cont.69827:
	jzero	%i0, %i0, cont.69825
else.69824:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69832
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
	jzero	%i0, %i31, else.69834
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.69835
else.69834:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.69835:
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
	jzero	%i0, %i0, cont.69833
else.69832:
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
cont.69833:
cont.69825:
	lf	%f2, 2(%i5)
	lf	%f1, 1(%i0)
	fsub	%f2, %f1, %f2
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69836
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69838
	fmul	%f6, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f4, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f2
	jzero	%i0, %i0, cont.69837
else.69838:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69840
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
	jzero	%i0, %i31, else.69842
	fmov	%f6, %f2
	jzero	%i0, %i0, cont.69843
else.69842:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
cont.69843:
	fmul	%f4, %f6, %f6
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
	fmul	%f4, %f1, %f6
	jzero	%i0, %i0, cont.69841
else.69840:
	lf	%f1, 3(%i0)
	fsub	%f6, %f1, %f2
	fmul	%f4, %f6, %f6
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
	fmul	%f4, %f1, %f6
cont.69841:
cont.69839:
	jzero	%i0, %i0, cont.69837
else.69836:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69844
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
	jzero	%i0, %i31, else.69846
	fmov	%f6, %f2
	jzero	%i0, %i0, cont.69847
else.69846:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
cont.69847:
	fmul	%f4, %f6, %f6
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
	fmul	%f4, %f1, %f6
	jzero	%i0, %i0, cont.69845
else.69844:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
	fmul	%f4, %f6, %f6
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
	fmul	%f4, %f1, %f6
cont.69845:
cont.69837:
	lf	%f2, 2(%i5)
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69848
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69850
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
	fmul	%f15, %f1, %f2
	jzero	%i0, %i0, cont.69849
else.69850:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.69852
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
	jzero	%i0, %i31, else.69854
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.69855
else.69854:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.69855:
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
	fmul	%f15, %f1, %f7
	jzero	%i0, %i0, cont.69853
else.69852:
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
	fmul	%f15, %f1, %f7
cont.69853:
cont.69851:
	jzero	%i0, %i0, cont.69849
else.69848:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.69856
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
	jzero	%i0, %i31, else.69858
	fmov	%f7, %f2
	jzero	%i0, %i0, cont.69859
else.69858:
	lf	%f1, 0(%i0)
	fsub	%f7, %f1, %f2
cont.69859:
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
	fmul	%f15, %f1, %f7
	jzero	%i0, %i0, cont.69857
else.69856:
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
	fmul	%f15, %f1, %f7
cont.69857:
cont.69849:
	fmul	%f12, %f13, %f4
	fmul	%f7, %f14, %f5
	fmul	%f2, %f7, %f4
	fmul	%f1, %f3, %f15
	fsub	%f11, %f2, %f1
	fmul	%f6, %f3, %f5
	fmul	%f2, %f6, %f4
	fmul	%f1, %f14, %f15
	fadd	%f10, %f2, %f1
	fmul	%f9, %f13, %f15
	fmul	%f2, %f7, %f15
	fmul	%f1, %f3, %f4
	fadd	%f8, %f2, %f1
	fmul	%f2, %f6, %f15
	fmul	%f1, %f14, %f4
	fsub	%f7, %f2, %f1
	fneg	%f6, %f5
	fmul	%f5, %f14, %f13
	fmul	%f4, %f3, %f13
	lf	%f3, 0(%i4)
	lf	%f2, 1(%i4)
	lf	%f1, 2(%i4)
	fmul	%f13, %f12, %f12
	fmul	%f14, %f3, %f13
	fmul	%f13, %f9, %f9
	fmul	%f13, %f2, %f13
	fadd	%f14, %f14, %f13
	fmul	%f13, %f6, %f6
	fmul	%f13, %f1, %f13
	fadd	%f13, %f14, %f13
	sf	%f13, 0(%i4)
	fmul	%f13, %f11, %f11
	fmul	%f14, %f3, %f13
	fmul	%f13, %f8, %f8
	fmul	%f13, %f2, %f13
	fadd	%f14, %f14, %f13
	fmul	%f13, %f5, %f5
	fmul	%f13, %f1, %f13
	fadd	%f13, %f14, %f13
	sf	%f13, 1(%i4)
	fmul	%f13, %f10, %f10
	fmul	%f14, %f3, %f13
	fmul	%f13, %f7, %f7
	fmul	%f13, %f2, %f13
	fadd	%f14, %f14, %f13
	fmul	%f13, %f4, %f4
	fmul	%f13, %f1, %f13
	fadd	%f13, %f14, %f13
	sf	%f13, 2(%i4)
	movui	%i31, 262144
	mif	%f15, %i31
	fmul	%f13, %f3, %f11
	fmul	%f14, %f13, %f10
	fmul	%f13, %f2, %f8
	fmul	%f13, %f13, %f7
	fadd	%f14, %f14, %f13
	fmul	%f13, %f1, %f5
	fmul	%f13, %f13, %f4
	fadd	%f13, %f14, %f13
	fmul	%f13, %f15, %f13
	sf	%f13, 0(%i5)
	movui	%i31, 262144
	mif	%f13, %i31
	fmul	%f12, %f3, %f12
	fmul	%f3, %f12, %f10
	fmul	%f9, %f2, %f9
	fmul	%f2, %f9, %f7
	fadd	%f2, %f3, %f2
	fmul	%f6, %f1, %f6
	fmul	%f1, %f6, %f4
	fadd	%f1, %f2, %f1
	fmul	%f1, %f13, %f1
	sf	%f1, 1(%i5)
	movui	%i31, 262144
	mif	%f3, %i31
	fmul	%f2, %f12, %f11
	fmul	%f1, %f9, %f8
	fadd	%f2, %f2, %f1
	fmul	%f1, %f6, %f5
	fadd	%f1, %f2, %f1
	fmul	%f1, %f3, %f1
	sf	%f1, 2(%i5)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
read_net_item.2813:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i7, %i4
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
	mov	%i6, %i4
	movi	%i31, -1
	jeq	%i6, %i31, then.69861
	addi	%i4, %i7, 1
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	set_label	%i31, read_net_item.2813
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i7, 2
	add	%i31, %i5, %i4
	sw	%i6, 0(%i31)
	mov	%i4, %i5
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.69861:
	addi	%i4, %i7, 1
	movi	%i5, -1
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69862:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69863
	jzero	%i0, %i0, ca_done.69864
ca_cont.69863:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69862
	jmp	%i0, 0(%i31)
ca_done.69864:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
read_or_network.2815:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i7, %i4
	mov	%i4, %i0
	subi	%i1, %i1, 8
	sw	%i7, 0(%i1)
	set_label	%i31, read_net_item.2813
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i6, %i30
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.69865
	addi	%i4, %i7, 1
	subi	%i1, %i1, 8
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	set_label	%i31, read_or_network.2815
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	addi	%i1, %i1, 8
	mov	%i5, %i30
	slli	%i4, %i7, 2
	add	%i31, %i5, %i4
	sw	%i6, 0(%i31)
	mov	%i4, %i5
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
then.69865:
	addi	%i4, %i7, 1
	mov	%i5, %i6
	mov	%i15, %i4
	mov	%i4, %i2
ca_loop.69866:
	ceqi	%i31, %i15, 0
	jzero	%i0, %i31, ca_cont.69867
	jzero	%i0, %i0, ca_done.69868
ca_cont.69867:
	sw	%i5, 0(%i2)
	addi	%i2, %i2, 4
	subi	%i15, %i15, 1
	set_label	%i31, ca_loop.69866
	jmp	%i0, 0(%i31)
ca_done.69868:
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
solver.2861:
	mov	%i9, %i5
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	lw	%i11, 9(%i5)
	lw	%i8, 6(%i5)
	lw	%i4, 5(%i5)
	lw	%i7, 4(%i5)
	lw	%i10, 3(%i5)
	lw	%i5, 1(%i5)
	lf	%f2, 0(%i6)
	lf	%f1, 0(%i4)
	fsub	%f6, %f2, %f1
	lf	%f2, 1(%i6)
	lf	%f1, 1(%i4)
	fsub	%f5, %f2, %f1
	lf	%f2, 2(%i6)
	lf	%f1, 2(%i4)
	fsub	%f4, %f2, %f1
	movi	%i31, 1
	jeq	%i5, %i31, then.69869
	movi	%i31, 2
	jeq	%i5, %i31, then.69870
	lf	%f9, 0(%i9)
	lf	%f8, 1(%i9)
	lf	%f7, 2(%i9)
	fmul	%f2, %f9, %f9
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f8, %f8
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f7, %f7
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i10, %i0, then.69871
	fmul	%f2, %f8, %f7
	lf	%f1, 0(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f7, %f9
	lf	%f1, 1(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f9, %f8
	lf	%f1, 2(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jzero	%i0, %i0, cont.69872
then.69871:
cont.69872:
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.69873
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.69873:
	lf	%f11, 0(%i9)
	lf	%f1, 1(%i9)
	lf	%f10, 2(%i9)
	fmul	%f7, %f11, %f6
	lf	%f2, 0(%i7)
	fmul	%f8, %f7, %f2
	fmul	%f7, %f1, %f5
	lf	%f2, 1(%i7)
	fmul	%f2, %f7, %f2
	fadd	%f8, %f8, %f2
	fmul	%f7, %f10, %f4
	lf	%f2, 2(%i7)
	fmul	%f2, %f7, %f2
	fadd	%f9, %f8, %f2
	jeq	%i10, %i0, then.69874
	fmul	%f7, %f10, %f5
	fmul	%f2, %f1, %f4
	fadd	%f7, %f7, %f2
	lf	%f2, 0(%i11)
	fmul	%f8, %f7, %f2
	fmul	%f7, %f11, %f4
	fmul	%f2, %f10, %f6
	fadd	%f7, %f7, %f2
	lf	%f2, 1(%i11)
	fmul	%f2, %f7, %f2
	fadd	%f7, %f8, %f2
	fmul	%f2, %f11, %f5
	fmul	%f1, %f1, %f6
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f7, %f1
	movui	%i31, 258048
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	fadd	%f2, %f9, %f1
	jzero	%i0, %i0, cont.69875
then.69874:
	fmov	%f2, %f9
cont.69875:
	fmul	%f7, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f8, %f7, %f1
	fmul	%f7, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f7, %f1
	fadd	%f8, %f8, %f1
	fmul	%f7, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f7, %f1
	fadd	%f8, %f8, %f1
	jeq	%i10, %i0, then.69876
	fmul	%f7, %f5, %f4
	lf	%f1, 0(%i11)
	fmul	%f1, %f7, %f1
	fadd	%f7, %f8, %f1
	fmul	%f4, %f4, %f6
	lf	%f1, 1(%i11)
	fmul	%f1, %f4, %f1
	fadd	%f7, %f7, %f1
	fmul	%f4, %f6, %f5
	lf	%f1, 2(%i11)
	fmul	%f1, %f4, %f1
	fadd	%f4, %f7, %f1
	jzero	%i0, %i0, cont.69877
then.69876:
	fmov	%f4, %f8
cont.69877:
	movi	%i31, 3
	jeq	%i5, %i31, then.69878
	fmov	%f1, %f4
	jzero	%i0, %i0, cont.69879
then.69878:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f4, %f1
cont.69879:
	fmul	%f4, %f2, %f2
	fmul	%f1, %f3, %f1
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.69880
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
	ceqi	%i4, %i8, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f4
	fsub	%f2, %f1, %f2
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.69880:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.69870:
	lf	%f2, 0(%i9)
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i9)
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i9)
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.69881
	lf	%f1, 0(%i7)
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f5
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
	fneg	%f2, %f1
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.69881:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.69869:
	lf	%f1, 0(%i9)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69882
	mov	%i4, %i0
	jzero	%i0, %i0, cont.69883
then.69882:
	lf	%f1, 0(%i9)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f6
	lf	%f1, 0(%i9)
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	lf	%f1, 1(%i9)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69884
	lf	%f1, 2(%i9)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69886
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.69885
then.69886:
	mov	%i4, %i0
cont.69887:
	jzero	%i0, %i0, cont.69885
then.69884:
	mov	%i4, %i0
cont.69885:
cont.69883:
	jeq	%i4, %i0, then.69888
	movi	%i4, 1
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.69888:
	lf	%f1, 1(%i9)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69889
	mov	%i4, %i0
	jzero	%i0, %i0, cont.69890
then.69889:
	lf	%f1, 1(%i9)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f5
	lf	%f1, 1(%i9)
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	lf	%f1, 2(%i9)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69891
	lf	%f1, 0(%i9)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69893
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.69892
then.69893:
	mov	%i4, %i0
cont.69894:
	jzero	%i0, %i0, cont.69892
then.69891:
	mov	%i4, %i0
cont.69892:
cont.69890:
	jeq	%i4, %i0, then.69895
	movi	%i4, 2
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.69895:
	lf	%f1, 2(%i9)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69896
	mov	%i4, %i0
	jzero	%i0, %i0, cont.69897
then.69896:
	lf	%f1, 2(%i9)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f4
	lf	%f1, 2(%i9)
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	lf	%f1, 0(%i9)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69898
	lf	%f1, 1(%i9)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69900
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.69899
then.69900:
	mov	%i4, %i0
cont.69901:
	jzero	%i0, %i0, cont.69899
then.69898:
	mov	%i4, %i0
cont.69899:
cont.69897:
	jeq	%i4, %i0, then.69902
	movi	%i4, 3
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.69902:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
shadow_check_and_group.2950:
	mov	%i7, %i4
	mov	%i6, %i5
loop_start.65365:
	slli	%i4, %i7, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.69904
	slli	%i4, %i7, 2
	add	%i31, %i6, %i4
	lw	%i9, 0(%i31)
	slli	%i5, %i9, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i13, 9(%i4)
	lw	%i12, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i8, 4(%i4)
	lw	%i11, 3(%i4)
	lw	%i10, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f5, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f3, %f2, %f1
	slli	%i5, %i9, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i10, %i31, then.69906
	movi	%i31, 2
	jeq	%i10, %i31, then.69908
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.69910
	mov	%i5, %i0
	jzero	%i0, %i0, cont.69907
then.69910:
	lf	%f2, 1(%i5)
	fmul	%f6, %f2, %f5
	lf	%f2, 2(%i5)
	fmul	%f2, %f2, %f4
	fadd	%f6, %f6, %f2
	lf	%f2, 3(%i5)
	fmul	%f2, %f2, %f3
	fadd	%f2, %f6, %f2
	fmul	%f7, %f5, %f5
	lf	%f6, 0(%i8)
	fmul	%f8, %f7, %f6
	fmul	%f7, %f4, %f4
	lf	%f6, 1(%i8)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	fmul	%f7, %f3, %f3
	lf	%f6, 2(%i8)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	jeq	%i11, %i0, then.69912
	fmul	%f7, %f4, %f3
	lf	%f6, 0(%i13)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f8, %f6
	fmul	%f6, %f3, %f5
	lf	%f3, 1(%i13)
	fmul	%f3, %f6, %f3
	fadd	%f6, %f7, %f3
	fmul	%f4, %f5, %f4
	lf	%f3, 2(%i13)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f6, %f3
	jzero	%i0, %i0, cont.69913
then.69912:
	fmov	%f4, %f8
cont.69913:
	movi	%i31, 3
	jeq	%i10, %i31, then.69914
	jzero	%i0, %i0, cont.69915
then.69914:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.69915:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.69916
	jeq	%i12, %i0, then.69918
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.69919
then.69918:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.69919:
	movi	%i5, 1
	jzero	%i0, %i0, cont.69917
then.69916:
	mov	%i5, %i0
cont.69917:
cont.69911:
	jzero	%i0, %i0, cont.69907
then.69908:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.69920
	lf	%f1, 1(%i5)
	fmul	%f2, %f1, %f5
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.69921
then.69920:
	mov	%i5, %i0
cont.69921:
cont.69909:
	jzero	%i0, %i0, cont.69907
then.69906:
	lf	%f1, 0(%i5)
	fsub	%f2, %f1, %f5
	lf	%f1, 1(%i5)
	fmul	%f6, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i8)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69922
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f3
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i8)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69924
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.69923
then.69924:
	mov	%i4, %i0
cont.69925:
	jzero	%i0, %i0, cont.69923
then.69922:
	mov	%i4, %i0
cont.69923:
	jeq	%i4, %i0, then.69926
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.69927
then.69926:
	lf	%f1, 2(%i5)
	fsub	%f2, %f1, %f4
	lf	%f1, 3(%i5)
	fmul	%f6, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i8)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69928
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f3
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i8)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69930
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.69929
then.69930:
	mov	%i4, %i0
cont.69931:
	jzero	%i0, %i0, cont.69929
then.69928:
	mov	%i4, %i0
cont.69929:
	jeq	%i4, %i0, then.69932
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.69933
then.69932:
	lf	%f1, 4(%i5)
	fsub	%f2, %f1, %f3
	lf	%f1, 5(%i5)
	fmul	%f3, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i8)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69934
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i8)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.69936
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.69935
then.69936:
	mov	%i4, %i0
cont.69937:
	jzero	%i0, %i0, cont.69935
then.69934:
	mov	%i4, %i0
cont.69935:
	jeq	%i4, %i0, then.69938
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.69939
then.69938:
	mov	%i5, %i0
cont.69939:
cont.69933:
cont.69927:
cont.69907:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.69940
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.69941
then.69940:
	mov	%i4, %i0
cont.69941:
	jeq	%i4, %i0, then.69942
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f3, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f3
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f3
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f3
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	mov	%i8, %i0
loop_start.65397:
	slli	%i4, %i8, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.69945
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i12, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i10)
	fsub	%f9, %f5, %f1
	lf	%f1, 1(%i10)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i10)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.69947
	movi	%i31, 2
	jeq	%i4, %i31, then.69949
	fmul	%f7, %f9, %f9
	lf	%f6, 0(%i9)
	fmul	%f8, %f7, %f6
	fmul	%f7, %f2, %f2
	lf	%f6, 1(%i9)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	fmul	%f7, %f1, %f1
	lf	%f6, 2(%i9)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	jeq	%i5, %i0, then.69951
	fmul	%f7, %f2, %f1
	lf	%f6, 0(%i12)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f8, %f6
	fmul	%f6, %f1, %f9
	lf	%f1, 1(%i12)
	fmul	%f1, %f6, %f1
	fadd	%f6, %f7, %f1
	fmul	%f2, %f9, %f2
	lf	%f1, 2(%i12)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f6, %f1
	jzero	%i0, %i0, cont.69952
then.69951:
	fmov	%f2, %f8
cont.69952:
	movi	%i31, 3
	jeq	%i4, %i31, then.69953
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.69954
then.69953:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.69954:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.69948
then.69949:
	lf	%f6, 0(%i9)
	fmul	%f7, %f6, %f9
	lf	%f6, 1(%i9)
	fmul	%f2, %f6, %f2
	fadd	%f6, %f7, %f2
	lf	%f2, 2(%i9)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f6, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.69950:
	jzero	%i0, %i0, cont.69948
then.69947:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f7, %f6, %f9
	lf	%f6, 0(%i9)
	flt	%i4, %f7, %f6
	jeq	%i4, %i0, then.69955
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f6, %f6, %f2
	lf	%f2, 1(%i9)
	flt	%i4, %f6, %f2
	jeq	%i4, %i0, then.69957
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i9)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.69956
then.69957:
	mov	%i4, %i0
cont.69958:
	jzero	%i0, %i0, cont.69956
then.69955:
	mov	%i4, %i0
cont.69956:
	jeq	%i4, %i0, then.69959
	mov	%i4, %i11
	jzero	%i0, %i0, cont.69960
then.69959:
	ceqi	%i4, %i11, 0
cont.69960:
cont.69948:
	jeq	%i4, %i0, then.69961
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65398
then.69961:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.69962:
	set_label	%i31, loop_start.65397
	jmp	%i0, 0(%i31)
then.69945:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65398
loop_end.65398:
	mov	%i4, %i31
	jeq	%i4, %i0, then.69963
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65366
then.69963:
	addi	%i4, %i7, 1
	mov	%i7, %i4
cont.69964:
	set_label	%i31, loop_start.65365
	jmp	%i0, 0(%i31)
then.69942:
	slli	%i5, %i9, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.69965
	addi	%i4, %i7, 1
	mov	%i7, %i4
	jzero	%i0, %i0, cont.69966
then.69965:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65366
cont.69966:
cont.69943:
	set_label	%i31, loop_start.65365
	jmp	%i0, 0(%i31)
then.69904:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65366
loop_end.65366:
	mov	%i4, %i31
	fmov	%f1, %f31
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
shadow_check_one_or_matrix.2956:
	mov	%i13, %i4
	mov	%i12, %i5
loop_start.65417:
	slli	%i4, %i13, 2
	add	%i31, %i12, %i4
	lw	%i11, 0(%i31)
	lw	%i14, 0(%i11)
	movi	%i31, -1
	jeq	%i14, %i31, then.69968
	movi	%i31, 99
	jeq	%i14, %i31, then.69970
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f2, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f4, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f1, %f4, %f1
	slli	%i5, %i14, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.69972
	movi	%i31, 2
	jeq	%i7, %i31, then.69974
	lf	%f5, 0(%i5)
	feq	%i4, %f5, %f0
	jeq	%i4, %i0, then.69976
	mov	%i4, %i0
	jzero	%i0, %i0, cont.69973
then.69976:
	lf	%f4, 1(%i5)
	fmul	%f6, %f4, %f3
	lf	%f4, 2(%i5)
	fmul	%f4, %f4, %f2
	fadd	%f6, %f6, %f4
	lf	%f4, 3(%i5)
	fmul	%f4, %f4, %f1
	fadd	%f4, %f6, %f4
	fmul	%f7, %f3, %f3
	lf	%f6, 0(%i6)
	fmul	%f8, %f7, %f6
	fmul	%f7, %f2, %f2
	lf	%f6, 1(%i6)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	fmul	%f7, %f1, %f1
	lf	%f6, 2(%i6)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	jeq	%i8, %i0, then.69978
	fmul	%f7, %f2, %f1
	lf	%f6, 0(%i10)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f8, %f6
	fmul	%f6, %f1, %f3
	lf	%f1, 1(%i10)
	fmul	%f1, %f6, %f1
	fadd	%f6, %f7, %f1
	fmul	%f2, %f3, %f2
	lf	%f1, 2(%i10)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f6, %f1
	jzero	%i0, %i0, cont.69979
then.69978:
	fmov	%f2, %f8
cont.69979:
	movi	%i31, 3
	jeq	%i7, %i31, then.69980
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.69981
then.69980:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.69981:
	fmul	%f2, %f4, %f4
	fmul	%f1, %f5, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.69982
	jeq	%i9, %i0, then.69984
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fadd	%f2, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.69985
then.69984:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.69985:
	movi	%i4, 1
	jzero	%i0, %i0, cont.69983
then.69982:
	mov	%i4, %i0
cont.69983:
cont.69977:
	jzero	%i0, %i0, cont.69973
then.69974:
	lf	%f4, 0(%i5)
	flt	%i4, %f4, %f0
	jeq	%i4, %i0, then.69986
	lf	%f4, 1(%i5)
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f4, %f2
	lf	%f2, 3(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.69987
then.69986:
	mov	%i4, %i0
cont.69987:
cont.69975:
	jzero	%i0, %i0, cont.69973
then.69972:
	lf	%f4, 0(%i5)
	fsub	%f5, %f4, %f3
	lf	%f4, 1(%i5)
	fmul	%f6, %f5, %f4
	lw	%i4, 244(%i0)
	lf	%f4, 1(%i4)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f2
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 1(%i6)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.69988
	lw	%i4, 244(%i0)
	lf	%f4, 2(%i4)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i6)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.69990
	lf	%f4, 1(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.69989
then.69990:
	mov	%i4, %i0
cont.69991:
	jzero	%i0, %i0, cont.69989
then.69988:
	mov	%i4, %i0
cont.69989:
	jeq	%i4, %i0, then.69992
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.69993
then.69992:
	lf	%f4, 2(%i5)
	fsub	%f5, %f4, %f2
	lf	%f4, 3(%i5)
	fmul	%f6, %f5, %f4
	lw	%i4, 244(%i0)
	lf	%f4, 0(%i4)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f3
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i6)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.69994
	lw	%i4, 244(%i0)
	lf	%f4, 2(%i4)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i6)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.69996
	lf	%f4, 3(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.69995
then.69996:
	mov	%i4, %i0
cont.69997:
	jzero	%i0, %i0, cont.69995
then.69994:
	mov	%i4, %i0
cont.69995:
	jeq	%i4, %i0, then.69998
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.69999
then.69998:
	lf	%f4, 4(%i5)
	fsub	%f4, %f4, %f1
	lf	%f1, 5(%i5)
	fmul	%f4, %f4, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.70000
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f2, %f1, %f2
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70002
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70001
then.70002:
	mov	%i4, %i0
cont.70003:
	jzero	%i0, %i0, cont.70001
then.70000:
	mov	%i4, %i0
cont.70001:
	jeq	%i4, %i0, then.70004
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.70005
then.70004:
	mov	%i4, %i0
cont.70005:
cont.69999:
cont.69993:
cont.69973:
	jeq	%i4, %i0, then.70006
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70008
	movi	%i10, 1
loop_start.65448:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70011
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	mov	%i8, %i0
loop_start.65452:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70014
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i7, 0(%i31)
	slli	%i5, %i7, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i17, 9(%i4)
	lw	%i16, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i15, 3(%i4)
	lw	%i14, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f5, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f3, %f2, %f1
	slli	%i5, %i7, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i14, %i31, then.70016
	movi	%i31, 2
	jeq	%i14, %i31, then.70018
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70020
	mov	%i5, %i0
	jzero	%i0, %i0, cont.70017
then.70020:
	lf	%f2, 1(%i5)
	fmul	%f6, %f2, %f5
	lf	%f2, 2(%i5)
	fmul	%f2, %f2, %f4
	fadd	%f6, %f6, %f2
	lf	%f2, 3(%i5)
	fmul	%f2, %f2, %f3
	fadd	%f2, %f6, %f2
	fmul	%f7, %f5, %f5
	lf	%f6, 0(%i6)
	fmul	%f8, %f7, %f6
	fmul	%f7, %f4, %f4
	lf	%f6, 1(%i6)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	fmul	%f7, %f3, %f3
	lf	%f6, 2(%i6)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	jeq	%i15, %i0, then.70022
	fmul	%f7, %f4, %f3
	lf	%f6, 0(%i17)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f8, %f6
	fmul	%f6, %f3, %f5
	lf	%f3, 1(%i17)
	fmul	%f3, %f6, %f3
	fadd	%f6, %f7, %f3
	fmul	%f4, %f5, %f4
	lf	%f3, 2(%i17)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f6, %f3
	jzero	%i0, %i0, cont.70023
then.70022:
	fmov	%f4, %f8
cont.70023:
	movi	%i31, 3
	jeq	%i14, %i31, then.70024
	jzero	%i0, %i0, cont.70025
then.70024:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.70025:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70026
	jeq	%i16, %i0, then.70028
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70029
then.70028:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70029:
	movi	%i5, 1
	jzero	%i0, %i0, cont.70027
then.70026:
	mov	%i5, %i0
cont.70027:
cont.70021:
	jzero	%i0, %i0, cont.70017
then.70018:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70030
	lf	%f1, 1(%i5)
	fmul	%f2, %f1, %f5
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.70031
then.70030:
	mov	%i5, %i0
cont.70031:
cont.70019:
	jzero	%i0, %i0, cont.70017
then.70016:
	lf	%f1, 0(%i5)
	fsub	%f2, %f1, %f5
	lf	%f1, 1(%i5)
	fmul	%f6, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70032
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f3
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70034
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70033
then.70034:
	mov	%i4, %i0
cont.70035:
	jzero	%i0, %i0, cont.70033
then.70032:
	mov	%i4, %i0
cont.70033:
	jeq	%i4, %i0, then.70036
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.70037
then.70036:
	lf	%f1, 2(%i5)
	fsub	%f2, %f1, %f4
	lf	%f1, 3(%i5)
	fmul	%f6, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70038
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f3
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70040
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70039
then.70040:
	mov	%i4, %i0
cont.70041:
	jzero	%i0, %i0, cont.70039
then.70038:
	mov	%i4, %i0
cont.70039:
	jeq	%i4, %i0, then.70042
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.70043
then.70042:
	lf	%f1, 4(%i5)
	fsub	%f2, %f1, %f3
	lf	%f1, 5(%i5)
	fmul	%f3, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70044
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70046
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70045
then.70046:
	mov	%i4, %i0
cont.70047:
	jzero	%i0, %i0, cont.70045
then.70044:
	mov	%i4, %i0
cont.70045:
	jeq	%i4, %i0, then.70048
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.70049
then.70048:
	mov	%i5, %i0
cont.70049:
cont.70043:
cont.70037:
cont.70017:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.70050
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70051
then.70050:
	mov	%i4, %i0
cont.70051:
	jeq	%i4, %i0, then.70052
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f3, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f3
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f3
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f3
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	mov	%i6, %i0
loop_start.65484:
	slli	%i4, %i6, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70055
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i16, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i15, 5(%i4)
	lw	%i14, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i15)
	fsub	%f9, %f5, %f1
	lf	%f1, 1(%i15)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i15)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.70057
	movi	%i31, 2
	jeq	%i4, %i31, then.70059
	fmul	%f7, %f9, %f9
	lf	%f6, 0(%i14)
	fmul	%f8, %f7, %f6
	fmul	%f7, %f2, %f2
	lf	%f6, 1(%i14)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	fmul	%f7, %f1, %f1
	lf	%f6, 2(%i14)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	jeq	%i7, %i0, then.70061
	fmul	%f7, %f2, %f1
	lf	%f6, 0(%i16)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f8, %f6
	fmul	%f6, %f1, %f9
	lf	%f1, 1(%i16)
	fmul	%f1, %f6, %f1
	fadd	%f6, %f7, %f1
	fmul	%f2, %f9, %f2
	lf	%f1, 2(%i16)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f6, %f1
	jzero	%i0, %i0, cont.70062
then.70061:
	fmov	%f2, %f8
cont.70062:
	movi	%i31, 3
	jeq	%i4, %i31, then.70063
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70064
then.70063:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70064:
	flt	%i7, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i7
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.70058
then.70059:
	lf	%f6, 0(%i14)
	fmul	%f7, %f6, %f9
	lf	%f6, 1(%i14)
	fmul	%f2, %f6, %f2
	fadd	%f6, %f7, %f2
	lf	%f2, 2(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f6, %f1
	flt	%i7, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i7
	ceq	%i4, %i4, %i5
cont.70060:
	jzero	%i0, %i0, cont.70058
then.70057:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f7, %f6, %f9
	lf	%f6, 0(%i14)
	flt	%i4, %f7, %f6
	jeq	%i4, %i0, then.70065
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f6, %f6, %f2
	lf	%f2, 1(%i14)
	flt	%i4, %f6, %f2
	jeq	%i4, %i0, then.70067
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i14)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70066
then.70067:
	mov	%i4, %i0
cont.70068:
	jzero	%i0, %i0, cont.70066
then.70065:
	mov	%i4, %i0
cont.70066:
	jeq	%i4, %i0, then.70069
	mov	%i4, %i5
	jzero	%i0, %i0, cont.70070
then.70069:
	ceqi	%i4, %i5, 0
cont.70070:
cont.70058:
	jeq	%i4, %i0, then.70071
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65485
then.70071:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.70072:
	set_label	%i31, loop_start.65484
	jmp	%i0, 0(%i31)
then.70055:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65485
loop_end.65485:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70073
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65453
then.70073:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.70074:
	set_label	%i31, loop_start.65452
	jmp	%i0, 0(%i31)
then.70052:
	slli	%i5, %i7, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.70075
	addi	%i4, %i8, 1
	mov	%i8, %i4
	jzero	%i0, %i0, cont.70076
then.70075:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65453
cont.70076:
cont.70053:
	set_label	%i31, loop_start.65452
	jmp	%i0, 0(%i31)
then.70014:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65453
loop_end.65453:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70077
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65449
then.70077:
	addi	%i4, %i10, 1
	mov	%i10, %i4
cont.70078:
	set_label	%i31, loop_start.65448
	jmp	%i0, 0(%i31)
then.70011:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65449
loop_end.65449:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.69971
then.70008:
	mov	%i4, %i0
cont.70009:
	jzero	%i0, %i0, cont.69971
then.70006:
	mov	%i4, %i0
cont.70007:
	jzero	%i0, %i0, cont.69971
then.69970:
	movi	%i4, 1
cont.69971:
	jeq	%i4, %i0, then.70079
	movi	%i10, 1
loop_start.65505:
	slli	%i4, %i10, 2
	add	%i31, %i11, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70082
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i9, 0(%i31)
	mov	%i8, %i0
loop_start.65509:
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70085
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i7, 0(%i31)
	slli	%i5, %i7, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i17, 9(%i4)
	lw	%i16, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i15, 3(%i4)
	lw	%i14, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f5, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f4, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f3, %f2, %f1
	slli	%i5, %i7, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i14, %i31, then.70087
	movi	%i31, 2
	jeq	%i14, %i31, then.70089
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70091
	mov	%i5, %i0
	jzero	%i0, %i0, cont.70088
then.70091:
	lf	%f2, 1(%i5)
	fmul	%f6, %f2, %f5
	lf	%f2, 2(%i5)
	fmul	%f2, %f2, %f4
	fadd	%f6, %f6, %f2
	lf	%f2, 3(%i5)
	fmul	%f2, %f2, %f3
	fadd	%f2, %f6, %f2
	fmul	%f7, %f5, %f5
	lf	%f6, 0(%i6)
	fmul	%f8, %f7, %f6
	fmul	%f7, %f4, %f4
	lf	%f6, 1(%i6)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	fmul	%f7, %f3, %f3
	lf	%f6, 2(%i6)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	jeq	%i15, %i0, then.70093
	fmul	%f7, %f4, %f3
	lf	%f6, 0(%i17)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f8, %f6
	fmul	%f6, %f3, %f5
	lf	%f3, 1(%i17)
	fmul	%f3, %f6, %f3
	fadd	%f6, %f7, %f3
	fmul	%f4, %f5, %f4
	lf	%f3, 2(%i17)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f6, %f3
	jzero	%i0, %i0, cont.70094
then.70093:
	fmov	%f4, %f8
cont.70094:
	movi	%i31, 3
	jeq	%i14, %i31, then.70095
	jzero	%i0, %i0, cont.70096
then.70095:
	movui	%i31, 260096
	mif	%f3, %i31
	fsub	%f4, %f4, %f3
cont.70096:
	fmul	%f3, %f2, %f2
	fmul	%f1, %f1, %f4
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70097
	jeq	%i16, %i0, then.70099
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70100
then.70099:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70100:
	movi	%i5, 1
	jzero	%i0, %i0, cont.70098
then.70097:
	mov	%i5, %i0
cont.70098:
cont.70092:
	jzero	%i0, %i0, cont.70088
then.70089:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70101
	lf	%f1, 1(%i5)
	fmul	%f2, %f1, %f5
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.70102
then.70101:
	mov	%i5, %i0
cont.70102:
cont.70090:
	jzero	%i0, %i0, cont.70088
then.70087:
	lf	%f1, 0(%i5)
	fsub	%f2, %f1, %f5
	lf	%f1, 1(%i5)
	fmul	%f6, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70103
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f3
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70105
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70104
then.70105:
	mov	%i4, %i0
cont.70106:
	jzero	%i0, %i0, cont.70104
then.70103:
	mov	%i4, %i0
cont.70104:
	jeq	%i4, %i0, then.70107
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.70108
then.70107:
	lf	%f1, 2(%i5)
	fsub	%f2, %f1, %f4
	lf	%f1, 3(%i5)
	fmul	%f6, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70109
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f2, %f1, %f3
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70111
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70110
then.70111:
	mov	%i4, %i0
cont.70112:
	jzero	%i0, %i0, cont.70110
then.70109:
	mov	%i4, %i0
cont.70110:
	jeq	%i4, %i0, then.70113
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.70114
then.70113:
	lf	%f1, 4(%i5)
	fsub	%f2, %f1, %f3
	lf	%f1, 5(%i5)
	fmul	%f3, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70115
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70117
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70116
then.70117:
	mov	%i4, %i0
cont.70118:
	jzero	%i0, %i0, cont.70116
then.70115:
	mov	%i4, %i0
cont.70116:
	jeq	%i4, %i0, then.70119
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.70120
then.70119:
	mov	%i5, %i0
cont.70120:
cont.70114:
cont.70108:
cont.70088:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.70121
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70122
then.70121:
	mov	%i4, %i0
cont.70122:
	jeq	%i4, %i0, then.70123
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f3, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f3
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f3
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f4, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f3
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f3, %f2, %f1
	mov	%i6, %i0
loop_start.65541:
	slli	%i4, %i6, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70126
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i16, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i15, 5(%i4)
	lw	%i14, 4(%i4)
	lw	%i7, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i15)
	fsub	%f9, %f5, %f1
	lf	%f1, 1(%i15)
	fsub	%f2, %f4, %f1
	lf	%f1, 2(%i15)
	fsub	%f1, %f3, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.70128
	movi	%i31, 2
	jeq	%i4, %i31, then.70130
	fmul	%f7, %f9, %f9
	lf	%f6, 0(%i14)
	fmul	%f8, %f7, %f6
	fmul	%f7, %f2, %f2
	lf	%f6, 1(%i14)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	fmul	%f7, %f1, %f1
	lf	%f6, 2(%i14)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	jeq	%i7, %i0, then.70132
	fmul	%f7, %f2, %f1
	lf	%f6, 0(%i16)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f8, %f6
	fmul	%f6, %f1, %f9
	lf	%f1, 1(%i16)
	fmul	%f1, %f6, %f1
	fadd	%f6, %f7, %f1
	fmul	%f2, %f9, %f2
	lf	%f1, 2(%i16)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f6, %f1
	jzero	%i0, %i0, cont.70133
then.70132:
	fmov	%f2, %f8
cont.70133:
	movi	%i31, 3
	jeq	%i4, %i31, then.70134
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70135
then.70134:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70135:
	flt	%i7, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i7
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.70129
then.70130:
	lf	%f6, 0(%i14)
	fmul	%f7, %f6, %f9
	lf	%f6, 1(%i14)
	fmul	%f2, %f6, %f2
	fadd	%f6, %f7, %f2
	lf	%f2, 2(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f6, %f1
	flt	%i7, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i7
	ceq	%i4, %i4, %i5
cont.70131:
	jzero	%i0, %i0, cont.70129
then.70128:
	fleq	%i4, %f0, %f9
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f7, %f6, %f9
	lf	%f6, 0(%i14)
	flt	%i4, %f7, %f6
	jeq	%i4, %i0, then.70136
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f6, %f6, %f2
	lf	%f2, 1(%i14)
	flt	%i4, %f6, %f2
	jeq	%i4, %i0, then.70138
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i14)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70137
then.70138:
	mov	%i4, %i0
cont.70139:
	jzero	%i0, %i0, cont.70137
then.70136:
	mov	%i4, %i0
cont.70137:
	jeq	%i4, %i0, then.70140
	mov	%i4, %i5
	jzero	%i0, %i0, cont.70141
then.70140:
	ceqi	%i4, %i5, 0
cont.70141:
cont.70129:
	jeq	%i4, %i0, then.70142
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65542
then.70142:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.70143:
	set_label	%i31, loop_start.65541
	jmp	%i0, 0(%i31)
then.70126:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65542
loop_end.65542:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70144
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65510
then.70144:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.70145:
	set_label	%i31, loop_start.65509
	jmp	%i0, 0(%i31)
then.70123:
	slli	%i5, %i7, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.70146
	addi	%i4, %i8, 1
	mov	%i8, %i4
	jzero	%i0, %i0, cont.70147
then.70146:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65510
cont.70147:
cont.70124:
	set_label	%i31, loop_start.65509
	jmp	%i0, 0(%i31)
then.70085:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65510
loop_end.65510:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70148
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65506
then.70148:
	addi	%i4, %i10, 1
	mov	%i10, %i4
cont.70149:
	set_label	%i31, loop_start.65505
	jmp	%i0, 0(%i31)
then.70082:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65506
loop_end.65506:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70150
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65418
then.70150:
	addi	%i4, %i13, 1
	mov	%i13, %i4
cont.70151:
	set_label	%i31, loop_start.65417
	jmp	%i0, 0(%i31)
then.70079:
	addi	%i4, %i13, 1
	mov	%i13, %i4
cont.70080:
	set_label	%i31, loop_start.65417
	jmp	%i0, 0(%i31)
then.69968:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65418
loop_end.65418:
	mov	%i4, %i31
	fmov	%f1, %f31
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
solve_each_element.2959:
	mov	%i11, %i4
	mov	%i10, %i5
loop_start.65564:
	slli	%i4, %i11, 2
	add	%i31, %i10, %i4
	lw	%i9, 0(%i31)
	movi	%i31, -1
	jeq	%i9, %i31, then.70153
	slli	%i5, %i9, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i13, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i12, 3(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 202(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i13)
	fsub	%f6, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i13)
	fsub	%f5, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i13)
	fsub	%f4, %f2, %f1
	movi	%i31, 1
	jeq	%i5, %i31, then.70155
	movi	%i31, 2
	jeq	%i5, %i31, then.70157
	lf	%f9, 0(%i6)
	lf	%f8, 1(%i6)
	lf	%f7, 2(%i6)
	fmul	%f2, %f9, %f9
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f8, %f8
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f7, %f7
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i12, %i0, then.70159
	fmul	%f2, %f8, %f7
	lf	%f1, 0(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f7, %f9
	lf	%f1, 1(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f9, %f8
	lf	%f1, 2(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jzero	%i0, %i0, cont.70160
then.70159:
cont.70160:
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.70161
	mov	%i8, %i0
	jzero	%i0, %i0, cont.70156
then.70161:
	lf	%f11, 0(%i6)
	lf	%f1, 1(%i6)
	lf	%f10, 2(%i6)
	fmul	%f7, %f11, %f6
	lf	%f2, 0(%i7)
	fmul	%f8, %f7, %f2
	fmul	%f7, %f1, %f5
	lf	%f2, 1(%i7)
	fmul	%f2, %f7, %f2
	fadd	%f8, %f8, %f2
	fmul	%f7, %f10, %f4
	lf	%f2, 2(%i7)
	fmul	%f2, %f7, %f2
	fadd	%f9, %f8, %f2
	jeq	%i12, %i0, then.70163
	fmul	%f7, %f10, %f5
	fmul	%f2, %f1, %f4
	fadd	%f7, %f7, %f2
	lf	%f2, 0(%i14)
	fmul	%f8, %f7, %f2
	fmul	%f7, %f11, %f4
	fmul	%f2, %f10, %f6
	fadd	%f7, %f7, %f2
	lf	%f2, 1(%i14)
	fmul	%f2, %f7, %f2
	fadd	%f7, %f8, %f2
	fmul	%f2, %f11, %f5
	fmul	%f1, %f1, %f6
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i14)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f7, %f1
	movui	%i31, 258048
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	fadd	%f2, %f9, %f1
	jzero	%i0, %i0, cont.70164
then.70163:
	fmov	%f2, %f9
cont.70164:
	fmul	%f7, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f8, %f7, %f1
	fmul	%f7, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f7, %f1
	fadd	%f8, %f8, %f1
	fmul	%f7, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f7, %f1
	fadd	%f8, %f8, %f1
	jeq	%i12, %i0, then.70165
	fmul	%f7, %f5, %f4
	lf	%f1, 0(%i14)
	fmul	%f1, %f7, %f1
	fadd	%f7, %f8, %f1
	fmul	%f4, %f4, %f6
	lf	%f1, 1(%i14)
	fmul	%f1, %f4, %f1
	fadd	%f7, %f7, %f1
	fmul	%f4, %f6, %f5
	lf	%f1, 2(%i14)
	fmul	%f1, %f4, %f1
	fadd	%f4, %f7, %f1
	jzero	%i0, %i0, cont.70166
then.70165:
	fmov	%f4, %f8
cont.70166:
	movi	%i31, 3
	jeq	%i5, %i31, then.70167
	fmov	%f1, %f4
	jzero	%i0, %i0, cont.70168
then.70167:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f4, %f1
cont.70168:
	fmul	%f4, %f2, %f2
	fmul	%f1, %f3, %f1
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70169
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
	ceqi	%i4, %i8, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f4
	fsub	%f2, %f1, %f2
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i8, 1
	jzero	%i0, %i0, cont.70170
then.70169:
	mov	%i8, %i0
cont.70170:
cont.70162:
	jzero	%i0, %i0, cont.70156
then.70157:
	lf	%f2, 0(%i6)
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i6)
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i6)
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.70171
	lf	%f1, 0(%i7)
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f5
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
	fneg	%f2, %f1
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i8, 1
	jzero	%i0, %i0, cont.70172
then.70171:
	mov	%i8, %i0
cont.70172:
cont.70158:
	jzero	%i0, %i0, cont.70156
then.70155:
	lf	%f1, 0(%i6)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70173
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70174
then.70173:
	lf	%f1, 0(%i6)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f6
	lf	%f1, 0(%i6)
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	lf	%f1, 1(%i6)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70175
	lf	%f1, 2(%i6)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70177
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70176
then.70177:
	mov	%i4, %i0
cont.70178:
	jzero	%i0, %i0, cont.70176
then.70175:
	mov	%i4, %i0
cont.70176:
cont.70174:
	jeq	%i4, %i0, then.70179
	movi	%i8, 1
	jzero	%i0, %i0, cont.70180
then.70179:
	lf	%f1, 1(%i6)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70181
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70182
then.70181:
	lf	%f1, 1(%i6)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f5
	lf	%f1, 1(%i6)
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	lf	%f1, 2(%i6)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70183
	lf	%f1, 0(%i6)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70185
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70184
then.70185:
	mov	%i4, %i0
cont.70186:
	jzero	%i0, %i0, cont.70184
then.70183:
	mov	%i4, %i0
cont.70184:
cont.70182:
	jeq	%i4, %i0, then.70187
	movi	%i8, 2
	jzero	%i0, %i0, cont.70188
then.70187:
	lf	%f1, 2(%i6)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70189
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70190
then.70189:
	lf	%f1, 2(%i6)
	flt	%i5, %f1, %f0
	mov	%i4, %i8
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i7)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f4
	lf	%f1, 2(%i6)
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	lf	%f1, 0(%i6)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70191
	lf	%f1, 1(%i6)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70193
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70192
then.70193:
	mov	%i4, %i0
cont.70194:
	jzero	%i0, %i0, cont.70192
then.70191:
	mov	%i4, %i0
cont.70192:
cont.70190:
	jeq	%i4, %i0, then.70195
	movi	%i8, 3
	jzero	%i0, %i0, cont.70196
then.70195:
	mov	%i8, %i0
cont.70196:
cont.70188:
cont.70180:
cont.70156:
	jeq	%i8, %i0, then.70197
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.70199
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.70200
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f7, %f2, %f1
	lf	%f1, 0(%i6)
	fmul	%f2, %f1, %f7
	lw	%i4, 202(%i0)
	lf	%f1, 0(%i4)
	fadd	%f6, %f2, %f1
	lf	%f1, 1(%i6)
	fmul	%f2, %f1, %f7
	lw	%i4, 202(%i0)
	lf	%f1, 1(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 2(%i6)
	fmul	%f2, %f1, %f7
	lw	%i4, 202(%i0)
	lf	%f1, 2(%i4)
	fadd	%f4, %f2, %f1
	mov	%i7, %i0
loop_start.65618:
	slli	%i4, %i7, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70202
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i14, 5(%i4)
	lw	%i13, 4(%i4)
	lw	%i12, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i14)
	fsub	%f3, %f6, %f1
	lf	%f1, 1(%i14)
	fsub	%f2, %f5, %f1
	lf	%f1, 2(%i14)
	fsub	%f1, %f4, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.70204
	movi	%i31, 2
	jeq	%i4, %i31, then.70206
	fmul	%f9, %f3, %f3
	lf	%f8, 0(%i13)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f2, %f2
	lf	%f8, 1(%i13)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i13)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i12, %i0, then.70208
	fmul	%f9, %f2, %f1
	lf	%f8, 0(%i15)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f3
	lf	%f1, 1(%i15)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f2, %f3, %f2
	lf	%f1, 2(%i15)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f8, %f1
	jzero	%i0, %i0, cont.70209
then.70208:
	fmov	%f2, %f10
cont.70209:
	movi	%i31, 3
	jeq	%i4, %i31, then.70210
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70211
then.70210:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70211:
	flt	%i12, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i12
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.70205
then.70206:
	lf	%f8, 0(%i13)
	fmul	%f8, %f8, %f3
	lf	%f3, 1(%i13)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f8, %f2
	lf	%f2, 2(%i13)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	flt	%i12, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i12
	ceq	%i4, %i4, %i5
cont.70207:
	jzero	%i0, %i0, cont.70205
then.70204:
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f3
	lf	%f3, 0(%i13)
	flt	%i4, %f8, %f3
	jeq	%i4, %i0, then.70212
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f2
	lf	%f2, 1(%i13)
	flt	%i4, %f3, %f2
	jeq	%i4, %i0, then.70214
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i13)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70213
then.70214:
	mov	%i4, %i0
cont.70215:
	jzero	%i0, %i0, cont.70213
then.70212:
	mov	%i4, %i0
cont.70213:
	jeq	%i4, %i0, then.70216
	mov	%i4, %i5
	jzero	%i0, %i0, cont.70217
then.70216:
	ceqi	%i4, %i5, 0
cont.70217:
cont.70205:
	jeq	%i4, %i0, then.70218
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65619
then.70218:
	addi	%i4, %i7, 1
	mov	%i7, %i4
cont.70219:
	set_label	%i31, loop_start.65618
	jmp	%i0, 0(%i31)
then.70202:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65619
loop_end.65619:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.70220
	lw	%i4, 160(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i9, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i8, 0(%i4)
cont.70220:
cont.70200:
cont.70199:
	addi	%i4, %i11, 1
	mov	%i11, %i4
	set_label	%i31, loop_start.65564
	jmp	%i0, 0(%i31)
then.70197:
	slli	%i5, %i9, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.70221
	addi	%i4, %i11, 1
	mov	%i11, %i4
	jzero	%i0, %i0, cont.70222
then.70221:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65565
cont.70222:
cont.70198:
	set_label	%i31, loop_start.65564
	jmp	%i0, 0(%i31)
then.70153:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65565
loop_end.65565:
	mov	%i4, %i31
	fmov	%f1, %f31
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
trace_or_matrix_fast.2981:
	mov	%i10, %i4
	mov	%i9, %i5
loop_start.65638:
	slli	%i4, %i10, 2
	add	%i31, %i9, %i4
	lw	%i8, 0(%i31)
	lw	%i15, 0(%i8)
	movi	%i31, -1
	jeq	%i15, %i31, then.70224
	movi	%i31, 99
	jeq	%i15, %i31, then.70226
	slli	%i5, %i15, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f3, 0(%i14)
	lf	%f2, 1(%i14)
	lf	%f1, 2(%i14)
	slli	%i4, %i15, 2
	add	%i31, %i7, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.70228
	movi	%i31, 2
	jeq	%i12, %i31, then.70230
	lf	%f5, 0(%i5)
	feq	%i4, %f5, %f0
	jeq	%i4, %i0, then.70232
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70229
then.70232:
	lf	%f4, 1(%i5)
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f4, %f2
	lf	%f2, 3(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i14)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f5, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70234
	jeq	%i13, %i0, then.70236
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70237
then.70236:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70237:
	movi	%i4, 1
	jzero	%i0, %i0, cont.70235
then.70234:
	mov	%i4, %i0
cont.70235:
cont.70233:
	jzero	%i0, %i0, cont.70229
then.70230:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70238
	lf	%f2, 0(%i5)
	lf	%f1, 3(%i14)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70239
then.70238:
	mov	%i4, %i0
cont.70239:
cont.70231:
	jzero	%i0, %i0, cont.70229
then.70228:
	lf	%f4, 0(%i5)
	fsub	%f5, %f4, %f3
	lf	%f4, 1(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 1(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f2
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 1(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70240
	lf	%f4, 2(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70242
	lf	%f4, 1(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70241
then.70242:
	mov	%i4, %i0
cont.70243:
	jzero	%i0, %i0, cont.70241
then.70240:
	mov	%i4, %i0
cont.70241:
	jeq	%i4, %i0, then.70244
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70245
then.70244:
	lf	%f4, 2(%i5)
	fsub	%f5, %f4, %f2
	lf	%f4, 3(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 0(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f3
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70246
	lf	%f4, 2(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70248
	lf	%f4, 3(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70247
then.70248:
	mov	%i4, %i0
cont.70249:
	jzero	%i0, %i0, cont.70247
then.70246:
	mov	%i4, %i0
cont.70247:
	jeq	%i4, %i0, then.70250
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.70251
then.70250:
	lf	%f4, 4(%i5)
	fsub	%f4, %f4, %f1
	lf	%f1, 5(%i5)
	fmul	%f4, %f4, %f1
	lf	%f1, 0(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.70252
	lf	%f1, 1(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f2, %f1, %f2
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i11)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70254
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70253
then.70254:
	mov	%i4, %i0
cont.70255:
	jzero	%i0, %i0, cont.70253
then.70252:
	mov	%i4, %i0
cont.70253:
	jeq	%i4, %i0, then.70256
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.70257
then.70256:
	mov	%i4, %i0
cont.70257:
cont.70251:
cont.70245:
cont.70229:
	jeq	%i4, %i0, cont.70258
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.70259
	movi	%i17, 1
loop_start.65669:
	slli	%i4, %i17, 2
	add	%i31, %i8, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70261
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	mov	%i15, %i0
loop_start.65673:
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i14, 0(%i31)
	movi	%i31, -1
	jeq	%i14, %i31, then.70264
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i18, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f3, 0(%i18)
	lf	%f2, 1(%i18)
	lf	%f1, 2(%i18)
	slli	%i4, %i14, 2
	add	%i31, %i7, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.70266
	movi	%i31, 2
	jeq	%i12, %i31, then.70268
	lf	%f5, 0(%i5)
	feq	%i4, %f5, %f0
	jeq	%i4, %i0, then.70270
	mov	%i13, %i0
	jzero	%i0, %i0, cont.70267
then.70270:
	lf	%f4, 1(%i5)
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f4, %f2
	lf	%f2, 3(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i18)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f5, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70272
	jeq	%i13, %i0, then.70274
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70275
then.70274:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70275:
	movi	%i13, 1
	jzero	%i0, %i0, cont.70273
then.70272:
	mov	%i13, %i0
cont.70273:
cont.70271:
	jzero	%i0, %i0, cont.70267
then.70268:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70276
	lf	%f2, 0(%i5)
	lf	%f1, 3(%i18)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.70277
then.70276:
	mov	%i13, %i0
cont.70277:
cont.70269:
	jzero	%i0, %i0, cont.70267
then.70266:
	lf	%f4, 0(%i5)
	fsub	%f5, %f4, %f3
	lf	%f4, 1(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 1(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f2
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 1(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70278
	lf	%f4, 2(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70280
	lf	%f4, 1(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70279
then.70280:
	mov	%i4, %i0
cont.70281:
	jzero	%i0, %i0, cont.70279
then.70278:
	mov	%i4, %i0
cont.70279:
	jeq	%i4, %i0, then.70282
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.70283
then.70282:
	lf	%f4, 2(%i5)
	fsub	%f5, %f4, %f2
	lf	%f4, 3(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 0(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f3
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70284
	lf	%f4, 2(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70286
	lf	%f4, 3(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70285
then.70286:
	mov	%i4, %i0
cont.70287:
	jzero	%i0, %i0, cont.70285
then.70284:
	mov	%i4, %i0
cont.70285:
	jeq	%i4, %i0, then.70288
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i13, 2
	jzero	%i0, %i0, cont.70289
then.70288:
	lf	%f4, 4(%i5)
	fsub	%f4, %f4, %f1
	lf	%f1, 5(%i5)
	fmul	%f4, %f4, %f1
	lf	%f1, 0(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.70290
	lf	%f1, 1(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f2, %f1, %f2
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i11)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70292
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70291
then.70292:
	mov	%i4, %i0
cont.70293:
	jzero	%i0, %i0, cont.70291
then.70290:
	mov	%i4, %i0
cont.70291:
	jeq	%i4, %i0, then.70294
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i13, 3
	jzero	%i0, %i0, cont.70295
then.70294:
	mov	%i13, %i0
cont.70295:
cont.70289:
cont.70283:
cont.70267:
	jeq	%i13, %i0, then.70296
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.70298
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.70299
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f7, %f2, %f1
	lf	%f1, 0(%i6)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f6, %f2, %f1
	lf	%f1, 1(%i6)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 2(%i6)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f4, %f2, %f1
	mov	%i12, %i0
loop_start.65704:
	slli	%i4, %i12, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70301
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 1(%i19)
	fsub	%f2, %f5, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f4, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.70303
	movi	%i31, 2
	jeq	%i4, %i31, then.70305
	fmul	%f9, %f3, %f3
	lf	%f8, 0(%i5)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f2, %f2
	lf	%f8, 1(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i18, %i0, then.70307
	fmul	%f9, %f2, %f1
	lf	%f8, 0(%i20)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f3
	lf	%f1, 1(%i20)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f2, %f3, %f2
	lf	%f1, 2(%i20)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f8, %f1
	jzero	%i0, %i0, cont.70308
then.70307:
	fmov	%f2, %f10
cont.70308:
	movi	%i31, 3
	jeq	%i4, %i31, then.70309
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70310
then.70309:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70310:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.70304
then.70305:
	lf	%f8, 0(%i5)
	fmul	%f8, %f8, %f3
	lf	%f3, 1(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f8, %f2
	lf	%f2, 2(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.70306:
	jzero	%i0, %i0, cont.70304
then.70303:
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f3
	lf	%f3, 0(%i5)
	flt	%i4, %f8, %f3
	jeq	%i4, %i0, then.70311
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f2
	lf	%f2, 1(%i5)
	flt	%i4, %f3, %f2
	jeq	%i4, %i0, then.70313
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70312
then.70313:
	mov	%i4, %i0
cont.70314:
	jzero	%i0, %i0, cont.70312
then.70311:
	mov	%i4, %i0
cont.70312:
	jeq	%i4, %i0, then.70315
	mov	%i4, %i11
	jzero	%i0, %i0, cont.70316
then.70315:
	ceqi	%i4, %i11, 0
cont.70316:
cont.70304:
	jeq	%i4, %i0, then.70317
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65705
then.70317:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.70318:
	set_label	%i31, loop_start.65704
	jmp	%i0, 0(%i31)
then.70301:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65705
loop_end.65705:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.70319
	lw	%i4, 160(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i14, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i13, 0(%i4)
cont.70319:
cont.70299:
cont.70298:
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.65673
	jmp	%i0, 0(%i31)
then.70296:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.70320
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.70321
then.70320:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65674
cont.70321:
cont.70297:
	set_label	%i31, loop_start.65673
	jmp	%i0, 0(%i31)
then.70264:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65674
loop_end.65674:
	mov	%i0, %i31
	addi	%i4, %i17, 1
	mov	%i17, %i4
	set_label	%i31, loop_start.65669
	jmp	%i0, 0(%i31)
then.70261:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65670
loop_end.65670:
	mov	%i0, %i31
cont.70259:
cont.70258:
	jzero	%i0, %i0, cont.70227
then.70226:
	movi	%i17, 1
loop_start.65725:
	slli	%i4, %i17, 2
	add	%i31, %i8, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70323
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	mov	%i15, %i0
loop_start.65729:
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i14, 0(%i31)
	movi	%i31, -1
	jeq	%i14, %i31, then.70326
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i18, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f3, 0(%i18)
	lf	%f2, 1(%i18)
	lf	%f1, 2(%i18)
	slli	%i4, %i14, 2
	add	%i31, %i7, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.70328
	movi	%i31, 2
	jeq	%i12, %i31, then.70330
	lf	%f5, 0(%i5)
	feq	%i4, %f5, %f0
	jeq	%i4, %i0, then.70332
	mov	%i13, %i0
	jzero	%i0, %i0, cont.70329
then.70332:
	lf	%f4, 1(%i5)
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f4, %f2
	lf	%f2, 3(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i18)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f5, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70334
	jeq	%i13, %i0, then.70336
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70337
then.70336:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70337:
	movi	%i13, 1
	jzero	%i0, %i0, cont.70335
then.70334:
	mov	%i13, %i0
cont.70335:
cont.70333:
	jzero	%i0, %i0, cont.70329
then.70330:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70338
	lf	%f2, 0(%i5)
	lf	%f1, 3(%i18)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.70339
then.70338:
	mov	%i13, %i0
cont.70339:
cont.70331:
	jzero	%i0, %i0, cont.70329
then.70328:
	lf	%f4, 0(%i5)
	fsub	%f5, %f4, %f3
	lf	%f4, 1(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 1(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f2
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 1(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70340
	lf	%f4, 2(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70342
	lf	%f4, 1(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70341
then.70342:
	mov	%i4, %i0
cont.70343:
	jzero	%i0, %i0, cont.70341
then.70340:
	mov	%i4, %i0
cont.70341:
	jeq	%i4, %i0, then.70344
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.70345
then.70344:
	lf	%f4, 2(%i5)
	fsub	%f5, %f4, %f2
	lf	%f4, 3(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 0(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f3
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70346
	lf	%f4, 2(%i6)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70348
	lf	%f4, 3(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70347
then.70348:
	mov	%i4, %i0
cont.70349:
	jzero	%i0, %i0, cont.70347
then.70346:
	mov	%i4, %i0
cont.70347:
	jeq	%i4, %i0, then.70350
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i13, 2
	jzero	%i0, %i0, cont.70351
then.70350:
	lf	%f4, 4(%i5)
	fsub	%f4, %f4, %f1
	lf	%f1, 5(%i5)
	fmul	%f4, %f4, %f1
	lf	%f1, 0(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.70352
	lf	%f1, 1(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f2, %f1, %f2
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i11)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70354
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70353
then.70354:
	mov	%i4, %i0
cont.70355:
	jzero	%i0, %i0, cont.70353
then.70352:
	mov	%i4, %i0
cont.70353:
	jeq	%i4, %i0, then.70356
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i13, 3
	jzero	%i0, %i0, cont.70357
then.70356:
	mov	%i13, %i0
cont.70357:
cont.70351:
cont.70345:
cont.70329:
	jeq	%i13, %i0, then.70358
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.70360
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.70361
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f7, %f2, %f1
	lf	%f1, 0(%i6)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f6, %f2, %f1
	lf	%f1, 1(%i6)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 2(%i6)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f4, %f2, %f1
	mov	%i12, %i0
loop_start.65760:
	slli	%i4, %i12, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70363
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 1(%i19)
	fsub	%f2, %f5, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f4, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.70365
	movi	%i31, 2
	jeq	%i4, %i31, then.70367
	fmul	%f9, %f3, %f3
	lf	%f8, 0(%i5)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f2, %f2
	lf	%f8, 1(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i18, %i0, then.70369
	fmul	%f9, %f2, %f1
	lf	%f8, 0(%i20)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f3
	lf	%f1, 1(%i20)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f2, %f3, %f2
	lf	%f1, 2(%i20)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f8, %f1
	jzero	%i0, %i0, cont.70370
then.70369:
	fmov	%f2, %f10
cont.70370:
	movi	%i31, 3
	jeq	%i4, %i31, then.70371
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70372
then.70371:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70372:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.70366
then.70367:
	lf	%f8, 0(%i5)
	fmul	%f8, %f8, %f3
	lf	%f3, 1(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f8, %f2
	lf	%f2, 2(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.70368:
	jzero	%i0, %i0, cont.70366
then.70365:
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f3
	lf	%f3, 0(%i5)
	flt	%i4, %f8, %f3
	jeq	%i4, %i0, then.70373
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f2
	lf	%f2, 1(%i5)
	flt	%i4, %f3, %f2
	jeq	%i4, %i0, then.70375
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70374
then.70375:
	mov	%i4, %i0
cont.70376:
	jzero	%i0, %i0, cont.70374
then.70373:
	mov	%i4, %i0
cont.70374:
	jeq	%i4, %i0, then.70377
	mov	%i4, %i11
	jzero	%i0, %i0, cont.70378
then.70377:
	ceqi	%i4, %i11, 0
cont.70378:
cont.70366:
	jeq	%i4, %i0, then.70379
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65761
then.70379:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.70380:
	set_label	%i31, loop_start.65760
	jmp	%i0, 0(%i31)
then.70363:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65761
loop_end.65761:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.70381
	lw	%i4, 160(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i14, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i13, 0(%i4)
cont.70381:
cont.70361:
cont.70360:
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.65729
	jmp	%i0, 0(%i31)
then.70358:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.70382
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.70383
then.70382:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65730
cont.70383:
cont.70359:
	set_label	%i31, loop_start.65729
	jmp	%i0, 0(%i31)
then.70326:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65730
loop_end.65730:
	mov	%i0, %i31
	addi	%i4, %i17, 1
	mov	%i17, %i4
	set_label	%i31, loop_start.65725
	jmp	%i0, 0(%i31)
then.70323:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65726
loop_end.65726:
	mov	%i0, %i31
cont.70227:
	addi	%i4, %i10, 1
	mov	%i10, %i4
	set_label	%i31, loop_start.65638
	jmp	%i0, 0(%i31)
then.70224:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65639
loop_end.65639:
	mov	%i4, %i31
	fmov	%f1, %f31
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
judge_intersection_fast.2985:
	mov	%i10, %i4
	mov	%i9, %i5
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	mov	%i8, %i0
	lw	%i4, 151(%i0)
	lw	%i7, 0(%i4)
loop_start.65782:
	slli	%i4, %i8, 2
	add	%i31, %i7, %i4
	lw	%i6, 0(%i31)
	lw	%i4, 0(%i6)
	movi	%i31, -1
	jeq	%i4, %i31, then.70385
	movi	%i31, 99
	jeq	%i4, %i31, then.70387
	slli	%i11, %i4, 2
	lw	%i5, 15(%i0)
	add	%i31, %i5, %i11
	lw	%i5, 0(%i31)
	lw	%i14, 10(%i5)
	lw	%i13, 6(%i5)
	lw	%i11, 4(%i5)
	lw	%i12, 1(%i5)
	lf	%f3, 0(%i14)
	lf	%f2, 1(%i14)
	lf	%f1, 2(%i14)
	slli	%i4, %i4, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.70389
	movi	%i31, 2
	jeq	%i12, %i31, then.70391
	lf	%f5, 0(%i5)
	feq	%i4, %f5, %f0
	jeq	%i4, %i0, then.70393
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70390
then.70393:
	lf	%f4, 1(%i5)
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f4, %f2
	lf	%f2, 3(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i14)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f5, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70395
	jeq	%i13, %i0, then.70397
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70398
then.70397:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70398:
	movi	%i4, 1
	jzero	%i0, %i0, cont.70396
then.70395:
	mov	%i4, %i0
cont.70396:
cont.70394:
	jzero	%i0, %i0, cont.70390
then.70391:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70399
	lf	%f2, 0(%i5)
	lf	%f1, 3(%i14)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70400
then.70399:
	mov	%i4, %i0
cont.70400:
cont.70392:
	jzero	%i0, %i0, cont.70390
then.70389:
	lf	%f4, 0(%i5)
	fsub	%f5, %f4, %f3
	lf	%f4, 1(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 1(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f2
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 1(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70401
	lf	%f4, 2(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70403
	lf	%f4, 1(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70402
then.70403:
	mov	%i4, %i0
cont.70404:
	jzero	%i0, %i0, cont.70402
then.70401:
	mov	%i4, %i0
cont.70402:
	jeq	%i4, %i0, then.70405
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70406
then.70405:
	lf	%f4, 2(%i5)
	fsub	%f5, %f4, %f2
	lf	%f4, 3(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 0(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f3
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70407
	lf	%f4, 2(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70409
	lf	%f4, 3(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70408
then.70409:
	mov	%i4, %i0
cont.70410:
	jzero	%i0, %i0, cont.70408
then.70407:
	mov	%i4, %i0
cont.70408:
	jeq	%i4, %i0, then.70411
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.70412
then.70411:
	lf	%f4, 4(%i5)
	fsub	%f4, %f4, %f1
	lf	%f1, 5(%i5)
	fmul	%f4, %f4, %f1
	lf	%f1, 0(%i10)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.70413
	lf	%f1, 1(%i10)
	fmul	%f1, %f4, %f1
	fadd	%f2, %f1, %f2
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i11)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70415
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70414
then.70415:
	mov	%i4, %i0
cont.70416:
	jzero	%i0, %i0, cont.70414
then.70413:
	mov	%i4, %i0
cont.70414:
	jeq	%i4, %i0, then.70417
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.70418
then.70417:
	mov	%i4, %i0
cont.70418:
cont.70412:
cont.70406:
cont.70390:
	jeq	%i4, %i0, cont.70419
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.70420
	movi	%i17, 1
loop_start.65813:
	slli	%i4, %i17, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70422
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	mov	%i15, %i0
loop_start.65817:
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i14, 0(%i31)
	movi	%i31, -1
	jeq	%i14, %i31, then.70425
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i18, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f3, 0(%i18)
	lf	%f2, 1(%i18)
	lf	%f1, 2(%i18)
	slli	%i4, %i14, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.70427
	movi	%i31, 2
	jeq	%i12, %i31, then.70429
	lf	%f5, 0(%i5)
	feq	%i4, %f5, %f0
	jeq	%i4, %i0, then.70431
	mov	%i13, %i0
	jzero	%i0, %i0, cont.70428
then.70431:
	lf	%f4, 1(%i5)
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f4, %f2
	lf	%f2, 3(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i18)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f5, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70433
	jeq	%i13, %i0, then.70435
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70436
then.70435:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70436:
	movi	%i13, 1
	jzero	%i0, %i0, cont.70434
then.70433:
	mov	%i13, %i0
cont.70434:
cont.70432:
	jzero	%i0, %i0, cont.70428
then.70429:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70437
	lf	%f2, 0(%i5)
	lf	%f1, 3(%i18)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.70438
then.70437:
	mov	%i13, %i0
cont.70438:
cont.70430:
	jzero	%i0, %i0, cont.70428
then.70427:
	lf	%f4, 0(%i5)
	fsub	%f5, %f4, %f3
	lf	%f4, 1(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 1(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f2
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 1(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70439
	lf	%f4, 2(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70441
	lf	%f4, 1(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70440
then.70441:
	mov	%i4, %i0
cont.70442:
	jzero	%i0, %i0, cont.70440
then.70439:
	mov	%i4, %i0
cont.70440:
	jeq	%i4, %i0, then.70443
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.70444
then.70443:
	lf	%f4, 2(%i5)
	fsub	%f5, %f4, %f2
	lf	%f4, 3(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 0(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f3
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70445
	lf	%f4, 2(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70447
	lf	%f4, 3(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70446
then.70447:
	mov	%i4, %i0
cont.70448:
	jzero	%i0, %i0, cont.70446
then.70445:
	mov	%i4, %i0
cont.70446:
	jeq	%i4, %i0, then.70449
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i13, 2
	jzero	%i0, %i0, cont.70450
then.70449:
	lf	%f4, 4(%i5)
	fsub	%f4, %f4, %f1
	lf	%f1, 5(%i5)
	fmul	%f4, %f4, %f1
	lf	%f1, 0(%i10)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.70451
	lf	%f1, 1(%i10)
	fmul	%f1, %f4, %f1
	fadd	%f2, %f1, %f2
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i11)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70453
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70452
then.70453:
	mov	%i4, %i0
cont.70454:
	jzero	%i0, %i0, cont.70452
then.70451:
	mov	%i4, %i0
cont.70452:
	jeq	%i4, %i0, then.70455
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i13, 3
	jzero	%i0, %i0, cont.70456
then.70455:
	mov	%i13, %i0
cont.70456:
cont.70450:
cont.70444:
cont.70428:
	jeq	%i13, %i0, then.70457
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.70459
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.70460
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f7, %f2, %f1
	lf	%f1, 0(%i10)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f6, %f2, %f1
	lf	%f1, 1(%i10)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 2(%i10)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f4, %f2, %f1
	mov	%i12, %i0
loop_start.65848:
	slli	%i4, %i12, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70462
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 1(%i19)
	fsub	%f2, %f5, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f4, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.70464
	movi	%i31, 2
	jeq	%i4, %i31, then.70466
	fmul	%f9, %f3, %f3
	lf	%f8, 0(%i5)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f2, %f2
	lf	%f8, 1(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i18, %i0, then.70468
	fmul	%f9, %f2, %f1
	lf	%f8, 0(%i20)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f3
	lf	%f1, 1(%i20)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f2, %f3, %f2
	lf	%f1, 2(%i20)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f8, %f1
	jzero	%i0, %i0, cont.70469
then.70468:
	fmov	%f2, %f10
cont.70469:
	movi	%i31, 3
	jeq	%i4, %i31, then.70470
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70471
then.70470:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70471:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.70465
then.70466:
	lf	%f8, 0(%i5)
	fmul	%f8, %f8, %f3
	lf	%f3, 1(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f8, %f2
	lf	%f2, 2(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.70467:
	jzero	%i0, %i0, cont.70465
then.70464:
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f3
	lf	%f3, 0(%i5)
	flt	%i4, %f8, %f3
	jeq	%i4, %i0, then.70472
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f2
	lf	%f2, 1(%i5)
	flt	%i4, %f3, %f2
	jeq	%i4, %i0, then.70474
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70473
then.70474:
	mov	%i4, %i0
cont.70475:
	jzero	%i0, %i0, cont.70473
then.70472:
	mov	%i4, %i0
cont.70473:
	jeq	%i4, %i0, then.70476
	mov	%i4, %i11
	jzero	%i0, %i0, cont.70477
then.70476:
	ceqi	%i4, %i11, 0
cont.70477:
cont.70465:
	jeq	%i4, %i0, then.70478
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65849
then.70478:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.70479:
	set_label	%i31, loop_start.65848
	jmp	%i0, 0(%i31)
then.70462:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65849
loop_end.65849:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.70480
	lw	%i4, 160(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i14, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i13, 0(%i4)
cont.70480:
cont.70460:
cont.70459:
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.65817
	jmp	%i0, 0(%i31)
then.70457:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.70481
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.70482
then.70481:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65818
cont.70482:
cont.70458:
	set_label	%i31, loop_start.65817
	jmp	%i0, 0(%i31)
then.70425:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65818
loop_end.65818:
	mov	%i0, %i31
	addi	%i4, %i17, 1
	mov	%i17, %i4
	set_label	%i31, loop_start.65813
	jmp	%i0, 0(%i31)
then.70422:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65814
loop_end.65814:
	mov	%i0, %i31
cont.70420:
cont.70419:
	jzero	%i0, %i0, cont.70388
then.70387:
	movi	%i15, 1
loop_start.65869:
	slli	%i4, %i15, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70484
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i14, 0(%i31)
	mov	%i13, %i0
loop_start.65873:
	slli	%i4, %i13, 2
	add	%i31, %i14, %i4
	lw	%i12, 0(%i31)
	movi	%i31, -1
	jeq	%i12, %i31, then.70487
	slli	%i5, %i12, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i18, 10(%i4)
	lw	%i17, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i16, 1(%i4)
	lf	%f3, 0(%i18)
	lf	%f2, 1(%i18)
	lf	%f1, 2(%i18)
	slli	%i4, %i12, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i16, %i31, then.70489
	movi	%i31, 2
	jeq	%i16, %i31, then.70491
	lf	%f5, 0(%i5)
	feq	%i4, %f5, %f0
	jeq	%i4, %i0, then.70493
	mov	%i17, %i0
	jzero	%i0, %i0, cont.70490
then.70493:
	lf	%f4, 1(%i5)
	fmul	%f4, %f4, %f3
	lf	%f3, 2(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f4, %f2
	lf	%f2, 3(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i18)
	fmul	%f2, %f3, %f3
	fmul	%f1, %f5, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70495
	jeq	%i17, %i0, then.70497
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70498
then.70497:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fsub	%f2, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70498:
	movi	%i17, 1
	jzero	%i0, %i0, cont.70496
then.70495:
	mov	%i17, %i0
cont.70496:
cont.70494:
	jzero	%i0, %i0, cont.70490
then.70491:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70499
	lf	%f2, 0(%i5)
	lf	%f1, 3(%i18)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i17, 1
	jzero	%i0, %i0, cont.70500
then.70499:
	mov	%i17, %i0
cont.70500:
cont.70492:
	jzero	%i0, %i0, cont.70490
then.70489:
	lf	%f4, 0(%i5)
	fsub	%f5, %f4, %f3
	lf	%f4, 1(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 1(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f2
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 1(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70501
	lf	%f4, 2(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70503
	lf	%f4, 1(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70502
then.70503:
	mov	%i4, %i0
cont.70504:
	jzero	%i0, %i0, cont.70502
then.70501:
	mov	%i4, %i0
cont.70502:
	jeq	%i4, %i0, then.70505
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i17, 1
	jzero	%i0, %i0, cont.70506
then.70505:
	lf	%f4, 2(%i5)
	fsub	%f5, %f4, %f2
	lf	%f4, 3(%i5)
	fmul	%f6, %f5, %f4
	lf	%f4, 0(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f3
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70507
	lf	%f4, 2(%i10)
	fmul	%f4, %f6, %f4
	fadd	%f5, %f4, %f1
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f5, %f4, %f5
	lf	%f4, 2(%i11)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.70509
	lf	%f4, 3(%i5)
	feq	%i4, %f4, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70508
then.70509:
	mov	%i4, %i0
cont.70510:
	jzero	%i0, %i0, cont.70508
then.70507:
	mov	%i4, %i0
cont.70508:
	jeq	%i4, %i0, then.70511
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i17, 2
	jzero	%i0, %i0, cont.70512
then.70511:
	lf	%f4, 4(%i5)
	fsub	%f4, %f4, %f1
	lf	%f1, 5(%i5)
	fmul	%f4, %f4, %f1
	lf	%f1, 0(%i10)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.70513
	lf	%f1, 1(%i10)
	fmul	%f1, %f4, %f1
	fadd	%f2, %f1, %f2
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i11)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70515
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70514
then.70515:
	mov	%i4, %i0
cont.70516:
	jzero	%i0, %i0, cont.70514
then.70513:
	mov	%i4, %i0
cont.70514:
	jeq	%i4, %i0, then.70517
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i17, 3
	jzero	%i0, %i0, cont.70518
then.70517:
	mov	%i17, %i0
cont.70518:
cont.70512:
cont.70506:
cont.70490:
	jeq	%i17, %i0, then.70519
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, cont.70521
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.70522
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f7, %f2, %f1
	lf	%f1, 0(%i10)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f6, %f2, %f1
	lf	%f1, 1(%i10)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f5, %f2, %f1
	lf	%f1, 2(%i10)
	fmul	%f2, %f1, %f7
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f4, %f2, %f1
	mov	%i16, %i0
loop_start.65904:
	slli	%i4, %i16, 2
	add	%i31, %i14, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70524
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 1(%i19)
	fsub	%f2, %f5, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f4, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.70526
	movi	%i31, 2
	jeq	%i4, %i31, then.70528
	fmul	%f9, %f3, %f3
	lf	%f8, 0(%i5)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f2, %f2
	lf	%f8, 1(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i18, %i0, then.70530
	fmul	%f9, %f2, %f1
	lf	%f8, 0(%i20)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f3
	lf	%f1, 1(%i20)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f2, %f3, %f2
	lf	%f1, 2(%i20)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f8, %f1
	jzero	%i0, %i0, cont.70531
then.70530:
	fmov	%f2, %f10
cont.70531:
	movi	%i31, 3
	jeq	%i4, %i31, then.70532
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70533
then.70532:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70533:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.70527
then.70528:
	lf	%f8, 0(%i5)
	fmul	%f8, %f8, %f3
	lf	%f3, 1(%i5)
	fmul	%f2, %f3, %f2
	fadd	%f3, %f8, %f2
	lf	%f2, 2(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.70529:
	jzero	%i0, %i0, cont.70527
then.70526:
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f3
	lf	%f3, 0(%i5)
	flt	%i4, %f8, %f3
	jeq	%i4, %i0, then.70534
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f2
	lf	%f2, 1(%i5)
	flt	%i4, %f3, %f2
	jeq	%i4, %i0, then.70536
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70535
then.70536:
	mov	%i4, %i0
cont.70537:
	jzero	%i0, %i0, cont.70535
then.70534:
	mov	%i4, %i0
cont.70535:
	jeq	%i4, %i0, then.70538
	mov	%i4, %i11
	jzero	%i0, %i0, cont.70539
then.70538:
	ceqi	%i4, %i11, 0
cont.70539:
cont.70527:
	jeq	%i4, %i0, then.70540
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65905
then.70540:
	addi	%i4, %i16, 1
	mov	%i16, %i4
cont.70541:
	set_label	%i31, loop_start.65904
	jmp	%i0, 0(%i31)
then.70524:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.65905
loop_end.65905:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.70542
	lw	%i4, 160(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f4, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i12, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i17, 0(%i4)
cont.70542:
cont.70522:
cont.70521:
	addi	%i4, %i13, 1
	mov	%i13, %i4
	set_label	%i31, loop_start.65873
	jmp	%i0, 0(%i31)
then.70519:
	slli	%i5, %i12, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.70543
	addi	%i4, %i13, 1
	mov	%i13, %i4
	jzero	%i0, %i0, cont.70544
then.70543:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65874
cont.70544:
cont.70520:
	set_label	%i31, loop_start.65873
	jmp	%i0, 0(%i31)
then.70487:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65874
loop_end.65874:
	mov	%i0, %i31
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.65869
	jmp	%i0, 0(%i31)
then.70484:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65870
loop_end.65870:
	mov	%i0, %i31
cont.70388:
	addi	%i4, %i8, 1
	mov	%i8, %i4
	set_label	%i31, loop_start.65782
	jmp	%i0, 0(%i31)
then.70385:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65783
loop_end.65783:
	mov	%i0, %i31
	lw	%i4, 160(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f2
	jeq	%i4, %i0, then.70545
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.70545:
	mov	%i4, %i0
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
utexture.2996:
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
	jeq	%i4, %i31, then.70546
	movi	%i31, 2
	jeq	%i4, %i31, then.70547
	movi	%i31, 3
	jeq	%i4, %i31, then.70548
	movi	%i31, 4
	jeq	%i4, %i31, then.70549
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.70549:
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
	jeq	%i4, %i0, then.70551
	movui	%i31, 268032
	mif	%f2, %i31
	jzero	%i0, %i0, cont.70552
then.70551:
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
	jzero	%i0, %i31, else.70553
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f5
	jzero	%i0, %i31, else.70555
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
	jzero	%i0, %i0, cont.70554
else.70555:
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
cont.70556:
	jzero	%i0, %i0, cont.70554
else.70553:
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
cont.70554:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.70552:
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
	jeq	%i4, %i0, then.70557
	movui	%i31, 268032
	mif	%f3, %i31
	jzero	%i0, %i0, cont.70558
then.70557:
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
	jzero	%i0, %i31, else.70559
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f5
	jzero	%i0, %i31, else.70561
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
	jzero	%i0, %i0, cont.70560
else.70561:
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
cont.70562:
	jzero	%i0, %i0, cont.70560
else.70559:
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
cont.70560:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.70558:
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
	jeq	%i4, %i0, then.70563
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70564
then.70563:
	fmov	%f2, %f1
cont.70564:
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
then.70548:
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
	jzero	%i0, %i31, else.70566
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70568
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
	jzero	%i0, %i0, cont.70567
else.70568:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70570
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
	jzero	%i0, %i31, else.70572
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70573
else.70572:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70573:
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
	jzero	%i0, %i0, cont.70571
else.70570:
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
cont.70571:
cont.70569:
	jzero	%i0, %i0, cont.70567
else.70566:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70574
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
	jzero	%i0, %i31, else.70576
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70577
else.70576:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70577:
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
	jzero	%i0, %i0, cont.70575
else.70574:
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
cont.70575:
cont.70567:
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
then.70547:
	lf	%f2, 1(%i15)
	movui	%i31, 256000
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70579
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70581
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
	jzero	%i0, %i0, cont.70580
else.70581:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70583
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
	jzero	%i0, %i31, else.70585
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70586
else.70585:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70586:
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
	jzero	%i0, %i0, cont.70584
else.70583:
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
cont.70584:
cont.70582:
	jzero	%i0, %i0, cont.70580
else.70579:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70587
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
	jzero	%i0, %i31, else.70589
	fmov	%f4, %f2
	jzero	%i0, %i0, cont.70590
else.70589:
	lf	%f1, 0(%i0)
	fsub	%f4, %f1, %f2
cont.70590:
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
	jzero	%i0, %i0, cont.70588
else.70587:
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
cont.70588:
cont.70580:
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
then.70546:
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
	jeq	%i5, %i0, then.70592
	jeq	%i4, %i0, then.70594
	movui	%i31, 276464
	mif	%f1, %i31
	jzero	%i0, %i0, cont.70593
then.70594:
	fmov	%f1, %f0
cont.70595:
	jzero	%i0, %i0, cont.70593
then.70592:
	jeq	%i4, %i0, then.70596
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70597
then.70596:
	movui	%i31, 276464
	mif	%f1, %i31
cont.70597:
cont.70593:
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
trace_ray.3008:
	subi	%i1, %i1, 16
	sw	%i3, 2(%i1)
	mov	%i31, %i4
	sw	%i31, 0(%i1)
	mov	%i31, %i5
	sw	%i31, 1(%i1)
	mov	%i4, %i6
	mov	%i23, %i7
	mov	%i22, %i8
	mov	%i21, %i9
	mov	%i20, %i10
	mov	%i4, %i11
	mov	%i4, %i12
	mov	%i19, %i13
	fmov	%f17, %f1
	fmov	%f16, %f2
loop_start.65960:
	movi	%i31, 4
	lw	%i30, 0(%i1)
	jleq	%i30, %i31, then.70600
	mov	%i31, %i0
	set_label	%i30, loop_end.65961
	jmp	%i0, 0(%i30)
then.70600:
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	mov	%i10, %i0
	lw	%i4, 151(%i0)
	lw	%i9, 0(%i4)
loop_start.65962:
	slli	%i4, %i10, 2
	add	%i31, %i9, %i4
	lw	%i8, 0(%i31)
	lw	%i4, 0(%i8)
	movi	%i31, -1
	jeq	%i4, %i31, then.70603
	movi	%i31, 99
	jeq	%i4, %i31, then.70605
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i13, 9(%i4)
	lw	%i7, 6(%i4)
	lw	%i12, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i11, 3(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 202(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i12)
	fsub	%f6, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i12)
	fsub	%f5, %f2, %f1
	lw	%i4, 202(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i12)
	fsub	%f4, %f2, %f1
	movi	%i31, 1
	jeq	%i5, %i31, then.70607
	movi	%i31, 2
	jeq	%i5, %i31, then.70609
	lw	%i31, 1(%i1)
	lf	%f9, 0(%i31)
	lw	%i31, 1(%i1)
	lf	%f8, 1(%i31)
	lw	%i31, 1(%i1)
	lf	%f7, 2(%i31)
	fmul	%f2, %f9, %f9
	lf	%f1, 0(%i6)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f8, %f8
	lf	%f1, 1(%i6)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f7, %f7
	lf	%f1, 2(%i6)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i11, %i0, then.70611
	fmul	%f2, %f8, %f7
	lf	%f1, 0(%i13)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f7, %f9
	lf	%f1, 1(%i13)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f9, %f8
	lf	%f1, 2(%i13)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jzero	%i0, %i0, cont.70612
then.70611:
cont.70612:
	feq	%i4, %f3, %f0
	jeq	%i4, %i0, then.70613
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70608
then.70613:
	lw	%i31, 1(%i1)
	lf	%f2, 0(%i31)
	lw	%i31, 1(%i1)
	lf	%f1, 1(%i31)
	lw	%i31, 1(%i1)
	lf	%f11, 2(%i31)
	fmul	%f8, %f2, %f6
	lf	%f7, 0(%i6)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f1, %f5
	lf	%f7, 1(%i6)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f11, %f4
	lf	%f7, 2(%i6)
	fmul	%f7, %f8, %f7
	fadd	%f10, %f9, %f7
	jeq	%i11, %i0, then.70615
	fmul	%f8, %f11, %f5
	fmul	%f7, %f1, %f4
	fadd	%f8, %f8, %f7
	lf	%f7, 0(%i13)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f2, %f4
	fmul	%f7, %f11, %f6
	fadd	%f8, %f8, %f7
	lf	%f7, 1(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f7, %f9, %f7
	fmul	%f2, %f2, %f5
	fmul	%f1, %f1, %f6
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i13)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f7, %f1
	movui	%i31, 258048
	mif	%f1, %i31
	fmul	%f1, %f2, %f1
	fadd	%f2, %f10, %f1
	jzero	%i0, %i0, cont.70616
then.70615:
	fmov	%f2, %f10
cont.70616:
	fmul	%f7, %f6, %f6
	lf	%f1, 0(%i6)
	fmul	%f8, %f7, %f1
	fmul	%f7, %f5, %f5
	lf	%f1, 1(%i6)
	fmul	%f1, %f7, %f1
	fadd	%f8, %f8, %f1
	fmul	%f7, %f4, %f4
	lf	%f1, 2(%i6)
	fmul	%f1, %f7, %f1
	fadd	%f8, %f8, %f1
	jeq	%i11, %i0, then.70617
	fmul	%f7, %f5, %f4
	lf	%f1, 0(%i13)
	fmul	%f1, %f7, %f1
	fadd	%f7, %f8, %f1
	fmul	%f4, %f4, %f6
	lf	%f1, 1(%i13)
	fmul	%f1, %f4, %f1
	fadd	%f7, %f7, %f1
	fmul	%f4, %f6, %f5
	lf	%f1, 2(%i13)
	fmul	%f1, %f4, %f1
	fadd	%f4, %f7, %f1
	jzero	%i0, %i0, cont.70618
then.70617:
	fmov	%f4, %f8
cont.70618:
	movi	%i31, 3
	jeq	%i5, %i31, then.70619
	fmov	%f1, %f4
	jzero	%i0, %i0, cont.70620
then.70619:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f4, %f1
cont.70620:
	fmul	%f4, %f2, %f2
	fmul	%f1, %f3, %f1
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70621
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
	ceqi	%i4, %i7, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f4
	fsub	%f2, %f1, %f2
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70622
then.70621:
	mov	%i4, %i0
cont.70622:
cont.70614:
	jzero	%i0, %i0, cont.70608
then.70609:
	lw	%i31, 1(%i1)
	lf	%f2, 0(%i31)
	lf	%f1, 0(%i6)
	fmul	%f3, %f2, %f1
	lw	%i31, 1(%i1)
	lf	%f2, 1(%i31)
	lf	%f1, 1(%i6)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lw	%i31, 1(%i1)
	lf	%f2, 2(%i31)
	lf	%f1, 2(%i6)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, then.70623
	lf	%f1, 0(%i6)
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i6)
	fmul	%f1, %f1, %f5
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i6)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f2, %f1
	fneg	%f2, %f1
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70624
then.70623:
	mov	%i4, %i0
cont.70624:
cont.70610:
	jzero	%i0, %i0, cont.70608
then.70607:
	lw	%i31, 1(%i1)
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70625
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70626
then.70625:
	lw	%i31, 1(%i1)
	lf	%f1, 0(%i31)
	flt	%i5, %f1, %f0
	mov	%i4, %i7
	xor	%i4, %i4, %i5
	lf	%f2, 0(%i6)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f6
	lw	%i31, 1(%i1)
	lf	%f1, 0(%i31)
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	lw	%i31, 1(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70627
	lw	%i31, 1(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70629
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70628
then.70629:
	mov	%i4, %i0
cont.70630:
	jzero	%i0, %i0, cont.70628
then.70627:
	mov	%i4, %i0
cont.70628:
cont.70626:
	jeq	%i4, %i0, then.70631
	movi	%i4, 1
	jzero	%i0, %i0, cont.70632
then.70631:
	lw	%i31, 1(%i1)
	lf	%f1, 1(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70633
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70634
then.70633:
	lw	%i31, 1(%i1)
	lf	%f1, 1(%i31)
	flt	%i5, %f1, %f0
	mov	%i4, %i7
	xor	%i4, %i4, %i5
	lf	%f2, 1(%i6)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f5
	lw	%i31, 1(%i1)
	lf	%f1, 1(%i31)
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	lw	%i31, 1(%i1)
	lf	%f1, 2(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f4
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70635
	lw	%i31, 1(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70637
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70636
then.70637:
	mov	%i4, %i0
cont.70638:
	jzero	%i0, %i0, cont.70636
then.70635:
	mov	%i4, %i0
cont.70636:
cont.70634:
	jeq	%i4, %i0, then.70639
	movi	%i4, 2
	jzero	%i0, %i0, cont.70640
then.70639:
	lw	%i31, 1(%i1)
	lf	%f1, 2(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70641
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70642
then.70641:
	lw	%i31, 1(%i1)
	lf	%f1, 2(%i31)
	flt	%i5, %f1, %f0
	mov	%i4, %i7
	xor	%i4, %i4, %i5
	lf	%f2, 2(%i6)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f2
	fsub	%f2, %f1, %f4
	lw	%i31, 1(%i1)
	lf	%f1, 2(%i31)
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	lw	%i31, 1(%i1)
	lf	%f1, 0(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70643
	lw	%i31, 1(%i1)
	lf	%f1, 1(%i31)
	fmul	%f1, %f3, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i6)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70645
	lw	%i4, 154(%i0)
	sf	%f3, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70644
then.70645:
	mov	%i4, %i0
cont.70646:
	jzero	%i0, %i0, cont.70644
then.70643:
	mov	%i4, %i0
cont.70644:
cont.70642:
	jeq	%i4, %i0, then.70647
	movi	%i4, 3
	jzero	%i0, %i0, cont.70648
then.70647:
	mov	%i4, %i0
cont.70648:
cont.70640:
cont.70632:
cont.70608:
	jeq	%i4, %i0, cont.70649
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, cont.70650
	movi	%i7, 1
loop_start.66016:
	slli	%i4, %i7, 2
	add	%i31, %i8, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70652
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	lw	%i31, 1(%i1)
	mov	%i6, %i31
	subi	%i1, %i1, 16
	sw	%i7, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	set_label	%i31, solve_each_element.2959
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i4, %i7, 1
	mov	%i7, %i4
	set_label	%i31, loop_start.66016
	jmp	%i0, 0(%i31)
then.70652:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66017
loop_end.66017:
	mov	%i0, %i31
cont.70650:
cont.70649:
	jzero	%i0, %i0, cont.70606
then.70605:
	movi	%i7, 1
loop_start.66021:
	slli	%i4, %i7, 2
	add	%i31, %i8, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70655
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	lw	%i31, 1(%i1)
	mov	%i6, %i31
	subi	%i1, %i1, 16
	sw	%i7, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sw	%i10, 3(%i1)
	set_label	%i31, solve_each_element.2959
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lw	%i10, 3(%i1)
	addi	%i1, %i1, 16
	addi	%i4, %i7, 1
	mov	%i7, %i4
	set_label	%i31, loop_start.66021
	jmp	%i0, 0(%i31)
then.70655:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66022
loop_end.66022:
	mov	%i0, %i31
cont.70606:
	addi	%i4, %i10, 1
	mov	%i10, %i4
	set_label	%i31, loop_start.65962
	jmp	%i0, 0(%i31)
then.70603:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65963
loop_end.65963:
	mov	%i0, %i31
	lw	%i4, 160(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f2
	jeq	%i4, %i0, then.70657
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70658
then.70657:
	mov	%i4, %i0
cont.70658:
	ceq	%i30, %i4, %i0
	jzero	%i0, %i30, Lrelax_skip_0
	set_label	%i30, then.70659
	jmp	%i0, 0(%i30)
Lrelax_skip_0:
	lw	%i4, 168(%i0)
	lw	%i9, 0(%i4)
	slli	%i5, %i9, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	lw	%i12, 9(%i5)
	lw	%i8, 8(%i5)
	lw	%i18, 7(%i5)
	lw	%i4, 6(%i5)
	lw	%i7, 5(%i5)
	lw	%i6, 4(%i5)
	lw	%i11, 3(%i5)
	lw	%i17, 2(%i5)
	lw	%i10, 1(%i5)
	lw	%i5, 0(%i5)
	lf	%f1, 0(%i18)
	fmul	%f4, %f1, %f17
	movi	%i31, 1
	jeq	%i10, %i31, then.70661
	movi	%i31, 2
	jeq	%i10, %i31, then.70663
	lw	%i10, 163(%i0)
	lf	%f2, 0(%i10)
	lf	%f1, 0(%i7)
	fsub	%f3, %f2, %f1
	lw	%i10, 163(%i0)
	lf	%f2, 1(%i10)
	lf	%f1, 1(%i7)
	fsub	%f2, %f2, %f1
	lw	%i10, 163(%i0)
	lf	%f5, 2(%i10)
	lf	%f1, 2(%i7)
	fsub	%f9, %f5, %f1
	lf	%f1, 0(%i6)
	fmul	%f8, %f3, %f1
	lf	%f1, 1(%i6)
	fmul	%f7, %f2, %f1
	lf	%f1, 2(%i6)
	fmul	%f1, %f9, %f1
	jeq	%i11, %i0, then.70665
	lf	%f5, 2(%i12)
	fmul	%f6, %f2, %f5
	lf	%f5, 1(%i12)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f8, %f5
	lw	%i10, 171(%i0)
	sf	%f5, 0(%i10)
	lf	%f5, 2(%i12)
	fmul	%f6, %f3, %f5
	lf	%f5, 0(%i12)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f7, %f5
	lw	%i10, 171(%i0)
	sf	%f5, 1(%i10)
	lf	%f5, 1(%i12)
	fmul	%f5, %f3, %f5
	lf	%f3, 0(%i12)
	fmul	%f2, %f2, %f3
	fadd	%f3, %f5, %f2
	movui	%i31, 258048
	mif	%f2, %i31
	fmul	%f2, %f3, %f2
	fadd	%f1, %f1, %f2
	lw	%i10, 171(%i0)
	sf	%f1, 2(%i10)
	jzero	%i0, %i0, cont.70666
then.70665:
	lw	%i10, 171(%i0)
	sf	%f8, 0(%i10)
	lw	%i10, 171(%i0)
	sf	%f7, 1(%i10)
	lw	%i10, 171(%i0)
	sf	%f1, 2(%i10)
cont.70666:
	lw	%i10, 171(%i0)
	lf	%f1, 0(%i10)
	fmul	%f2, %f1, %f1
	lw	%i10, 171(%i0)
	lf	%f1, 1(%i10)
	fmul	%f1, %f1, %f1
	fadd	%f2, %f2, %f1
	lw	%i10, 171(%i0)
	lf	%f1, 2(%i10)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	feq	%i10, %f1, %f0
	jeq	%i10, %i0, then.70667
	movui	%i31, 260096
	mif	%f2, %i31
	jzero	%i0, %i0, cont.70668
then.70667:
	jeq	%i4, %i0, then.70669
	movui	%i31, 784384
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	jzero	%i0, %i0, cont.70670
then.70669:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.70670:
cont.70668:
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
	jzero	%i0, %i0, cont.70662
then.70663:
	lf	%f1, 0(%i6)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.70664:
	jzero	%i0, %i0, cont.70662
then.70661:
	lw	%i4, 157(%i0)
	lw	%i10, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i10, %i10, 1
	slli	%i4, %i10, 2
	lw	%i30, 1(%i1)
	add	%i31, %i30, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70671
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70672
then.70671:
	flt	%i4, %f0, %f1
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
cont.70672:
	fneg	%f1, %f1
	slli	%i10, %i10, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i10
	sf	%f1, 0(%i31)
cont.70662:
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 2(%i4)
	lf	%f1, 0(%i8)
	lw	%i4, 176(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i8)
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i8)
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
	movi	%i31, 1
	jeq	%i5, %i31, then.70673
	movi	%i31, 2
	jeq	%i5, %i31, then.70675
	movi	%i31, 3
	jeq	%i5, %i31, then.70677
	ceqi	%i31, %i5, 4
	jzero	%i0, %i31, cont.70679
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i7)
	fsub	%f3, %f2, %f1
	lf	%f1, 0(%i6)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fmul	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i7)
	fsub	%f3, %f2, %f1
	lf	%f1, 2(%i6)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f1, %f2, %f1
	fmul	%f5, %f3, %f1
	fmul	%f2, %f6, %f6
	fmul	%f1, %f5, %f5
	fadd	%f3, %f2, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f6
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70680
	movui	%i31, 268032
	mif	%f2, %i31
	jzero	%i0, %i0, cont.70681
then.70680:
	finv	%f1, %f6
	fmul	%f2, %f5, %f1
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f2
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f6, %f1
	jzero	%i0, %i31, else.70682
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f6
	jzero	%i0, %i31, else.70684
	fmul	%f5, %f6, %f6
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f5
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	jzero	%i0, %i0, cont.70683
else.70684:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f6
	fmul	%f6, %f2, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	lf	%f1, 2(%i0)
	fadd	%f2, %f2, %f1
cont.70685:
	jzero	%i0, %i0, cont.70683
else.70682:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f6
	fmul	%f6, %f2, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f2, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i0)
	fadd	%f2, %f2, %f1
cont.70683:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
cont.70681:
	fmov	%f1, %f2
	ffloor	%f1, %f1
	fsub	%f2, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f5, 1(%i4)
	lf	%f1, 1(%i7)
	fsub	%f6, %f5, %f1
	lf	%f1, 1(%i6)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fmul	%f6, %f6, %f1
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f3
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.70686
	movui	%i31, 268032
	mif	%f3, %i31
	jzero	%i0, %i0, cont.70687
then.70686:
	finv	%f1, %f3
	fmul	%f3, %f6, %f1
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f3
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f6, %f1
	jzero	%i0, %i31, else.70688
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f6
	jzero	%i0, %i31, else.70690
	fmul	%f5, %f6, %f6
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	jzero	%i0, %i0, cont.70689
else.70690:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f6
	fmul	%f6, %f3, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i0)
	fadd	%f3, %f3, %f1
cont.70691:
	jzero	%i0, %i0, cont.70689
else.70688:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f6
	fmul	%f6, %f3, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	lf	%f1, 1(%i0)
	fadd	%f3, %f3, %f1
cont.70689:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.70687:
	fmov	%f1, %f3
	ffloor	%f1, %f1
	fsub	%f5, %f3, %f1
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
	fsub	%f1, %f1, %f5
	fmul	%f1, %f1, %f1
	fsub	%f1, %f2, %f1
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70692
	fmov	%f2, %f0
	jzero	%i0, %i0, cont.70693
then.70692:
	fmov	%f2, %f1
cont.70693:
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
cont.70679:
	jzero	%i0, %i0, cont.70674
then.70677:
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i7)
	fsub	%f3, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i7)
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
	jzero	%i0, %i31, else.70694
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70696
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
	fmul	%f1, %f1, %f2
	jzero	%i0, %i0, cont.70695
else.70696:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70698
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
	jzero	%i0, %i31, else.70700
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70701
else.70700:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70701:
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.70699
else.70698:
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
	fmul	%f1, %f1, %f5
cont.70699:
cont.70697:
	jzero	%i0, %i0, cont.70695
else.70694:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70702
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
	jzero	%i0, %i31, else.70704
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70705
else.70704:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70705:
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.70703
else.70702:
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
	fmul	%f1, %f1, %f5
cont.70703:
cont.70695:
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
cont.70678:
	jzero	%i0, %i0, cont.70674
then.70675:
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	movui	%i31, 256000
	mif	%f1, %i31
	fmul	%f2, %f2, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70706
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70708
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
	fmul	%f1, %f1, %f2
	jzero	%i0, %i0, cont.70707
else.70708:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.70710
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
	jzero	%i0, %i31, else.70712
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70713
else.70712:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70713:
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.70711
else.70710:
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
	fmul	%f1, %f1, %f5
cont.70711:
cont.70709:
	jzero	%i0, %i0, cont.70707
else.70706:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.70714
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
	jzero	%i0, %i31, else.70716
	fmov	%f5, %f2
	jzero	%i0, %i0, cont.70717
else.70716:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f2
cont.70717:
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.70715
else.70714:
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
	fmul	%f1, %f1, %f5
cont.70715:
cont.70707:
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
cont.70676:
	jzero	%i0, %i0, cont.70674
then.70673:
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i7)
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
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i7)
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
	jeq	%i5, %i0, then.70718
	jeq	%i4, %i0, then.70720
	movui	%i31, 276464
	mif	%f1, %i31
	jzero	%i0, %i0, cont.70719
then.70720:
	fmov	%f1, %f0
cont.70721:
	jzero	%i0, %i0, cont.70719
then.70718:
	jeq	%i4, %i0, then.70722
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.70723
then.70722:
	movui	%i31, 276464
	mif	%f1, %i31
cont.70723:
cont.70719:
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
cont.70674:
	slli	%i5, %i9, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i5, %i5, %i4
	lw	%i31, 0(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i22, %i4
	sw	%i5, 0(%i31)
	lw	%i31, 0(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i23, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
	lf	%f2, 0(%i18)
	movui	%i31, 258048
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70724
	lw	%i31, 0(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i21, %i4
	sw	%i0, 0(%i31)
	jzero	%i0, %i0, cont.70725
then.70724:
	movi	%i5, 1
	lw	%i31, 0(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i21, %i4
	sw	%i5, 0(%i31)
	lw	%i31, 0(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i20, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
	lw	%i31, 0(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i20, %i4
	lw	%i4, 0(%i31)
	movui	%i31, 243712
	mif	%f1, %i31
	fmul	%f2, %f1, %f4
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f2
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f2
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f2
	sf	%f1, 2(%i4)
	lw	%i31, 0(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i19, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.70725:
	movui	%i31, 786432
	mif	%f5, %i31
	lw	%i31, 1(%i1)
	lf	%f2, 0(%i31)
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i31, 1(%i1)
	lf	%f2, 1(%i31)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lw	%i31, 1(%i1)
	lf	%f2, 2(%i31)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	fmul	%f3, %f5, %f1
	lw	%i31, 1(%i1)
	lf	%f2, 0(%i31)
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i31, 1(%i1)
	sf	%f1, 0(%i31)
	lw	%i31, 1(%i1)
	lf	%f2, 1(%i31)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i31, 1(%i1)
	sf	%f1, 1(%i31)
	lw	%i31, 1(%i1)
	lf	%f2, 2(%i31)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i31, 1(%i1)
	sf	%f1, 2(%i31)
	lf	%f1, 1(%i18)
	fmul	%f3, %f17, %f1
	mov	%i8, %i0
	lw	%i4, 151(%i0)
	lw	%i7, 0(%i4)
loop_start.66079:
	slli	%i4, %i8, 2
	add	%i31, %i7, %i4
	lw	%i6, 0(%i31)
	lw	%i14, 0(%i6)
	movi	%i31, -1
	jeq	%i14, %i31, then.70727
	movi	%i31, 99
	jeq	%i14, %i31, then.70729
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i13, 9(%i4)
	lw	%i12, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i11, 3(%i4)
	lw	%i10, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f7, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f6, %f2, %f1
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f5, %f2, %f1
	slli	%i5, %i14, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i10, %i31, then.70731
	movi	%i31, 2
	jeq	%i10, %i31, then.70733
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.70735
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70732
then.70735:
	lf	%f2, 1(%i5)
	fmul	%f8, %f2, %f7
	lf	%f2, 2(%i5)
	fmul	%f2, %f2, %f6
	fadd	%f8, %f8, %f2
	lf	%f2, 3(%i5)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f8, %f2
	fmul	%f9, %f7, %f7
	lf	%f8, 0(%i9)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f6, %f6
	lf	%f8, 1(%i9)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f5, %f5
	lf	%f8, 2(%i9)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i11, %i0, then.70737
	fmul	%f9, %f6, %f5
	lf	%f8, 0(%i13)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f5, %f7
	lf	%f5, 1(%i13)
	fmul	%f5, %f8, %f5
	fadd	%f8, %f9, %f5
	fmul	%f6, %f7, %f6
	lf	%f5, 2(%i13)
	fmul	%f5, %f6, %f5
	fadd	%f6, %f8, %f5
	jzero	%i0, %i0, cont.70738
then.70737:
	fmov	%f6, %f10
cont.70738:
	movi	%i31, 3
	jeq	%i10, %i31, then.70739
	jzero	%i0, %i0, cont.70740
then.70739:
	movui	%i31, 260096
	mif	%f5, %i31
	fsub	%f6, %f6, %f5
cont.70740:
	fmul	%f5, %f2, %f2
	fmul	%f1, %f1, %f6
	fsub	%f1, %f5, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70741
	jeq	%i12, %i0, then.70743
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fadd	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70744
then.70743:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70744:
	movi	%i4, 1
	jzero	%i0, %i0, cont.70742
then.70741:
	mov	%i4, %i0
cont.70742:
cont.70736:
	jzero	%i0, %i0, cont.70732
then.70733:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70745
	lf	%f1, 1(%i5)
	fmul	%f2, %f1, %f7
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f6
	fadd	%f2, %f2, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70746
then.70745:
	mov	%i4, %i0
cont.70746:
cont.70734:
	jzero	%i0, %i0, cont.70732
then.70731:
	lf	%f1, 0(%i5)
	fsub	%f2, %f1, %f7
	lf	%f1, 1(%i5)
	fmul	%f8, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i9)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70747
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i9)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70749
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70748
then.70749:
	mov	%i4, %i0
cont.70750:
	jzero	%i0, %i0, cont.70748
then.70747:
	mov	%i4, %i0
cont.70748:
	jeq	%i4, %i0, then.70751
	lw	%i4, 154(%i0)
	sf	%f8, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70752
then.70751:
	lf	%f1, 2(%i5)
	fsub	%f2, %f1, %f6
	lf	%f1, 3(%i5)
	fmul	%f8, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f7
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i9)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70753
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i9)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70755
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70754
then.70755:
	mov	%i4, %i0
cont.70756:
	jzero	%i0, %i0, cont.70754
then.70753:
	mov	%i4, %i0
cont.70754:
	jeq	%i4, %i0, then.70757
	lw	%i4, 154(%i0)
	sf	%f8, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.70758
then.70757:
	lf	%f1, 4(%i5)
	fsub	%f2, %f1, %f5
	lf	%f1, 5(%i5)
	fmul	%f5, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f2, %f1, %f7
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i9)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70759
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i9)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70761
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70760
then.70761:
	mov	%i4, %i0
cont.70762:
	jzero	%i0, %i0, cont.70760
then.70759:
	mov	%i4, %i0
cont.70760:
	jeq	%i4, %i0, then.70763
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.70764
then.70763:
	mov	%i4, %i0
cont.70764:
cont.70758:
cont.70752:
cont.70732:
	jeq	%i4, %i0, then.70765
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70767
	movi	%i16, 1
loop_start.66110:
	slli	%i4, %i16, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70770
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i15, 0(%i31)
	mov	%i14, %i0
loop_start.66114:
	slli	%i4, %i14, 2
	add	%i31, %i15, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70773
	slli	%i4, %i14, 2
	add	%i31, %i15, %i4
	lw	%i13, 0(%i31)
	slli	%i5, %i13, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i12, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i24, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i4, 1(%i4)
	lw	%i5, 163(%i0)
	lf	%f2, 0(%i5)
	lf	%f1, 0(%i24)
	fsub	%f7, %f2, %f1
	lw	%i5, 163(%i0)
	lf	%f2, 1(%i5)
	lf	%f1, 1(%i24)
	fsub	%f6, %f2, %f1
	lw	%i5, 163(%i0)
	lf	%f2, 2(%i5)
	lf	%f1, 2(%i24)
	fsub	%f5, %f2, %f1
	slli	%i24, %i13, 2
	lw	%i5, 248(%i0)
	add	%i31, %i5, %i24
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i4, %i31, then.70775
	movi	%i31, 2
	jeq	%i4, %i31, then.70777
	lf	%f1, 0(%i5)
	feq	%i24, %f1, %f0
	jeq	%i24, %i0, then.70779
	mov	%i5, %i0
	jzero	%i0, %i0, cont.70776
then.70779:
	lf	%f2, 1(%i5)
	fmul	%f8, %f2, %f7
	lf	%f2, 2(%i5)
	fmul	%f2, %f2, %f6
	fadd	%f8, %f8, %f2
	lf	%f2, 3(%i5)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f8, %f2
	fmul	%f9, %f7, %f7
	lf	%f8, 0(%i10)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f6, %f6
	lf	%f8, 1(%i10)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f5, %f5
	lf	%f8, 2(%i10)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i9, %i0, then.70781
	fmul	%f9, %f6, %f5
	lf	%f8, 0(%i12)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f5, %f7
	lf	%f5, 1(%i12)
	fmul	%f5, %f8, %f5
	fadd	%f8, %f9, %f5
	fmul	%f6, %f7, %f6
	lf	%f5, 2(%i12)
	fmul	%f5, %f6, %f5
	fadd	%f6, %f8, %f5
	jzero	%i0, %i0, cont.70782
then.70781:
	fmov	%f6, %f10
cont.70782:
	movi	%i31, 3
	jeq	%i4, %i31, then.70783
	jzero	%i0, %i0, cont.70784
then.70783:
	movui	%i31, 260096
	mif	%f5, %i31
	fsub	%f6, %f6, %f5
cont.70784:
	fmul	%f5, %f2, %f2
	fmul	%f1, %f1, %f6
	fsub	%f1, %f5, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70785
	jeq	%i11, %i0, then.70787
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fadd	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70788
then.70787:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70788:
	movi	%i5, 1
	jzero	%i0, %i0, cont.70786
then.70785:
	mov	%i5, %i0
cont.70786:
cont.70780:
	jzero	%i0, %i0, cont.70776
then.70777:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70789
	lf	%f1, 1(%i5)
	fmul	%f2, %f1, %f7
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f6
	fadd	%f2, %f2, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.70790
then.70789:
	mov	%i5, %i0
cont.70790:
cont.70778:
	jzero	%i0, %i0, cont.70776
then.70775:
	lf	%f1, 0(%i5)
	fsub	%f2, %f1, %f7
	lf	%f1, 1(%i5)
	fmul	%f8, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70791
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70793
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70792
then.70793:
	mov	%i4, %i0
cont.70794:
	jzero	%i0, %i0, cont.70792
then.70791:
	mov	%i4, %i0
cont.70792:
	jeq	%i4, %i0, then.70795
	lw	%i4, 154(%i0)
	sf	%f8, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.70796
then.70795:
	lf	%f1, 2(%i5)
	fsub	%f2, %f1, %f6
	lf	%f1, 3(%i5)
	fmul	%f8, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f7
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70797
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70799
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70798
then.70799:
	mov	%i4, %i0
cont.70800:
	jzero	%i0, %i0, cont.70798
then.70797:
	mov	%i4, %i0
cont.70798:
	jeq	%i4, %i0, then.70801
	lw	%i4, 154(%i0)
	sf	%f8, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.70802
then.70801:
	lf	%f1, 4(%i5)
	fsub	%f2, %f1, %f5
	lf	%f1, 5(%i5)
	fmul	%f5, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f2, %f1, %f7
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70803
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70805
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70804
then.70805:
	mov	%i4, %i0
cont.70806:
	jzero	%i0, %i0, cont.70804
then.70803:
	mov	%i4, %i0
cont.70804:
	jeq	%i4, %i0, then.70807
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.70808
then.70807:
	mov	%i5, %i0
cont.70808:
cont.70802:
cont.70796:
cont.70776:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.70809
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70810
then.70809:
	mov	%i4, %i0
cont.70810:
	jeq	%i4, %i0, then.70811
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f8, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f7, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f6, %f2, %f1
	mov	%i10, %i0
loop_start.66146:
	slli	%i4, %i10, 2
	add	%i31, %i15, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70814
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i13, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i12, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i11, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i12)
	fsub	%f5, %f8, %f1
	lf	%f1, 1(%i12)
	fsub	%f2, %f7, %f1
	lf	%f1, 2(%i12)
	fsub	%f1, %f6, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.70816
	movi	%i31, 2
	jeq	%i4, %i31, then.70818
	fmul	%f10, %f5, %f5
	lf	%f9, 0(%i5)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f2, %f2
	lf	%f9, 1(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f1, %f1
	lf	%f9, 2(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i11, %i0, then.70820
	fmul	%f10, %f2, %f1
	lf	%f9, 0(%i13)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f1, %f5
	lf	%f1, 1(%i13)
	fmul	%f1, %f9, %f1
	fadd	%f9, %f10, %f1
	fmul	%f2, %f5, %f2
	lf	%f1, 2(%i13)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f9, %f1
	jzero	%i0, %i0, cont.70821
then.70820:
	fmov	%f2, %f11
cont.70821:
	movi	%i31, 3
	jeq	%i4, %i31, then.70822
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70823
then.70822:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70823:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.70817
then.70818:
	lf	%f9, 0(%i5)
	fmul	%f9, %f9, %f5
	lf	%f5, 1(%i5)
	fmul	%f2, %f5, %f2
	fadd	%f5, %f9, %f2
	lf	%f2, 2(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f5, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	ceq	%i4, %i4, %i5
cont.70819:
	jzero	%i0, %i0, cont.70817
then.70816:
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f9, %i4
	fmul	%f9, %f9, %f5
	lf	%f5, 0(%i5)
	flt	%i4, %f9, %f5
	jeq	%i4, %i0, then.70824
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f2
	lf	%f2, 1(%i5)
	flt	%i4, %f5, %f2
	jeq	%i4, %i0, then.70826
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70825
then.70826:
	mov	%i4, %i0
cont.70827:
	jzero	%i0, %i0, cont.70825
then.70824:
	mov	%i4, %i0
cont.70825:
	jeq	%i4, %i0, then.70828
	mov	%i4, %i9
	jzero	%i0, %i0, cont.70829
then.70828:
	ceqi	%i4, %i9, 0
cont.70829:
cont.70817:
	jeq	%i4, %i0, then.70830
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66147
then.70830:
	addi	%i4, %i10, 1
	mov	%i10, %i4
cont.70831:
	set_label	%i31, loop_start.66146
	jmp	%i0, 0(%i31)
then.70814:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66147
loop_end.66147:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70832
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66115
then.70832:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.70833:
	set_label	%i31, loop_start.66114
	jmp	%i0, 0(%i31)
then.70811:
	slli	%i5, %i13, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.70834
	addi	%i4, %i14, 1
	mov	%i14, %i4
	jzero	%i0, %i0, cont.70835
then.70834:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66115
cont.70835:
cont.70812:
	set_label	%i31, loop_start.66114
	jmp	%i0, 0(%i31)
then.70773:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66115
loop_end.66115:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70836
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66111
then.70836:
	addi	%i4, %i16, 1
	mov	%i16, %i4
cont.70837:
	set_label	%i31, loop_start.66110
	jmp	%i0, 0(%i31)
then.70770:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66111
loop_end.66111:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.70730
then.70767:
	mov	%i4, %i0
cont.70768:
	jzero	%i0, %i0, cont.70730
then.70765:
	mov	%i4, %i0
cont.70766:
	jzero	%i0, %i0, cont.70730
then.70729:
	movi	%i4, 1
cont.70730:
	jeq	%i4, %i0, then.70838
	movi	%i16, 1
loop_start.66167:
	slli	%i4, %i16, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70841
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i15, 0(%i31)
	mov	%i14, %i0
loop_start.66171:
	slli	%i4, %i14, 2
	add	%i31, %i15, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70844
	slli	%i4, %i14, 2
	add	%i31, %i15, %i4
	lw	%i13, 0(%i31)
	slli	%i5, %i13, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i12, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i24, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i4, 1(%i4)
	lw	%i5, 163(%i0)
	lf	%f2, 0(%i5)
	lf	%f1, 0(%i24)
	fsub	%f7, %f2, %f1
	lw	%i5, 163(%i0)
	lf	%f2, 1(%i5)
	lf	%f1, 1(%i24)
	fsub	%f6, %f2, %f1
	lw	%i5, 163(%i0)
	lf	%f2, 2(%i5)
	lf	%f1, 2(%i24)
	fsub	%f5, %f2, %f1
	slli	%i24, %i13, 2
	lw	%i5, 248(%i0)
	add	%i31, %i5, %i24
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i4, %i31, then.70846
	movi	%i31, 2
	jeq	%i4, %i31, then.70848
	lf	%f1, 0(%i5)
	feq	%i24, %f1, %f0
	jeq	%i24, %i0, then.70850
	mov	%i5, %i0
	jzero	%i0, %i0, cont.70847
then.70850:
	lf	%f2, 1(%i5)
	fmul	%f8, %f2, %f7
	lf	%f2, 2(%i5)
	fmul	%f2, %f2, %f6
	fadd	%f8, %f8, %f2
	lf	%f2, 3(%i5)
	fmul	%f2, %f2, %f5
	fadd	%f2, %f8, %f2
	fmul	%f9, %f7, %f7
	lf	%f8, 0(%i10)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f6, %f6
	lf	%f8, 1(%i10)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f5, %f5
	lf	%f8, 2(%i10)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i9, %i0, then.70852
	fmul	%f9, %f6, %f5
	lf	%f8, 0(%i12)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f5, %f7
	lf	%f5, 1(%i12)
	fmul	%f5, %f8, %f5
	fadd	%f8, %f9, %f5
	fmul	%f6, %f7, %f6
	lf	%f5, 2(%i12)
	fmul	%f5, %f6, %f5
	fadd	%f6, %f8, %f5
	jzero	%i0, %i0, cont.70853
then.70852:
	fmov	%f6, %f10
cont.70853:
	movi	%i31, 3
	jeq	%i4, %i31, then.70854
	jzero	%i0, %i0, cont.70855
then.70854:
	movui	%i31, 260096
	mif	%f5, %i31
	fsub	%f6, %f6, %f5
cont.70855:
	fmul	%f5, %f2, %f2
	fmul	%f1, %f1, %f6
	fsub	%f1, %f5, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70856
	jeq	%i11, %i0, then.70858
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fadd	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70859
then.70858:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fsub	%f2, %f2, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70859:
	movi	%i5, 1
	jzero	%i0, %i0, cont.70857
then.70856:
	mov	%i5, %i0
cont.70857:
cont.70851:
	jzero	%i0, %i0, cont.70847
then.70848:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70860
	lf	%f1, 1(%i5)
	fmul	%f2, %f1, %f7
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f6
	fadd	%f2, %f2, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f2, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.70861
then.70860:
	mov	%i5, %i0
cont.70861:
cont.70849:
	jzero	%i0, %i0, cont.70847
then.70846:
	lf	%f1, 0(%i5)
	fsub	%f2, %f1, %f7
	lf	%f1, 1(%i5)
	fmul	%f8, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70862
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70864
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70863
then.70864:
	mov	%i4, %i0
cont.70865:
	jzero	%i0, %i0, cont.70863
then.70862:
	mov	%i4, %i0
cont.70863:
	jeq	%i4, %i0, then.70866
	lw	%i4, 154(%i0)
	sf	%f8, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.70867
then.70866:
	lf	%f1, 2(%i5)
	fsub	%f2, %f1, %f6
	lf	%f1, 3(%i5)
	fmul	%f8, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f7
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70868
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f8, %f1
	fadd	%f2, %f1, %f5
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 2(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70870
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70869
then.70870:
	mov	%i4, %i0
cont.70871:
	jzero	%i0, %i0, cont.70869
then.70868:
	mov	%i4, %i0
cont.70869:
	jeq	%i4, %i0, then.70872
	lw	%i4, 154(%i0)
	sf	%f8, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.70873
then.70872:
	lf	%f1, 4(%i5)
	fsub	%f2, %f1, %f5
	lf	%f1, 5(%i5)
	fmul	%f5, %f2, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f2, %f1, %f7
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 0(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70874
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f2, %f1, %f6
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i10)
	flt	%i4, %f2, %f1
	jeq	%i4, %i0, then.70876
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70875
then.70876:
	mov	%i4, %i0
cont.70877:
	jzero	%i0, %i0, cont.70875
then.70874:
	mov	%i4, %i0
cont.70875:
	jeq	%i4, %i0, then.70878
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.70879
then.70878:
	mov	%i5, %i0
cont.70879:
cont.70873:
cont.70867:
cont.70847:
	lw	%i4, 154(%i0)
	lf	%f2, 0(%i4)
	jeq	%i5, %i0, then.70880
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70881
then.70880:
	mov	%i4, %i0
cont.70881:
	jeq	%i4, %i0, then.70882
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f5, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f8, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f7, %f2, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f2, %f1, %f5
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f6, %f2, %f1
	mov	%i10, %i0
loop_start.66203:
	slli	%i4, %i10, 2
	add	%i31, %i15, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70885
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i13, 9(%i4)
	lw	%i9, 6(%i4)
	lw	%i12, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i11, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i12)
	fsub	%f5, %f8, %f1
	lf	%f1, 1(%i12)
	fsub	%f2, %f7, %f1
	lf	%f1, 2(%i12)
	fsub	%f1, %f6, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.70887
	movi	%i31, 2
	jeq	%i4, %i31, then.70889
	fmul	%f10, %f5, %f5
	lf	%f9, 0(%i5)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f2, %f2
	lf	%f9, 1(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f1, %f1
	lf	%f9, 2(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i11, %i0, then.70891
	fmul	%f10, %f2, %f1
	lf	%f9, 0(%i13)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f1, %f5
	lf	%f1, 1(%i13)
	fmul	%f1, %f9, %f1
	fadd	%f9, %f10, %f1
	fmul	%f2, %f5, %f2
	lf	%f1, 2(%i13)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f9, %f1
	jzero	%i0, %i0, cont.70892
then.70891:
	fmov	%f2, %f11
cont.70892:
	movi	%i31, 3
	jeq	%i4, %i31, then.70893
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70894
then.70893:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70894:
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.70888
then.70889:
	lf	%f9, 0(%i5)
	fmul	%f9, %f9, %f5
	lf	%f5, 1(%i5)
	fmul	%f2, %f5, %f2
	fadd	%f5, %f9, %f2
	lf	%f2, 2(%i5)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f5, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i9
	ceq	%i4, %i4, %i5
cont.70890:
	jzero	%i0, %i0, cont.70888
then.70887:
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f9, %i4
	fmul	%f9, %f9, %f5
	lf	%f5, 0(%i5)
	flt	%i4, %f9, %f5
	jeq	%i4, %i0, then.70895
	fleq	%i4, %f0, %f2
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f2
	lf	%f2, 1(%i5)
	flt	%i4, %f5, %f2
	jeq	%i4, %i0, then.70897
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f2, %i4
	fmul	%f2, %f2, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f2, %f1
	jzero	%i0, %i0, cont.70896
then.70897:
	mov	%i4, %i0
cont.70898:
	jzero	%i0, %i0, cont.70896
then.70895:
	mov	%i4, %i0
cont.70896:
	jeq	%i4, %i0, then.70899
	mov	%i4, %i9
	jzero	%i0, %i0, cont.70900
then.70899:
	ceqi	%i4, %i9, 0
cont.70900:
cont.70888:
	jeq	%i4, %i0, then.70901
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66204
then.70901:
	addi	%i4, %i10, 1
	mov	%i10, %i4
cont.70902:
	set_label	%i31, loop_start.66203
	jmp	%i0, 0(%i31)
then.70885:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66204
loop_end.66204:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70903
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66172
then.70903:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.70904:
	set_label	%i31, loop_start.66171
	jmp	%i0, 0(%i31)
then.70882:
	slli	%i5, %i13, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.70905
	addi	%i4, %i14, 1
	mov	%i14, %i4
	jzero	%i0, %i0, cont.70906
then.70905:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66172
cont.70906:
cont.70883:
	set_label	%i31, loop_start.66171
	jmp	%i0, 0(%i31)
then.70844:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66172
loop_end.66172:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70907
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66168
then.70907:
	addi	%i4, %i16, 1
	mov	%i16, %i4
cont.70908:
	set_label	%i31, loop_start.66167
	jmp	%i0, 0(%i31)
then.70841:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66168
loop_end.66168:
	mov	%i4, %i31
	jeq	%i4, %i0, then.70909
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66080
then.70909:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.70910:
	set_label	%i31, loop_start.66079
	jmp	%i0, 0(%i31)
then.70838:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.70839:
	set_label	%i31, loop_start.66079
	jmp	%i0, 0(%i31)
then.70727:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66080
loop_end.66080:
	mov	%i4, %i31
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.70911
	lw	%i4, 171(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f5, %f2, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f2, %f1
	fadd	%f5, %f5, %f1
	lw	%i4, 171(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f5, %f1
	fneg	%f1, %f1
	fmul	%f6, %f1, %f4
	lw	%i31, 1(%i1)
	lf	%f2, 0(%i31)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f5, %f2, %f1
	lw	%i31, 1(%i1)
	lf	%f2, 1(%i31)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f2, %f1
	fadd	%f5, %f5, %f1
	lw	%i31, 1(%i1)
	lf	%f2, 2(%i31)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f5, %f1
	fneg	%f5, %f1
	flt	%i4, %f0, %f6
	jeq	%i4, %i0, cont.70912
	lw	%i4, 186(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.70912:
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.70913
	fmul	%f1, %f5, %f5
	fmul	%f1, %f1, %f1
	fmul	%f2, %f1, %f3
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
cont.70913:
cont.70911:
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i11, %i4, 1
loop_start.66226:
	jleq	%i0, %i11, then.70915
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66227
then.70915:
	slli	%i5, %i11, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 10(%i4)
	lw	%i9, 9(%i4)
	lw	%i8, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i8)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i10)
	lw	%i4, 163(%i0)
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i8)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i10)
	lw	%i4, 163(%i0)
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i8)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i10)
	movi	%i31, 2
	jeq	%i5, %i31, then.70917
	movi	%i31, 2
	jleq	%i5, %i31, cont.70919
	lf	%f8, 0(%i10)
	lf	%f7, 1(%i10)
	lf	%f6, 2(%i10)
	fmul	%f2, %f8, %f8
	lf	%f1, 0(%i7)
	fmul	%f5, %f2, %f1
	fmul	%f2, %f7, %f7
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f5, %f5, %f1
	fmul	%f2, %f6, %f6
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f5, %f5, %f1
	jeq	%i6, %i0, then.70920
	fmul	%f2, %f7, %f6
	lf	%f1, 0(%i9)
	fmul	%f1, %f2, %f1
	fadd	%f5, %f5, %f1
	fmul	%f2, %f6, %f8
	lf	%f1, 1(%i9)
	fmul	%f1, %f2, %f1
	fadd	%f5, %f5, %f1
	fmul	%f2, %f8, %f7
	lf	%f1, 2(%i9)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f5, %f1
	jzero	%i0, %i0, cont.70921
then.70920:
	fmov	%f2, %f5
cont.70921:
	movi	%i31, 3
	jeq	%i5, %i31, then.70922
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.70923
then.70922:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.70923:
	sf	%f1, 3(%i10)
cont.70919:
	jzero	%i0, %i0, cont.70918
then.70917:
	lf	%f2, 0(%i10)
	lf	%f6, 1(%i10)
	lf	%f5, 2(%i10)
	lf	%f1, 0(%i7)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f6
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f2, %f1
	sf	%f1, 3(%i10)
cont.70918:
	subi	%i4, %i11, 1
	mov	%i11, %i4
cont.70916:
	set_label	%i30, loop_start.66226
	jmp	%i0, 0(%i30)
loop_end.66227:
	mov	%i0, %i31
	lw	%i4, 496(%i0)
	lw	%i4, 0(%i4)
	subi	%i16, %i4, 1
loop_start.66230:
	jleq	%i0, %i16, then.70925
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66231
then.70925:
	slli	%i5, %i16, 2
	lw	%i4, 314(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lf	%f2, 4(%i4)
	lw	%i15, 2(%i4)
	lw	%i14, 1(%i4)
	lw	%i13, 0(%i4)
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	mov	%i12, %i0
	lw	%i4, 151(%i0)
	lw	%i11, 0(%i4)
loop_start.66233:
	slli	%i4, %i12, 2
	add	%i31, %i11, %i4
	lw	%i10, 0(%i31)
	lw	%i24, 0(%i10)
	movi	%i31, -1
	jeq	%i24, %i31, then.70928
	movi	%i31, 99
	jeq	%i24, %i31, then.70930
	slli	%i5, %i24, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i9, 10(%i4)
	lw	%i8, 6(%i4)
	lw	%i6, 4(%i4)
	lw	%i7, 1(%i4)
	lf	%f6, 0(%i9)
	lf	%f5, 1(%i9)
	lf	%f1, 2(%i9)
	slli	%i4, %i24, 2
	add	%i31, %i15, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i7, %i31, then.70932
	movi	%i31, 2
	jeq	%i7, %i31, then.70934
	lf	%f8, 0(%i5)
	feq	%i4, %f8, %f0
	jeq	%i4, %i0, then.70936
	mov	%i4, %i0
	jzero	%i0, %i0, cont.70933
then.70936:
	lf	%f7, 1(%i5)
	fmul	%f7, %f7, %f6
	lf	%f6, 2(%i5)
	fmul	%f5, %f6, %f5
	fadd	%f6, %f7, %f5
	lf	%f5, 3(%i5)
	fmul	%f1, %f5, %f1
	fadd	%f6, %f6, %f1
	lf	%f1, 3(%i9)
	fmul	%f5, %f6, %f6
	fmul	%f1, %f8, %f1
	fsub	%f1, %f5, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.70938
	jeq	%i8, %i0, then.70940
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fadd	%f5, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70941
then.70940:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fsub	%f5, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70941:
	movi	%i4, 1
	jzero	%i0, %i0, cont.70939
then.70938:
	mov	%i4, %i0
cont.70939:
cont.70937:
	jzero	%i0, %i0, cont.70933
then.70934:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70942
	lf	%f5, 0(%i5)
	lf	%f1, 3(%i9)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70943
then.70942:
	mov	%i4, %i0
cont.70943:
cont.70935:
	jzero	%i0, %i0, cont.70933
then.70932:
	lf	%f7, 0(%i5)
	fsub	%f8, %f7, %f6
	lf	%f7, 1(%i5)
	fmul	%f9, %f8, %f7
	lf	%f7, 1(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f5
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 1(%i6)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.70944
	lf	%f7, 2(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f1
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 2(%i6)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.70946
	lf	%f7, 1(%i5)
	feq	%i4, %f7, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70945
then.70946:
	mov	%i4, %i0
cont.70947:
	jzero	%i0, %i0, cont.70945
then.70944:
	mov	%i4, %i0
cont.70945:
	jeq	%i4, %i0, then.70948
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.70949
then.70948:
	lf	%f7, 2(%i5)
	fsub	%f8, %f7, %f5
	lf	%f7, 3(%i5)
	fmul	%f9, %f8, %f7
	lf	%f7, 0(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f6
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 0(%i6)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.70950
	lf	%f7, 2(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f1
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 2(%i6)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.70952
	lf	%f7, 3(%i5)
	feq	%i4, %f7, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70951
then.70952:
	mov	%i4, %i0
cont.70953:
	jzero	%i0, %i0, cont.70951
then.70950:
	mov	%i4, %i0
cont.70951:
	jeq	%i4, %i0, then.70954
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.70955
then.70954:
	lf	%f7, 4(%i5)
	fsub	%f7, %f7, %f1
	lf	%f1, 5(%i5)
	fmul	%f7, %f7, %f1
	lf	%f1, 0(%i14)
	fmul	%f1, %f7, %f1
	fadd	%f6, %f1, %f6
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 0(%i6)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.70956
	lf	%f1, 1(%i14)
	fmul	%f1, %f7, %f1
	fadd	%f5, %f1, %f5
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 1(%i6)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.70958
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70957
then.70958:
	mov	%i4, %i0
cont.70959:
	jzero	%i0, %i0, cont.70957
then.70956:
	mov	%i4, %i0
cont.70957:
	jeq	%i4, %i0, then.70960
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.70961
then.70960:
	mov	%i4, %i0
cont.70961:
cont.70955:
cont.70949:
cont.70933:
	jeq	%i4, %i0, cont.70962
	lw	%i4, 154(%i0)
	lf	%f5, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, cont.70963
	movi	%i9, 1
loop_start.66264:
	slli	%i4, %i9, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.70965
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i8, 0(%i31)
	mov	%i7, %i0
loop_start.66268:
	slli	%i4, %i7, 2
	add	%i31, %i8, %i4
	lw	%i6, 0(%i31)
	movi	%i31, -1
	jeq	%i6, %i31, then.70968
	slli	%i5, %i6, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	lw	%i25, 10(%i5)
	lw	%i4, 6(%i5)
	lw	%i24, 4(%i5)
	lw	%i26, 1(%i5)
	lf	%f6, 0(%i25)
	lf	%f5, 1(%i25)
	lf	%f1, 2(%i25)
	slli	%i5, %i6, 2
	add	%i31, %i15, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i26, %i31, then.70970
	movi	%i31, 2
	jeq	%i26, %i31, then.70972
	lf	%f8, 0(%i5)
	feq	%i24, %f8, %f0
	jeq	%i24, %i0, then.70974
	mov	%i28, %i0
	jzero	%i0, %i0, cont.70971
then.70974:
	lf	%f7, 1(%i5)
	fmul	%f7, %f7, %f6
	lf	%f6, 2(%i5)
	fmul	%f5, %f6, %f5
	fadd	%f6, %f7, %f5
	lf	%f5, 3(%i5)
	fmul	%f1, %f5, %f1
	fadd	%f6, %f6, %f1
	lf	%f1, 3(%i25)
	fmul	%f5, %f6, %f6
	fmul	%f1, %f8, %f1
	fsub	%f1, %f5, %f1
	flt	%i24, %f0, %f1
	jeq	%i24, %i0, then.70976
	jeq	%i4, %i0, then.70978
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fadd	%f5, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.70979
then.70978:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fsub	%f5, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.70979:
	movi	%i28, 1
	jzero	%i0, %i0, cont.70977
then.70976:
	mov	%i28, %i0
cont.70977:
cont.70975:
	jzero	%i0, %i0, cont.70971
then.70972:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.70980
	lf	%f5, 0(%i5)
	lf	%f1, 3(%i25)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i28, 1
	jzero	%i0, %i0, cont.70981
then.70980:
	mov	%i28, %i0
cont.70981:
cont.70973:
	jzero	%i0, %i0, cont.70971
then.70970:
	lf	%f7, 0(%i5)
	fsub	%f8, %f7, %f6
	lf	%f7, 1(%i5)
	fmul	%f9, %f8, %f7
	lf	%f7, 1(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f5
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 1(%i24)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.70982
	lf	%f7, 2(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f1
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 2(%i24)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.70984
	lf	%f7, 1(%i5)
	feq	%i4, %f7, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70983
then.70984:
	mov	%i4, %i0
cont.70985:
	jzero	%i0, %i0, cont.70983
then.70982:
	mov	%i4, %i0
cont.70983:
	jeq	%i4, %i0, then.70986
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i28, 1
	jzero	%i0, %i0, cont.70987
then.70986:
	lf	%f7, 2(%i5)
	fsub	%f8, %f7, %f5
	lf	%f7, 3(%i5)
	fmul	%f9, %f8, %f7
	lf	%f7, 0(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f6
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 0(%i24)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.70988
	lf	%f7, 2(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f1
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 2(%i24)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.70990
	lf	%f7, 3(%i5)
	feq	%i4, %f7, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70989
then.70990:
	mov	%i4, %i0
cont.70991:
	jzero	%i0, %i0, cont.70989
then.70988:
	mov	%i4, %i0
cont.70989:
	jeq	%i4, %i0, then.70992
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i28, 2
	jzero	%i0, %i0, cont.70993
then.70992:
	lf	%f7, 4(%i5)
	fsub	%f7, %f7, %f1
	lf	%f1, 5(%i5)
	fmul	%f7, %f7, %f1
	lf	%f1, 0(%i14)
	fmul	%f1, %f7, %f1
	fadd	%f6, %f1, %f6
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 0(%i24)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.70994
	lf	%f1, 1(%i14)
	fmul	%f1, %f7, %f1
	fadd	%f5, %f1, %f5
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 1(%i24)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.70996
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.70995
then.70996:
	mov	%i4, %i0
cont.70997:
	jzero	%i0, %i0, cont.70995
then.70994:
	mov	%i4, %i0
cont.70995:
	jeq	%i4, %i0, then.70998
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i28, 3
	jzero	%i0, %i0, cont.70999
then.70998:
	mov	%i28, %i0
cont.70999:
cont.70993:
cont.70987:
cont.70971:
	jeq	%i28, %i0, then.71000
	lw	%i4, 154(%i0)
	lf	%f5, 0(%i4)
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.71002
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, cont.71003
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f10, %f5, %f1
	lf	%f1, 0(%i14)
	fmul	%f5, %f1, %f10
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f9, %f5, %f1
	lf	%f1, 1(%i14)
	fmul	%f5, %f1, %f10
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f8, %f5, %f1
	lf	%f1, 2(%i14)
	fmul	%f5, %f1, %f10
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f7, %f5, %f1
	mov	%i27, %i0
loop_start.66299:
	slli	%i4, %i27, 2
	add	%i31, %i8, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71005
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i29, 0(%i31)
	lw	%i26, 9(%i29)
	lw	%i25, 6(%i29)
	lw	%i24, 5(%i29)
	lw	%i5, 4(%i29)
	lw	%i4, 3(%i29)
	lw	%i29, 1(%i29)
	lf	%f1, 0(%i24)
	fsub	%f6, %f9, %f1
	lf	%f1, 1(%i24)
	fsub	%f5, %f8, %f1
	lf	%f1, 2(%i24)
	fsub	%f1, %f7, %f1
	movi	%i31, 1
	jeq	%i29, %i31, then.71007
	movi	%i31, 2
	jeq	%i29, %i31, then.71009
	fmul	%f12, %f6, %f6
	lf	%f11, 0(%i5)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f5, %f5
	lf	%f11, 1(%i5)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f1, %f1
	lf	%f11, 2(%i5)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	jeq	%i4, %i0, then.71011
	fmul	%f12, %f5, %f1
	lf	%f11, 0(%i26)
	fmul	%f11, %f12, %f11
	fadd	%f12, %f13, %f11
	fmul	%f11, %f1, %f6
	lf	%f1, 1(%i26)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f12, %f1
	fmul	%f5, %f6, %f5
	lf	%f1, 2(%i26)
	fmul	%f1, %f5, %f1
	fadd	%f5, %f11, %f1
	jzero	%i0, %i0, cont.71012
then.71011:
	fmov	%f5, %f13
cont.71012:
	movi	%i31, 3
	jeq	%i29, %i31, then.71013
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71014
then.71013:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71014:
	flt	%i5, %f1, %f0
	mov	%i4, %i25
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71008
then.71009:
	lf	%f11, 0(%i5)
	fmul	%f11, %f11, %f6
	lf	%f6, 1(%i5)
	fmul	%f5, %f6, %f5
	fadd	%f6, %f11, %f5
	lf	%f5, 2(%i5)
	fmul	%f1, %f5, %f1
	fadd	%f1, %f6, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i25
	ceq	%i4, %i4, %i5
cont.71010:
	jzero	%i0, %i0, cont.71008
then.71007:
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f11, %i4
	fmul	%f11, %f11, %f6
	lf	%f6, 0(%i5)
	flt	%i4, %f11, %f6
	jeq	%i4, %i0, then.71015
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f6, %f6, %f5
	lf	%f5, 1(%i5)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71017
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71016
then.71017:
	mov	%i4, %i0
cont.71018:
	jzero	%i0, %i0, cont.71016
then.71015:
	mov	%i4, %i0
cont.71016:
	jeq	%i4, %i0, then.71019
	mov	%i4, %i25
	jzero	%i0, %i0, cont.71020
then.71019:
	ceqi	%i4, %i25, 0
cont.71020:
cont.71008:
	jeq	%i4, %i0, then.71021
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66300
then.71021:
	addi	%i4, %i27, 1
	mov	%i27, %i4
cont.71022:
	set_label	%i31, loop_start.66299
	jmp	%i0, 0(%i31)
then.71005:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66300
loop_end.66300:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.71023
	lw	%i4, 160(%i0)
	sf	%f10, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f9, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f8, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i6, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i28, 0(%i4)
cont.71023:
cont.71003:
cont.71002:
	addi	%i4, %i7, 1
	mov	%i7, %i4
	set_label	%i31, loop_start.66268
	jmp	%i0, 0(%i31)
then.71000:
	slli	%i5, %i6, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71024
	addi	%i4, %i7, 1
	mov	%i7, %i4
	jzero	%i0, %i0, cont.71025
then.71024:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66269
cont.71025:
cont.71001:
	set_label	%i31, loop_start.66268
	jmp	%i0, 0(%i31)
then.70968:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66269
loop_end.66269:
	mov	%i0, %i31
	addi	%i4, %i9, 1
	mov	%i9, %i4
	set_label	%i31, loop_start.66264
	jmp	%i0, 0(%i31)
then.70965:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66265
loop_end.66265:
	mov	%i0, %i31
cont.70963:
cont.70962:
	jzero	%i0, %i0, cont.70931
then.70930:
	movi	%i9, 1
loop_start.66320:
	slli	%i4, %i9, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71027
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i8, 0(%i31)
	mov	%i7, %i0
loop_start.66324:
	slli	%i4, %i7, 2
	add	%i31, %i8, %i4
	lw	%i6, 0(%i31)
	movi	%i31, -1
	jeq	%i6, %i31, then.71030
	slli	%i5, %i6, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	lw	%i25, 10(%i5)
	lw	%i4, 6(%i5)
	lw	%i24, 4(%i5)
	lw	%i26, 1(%i5)
	lf	%f6, 0(%i25)
	lf	%f5, 1(%i25)
	lf	%f1, 2(%i25)
	slli	%i5, %i6, 2
	add	%i31, %i15, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i26, %i31, then.71032
	movi	%i31, 2
	jeq	%i26, %i31, then.71034
	lf	%f8, 0(%i5)
	feq	%i24, %f8, %f0
	jeq	%i24, %i0, then.71036
	mov	%i28, %i0
	jzero	%i0, %i0, cont.71033
then.71036:
	lf	%f7, 1(%i5)
	fmul	%f7, %f7, %f6
	lf	%f6, 2(%i5)
	fmul	%f5, %f6, %f5
	fadd	%f6, %f7, %f5
	lf	%f5, 3(%i5)
	fmul	%f1, %f5, %f1
	fadd	%f6, %f6, %f1
	lf	%f1, 3(%i25)
	fmul	%f5, %f6, %f6
	fmul	%f1, %f8, %f1
	fsub	%f1, %f5, %f1
	flt	%i24, %f0, %f1
	jeq	%i24, %i0, then.71038
	jeq	%i4, %i0, then.71040
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fadd	%f5, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71041
then.71040:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fsub	%f5, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71041:
	movi	%i28, 1
	jzero	%i0, %i0, cont.71039
then.71038:
	mov	%i28, %i0
cont.71039:
cont.71037:
	jzero	%i0, %i0, cont.71033
then.71034:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71042
	lf	%f5, 0(%i5)
	lf	%f1, 3(%i25)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i28, 1
	jzero	%i0, %i0, cont.71043
then.71042:
	mov	%i28, %i0
cont.71043:
cont.71035:
	jzero	%i0, %i0, cont.71033
then.71032:
	lf	%f7, 0(%i5)
	fsub	%f8, %f7, %f6
	lf	%f7, 1(%i5)
	fmul	%f9, %f8, %f7
	lf	%f7, 1(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f5
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 1(%i24)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.71044
	lf	%f7, 2(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f1
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 2(%i24)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.71046
	lf	%f7, 1(%i5)
	feq	%i4, %f7, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71045
then.71046:
	mov	%i4, %i0
cont.71047:
	jzero	%i0, %i0, cont.71045
then.71044:
	mov	%i4, %i0
cont.71045:
	jeq	%i4, %i0, then.71048
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i28, 1
	jzero	%i0, %i0, cont.71049
then.71048:
	lf	%f7, 2(%i5)
	fsub	%f8, %f7, %f5
	lf	%f7, 3(%i5)
	fmul	%f9, %f8, %f7
	lf	%f7, 0(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f6
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 0(%i24)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.71050
	lf	%f7, 2(%i14)
	fmul	%f7, %f9, %f7
	fadd	%f8, %f7, %f1
	fleq	%i4, %f0, %f8
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f8, %f7, %f8
	lf	%f7, 2(%i24)
	flt	%i4, %f8, %f7
	jeq	%i4, %i0, then.71052
	lf	%f7, 3(%i5)
	feq	%i4, %f7, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71051
then.71052:
	mov	%i4, %i0
cont.71053:
	jzero	%i0, %i0, cont.71051
then.71050:
	mov	%i4, %i0
cont.71051:
	jeq	%i4, %i0, then.71054
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i28, 2
	jzero	%i0, %i0, cont.71055
then.71054:
	lf	%f7, 4(%i5)
	fsub	%f7, %f7, %f1
	lf	%f1, 5(%i5)
	fmul	%f7, %f7, %f1
	lf	%f1, 0(%i14)
	fmul	%f1, %f7, %f1
	fadd	%f6, %f1, %f6
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 0(%i24)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.71056
	lf	%f1, 1(%i14)
	fmul	%f1, %f7, %f1
	fadd	%f5, %f1, %f5
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 1(%i24)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.71058
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71057
then.71058:
	mov	%i4, %i0
cont.71059:
	jzero	%i0, %i0, cont.71057
then.71056:
	mov	%i4, %i0
cont.71057:
	jeq	%i4, %i0, then.71060
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i28, 3
	jzero	%i0, %i0, cont.71061
then.71060:
	mov	%i28, %i0
cont.71061:
cont.71055:
cont.71049:
cont.71033:
	jeq	%i28, %i0, then.71062
	lw	%i4, 154(%i0)
	lf	%f5, 0(%i4)
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.71064
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, cont.71065
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f10, %f5, %f1
	lf	%f1, 0(%i14)
	fmul	%f5, %f1, %f10
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f9, %f5, %f1
	lf	%f1, 1(%i14)
	fmul	%f5, %f1, %f10
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f8, %f5, %f1
	lf	%f1, 2(%i14)
	fmul	%f5, %f1, %f10
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f7, %f5, %f1
	mov	%i27, %i0
loop_start.66355:
	slli	%i4, %i27, 2
	add	%i31, %i8, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71067
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i29, 0(%i31)
	lw	%i26, 9(%i29)
	lw	%i25, 6(%i29)
	lw	%i24, 5(%i29)
	lw	%i5, 4(%i29)
	lw	%i4, 3(%i29)
	lw	%i29, 1(%i29)
	lf	%f1, 0(%i24)
	fsub	%f6, %f9, %f1
	lf	%f1, 1(%i24)
	fsub	%f5, %f8, %f1
	lf	%f1, 2(%i24)
	fsub	%f1, %f7, %f1
	movi	%i31, 1
	jeq	%i29, %i31, then.71069
	movi	%i31, 2
	jeq	%i29, %i31, then.71071
	fmul	%f12, %f6, %f6
	lf	%f11, 0(%i5)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f5, %f5
	lf	%f11, 1(%i5)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f1, %f1
	lf	%f11, 2(%i5)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	jeq	%i4, %i0, then.71073
	fmul	%f12, %f5, %f1
	lf	%f11, 0(%i26)
	fmul	%f11, %f12, %f11
	fadd	%f12, %f13, %f11
	fmul	%f11, %f1, %f6
	lf	%f1, 1(%i26)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f12, %f1
	fmul	%f5, %f6, %f5
	lf	%f1, 2(%i26)
	fmul	%f1, %f5, %f1
	fadd	%f5, %f11, %f1
	jzero	%i0, %i0, cont.71074
then.71073:
	fmov	%f5, %f13
cont.71074:
	movi	%i31, 3
	jeq	%i29, %i31, then.71075
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.71076
then.71075:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.71076:
	flt	%i5, %f1, %f0
	mov	%i4, %i25
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71070
then.71071:
	lf	%f11, 0(%i5)
	fmul	%f11, %f11, %f6
	lf	%f6, 1(%i5)
	fmul	%f5, %f6, %f5
	fadd	%f6, %f11, %f5
	lf	%f5, 2(%i5)
	fmul	%f1, %f5, %f1
	fadd	%f1, %f6, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i25
	ceq	%i4, %i4, %i5
cont.71072:
	jzero	%i0, %i0, cont.71070
then.71069:
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f11, %i4
	fmul	%f11, %f11, %f6
	lf	%f6, 0(%i5)
	flt	%i4, %f11, %f6
	jeq	%i4, %i0, then.71077
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f6, %f6, %f5
	lf	%f5, 1(%i5)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71079
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71078
then.71079:
	mov	%i4, %i0
cont.71080:
	jzero	%i0, %i0, cont.71078
then.71077:
	mov	%i4, %i0
cont.71078:
	jeq	%i4, %i0, then.71081
	mov	%i4, %i25
	jzero	%i0, %i0, cont.71082
then.71081:
	ceqi	%i4, %i25, 0
cont.71082:
cont.71070:
	jeq	%i4, %i0, then.71083
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66356
then.71083:
	addi	%i4, %i27, 1
	mov	%i27, %i4
cont.71084:
	set_label	%i31, loop_start.66355
	jmp	%i0, 0(%i31)
then.71067:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66356
loop_end.66356:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.71085
	lw	%i4, 160(%i0)
	sf	%f10, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f9, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f8, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i6, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i28, 0(%i4)
cont.71085:
cont.71065:
cont.71064:
	addi	%i4, %i7, 1
	mov	%i7, %i4
	set_label	%i31, loop_start.66324
	jmp	%i0, 0(%i31)
then.71062:
	slli	%i5, %i6, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71086
	addi	%i4, %i7, 1
	mov	%i7, %i4
	jzero	%i0, %i0, cont.71087
then.71086:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66325
cont.71087:
cont.71063:
	set_label	%i31, loop_start.66324
	jmp	%i0, 0(%i31)
then.71030:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66325
loop_end.66325:
	mov	%i0, %i31
	addi	%i4, %i9, 1
	mov	%i9, %i4
	set_label	%i31, loop_start.66320
	jmp	%i0, 0(%i31)
then.71027:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66321
loop_end.66321:
	mov	%i0, %i31
cont.70931:
	addi	%i4, %i12, 1
	mov	%i12, %i4
	set_label	%i31, loop_start.66233
	jmp	%i0, 0(%i31)
then.70928:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66234
loop_end.66234:
	mov	%i0, %i31
	lw	%i4, 160(%i0)
	lf	%f5, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f5
	jeq	%i4, %i0, then.71088
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f5, %f1
	jzero	%i0, %i0, cont.71089
then.71088:
	mov	%i4, %i0
cont.71089:
	jeq	%i4, %i0, cont.71090
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i4, %i5, %i4
	ceq	%i31, %i4, %i13
	jzero	%i0, %i31, cont.71091
	mov	%i11, %i0
	lw	%i4, 151(%i0)
	lw	%i10, 0(%i4)
loop_start.66377:
	slli	%i4, %i11, 2
	add	%i31, %i10, %i4
	lw	%i9, 0(%i31)
	lw	%i15, 0(%i9)
	movi	%i31, -1
	jeq	%i15, %i31, then.71093
	movi	%i31, 99
	jeq	%i15, %i31, then.71095
	slli	%i5, %i15, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	lw	%i8, 9(%i5)
	lw	%i7, 6(%i5)
	lw	%i12, 5(%i5)
	lw	%i6, 4(%i5)
	lw	%i4, 3(%i5)
	lw	%i13, 1(%i5)
	lw	%i5, 163(%i0)
	lf	%f5, 0(%i5)
	lf	%f1, 0(%i12)
	fsub	%f8, %f5, %f1
	lw	%i5, 163(%i0)
	lf	%f5, 1(%i5)
	lf	%f1, 1(%i12)
	fsub	%f7, %f5, %f1
	lw	%i5, 163(%i0)
	lf	%f5, 2(%i5)
	lf	%f1, 2(%i12)
	fsub	%f6, %f5, %f1
	slli	%i12, %i15, 2
	lw	%i5, 248(%i0)
	add	%i31, %i5, %i12
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i13, %i31, then.71097
	movi	%i31, 2
	jeq	%i13, %i31, then.71099
	lf	%f1, 0(%i5)
	feq	%i12, %f1, %f0
	jeq	%i12, %i0, then.71101
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71098
then.71101:
	lf	%f5, 1(%i5)
	fmul	%f9, %f5, %f8
	lf	%f5, 2(%i5)
	fmul	%f5, %f5, %f7
	fadd	%f9, %f9, %f5
	lf	%f5, 3(%i5)
	fmul	%f5, %f5, %f6
	fadd	%f5, %f9, %f5
	fmul	%f10, %f8, %f8
	lf	%f9, 0(%i6)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f7, %f7
	lf	%f9, 1(%i6)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f6, %f6
	lf	%f9, 2(%i6)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i4, %i0, then.71103
	fmul	%f10, %f7, %f6
	lf	%f9, 0(%i8)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f6, %f8
	lf	%f6, 1(%i8)
	fmul	%f6, %f9, %f6
	fadd	%f9, %f10, %f6
	fmul	%f7, %f8, %f7
	lf	%f6, 2(%i8)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f9, %f6
	jzero	%i0, %i0, cont.71104
then.71103:
	fmov	%f7, %f11
cont.71104:
	movi	%i31, 3
	jeq	%i13, %i31, then.71105
	jzero	%i0, %i0, cont.71106
then.71105:
	movui	%i31, 260096
	mif	%f6, %i31
	fsub	%f7, %f7, %f6
cont.71106:
	fmul	%f6, %f5, %f5
	fmul	%f1, %f1, %f7
	fsub	%f1, %f6, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71107
	jeq	%i7, %i0, then.71109
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f6, %i31
	finv	%f1, %f1
	fmul	%f1, %f6, %f1
	fadd	%f5, %f5, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71110
then.71109:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f6, %i31
	finv	%f1, %f1
	fmul	%f1, %f6, %f1
	fsub	%f5, %f5, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71110:
	movi	%i4, 1
	jzero	%i0, %i0, cont.71108
then.71107:
	mov	%i4, %i0
cont.71108:
cont.71102:
	jzero	%i0, %i0, cont.71098
then.71099:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71111
	lf	%f1, 1(%i5)
	fmul	%f5, %f1, %f8
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f7
	fadd	%f5, %f5, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f6
	fadd	%f1, %f5, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71112
then.71111:
	mov	%i4, %i0
cont.71112:
cont.71100:
	jzero	%i0, %i0, cont.71098
then.71097:
	lf	%f1, 0(%i5)
	fsub	%f5, %f1, %f8
	lf	%f1, 1(%i5)
	fmul	%f9, %f5, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f9, %f1
	fadd	%f5, %f1, %f7
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 1(%i6)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.71113
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f9, %f1
	fadd	%f5, %f1, %f6
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 2(%i6)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.71115
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71114
then.71115:
	mov	%i4, %i0
cont.71116:
	jzero	%i0, %i0, cont.71114
then.71113:
	mov	%i4, %i0
cont.71114:
	jeq	%i4, %i0, then.71117
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71118
then.71117:
	lf	%f1, 2(%i5)
	fsub	%f5, %f1, %f7
	lf	%f1, 3(%i5)
	fmul	%f9, %f5, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f9, %f1
	fadd	%f5, %f1, %f8
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 0(%i6)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.71119
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f9, %f1
	fadd	%f5, %f1, %f6
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 2(%i6)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.71121
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71120
then.71121:
	mov	%i4, %i0
cont.71122:
	jzero	%i0, %i0, cont.71120
then.71119:
	mov	%i4, %i0
cont.71120:
	jeq	%i4, %i0, then.71123
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.71124
then.71123:
	lf	%f1, 4(%i5)
	fsub	%f5, %f1, %f6
	lf	%f1, 5(%i5)
	fmul	%f6, %f5, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f5, %f1, %f8
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 0(%i6)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.71125
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f5, %f1, %f7
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 1(%i6)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.71127
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71126
then.71127:
	mov	%i4, %i0
cont.71128:
	jzero	%i0, %i0, cont.71126
then.71125:
	mov	%i4, %i0
cont.71126:
	jeq	%i4, %i0, then.71129
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.71130
then.71129:
	mov	%i4, %i0
cont.71130:
cont.71124:
cont.71118:
cont.71098:
	jeq	%i4, %i0, then.71131
	lw	%i4, 154(%i0)
	lf	%f5, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.71133
	movi	%i6, 1
loop_start.66408:
	slli	%i4, %i6, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71136
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sf	%f2, 4(%i1)
	sf	%f3, 5(%i1)
	sf	%f4, 6(%i1)
	set_label	%i31, shadow_check_and_group.2950
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lf	%f2, 4(%i1)
	lf	%f3, 5(%i1)
	lf	%f4, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	jeq	%i4, %i0, then.71138
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66409
then.71138:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71139:
	set_label	%i31, loop_start.66408
	jmp	%i0, 0(%i31)
then.71136:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66409
loop_end.66409:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.71096
then.71133:
	mov	%i4, %i0
cont.71134:
	jzero	%i0, %i0, cont.71096
then.71131:
	mov	%i4, %i0
cont.71132:
	jzero	%i0, %i0, cont.71096
then.71095:
	movi	%i4, 1
cont.71096:
	jeq	%i4, %i0, then.71140
	movi	%i6, 1
loop_start.66413:
	slli	%i4, %i6, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71143
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i9, 1(%i1)
	sw	%i10, 2(%i1)
	sw	%i11, 3(%i1)
	sf	%f2, 4(%i1)
	sf	%f3, 5(%i1)
	sf	%f4, 6(%i1)
	set_label	%i31, shadow_check_and_group.2950
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i9, 1(%i1)
	lw	%i10, 2(%i1)
	lw	%i11, 3(%i1)
	lf	%f2, 4(%i1)
	lf	%f3, 5(%i1)
	lf	%f4, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	jeq	%i4, %i0, then.71145
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66414
then.71145:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71146:
	set_label	%i31, loop_start.66413
	jmp	%i0, 0(%i31)
then.71143:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66414
loop_end.66414:
	mov	%i4, %i31
	jeq	%i4, %i0, then.71147
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66378
then.71147:
	addi	%i4, %i11, 1
	mov	%i11, %i4
cont.71148:
	set_label	%i31, loop_start.66377
	jmp	%i0, 0(%i31)
then.71140:
	addi	%i4, %i11, 1
	mov	%i11, %i4
cont.71141:
	set_label	%i31, loop_start.66377
	jmp	%i0, 0(%i31)
then.71093:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66378
loop_end.66378:
	mov	%i4, %i31
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.71149
	lw	%i4, 171(%i0)
	lf	%f5, 0(%i4)
	lf	%f1, 0(%i14)
	fmul	%f6, %f5, %f1
	lw	%i4, 171(%i0)
	lf	%f5, 1(%i4)
	lf	%f1, 1(%i14)
	fmul	%f1, %f5, %f1
	fadd	%f6, %f6, %f1
	lw	%i4, 171(%i0)
	lf	%f5, 2(%i4)
	lf	%f1, 2(%i14)
	fmul	%f1, %f5, %f1
	fadd	%f5, %f6, %f1
	fmul	%f1, %f2, %f4
	fmul	%f7, %f1, %f5
	lw	%i31, 1(%i1)
	lf	%f5, 0(%i31)
	lf	%f1, 0(%i14)
	fmul	%f6, %f5, %f1
	lw	%i31, 1(%i1)
	lf	%f5, 1(%i31)
	lf	%f1, 1(%i14)
	fmul	%f1, %f5, %f1
	fadd	%f6, %f6, %f1
	lw	%i31, 1(%i1)
	lf	%f5, 2(%i31)
	lf	%f1, 2(%i14)
	fmul	%f1, %f5, %f1
	fadd	%f1, %f6, %f1
	fmul	%f5, %f2, %f1
	flt	%i4, %f0, %f7
	jeq	%i4, %i0, cont.71150
	lw	%i4, 186(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.71150:
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, cont.71151
	fmul	%f1, %f5, %f5
	fmul	%f1, %f1, %f1
	fmul	%f2, %f1, %f3
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
cont.71151:
cont.71149:
cont.71091:
cont.71090:
	subi	%i4, %i16, 1
	mov	%i16, %i4
cont.70926:
	set_label	%i30, loop_start.66230
	jmp	%i0, 0(%i30)
loop_end.66231:
	mov	%i0, %i31
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f17
	jeq	%i4, %i0, then.71152
	movi	%i4, 4
	lw	%i31, 0(%i1)
	jleq	%i4, %i31, cont.71154
	lw	%i31, 0(%i1)
	addi	%i4, %i31, 1
	movi	%i5, -1
	slli	%i4, %i4, 2
	add	%i31, %i22, %i4
	sw	%i5, 0(%i31)
cont.71154:
	movi	%i31, 2
	jeq	%i17, %i31, then.71155
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65961
then.71155:
	movui	%i31, 260096
	mif	%f2, %i31
	lf	%f1, 0(%i18)
	fsub	%f1, %f2, %f1
	fmul	%f2, %f17, %f1
	lw	%i31, 0(%i1)
	addi	%i5, %i31, 1
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	fadd	%f1, %f16, %f1
	mov	%i31, %i5
	sw	%i31, 0(%i1)
	fmov	%f17, %f2
	fmov	%f16, %f1
cont.71156:
	jzero	%i0, %i0, cont.70660
then.71152:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65961
then.70659:
	movi	%i5, -1
	lw	%i31, 0(%i1)
	slli	%i4, %i31, 2
	add	%i31, %i22, %i4
	sw	%i5, 0(%i31)
	lw	%i31, 0(%i1)
	jeq	%i31, %i0, then.71157
	lw	%i31, 1(%i1)
	lf	%f2, 0(%i31)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f2, %f1
	lw	%i31, 1(%i1)
	lf	%f2, 1(%i31)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lw	%i31, 1(%i1)
	lf	%f2, 2(%i31)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f2, %f1
	fadd	%f1, %f3, %f1
	fneg	%f2, %f1
	flt	%i4, %f0, %f2
	jeq	%i4, %i0, then.71159
	fmul	%f1, %f2, %f2
	fmul	%f1, %f1, %f2
	fmul	%f2, %f1, %f17
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
	jzero	%i0, %i0, loop_end.65961
then.71159:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65961
cont.71160:
then.71157:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.65961
cont.71158:
cont.70660:
cont.70601:
	set_label	%i30, loop_start.65960
	jmp	%i0, 0(%i30)
loop_end.65961:
	mov	%i4, %i31
	fmov	%f1, %f31
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 2(%i1)
	addi	%i1, %i1, 16
	jmp	%i0, 0(%i3)
trace_diffuse_ray.3014:
	mov	%i10, %i4
	mov	%i9, %i5
	fmov	%f2, %f1
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	mov	%i8, %i0
	lw	%i4, 151(%i0)
	lw	%i7, 0(%i4)
loop_start.66426:
	slli	%i4, %i8, 2
	add	%i31, %i7, %i4
	lw	%i6, 0(%i31)
	lw	%i15, 0(%i6)
	movi	%i31, -1
	jeq	%i15, %i31, then.71162
	movi	%i31, 99
	jeq	%i15, %i31, then.71164
	slli	%i5, %i15, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f4, 0(%i14)
	lf	%f3, 1(%i14)
	lf	%f1, 2(%i14)
	slli	%i4, %i15, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.71166
	movi	%i31, 2
	jeq	%i12, %i31, then.71168
	lf	%f6, 0(%i5)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.71170
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71167
then.71170:
	lf	%f5, 1(%i5)
	fmul	%f5, %f5, %f4
	lf	%f4, 2(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	lf	%f3, 3(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i14)
	fmul	%f3, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71172
	jeq	%i13, %i0, then.71174
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71175
then.71174:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71175:
	movi	%i4, 1
	jzero	%i0, %i0, cont.71173
then.71172:
	mov	%i4, %i0
cont.71173:
cont.71171:
	jzero	%i0, %i0, cont.71167
then.71168:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71176
	lf	%f3, 0(%i5)
	lf	%f1, 3(%i14)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71177
then.71176:
	mov	%i4, %i0
cont.71177:
cont.71169:
	jzero	%i0, %i0, cont.71167
then.71166:
	lf	%f5, 0(%i5)
	fsub	%f6, %f5, %f4
	lf	%f5, 1(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 1(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f3
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 1(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71178
	lf	%f5, 2(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71180
	lf	%f5, 1(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71179
then.71180:
	mov	%i4, %i0
cont.71181:
	jzero	%i0, %i0, cont.71179
then.71178:
	mov	%i4, %i0
cont.71179:
	jeq	%i4, %i0, then.71182
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71183
then.71182:
	lf	%f5, 2(%i5)
	fsub	%f6, %f5, %f3
	lf	%f5, 3(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 0(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f4
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71184
	lf	%f5, 2(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71186
	lf	%f5, 3(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71185
then.71186:
	mov	%i4, %i0
cont.71187:
	jzero	%i0, %i0, cont.71185
then.71184:
	mov	%i4, %i0
cont.71185:
	jeq	%i4, %i0, then.71188
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.71189
then.71188:
	lf	%f5, 4(%i5)
	fsub	%f5, %f5, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f5, %f1
	lf	%f1, 0(%i10)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i11)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.71190
	lf	%f1, 1(%i10)
	fmul	%f1, %f5, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71192
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71191
then.71192:
	mov	%i4, %i0
cont.71193:
	jzero	%i0, %i0, cont.71191
then.71190:
	mov	%i4, %i0
cont.71191:
	jeq	%i4, %i0, then.71194
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.71195
then.71194:
	mov	%i4, %i0
cont.71195:
cont.71189:
cont.71183:
cont.71167:
	jeq	%i4, %i0, cont.71196
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, cont.71197
	movi	%i17, 1
loop_start.66457:
	slli	%i4, %i17, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71199
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	mov	%i15, %i0
loop_start.66461:
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i14, 0(%i31)
	movi	%i31, -1
	jeq	%i14, %i31, then.71202
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i18, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f4, 0(%i18)
	lf	%f3, 1(%i18)
	lf	%f1, 2(%i18)
	slli	%i4, %i14, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.71204
	movi	%i31, 2
	jeq	%i12, %i31, then.71206
	lf	%f6, 0(%i5)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.71208
	mov	%i13, %i0
	jzero	%i0, %i0, cont.71205
then.71208:
	lf	%f5, 1(%i5)
	fmul	%f5, %f5, %f4
	lf	%f4, 2(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	lf	%f3, 3(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i18)
	fmul	%f3, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71210
	jeq	%i13, %i0, then.71212
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71213
then.71212:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71213:
	movi	%i13, 1
	jzero	%i0, %i0, cont.71211
then.71210:
	mov	%i13, %i0
cont.71211:
cont.71209:
	jzero	%i0, %i0, cont.71205
then.71206:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71214
	lf	%f3, 0(%i5)
	lf	%f1, 3(%i18)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71215
then.71214:
	mov	%i13, %i0
cont.71215:
cont.71207:
	jzero	%i0, %i0, cont.71205
then.71204:
	lf	%f5, 0(%i5)
	fsub	%f6, %f5, %f4
	lf	%f5, 1(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 1(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f3
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 1(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71216
	lf	%f5, 2(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71218
	lf	%f5, 1(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71217
then.71218:
	mov	%i4, %i0
cont.71219:
	jzero	%i0, %i0, cont.71217
then.71216:
	mov	%i4, %i0
cont.71217:
	jeq	%i4, %i0, then.71220
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71221
then.71220:
	lf	%f5, 2(%i5)
	fsub	%f6, %f5, %f3
	lf	%f5, 3(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 0(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f4
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71222
	lf	%f5, 2(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71224
	lf	%f5, 3(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71223
then.71224:
	mov	%i4, %i0
cont.71225:
	jzero	%i0, %i0, cont.71223
then.71222:
	mov	%i4, %i0
cont.71223:
	jeq	%i4, %i0, then.71226
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 2
	jzero	%i0, %i0, cont.71227
then.71226:
	lf	%f5, 4(%i5)
	fsub	%f5, %f5, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f5, %f1
	lf	%f1, 0(%i10)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i11)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.71228
	lf	%f1, 1(%i10)
	fmul	%f1, %f5, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71230
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71229
then.71230:
	mov	%i4, %i0
cont.71231:
	jzero	%i0, %i0, cont.71229
then.71228:
	mov	%i4, %i0
cont.71229:
	jeq	%i4, %i0, then.71232
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i13, 3
	jzero	%i0, %i0, cont.71233
then.71232:
	mov	%i13, %i0
cont.71233:
cont.71227:
cont.71221:
cont.71205:
	jeq	%i13, %i0, then.71234
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, cont.71236
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, cont.71237
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f8, %f3, %f1
	lf	%f1, 0(%i10)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lf	%f1, 1(%i10)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lf	%f1, 2(%i10)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i12, %i0
loop_start.66492:
	slli	%i4, %i12, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71239
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71241
	movi	%i31, 2
	jeq	%i4, %i31, then.71243
	fmul	%f10, %f4, %f4
	lf	%f9, 0(%i5)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f3, %f3
	lf	%f9, 1(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f1, %f1
	lf	%f9, 2(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i18, %i0, then.71245
	fmul	%f10, %f3, %f1
	lf	%f9, 0(%i20)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f1, %f4
	lf	%f1, 1(%i20)
	fmul	%f1, %f9, %f1
	fadd	%f9, %f10, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i20)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f9, %f1
	jzero	%i0, %i0, cont.71246
then.71245:
	fmov	%f3, %f11
cont.71246:
	movi	%i31, 3
	jeq	%i4, %i31, then.71247
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.71248
then.71247:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.71248:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71242
then.71243:
	lf	%f9, 0(%i5)
	fmul	%f9, %f9, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f9, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.71244:
	jzero	%i0, %i0, cont.71242
then.71241:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f9, %i4
	fmul	%f9, %f9, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f9, %f4
	jeq	%i4, %i0, then.71249
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.71251
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71250
then.71251:
	mov	%i4, %i0
cont.71252:
	jzero	%i0, %i0, cont.71250
then.71249:
	mov	%i4, %i0
cont.71250:
	jeq	%i4, %i0, then.71253
	mov	%i4, %i11
	jzero	%i0, %i0, cont.71254
then.71253:
	ceqi	%i4, %i11, 0
cont.71254:
cont.71242:
	jeq	%i4, %i0, then.71255
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66493
then.71255:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.71256:
	set_label	%i31, loop_start.66492
	jmp	%i0, 0(%i31)
then.71239:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66493
loop_end.66493:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.71257
	lw	%i4, 160(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i14, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i13, 0(%i4)
cont.71257:
cont.71237:
cont.71236:
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.66461
	jmp	%i0, 0(%i31)
then.71234:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71258
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.71259
then.71258:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66462
cont.71259:
cont.71235:
	set_label	%i31, loop_start.66461
	jmp	%i0, 0(%i31)
then.71202:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66462
loop_end.66462:
	mov	%i0, %i31
	addi	%i4, %i17, 1
	mov	%i17, %i4
	set_label	%i31, loop_start.66457
	jmp	%i0, 0(%i31)
then.71199:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66458
loop_end.66458:
	mov	%i0, %i31
cont.71197:
cont.71196:
	jzero	%i0, %i0, cont.71165
then.71164:
	movi	%i17, 1
loop_start.66513:
	slli	%i4, %i17, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71261
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	mov	%i15, %i0
loop_start.66517:
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i14, 0(%i31)
	movi	%i31, -1
	jeq	%i14, %i31, then.71264
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i18, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f4, 0(%i18)
	lf	%f3, 1(%i18)
	lf	%f1, 2(%i18)
	slli	%i4, %i14, 2
	add	%i31, %i9, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.71266
	movi	%i31, 2
	jeq	%i12, %i31, then.71268
	lf	%f6, 0(%i5)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.71270
	mov	%i13, %i0
	jzero	%i0, %i0, cont.71267
then.71270:
	lf	%f5, 1(%i5)
	fmul	%f5, %f5, %f4
	lf	%f4, 2(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	lf	%f3, 3(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i18)
	fmul	%f3, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71272
	jeq	%i13, %i0, then.71274
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71275
then.71274:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71275:
	movi	%i13, 1
	jzero	%i0, %i0, cont.71273
then.71272:
	mov	%i13, %i0
cont.71273:
cont.71271:
	jzero	%i0, %i0, cont.71267
then.71268:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71276
	lf	%f3, 0(%i5)
	lf	%f1, 3(%i18)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71277
then.71276:
	mov	%i13, %i0
cont.71277:
cont.71269:
	jzero	%i0, %i0, cont.71267
then.71266:
	lf	%f5, 0(%i5)
	fsub	%f6, %f5, %f4
	lf	%f5, 1(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 1(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f3
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 1(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71278
	lf	%f5, 2(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71280
	lf	%f5, 1(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71279
then.71280:
	mov	%i4, %i0
cont.71281:
	jzero	%i0, %i0, cont.71279
then.71278:
	mov	%i4, %i0
cont.71279:
	jeq	%i4, %i0, then.71282
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71283
then.71282:
	lf	%f5, 2(%i5)
	fsub	%f6, %f5, %f3
	lf	%f5, 3(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 0(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f4
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71284
	lf	%f5, 2(%i10)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71286
	lf	%f5, 3(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71285
then.71286:
	mov	%i4, %i0
cont.71287:
	jzero	%i0, %i0, cont.71285
then.71284:
	mov	%i4, %i0
cont.71285:
	jeq	%i4, %i0, then.71288
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 2
	jzero	%i0, %i0, cont.71289
then.71288:
	lf	%f5, 4(%i5)
	fsub	%f5, %f5, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f5, %f1
	lf	%f1, 0(%i10)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i11)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.71290
	lf	%f1, 1(%i10)
	fmul	%f1, %f5, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71292
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71291
then.71292:
	mov	%i4, %i0
cont.71293:
	jzero	%i0, %i0, cont.71291
then.71290:
	mov	%i4, %i0
cont.71291:
	jeq	%i4, %i0, then.71294
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i13, 3
	jzero	%i0, %i0, cont.71295
then.71294:
	mov	%i13, %i0
cont.71295:
cont.71289:
cont.71283:
cont.71267:
	jeq	%i13, %i0, then.71296
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, cont.71298
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, cont.71299
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f8, %f3, %f1
	lf	%f1, 0(%i10)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lf	%f1, 1(%i10)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lf	%f1, 2(%i10)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i12, %i0
loop_start.66548:
	slli	%i4, %i12, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71301
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71303
	movi	%i31, 2
	jeq	%i4, %i31, then.71305
	fmul	%f10, %f4, %f4
	lf	%f9, 0(%i5)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f3, %f3
	lf	%f9, 1(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f1, %f1
	lf	%f9, 2(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i18, %i0, then.71307
	fmul	%f10, %f3, %f1
	lf	%f9, 0(%i20)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f1, %f4
	lf	%f1, 1(%i20)
	fmul	%f1, %f9, %f1
	fadd	%f9, %f10, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i20)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f9, %f1
	jzero	%i0, %i0, cont.71308
then.71307:
	fmov	%f3, %f11
cont.71308:
	movi	%i31, 3
	jeq	%i4, %i31, then.71309
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.71310
then.71309:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.71310:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71304
then.71305:
	lf	%f9, 0(%i5)
	fmul	%f9, %f9, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f9, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.71306:
	jzero	%i0, %i0, cont.71304
then.71303:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f9, %i4
	fmul	%f9, %f9, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f9, %f4
	jeq	%i4, %i0, then.71311
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.71313
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71312
then.71313:
	mov	%i4, %i0
cont.71314:
	jzero	%i0, %i0, cont.71312
then.71311:
	mov	%i4, %i0
cont.71312:
	jeq	%i4, %i0, then.71315
	mov	%i4, %i11
	jzero	%i0, %i0, cont.71316
then.71315:
	ceqi	%i4, %i11, 0
cont.71316:
cont.71304:
	jeq	%i4, %i0, then.71317
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66549
then.71317:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.71318:
	set_label	%i31, loop_start.66548
	jmp	%i0, 0(%i31)
then.71301:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66549
loop_end.66549:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.71319
	lw	%i4, 160(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i14, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i13, 0(%i4)
cont.71319:
cont.71299:
cont.71298:
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.66517
	jmp	%i0, 0(%i31)
then.71296:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71320
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.71321
then.71320:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66518
cont.71321:
cont.71297:
	set_label	%i31, loop_start.66517
	jmp	%i0, 0(%i31)
then.71264:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66518
loop_end.66518:
	mov	%i0, %i31
	addi	%i4, %i17, 1
	mov	%i17, %i4
	set_label	%i31, loop_start.66513
	jmp	%i0, 0(%i31)
then.71261:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66514
loop_end.66514:
	mov	%i0, %i31
cont.71165:
	addi	%i4, %i8, 1
	mov	%i8, %i4
	set_label	%i31, loop_start.66426
	jmp	%i0, 0(%i31)
then.71162:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66427
loop_end.66427:
	mov	%i0, %i31
	lw	%i4, 160(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f3
	jeq	%i4, %i0, then.71322
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71323
then.71322:
	mov	%i4, %i0
cont.71323:
	ceq	%i30, %i4, %i0
	jzero	%i0, %i30, Lrelax_skip_1
	set_label	%i30, cont.71324
	jmp	%i0, 0(%i30)
Lrelax_skip_1:
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	lw	%i13, 9(%i5)
	lw	%i9, 8(%i5)
	lw	%i6, 7(%i5)
	lw	%i12, 6(%i5)
	lw	%i8, 5(%i5)
	lw	%i7, 4(%i5)
	lw	%i11, 3(%i5)
	lw	%i4, 1(%i5)
	lw	%i5, 0(%i5)
	movi	%i31, 1
	jeq	%i4, %i31, then.71325
	movi	%i31, 2
	jeq	%i4, %i31, then.71327
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i8)
	fsub	%f4, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i8)
	fsub	%f3, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f5, 2(%i4)
	lf	%f1, 2(%i8)
	fsub	%f9, %f5, %f1
	lf	%f1, 0(%i7)
	fmul	%f8, %f4, %f1
	lf	%f1, 1(%i7)
	fmul	%f7, %f3, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f9, %f1
	jeq	%i11, %i0, then.71329
	lf	%f5, 2(%i13)
	fmul	%f6, %f3, %f5
	lf	%f5, 1(%i13)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f8, %f5
	lw	%i4, 171(%i0)
	sf	%f5, 0(%i4)
	lf	%f5, 2(%i13)
	fmul	%f6, %f4, %f5
	lf	%f5, 0(%i13)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f7, %f5
	lw	%i4, 171(%i0)
	sf	%f5, 1(%i4)
	lf	%f5, 1(%i13)
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i13)
	fmul	%f3, %f3, %f4
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.71330
then.71329:
	lw	%i4, 171(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f7, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.71330:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f1, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f3, %f3, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71331
	movui	%i31, 260096
	mif	%f3, %i31
	jzero	%i0, %i0, cont.71332
then.71331:
	jeq	%i12, %i0, then.71333
	movui	%i31, 784384
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	jzero	%i0, %i0, cont.71334
then.71333:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.71334:
cont.71332:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.71326
then.71327:
	lf	%f1, 0(%i7)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i7)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i7)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.71328:
	jzero	%i0, %i0, cont.71326
then.71325:
	lw	%i4, 157(%i0)
	lw	%i11, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i11, %i11, 1
	slli	%i4, %i11, 2
	add	%i31, %i10, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71335
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.71336
then.71335:
	flt	%i4, %f0, %f1
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
cont.71336:
	fneg	%f1, %f1
	slli	%i10, %i11, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i10
	sf	%f1, 0(%i31)
cont.71326:
	lf	%f1, 0(%i9)
	lw	%i4, 176(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i9)
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i9)
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
	movi	%i31, 1
	jeq	%i5, %i31, then.71337
	movi	%i31, 2
	jeq	%i5, %i31, then.71339
	movi	%i31, 3
	jeq	%i5, %i31, then.71341
	ceqi	%i31, %i5, 4
	jzero	%i0, %i31, cont.71343
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i8)
	fsub	%f4, %f3, %f1
	lf	%f1, 0(%i7)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fmul	%f6, %f4, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i8)
	fsub	%f4, %f3, %f1
	lf	%f1, 2(%i7)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fmul	%f5, %f4, %f1
	fmul	%f3, %f6, %f6
	fmul	%f1, %f5, %f5
	fadd	%f4, %f3, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f6
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71344
	movui	%i31, 268032
	mif	%f3, %i31
	jzero	%i0, %i0, cont.71345
then.71344:
	finv	%f1, %f6
	fmul	%f3, %f5, %f1
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f3
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f6, %f1
	jzero	%i0, %i31, else.71346
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f6
	jzero	%i0, %i31, else.71348
	fmul	%f5, %f6, %f6
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	jzero	%i0, %i0, cont.71347
else.71348:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f6
	fmul	%f6, %f3, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i0)
	fadd	%f3, %f3, %f1
cont.71349:
	jzero	%i0, %i0, cont.71347
else.71346:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f6
	fmul	%f6, %f3, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	lf	%f1, 1(%i0)
	fadd	%f3, %f3, %f1
cont.71347:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.71345:
	fmov	%f1, %f3
	ffloor	%f1, %f1
	fsub	%f3, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f5, 1(%i4)
	lf	%f1, 1(%i8)
	fsub	%f6, %f5, %f1
	lf	%f1, 1(%i7)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fmul	%f6, %f6, %f1
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f4
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.71350
	movui	%i31, 268032
	mif	%f4, %i31
	jzero	%i0, %i0, cont.71351
then.71350:
	finv	%f1, %f4
	fmul	%f4, %f6, %f1
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f4
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f6, %f1
	jzero	%i0, %i31, else.71352
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f6
	jzero	%i0, %i31, else.71354
	fmul	%f5, %f6, %f6
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	jzero	%i0, %i0, cont.71353
else.71354:
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f6
	fmul	%f6, %f4, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	lf	%f1, 2(%i0)
	fadd	%f4, %f4, %f1
cont.71355:
	jzero	%i0, %i0, cont.71353
else.71352:
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f6
	fmul	%f6, %f4, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	lf	%f1, 1(%i0)
	fadd	%f4, %f4, %f1
cont.71353:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f4, %f4, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
cont.71351:
	fmov	%f1, %f4
	ffloor	%f1, %f1
	fsub	%f5, %f4, %f1
	movui	%i31, 254361
	ori	%i31, %i31, -1638
	mif	%f4, %i31
	movui	%i31, 258048
	mif	%f1, %i31
	fsub	%f1, %f1, %f3
	fmul	%f1, %f1, %f1
	fsub	%f3, %f4, %f1
	movui	%i31, 258048
	mif	%f1, %i31
	fsub	%f1, %f1, %f5
	fmul	%f1, %f1, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71356
	fmov	%f3, %f0
	jzero	%i0, %i0, cont.71357
then.71356:
	fmov	%f3, %f1
cont.71357:
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f3, %f1, %f3
	movui	%i31, 256409
	ori	%i31, %i31, -1638
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
cont.71343:
	jzero	%i0, %i0, cont.71338
then.71341:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i8)
	fsub	%f4, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i8)
	fsub	%f1, %f3, %f1
	fmul	%f3, %f4, %f4
	fmul	%f1, %f1, %f1
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	fmov	%f1, %f3
	ffloor	%f1, %f1
	fsub	%f3, %f3, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fsub	%f3, %f1, %f3
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.71358
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.71360
	fmul	%f5, %f3, %f3
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
	fmul	%f1, %f1, %f3
	jzero	%i0, %i0, cont.71359
else.71360:
	lf	%f1, 3(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.71362
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.71364
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.71365
else.71364:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.71365:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.71363
else.71362:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
cont.71363:
cont.71361:
	jzero	%i0, %i0, cont.71359
else.71358:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.71366
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.71368
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.71369
else.71368:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.71369:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.71367
else.71366:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f5
cont.71367:
cont.71359:
	fmul	%f3, %f1, %f1
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f3, %f1, %f3
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
cont.71342:
	jzero	%i0, %i0, cont.71338
then.71339:
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	movui	%i31, 256000
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.71370
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.71372
	fmul	%f5, %f3, %f3
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
	fmul	%f1, %f1, %f3
	jzero	%i0, %i0, cont.71371
else.71372:
	lf	%f1, 3(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.71374
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.71376
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.71377
else.71376:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.71377:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.71375
else.71374:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
cont.71375:
cont.71373:
	jzero	%i0, %i0, cont.71371
else.71370:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.71378
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.71380
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.71381
else.71380:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.71381:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.71379
else.71378:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f5
cont.71379:
cont.71371:
	fmul	%f4, %f1, %f1
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f1, %f4
	lw	%i4, 176(%i0)
	sf	%f1, 0(%i4)
	movui	%i31, 276464
	mif	%f3, %i31
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f1, %f4
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
cont.71340:
	jzero	%i0, %i0, cont.71338
then.71337:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i8)
	fsub	%f4, %f3, %f1
	movui	%i31, 251084
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f1, %f4, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	movui	%i31, 268800
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	flt	%i5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i8)
	fsub	%f4, %f3, %f1
	movui	%i31, 251084
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f1, %f4, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	movui	%i31, 268800
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i5, %i0, then.71382
	jeq	%i4, %i0, then.71384
	movui	%i31, 276464
	mif	%f1, %i31
	jzero	%i0, %i0, cont.71383
then.71384:
	fmov	%f1, %f0
cont.71385:
	jzero	%i0, %i0, cont.71383
then.71382:
	jeq	%i4, %i0, then.71386
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.71387
then.71386:
	movui	%i31, 276464
	mif	%f1, %i31
cont.71387:
cont.71383:
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
cont.71338:
	mov	%i14, %i0
	lw	%i4, 151(%i0)
	lw	%i13, 0(%i4)
loop_start.66615:
	slli	%i4, %i14, 2
	add	%i31, %i13, %i4
	lw	%i12, 0(%i31)
	lw	%i15, 0(%i12)
	movi	%i31, -1
	jeq	%i15, %i31, then.71389
	movi	%i31, 99
	jeq	%i15, %i31, then.71391
	slli	%i5, %i15, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i11, 9(%i4)
	lw	%i10, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i9, 3(%i4)
	lw	%i8, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i15, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i8, %i31, then.71393
	movi	%i31, 2
	jeq	%i8, %i31, then.71395
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71397
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71394
then.71397:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i7)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i7)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i7)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i9, %i0, then.71399
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i11)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i11)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i11)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.71400
then.71399:
	fmov	%f5, %f9
cont.71400:
	movi	%i31, 3
	jeq	%i8, %i31, then.71401
	jzero	%i0, %i0, cont.71402
then.71401:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.71402:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71403
	jeq	%i10, %i0, then.71405
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71406
then.71405:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71406:
	movi	%i4, 1
	jzero	%i0, %i0, cont.71404
then.71403:
	mov	%i4, %i0
cont.71404:
cont.71398:
	jzero	%i0, %i0, cont.71394
then.71395:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71407
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71408
then.71407:
	mov	%i4, %i0
cont.71408:
cont.71396:
	jzero	%i0, %i0, cont.71394
then.71393:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71409
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71411
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71410
then.71411:
	mov	%i4, %i0
cont.71412:
	jzero	%i0, %i0, cont.71410
then.71409:
	mov	%i4, %i0
cont.71410:
	jeq	%i4, %i0, then.71413
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71414
then.71413:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71415
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71417
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71416
then.71417:
	mov	%i4, %i0
cont.71418:
	jzero	%i0, %i0, cont.71416
then.71415:
	mov	%i4, %i0
cont.71416:
	jeq	%i4, %i0, then.71419
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.71420
then.71419:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71421
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71423
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71422
then.71423:
	mov	%i4, %i0
cont.71424:
	jzero	%i0, %i0, cont.71422
then.71421:
	mov	%i4, %i0
cont.71422:
	jeq	%i4, %i0, then.71425
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.71426
then.71425:
	mov	%i4, %i0
cont.71426:
cont.71420:
cont.71414:
cont.71394:
	jeq	%i4, %i0, then.71427
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71429
	movi	%i11, 1
loop_start.66646:
	slli	%i4, %i11, 2
	add	%i31, %i12, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71432
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i10, 0(%i31)
	mov	%i9, %i0
loop_start.66650:
	slli	%i4, %i9, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71435
	slli	%i4, %i9, 2
	add	%i31, %i10, %i4
	lw	%i8, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i18, 9(%i4)
	lw	%i17, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i16, 3(%i4)
	lw	%i15, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i8, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i15, %i31, then.71437
	movi	%i31, 2
	jeq	%i15, %i31, then.71439
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71441
	mov	%i5, %i0
	jzero	%i0, %i0, cont.71438
then.71441:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i7)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i7)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i7)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i16, %i0, then.71443
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i18)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i18)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i18)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.71444
then.71443:
	fmov	%f5, %f9
cont.71444:
	movi	%i31, 3
	jeq	%i15, %i31, then.71445
	jzero	%i0, %i0, cont.71446
then.71445:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.71446:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71447
	jeq	%i17, %i0, then.71449
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71450
then.71449:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71450:
	movi	%i5, 1
	jzero	%i0, %i0, cont.71448
then.71447:
	mov	%i5, %i0
cont.71448:
cont.71442:
	jzero	%i0, %i0, cont.71438
then.71439:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71451
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.71452
then.71451:
	mov	%i5, %i0
cont.71452:
cont.71440:
	jzero	%i0, %i0, cont.71438
then.71437:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71453
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71455
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71454
then.71455:
	mov	%i4, %i0
cont.71456:
	jzero	%i0, %i0, cont.71454
then.71453:
	mov	%i4, %i0
cont.71454:
	jeq	%i4, %i0, then.71457
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.71458
then.71457:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71459
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71461
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71460
then.71461:
	mov	%i4, %i0
cont.71462:
	jzero	%i0, %i0, cont.71460
then.71459:
	mov	%i4, %i0
cont.71460:
	jeq	%i4, %i0, then.71463
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.71464
then.71463:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71465
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71467
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71466
then.71467:
	mov	%i4, %i0
cont.71468:
	jzero	%i0, %i0, cont.71466
then.71465:
	mov	%i4, %i0
cont.71466:
	jeq	%i4, %i0, then.71469
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.71470
then.71469:
	mov	%i5, %i0
cont.71470:
cont.71464:
cont.71458:
cont.71438:
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	jeq	%i5, %i0, then.71471
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71472
then.71471:
	mov	%i4, %i0
cont.71472:
	jeq	%i4, %i0, then.71473
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f4, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i7, %i0
loop_start.66682:
	slli	%i4, %i7, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71476
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i17, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i16, 5(%i4)
	lw	%i15, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i16)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i16)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i16)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71478
	movi	%i31, 2
	jeq	%i4, %i31, then.71480
	fmul	%f9, %f4, %f4
	lf	%f8, 0(%i15)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f3, %f3
	lf	%f8, 1(%i15)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i15)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i8, %i0, then.71482
	fmul	%f9, %f3, %f1
	lf	%f8, 0(%i17)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f4
	lf	%f1, 1(%i17)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i17)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f8, %f1
	jzero	%i0, %i0, cont.71483
then.71482:
	fmov	%f3, %f10
cont.71483:
	movi	%i31, 3
	jeq	%i4, %i31, then.71484
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.71485
then.71484:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.71485:
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71479
then.71480:
	lf	%f8, 0(%i15)
	fmul	%f8, %f8, %f4
	lf	%f4, 1(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f8, %f3
	lf	%f3, 2(%i15)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	ceq	%i4, %i4, %i5
cont.71481:
	jzero	%i0, %i0, cont.71479
then.71478:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f4
	lf	%f4, 0(%i15)
	flt	%i4, %f8, %f4
	jeq	%i4, %i0, then.71486
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i15)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.71488
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i15)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71487
then.71488:
	mov	%i4, %i0
cont.71489:
	jzero	%i0, %i0, cont.71487
then.71486:
	mov	%i4, %i0
cont.71487:
	jeq	%i4, %i0, then.71490
	mov	%i4, %i5
	jzero	%i0, %i0, cont.71491
then.71490:
	ceqi	%i4, %i5, 0
cont.71491:
cont.71479:
	jeq	%i4, %i0, then.71492
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66683
then.71492:
	addi	%i4, %i7, 1
	mov	%i7, %i4
cont.71493:
	set_label	%i31, loop_start.66682
	jmp	%i0, 0(%i31)
then.71476:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66683
loop_end.66683:
	mov	%i4, %i31
	jeq	%i4, %i0, then.71494
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66651
then.71494:
	addi	%i4, %i9, 1
	mov	%i9, %i4
cont.71495:
	set_label	%i31, loop_start.66650
	jmp	%i0, 0(%i31)
then.71473:
	slli	%i5, %i8, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71496
	addi	%i4, %i9, 1
	mov	%i9, %i4
	jzero	%i0, %i0, cont.71497
then.71496:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66651
cont.71497:
cont.71474:
	set_label	%i31, loop_start.66650
	jmp	%i0, 0(%i31)
then.71435:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66651
loop_end.66651:
	mov	%i4, %i31
	jeq	%i4, %i0, then.71498
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66647
then.71498:
	addi	%i4, %i11, 1
	mov	%i11, %i4
cont.71499:
	set_label	%i31, loop_start.66646
	jmp	%i0, 0(%i31)
then.71432:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66647
loop_end.66647:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.71392
then.71429:
	mov	%i4, %i0
cont.71430:
	jzero	%i0, %i0, cont.71392
then.71427:
	mov	%i4, %i0
cont.71428:
	jzero	%i0, %i0, cont.71392
then.71391:
	movi	%i4, 1
cont.71392:
	jeq	%i4, %i0, then.71500
	movi	%i11, 1
loop_start.66703:
	slli	%i4, %i11, 2
	add	%i31, %i12, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71503
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i10, 0(%i31)
	mov	%i9, %i0
loop_start.66707:
	slli	%i4, %i9, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71506
	slli	%i4, %i9, 2
	add	%i31, %i10, %i4
	lw	%i8, 0(%i31)
	slli	%i5, %i8, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i18, 9(%i4)
	lw	%i17, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i16, 3(%i4)
	lw	%i15, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i8, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i15, %i31, then.71508
	movi	%i31, 2
	jeq	%i15, %i31, then.71510
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71512
	mov	%i5, %i0
	jzero	%i0, %i0, cont.71509
then.71512:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i7)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i7)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i7)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i16, %i0, then.71514
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i18)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i18)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i18)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.71515
then.71514:
	fmov	%f5, %f9
cont.71515:
	movi	%i31, 3
	jeq	%i15, %i31, then.71516
	jzero	%i0, %i0, cont.71517
then.71516:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.71517:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71518
	jeq	%i17, %i0, then.71520
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71521
then.71520:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71521:
	movi	%i5, 1
	jzero	%i0, %i0, cont.71519
then.71518:
	mov	%i5, %i0
cont.71519:
cont.71513:
	jzero	%i0, %i0, cont.71509
then.71510:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71522
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.71523
then.71522:
	mov	%i5, %i0
cont.71523:
cont.71511:
	jzero	%i0, %i0, cont.71509
then.71508:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71524
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71526
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71525
then.71526:
	mov	%i4, %i0
cont.71527:
	jzero	%i0, %i0, cont.71525
then.71524:
	mov	%i4, %i0
cont.71525:
	jeq	%i4, %i0, then.71528
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.71529
then.71528:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71530
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71532
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71531
then.71532:
	mov	%i4, %i0
cont.71533:
	jzero	%i0, %i0, cont.71531
then.71530:
	mov	%i4, %i0
cont.71531:
	jeq	%i4, %i0, then.71534
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.71535
then.71534:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71536
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i7)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71538
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71537
then.71538:
	mov	%i4, %i0
cont.71539:
	jzero	%i0, %i0, cont.71537
then.71536:
	mov	%i4, %i0
cont.71537:
	jeq	%i4, %i0, then.71540
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.71541
then.71540:
	mov	%i5, %i0
cont.71541:
cont.71535:
cont.71529:
cont.71509:
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	jeq	%i5, %i0, then.71542
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71543
then.71542:
	mov	%i4, %i0
cont.71543:
	jeq	%i4, %i0, then.71544
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f4, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i7, %i0
loop_start.66739:
	slli	%i4, %i7, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71547
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i17, 9(%i4)
	lw	%i5, 6(%i4)
	lw	%i16, 5(%i4)
	lw	%i15, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i16)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i16)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i16)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71549
	movi	%i31, 2
	jeq	%i4, %i31, then.71551
	fmul	%f9, %f4, %f4
	lf	%f8, 0(%i15)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f3, %f3
	lf	%f8, 1(%i15)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i15)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i8, %i0, then.71553
	fmul	%f9, %f3, %f1
	lf	%f8, 0(%i17)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f4
	lf	%f1, 1(%i17)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i17)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f8, %f1
	jzero	%i0, %i0, cont.71554
then.71553:
	fmov	%f3, %f10
cont.71554:
	movi	%i31, 3
	jeq	%i4, %i31, then.71555
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.71556
then.71555:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.71556:
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71550
then.71551:
	lf	%f8, 0(%i15)
	fmul	%f8, %f8, %f4
	lf	%f4, 1(%i15)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f8, %f3
	lf	%f3, 2(%i15)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i8, %f1, %f0
	mov	%i4, %i5
	mov	%i5, %i8
	ceq	%i4, %i4, %i5
cont.71552:
	jzero	%i0, %i0, cont.71550
then.71549:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f4
	lf	%f4, 0(%i15)
	flt	%i4, %f8, %f4
	jeq	%i4, %i0, then.71557
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i15)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.71559
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i15)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71558
then.71559:
	mov	%i4, %i0
cont.71560:
	jzero	%i0, %i0, cont.71558
then.71557:
	mov	%i4, %i0
cont.71558:
	jeq	%i4, %i0, then.71561
	mov	%i4, %i5
	jzero	%i0, %i0, cont.71562
then.71561:
	ceqi	%i4, %i5, 0
cont.71562:
cont.71550:
	jeq	%i4, %i0, then.71563
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66740
then.71563:
	addi	%i4, %i7, 1
	mov	%i7, %i4
cont.71564:
	set_label	%i31, loop_start.66739
	jmp	%i0, 0(%i31)
then.71547:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66740
loop_end.66740:
	mov	%i4, %i31
	jeq	%i4, %i0, then.71565
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66708
then.71565:
	addi	%i4, %i9, 1
	mov	%i9, %i4
cont.71566:
	set_label	%i31, loop_start.66707
	jmp	%i0, 0(%i31)
then.71544:
	slli	%i5, %i8, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71567
	addi	%i4, %i9, 1
	mov	%i9, %i4
	jzero	%i0, %i0, cont.71568
then.71567:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66708
cont.71568:
cont.71545:
	set_label	%i31, loop_start.66707
	jmp	%i0, 0(%i31)
then.71506:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66708
loop_end.66708:
	mov	%i4, %i31
	jeq	%i4, %i0, then.71569
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66704
then.71569:
	addi	%i4, %i11, 1
	mov	%i11, %i4
cont.71570:
	set_label	%i31, loop_start.66703
	jmp	%i0, 0(%i31)
then.71503:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66704
loop_end.66704:
	mov	%i4, %i31
	jeq	%i4, %i0, then.71571
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66616
then.71571:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.71572:
	set_label	%i31, loop_start.66615
	jmp	%i0, 0(%i31)
then.71500:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.71501:
	set_label	%i31, loop_start.66615
	jmp	%i0, 0(%i31)
then.71389:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66616
loop_end.66616:
	mov	%i4, %i31
	jeq	%i4, %i0, then.71573
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
then.71573:
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f3, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71575
	jzero	%i0, %i0, cont.71576
then.71575:
	fmov	%f1, %f0
cont.71576:
	fmul	%f2, %f2, %f1
	lf	%f1, 0(%i6)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
	mov	%i30, %i4
	fmov	%f30, %f1
	jmp	%i0, 0(%i3)
	mov	%i30, %i4
	fmov	%f30, %f1
cont.71324:
	jmp	%i0, 0(%i3)
iter_trace_diffuse_rays.3017:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i18, %i4
	mov	%i17, %i5
	mov	%i16, %i7
loop_start.66762:
	jleq	%i0, %i16, then.71579
	mov	%i31, %i0
	set_label	%i30, loop_end.66763
	jmp	%i0, 0(%i30)
then.71579:
	slli	%i4, %i16, 2
	add	%i31, %i18, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i17)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i17)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i17)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	flt	%i4, %f2, %f0
	jeq	%i4, %i0, then.71581
	addi	%i4, %i16, 1
	slli	%i4, %i4, 2
	add	%i31, %i18, %i4
	lw	%i4, 0(%i31)
	lw	%i10, 1(%i4)
	lw	%i9, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	mov	%i8, %i0
	lw	%i4, 151(%i0)
	lw	%i7, 0(%i4)
loop_start.66767:
	slli	%i4, %i8, 2
	add	%i31, %i7, %i4
	lw	%i6, 0(%i31)
	lw	%i15, 0(%i6)
	movi	%i31, -1
	jeq	%i15, %i31, then.71584
	movi	%i31, 99
	jeq	%i15, %i31, then.71586
	slli	%i5, %i15, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f4, 0(%i14)
	lf	%f3, 1(%i14)
	lf	%f1, 2(%i14)
	slli	%i4, %i15, 2
	add	%i31, %i10, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.71588
	movi	%i31, 2
	jeq	%i12, %i31, then.71590
	lf	%f6, 0(%i5)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.71592
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71589
then.71592:
	lf	%f5, 1(%i5)
	fmul	%f5, %f5, %f4
	lf	%f4, 2(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	lf	%f3, 3(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i14)
	fmul	%f3, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71594
	jeq	%i13, %i0, then.71596
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71597
then.71596:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71597:
	movi	%i4, 1
	jzero	%i0, %i0, cont.71595
then.71594:
	mov	%i4, %i0
cont.71595:
cont.71593:
	jzero	%i0, %i0, cont.71589
then.71590:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71598
	lf	%f3, 0(%i5)
	lf	%f1, 3(%i14)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71599
then.71598:
	mov	%i4, %i0
cont.71599:
cont.71591:
	jzero	%i0, %i0, cont.71589
then.71588:
	lf	%f5, 0(%i5)
	fsub	%f6, %f5, %f4
	lf	%f5, 1(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 1(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f3
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 1(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71600
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71602
	lf	%f5, 1(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71601
then.71602:
	mov	%i4, %i0
cont.71603:
	jzero	%i0, %i0, cont.71601
then.71600:
	mov	%i4, %i0
cont.71601:
	jeq	%i4, %i0, then.71604
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71605
then.71604:
	lf	%f5, 2(%i5)
	fsub	%f6, %f5, %f3
	lf	%f5, 3(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 0(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f4
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71606
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71608
	lf	%f5, 3(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71607
then.71608:
	mov	%i4, %i0
cont.71609:
	jzero	%i0, %i0, cont.71607
then.71606:
	mov	%i4, %i0
cont.71607:
	jeq	%i4, %i0, then.71610
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.71611
then.71610:
	lf	%f5, 4(%i5)
	fsub	%f5, %f5, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f5, %f1
	lf	%f1, 0(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i11)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.71612
	lf	%f1, 1(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71614
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71613
then.71614:
	mov	%i4, %i0
cont.71615:
	jzero	%i0, %i0, cont.71613
then.71612:
	mov	%i4, %i0
cont.71613:
	jeq	%i4, %i0, then.71616
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.71617
then.71616:
	mov	%i4, %i0
cont.71617:
cont.71611:
cont.71605:
cont.71589:
	jeq	%i4, %i0, cont.71618
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, cont.71619
	movi	%i20, 1
loop_start.66798:
	slli	%i4, %i20, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71621
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i19, 0(%i31)
	mov	%i15, %i0
loop_start.66802:
	slli	%i4, %i15, 2
	add	%i31, %i19, %i4
	lw	%i14, 0(%i31)
	movi	%i31, -1
	jeq	%i14, %i31, then.71624
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f4, 0(%i21)
	lf	%f3, 1(%i21)
	lf	%f1, 2(%i21)
	slli	%i4, %i14, 2
	add	%i31, %i10, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.71626
	movi	%i31, 2
	jeq	%i12, %i31, then.71628
	lf	%f6, 0(%i5)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.71630
	mov	%i13, %i0
	jzero	%i0, %i0, cont.71627
then.71630:
	lf	%f5, 1(%i5)
	fmul	%f5, %f5, %f4
	lf	%f4, 2(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	lf	%f3, 3(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i21)
	fmul	%f3, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71632
	jeq	%i13, %i0, then.71634
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71635
then.71634:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71635:
	movi	%i13, 1
	jzero	%i0, %i0, cont.71633
then.71632:
	mov	%i13, %i0
cont.71633:
cont.71631:
	jzero	%i0, %i0, cont.71627
then.71628:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71636
	lf	%f3, 0(%i5)
	lf	%f1, 3(%i21)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71637
then.71636:
	mov	%i13, %i0
cont.71637:
cont.71629:
	jzero	%i0, %i0, cont.71627
then.71626:
	lf	%f5, 0(%i5)
	fsub	%f6, %f5, %f4
	lf	%f5, 1(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 1(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f3
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 1(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71638
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71640
	lf	%f5, 1(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71639
then.71640:
	mov	%i4, %i0
cont.71641:
	jzero	%i0, %i0, cont.71639
then.71638:
	mov	%i4, %i0
cont.71639:
	jeq	%i4, %i0, then.71642
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71643
then.71642:
	lf	%f5, 2(%i5)
	fsub	%f6, %f5, %f3
	lf	%f5, 3(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 0(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f4
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71644
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71646
	lf	%f5, 3(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71645
then.71646:
	mov	%i4, %i0
cont.71647:
	jzero	%i0, %i0, cont.71645
then.71644:
	mov	%i4, %i0
cont.71645:
	jeq	%i4, %i0, then.71648
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 2
	jzero	%i0, %i0, cont.71649
then.71648:
	lf	%f5, 4(%i5)
	fsub	%f5, %f5, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f5, %f1
	lf	%f1, 0(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i11)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.71650
	lf	%f1, 1(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71652
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71651
then.71652:
	mov	%i4, %i0
cont.71653:
	jzero	%i0, %i0, cont.71651
then.71650:
	mov	%i4, %i0
cont.71651:
	jeq	%i4, %i0, then.71654
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i13, 3
	jzero	%i0, %i0, cont.71655
then.71654:
	mov	%i13, %i0
cont.71655:
cont.71649:
cont.71643:
cont.71627:
	jeq	%i13, %i0, then.71656
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, cont.71658
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, cont.71659
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f8, %f3, %f1
	lf	%f1, 0(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lf	%f1, 1(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lf	%f1, 2(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i12, %i0
loop_start.66833:
	slli	%i4, %i12, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71661
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i23, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i22, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i21, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i22)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i22)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i22)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71663
	movi	%i31, 2
	jeq	%i4, %i31, then.71665
	fmul	%f10, %f4, %f4
	lf	%f9, 0(%i5)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f3, %f3
	lf	%f9, 1(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f1, %f1
	lf	%f9, 2(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i21, %i0, then.71667
	fmul	%f10, %f3, %f1
	lf	%f9, 0(%i23)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f1, %f4
	lf	%f1, 1(%i23)
	fmul	%f1, %f9, %f1
	fadd	%f9, %f10, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i23)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f9, %f1
	jzero	%i0, %i0, cont.71668
then.71667:
	fmov	%f3, %f11
cont.71668:
	movi	%i31, 3
	jeq	%i4, %i31, then.71669
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.71670
then.71669:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.71670:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71664
then.71665:
	lf	%f9, 0(%i5)
	fmul	%f9, %f9, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f9, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.71666:
	jzero	%i0, %i0, cont.71664
then.71663:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f9, %i4
	fmul	%f9, %f9, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f9, %f4
	jeq	%i4, %i0, then.71671
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.71673
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71672
then.71673:
	mov	%i4, %i0
cont.71674:
	jzero	%i0, %i0, cont.71672
then.71671:
	mov	%i4, %i0
cont.71672:
	jeq	%i4, %i0, then.71675
	mov	%i4, %i11
	jzero	%i0, %i0, cont.71676
then.71675:
	ceqi	%i4, %i11, 0
cont.71676:
cont.71664:
	jeq	%i4, %i0, then.71677
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66834
then.71677:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.71678:
	set_label	%i31, loop_start.66833
	jmp	%i0, 0(%i31)
then.71661:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66834
loop_end.66834:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.71679
	lw	%i4, 160(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i14, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i13, 0(%i4)
cont.71679:
cont.71659:
cont.71658:
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.66802
	jmp	%i0, 0(%i31)
then.71656:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71680
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.71681
then.71680:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66803
cont.71681:
cont.71657:
	set_label	%i31, loop_start.66802
	jmp	%i0, 0(%i31)
then.71624:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66803
loop_end.66803:
	mov	%i0, %i31
	addi	%i4, %i20, 1
	mov	%i20, %i4
	set_label	%i31, loop_start.66798
	jmp	%i0, 0(%i31)
then.71621:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66799
loop_end.66799:
	mov	%i0, %i31
cont.71619:
cont.71618:
	jzero	%i0, %i0, cont.71587
then.71586:
	movi	%i20, 1
loop_start.66854:
	slli	%i4, %i20, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71683
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i19, 0(%i31)
	mov	%i15, %i0
loop_start.66858:
	slli	%i4, %i15, 2
	add	%i31, %i19, %i4
	lw	%i14, 0(%i31)
	movi	%i31, -1
	jeq	%i14, %i31, then.71686
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f4, 0(%i21)
	lf	%f3, 1(%i21)
	lf	%f1, 2(%i21)
	slli	%i4, %i14, 2
	add	%i31, %i10, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.71688
	movi	%i31, 2
	jeq	%i12, %i31, then.71690
	lf	%f6, 0(%i5)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.71692
	mov	%i13, %i0
	jzero	%i0, %i0, cont.71689
then.71692:
	lf	%f5, 1(%i5)
	fmul	%f5, %f5, %f4
	lf	%f4, 2(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	lf	%f3, 3(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i21)
	fmul	%f3, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71694
	jeq	%i13, %i0, then.71696
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71697
then.71696:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71697:
	movi	%i13, 1
	jzero	%i0, %i0, cont.71695
then.71694:
	mov	%i13, %i0
cont.71695:
cont.71693:
	jzero	%i0, %i0, cont.71689
then.71690:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71698
	lf	%f3, 0(%i5)
	lf	%f1, 3(%i21)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71699
then.71698:
	mov	%i13, %i0
cont.71699:
cont.71691:
	jzero	%i0, %i0, cont.71689
then.71688:
	lf	%f5, 0(%i5)
	fsub	%f6, %f5, %f4
	lf	%f5, 1(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 1(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f3
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 1(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71700
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71702
	lf	%f5, 1(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71701
then.71702:
	mov	%i4, %i0
cont.71703:
	jzero	%i0, %i0, cont.71701
then.71700:
	mov	%i4, %i0
cont.71701:
	jeq	%i4, %i0, then.71704
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71705
then.71704:
	lf	%f5, 2(%i5)
	fsub	%f6, %f5, %f3
	lf	%f5, 3(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 0(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f4
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71706
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71708
	lf	%f5, 3(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71707
then.71708:
	mov	%i4, %i0
cont.71709:
	jzero	%i0, %i0, cont.71707
then.71706:
	mov	%i4, %i0
cont.71707:
	jeq	%i4, %i0, then.71710
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 2
	jzero	%i0, %i0, cont.71711
then.71710:
	lf	%f5, 4(%i5)
	fsub	%f5, %f5, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f5, %f1
	lf	%f1, 0(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i11)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.71712
	lf	%f1, 1(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71714
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71713
then.71714:
	mov	%i4, %i0
cont.71715:
	jzero	%i0, %i0, cont.71713
then.71712:
	mov	%i4, %i0
cont.71713:
	jeq	%i4, %i0, then.71716
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i13, 3
	jzero	%i0, %i0, cont.71717
then.71716:
	mov	%i13, %i0
cont.71717:
cont.71711:
cont.71705:
cont.71689:
	jeq	%i13, %i0, then.71718
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, cont.71720
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, cont.71721
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f8, %f3, %f1
	lf	%f1, 0(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lf	%f1, 1(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lf	%f1, 2(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i12, %i0
loop_start.66889:
	slli	%i4, %i12, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71723
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i23, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i22, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i21, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i22)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i22)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i22)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71725
	movi	%i31, 2
	jeq	%i4, %i31, then.71727
	fmul	%f10, %f4, %f4
	lf	%f9, 0(%i5)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f3, %f3
	lf	%f9, 1(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f1, %f1
	lf	%f9, 2(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i21, %i0, then.71729
	fmul	%f10, %f3, %f1
	lf	%f9, 0(%i23)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f1, %f4
	lf	%f1, 1(%i23)
	fmul	%f1, %f9, %f1
	fadd	%f9, %f10, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i23)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f9, %f1
	jzero	%i0, %i0, cont.71730
then.71729:
	fmov	%f3, %f11
cont.71730:
	movi	%i31, 3
	jeq	%i4, %i31, then.71731
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.71732
then.71731:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.71732:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71726
then.71727:
	lf	%f9, 0(%i5)
	fmul	%f9, %f9, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f9, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.71728:
	jzero	%i0, %i0, cont.71726
then.71725:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f9, %i4
	fmul	%f9, %f9, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f9, %f4
	jeq	%i4, %i0, then.71733
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.71735
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71734
then.71735:
	mov	%i4, %i0
cont.71736:
	jzero	%i0, %i0, cont.71734
then.71733:
	mov	%i4, %i0
cont.71734:
	jeq	%i4, %i0, then.71737
	mov	%i4, %i11
	jzero	%i0, %i0, cont.71738
then.71737:
	ceqi	%i4, %i11, 0
cont.71738:
cont.71726:
	jeq	%i4, %i0, then.71739
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66890
then.71739:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.71740:
	set_label	%i31, loop_start.66889
	jmp	%i0, 0(%i31)
then.71723:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66890
loop_end.66890:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.71741
	lw	%i4, 160(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i14, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i13, 0(%i4)
cont.71741:
cont.71721:
cont.71720:
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.66858
	jmp	%i0, 0(%i31)
then.71718:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71742
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.71743
then.71742:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66859
cont.71743:
cont.71719:
	set_label	%i31, loop_start.66858
	jmp	%i0, 0(%i31)
then.71686:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66859
loop_end.66859:
	mov	%i0, %i31
	addi	%i4, %i20, 1
	mov	%i20, %i4
	set_label	%i31, loop_start.66854
	jmp	%i0, 0(%i31)
then.71683:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66855
loop_end.66855:
	mov	%i0, %i31
cont.71587:
	addi	%i4, %i8, 1
	mov	%i8, %i4
	set_label	%i31, loop_start.66767
	jmp	%i0, 0(%i31)
then.71584:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66768
loop_end.66768:
	mov	%i0, %i31
	lw	%i4, 160(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f3
	jeq	%i4, %i0, then.71744
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71745
then.71744:
	mov	%i4, %i0
cont.71745:
	jeq	%i4, %i0, cont.71746
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i19, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	movi	%i31, 1
	jeq	%i6, %i31, then.71747
	movi	%i31, 2
	jeq	%i6, %i31, then.71749
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f5, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f9, %f5, %f1
	lf	%f1, 0(%i10)
	fmul	%f8, %f4, %f1
	lf	%f1, 1(%i10)
	fmul	%f7, %f3, %f1
	lf	%f1, 2(%i10)
	fmul	%f1, %f9, %f1
	jeq	%i8, %i0, then.71751
	lf	%f5, 2(%i14)
	fmul	%f6, %f3, %f5
	lf	%f5, 1(%i14)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f8, %f5
	lw	%i4, 171(%i0)
	sf	%f5, 0(%i4)
	lf	%f5, 2(%i14)
	fmul	%f6, %f4, %f5
	lf	%f5, 0(%i14)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f7, %f5
	lw	%i4, 171(%i0)
	sf	%f5, 1(%i4)
	lf	%f5, 1(%i14)
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i14)
	fmul	%f3, %f3, %f4
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.71752
then.71751:
	lw	%i4, 171(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f7, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.71752:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f1, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f3, %f3, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71753
	movui	%i31, 260096
	mif	%f3, %i31
	jzero	%i0, %i0, cont.71754
then.71753:
	jeq	%i12, %i0, then.71755
	movui	%i31, 784384
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	jzero	%i0, %i0, cont.71756
then.71755:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.71756:
cont.71754:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.71748
then.71749:
	lf	%f1, 0(%i10)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i10)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i10)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.71750:
	jzero	%i0, %i0, cont.71748
then.71747:
	lw	%i4, 157(%i0)
	lw	%i20, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i20, %i20, 1
	slli	%i4, %i20, 2
	add	%i31, %i9, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71757
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.71758
then.71757:
	flt	%i4, %f0, %f1
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
cont.71758:
	fneg	%f1, %f1
	slli	%i9, %i20, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i9
	sf	%f1, 0(%i31)
cont.71748:
	lw	%i20, 163(%i0)
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i19
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i20
	subi	%i1, %i1, 8
	sf	%f2, 0(%i1)
	set_label	%i31, utexture.2996
	jmp	%i3, 0(%i31)
	lf	%f2, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i9, %i0
	lw	%i4, 151(%i0)
	lw	%i8, 0(%i4)
loop_start.66922:
	slli	%i4, %i9, 2
	add	%i31, %i8, %i4
	lw	%i7, 0(%i31)
	lw	%i14, 0(%i7)
	movi	%i31, -1
	jeq	%i14, %i31, then.71760
	movi	%i31, 99
	jeq	%i14, %i31, then.71762
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i13, 9(%i4)
	lw	%i12, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i11, 3(%i4)
	lw	%i10, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i14, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i10, %i31, then.71764
	movi	%i31, 2
	jeq	%i10, %i31, then.71766
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71768
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71765
then.71768:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i6)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i6)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i6)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i11, %i0, then.71770
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i13)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i13)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.71771
then.71770:
	fmov	%f5, %f9
cont.71771:
	movi	%i31, 3
	jeq	%i10, %i31, then.71772
	jzero	%i0, %i0, cont.71773
then.71772:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.71773:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71774
	jeq	%i12, %i0, then.71776
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71777
then.71776:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71777:
	movi	%i4, 1
	jzero	%i0, %i0, cont.71775
then.71774:
	mov	%i4, %i0
cont.71775:
cont.71769:
	jzero	%i0, %i0, cont.71765
then.71766:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71778
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71779
then.71778:
	mov	%i4, %i0
cont.71779:
cont.71767:
	jzero	%i0, %i0, cont.71765
then.71764:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71780
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71782
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71781
then.71782:
	mov	%i4, %i0
cont.71783:
	jzero	%i0, %i0, cont.71781
then.71780:
	mov	%i4, %i0
cont.71781:
	jeq	%i4, %i0, then.71784
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71785
then.71784:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71786
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71788
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71787
then.71788:
	mov	%i4, %i0
cont.71789:
	jzero	%i0, %i0, cont.71787
then.71786:
	mov	%i4, %i0
cont.71787:
	jeq	%i4, %i0, then.71790
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.71791
then.71790:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71792
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71794
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71793
then.71794:
	mov	%i4, %i0
cont.71795:
	jzero	%i0, %i0, cont.71793
then.71792:
	mov	%i4, %i0
cont.71793:
	jeq	%i4, %i0, then.71796
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.71797
then.71796:
	mov	%i4, %i0
cont.71797:
cont.71791:
cont.71785:
cont.71765:
	jeq	%i4, %i0, then.71798
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71800
	movi	%i6, 1
loop_start.66953:
	slli	%i4, %i6, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71803
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sf	%f2, 4(%i1)
	set_label	%i31, shadow_check_and_group.2950
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lf	%f2, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	jeq	%i4, %i0, then.71805
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66954
then.71805:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71806:
	set_label	%i31, loop_start.66953
	jmp	%i0, 0(%i31)
then.71803:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66954
loop_end.66954:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.71763
then.71800:
	mov	%i4, %i0
cont.71801:
	jzero	%i0, %i0, cont.71763
then.71798:
	mov	%i4, %i0
cont.71799:
	jzero	%i0, %i0, cont.71763
then.71762:
	movi	%i4, 1
cont.71763:
	jeq	%i4, %i0, then.71807
	movi	%i6, 1
loop_start.66958:
	slli	%i4, %i6, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71810
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sf	%f2, 4(%i1)
	set_label	%i31, shadow_check_and_group.2950
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lf	%f2, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	jeq	%i4, %i0, then.71812
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66959
then.71812:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.71813:
	set_label	%i31, loop_start.66958
	jmp	%i0, 0(%i31)
then.71810:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66959
loop_end.66959:
	mov	%i4, %i31
	jeq	%i4, %i0, then.71814
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.66923
then.71814:
	addi	%i4, %i9, 1
	mov	%i9, %i4
cont.71815:
	set_label	%i31, loop_start.66922
	jmp	%i0, 0(%i31)
then.71807:
	addi	%i4, %i9, 1
	mov	%i9, %i4
cont.71808:
	set_label	%i31, loop_start.66922
	jmp	%i0, 0(%i31)
then.71760:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66923
loop_end.66923:
	mov	%i4, %i31
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.71816
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f3, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71817
	jzero	%i0, %i0, cont.71818
then.71817:
	fmov	%f1, %f0
cont.71818:
	fmul	%f2, %f2, %f1
	lf	%f1, 0(%i19)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.71816:
cont.71746:
	jzero	%i0, %i0, cont.71582
then.71581:
	slli	%i4, %i16, 2
	add	%i31, %i18, %i4
	lw	%i4, 0(%i31)
	lw	%i10, 1(%i4)
	lw	%i9, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	mov	%i8, %i0
	lw	%i4, 151(%i0)
	lw	%i7, 0(%i4)
loop_start.66967:
	slli	%i4, %i8, 2
	add	%i31, %i7, %i4
	lw	%i6, 0(%i31)
	lw	%i15, 0(%i6)
	movi	%i31, -1
	jeq	%i15, %i31, then.71820
	movi	%i31, 99
	jeq	%i15, %i31, then.71822
	slli	%i5, %i15, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f4, 0(%i14)
	lf	%f3, 1(%i14)
	lf	%f1, 2(%i14)
	slli	%i4, %i15, 2
	add	%i31, %i10, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.71824
	movi	%i31, 2
	jeq	%i12, %i31, then.71826
	lf	%f6, 0(%i5)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.71828
	mov	%i4, %i0
	jzero	%i0, %i0, cont.71825
then.71828:
	lf	%f5, 1(%i5)
	fmul	%f5, %f5, %f4
	lf	%f4, 2(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	lf	%f3, 3(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i14)
	fmul	%f3, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71830
	jeq	%i13, %i0, then.71832
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71833
then.71832:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71833:
	movi	%i4, 1
	jzero	%i0, %i0, cont.71831
then.71830:
	mov	%i4, %i0
cont.71831:
cont.71829:
	jzero	%i0, %i0, cont.71825
then.71826:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71834
	lf	%f3, 0(%i5)
	lf	%f1, 3(%i14)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71835
then.71834:
	mov	%i4, %i0
cont.71835:
cont.71827:
	jzero	%i0, %i0, cont.71825
then.71824:
	lf	%f5, 0(%i5)
	fsub	%f6, %f5, %f4
	lf	%f5, 1(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 1(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f3
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 1(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71836
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71838
	lf	%f5, 1(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71837
then.71838:
	mov	%i4, %i0
cont.71839:
	jzero	%i0, %i0, cont.71837
then.71836:
	mov	%i4, %i0
cont.71837:
	jeq	%i4, %i0, then.71840
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.71841
then.71840:
	lf	%f5, 2(%i5)
	fsub	%f6, %f5, %f3
	lf	%f5, 3(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 0(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f4
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71842
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71844
	lf	%f5, 3(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71843
then.71844:
	mov	%i4, %i0
cont.71845:
	jzero	%i0, %i0, cont.71843
then.71842:
	mov	%i4, %i0
cont.71843:
	jeq	%i4, %i0, then.71846
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.71847
then.71846:
	lf	%f5, 4(%i5)
	fsub	%f5, %f5, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f5, %f1
	lf	%f1, 0(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i11)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.71848
	lf	%f1, 1(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71850
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71849
then.71850:
	mov	%i4, %i0
cont.71851:
	jzero	%i0, %i0, cont.71849
then.71848:
	mov	%i4, %i0
cont.71849:
	jeq	%i4, %i0, then.71852
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.71853
then.71852:
	mov	%i4, %i0
cont.71853:
cont.71847:
cont.71841:
cont.71825:
	jeq	%i4, %i0, cont.71854
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, cont.71855
	movi	%i20, 1
loop_start.66998:
	slli	%i4, %i20, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71857
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i19, 0(%i31)
	mov	%i15, %i0
loop_start.67002:
	slli	%i4, %i15, 2
	add	%i31, %i19, %i4
	lw	%i14, 0(%i31)
	movi	%i31, -1
	jeq	%i14, %i31, then.71860
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f4, 0(%i21)
	lf	%f3, 1(%i21)
	lf	%f1, 2(%i21)
	slli	%i4, %i14, 2
	add	%i31, %i10, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.71862
	movi	%i31, 2
	jeq	%i12, %i31, then.71864
	lf	%f6, 0(%i5)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.71866
	mov	%i13, %i0
	jzero	%i0, %i0, cont.71863
then.71866:
	lf	%f5, 1(%i5)
	fmul	%f5, %f5, %f4
	lf	%f4, 2(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	lf	%f3, 3(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i21)
	fmul	%f3, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71868
	jeq	%i13, %i0, then.71870
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71871
then.71870:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71871:
	movi	%i13, 1
	jzero	%i0, %i0, cont.71869
then.71868:
	mov	%i13, %i0
cont.71869:
cont.71867:
	jzero	%i0, %i0, cont.71863
then.71864:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71872
	lf	%f3, 0(%i5)
	lf	%f1, 3(%i21)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71873
then.71872:
	mov	%i13, %i0
cont.71873:
cont.71865:
	jzero	%i0, %i0, cont.71863
then.71862:
	lf	%f5, 0(%i5)
	fsub	%f6, %f5, %f4
	lf	%f5, 1(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 1(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f3
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 1(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71874
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71876
	lf	%f5, 1(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71875
then.71876:
	mov	%i4, %i0
cont.71877:
	jzero	%i0, %i0, cont.71875
then.71874:
	mov	%i4, %i0
cont.71875:
	jeq	%i4, %i0, then.71878
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71879
then.71878:
	lf	%f5, 2(%i5)
	fsub	%f6, %f5, %f3
	lf	%f5, 3(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 0(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f4
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71880
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71882
	lf	%f5, 3(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71881
then.71882:
	mov	%i4, %i0
cont.71883:
	jzero	%i0, %i0, cont.71881
then.71880:
	mov	%i4, %i0
cont.71881:
	jeq	%i4, %i0, then.71884
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 2
	jzero	%i0, %i0, cont.71885
then.71884:
	lf	%f5, 4(%i5)
	fsub	%f5, %f5, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f5, %f1
	lf	%f1, 0(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i11)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.71886
	lf	%f1, 1(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71888
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71887
then.71888:
	mov	%i4, %i0
cont.71889:
	jzero	%i0, %i0, cont.71887
then.71886:
	mov	%i4, %i0
cont.71887:
	jeq	%i4, %i0, then.71890
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i13, 3
	jzero	%i0, %i0, cont.71891
then.71890:
	mov	%i13, %i0
cont.71891:
cont.71885:
cont.71879:
cont.71863:
	jeq	%i13, %i0, then.71892
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, cont.71894
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, cont.71895
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f8, %f3, %f1
	lf	%f1, 0(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lf	%f1, 1(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lf	%f1, 2(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i12, %i0
loop_start.67033:
	slli	%i4, %i12, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71897
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i23, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i22, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i21, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i22)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i22)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i22)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71899
	movi	%i31, 2
	jeq	%i4, %i31, then.71901
	fmul	%f10, %f4, %f4
	lf	%f9, 0(%i5)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f3, %f3
	lf	%f9, 1(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f1, %f1
	lf	%f9, 2(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i21, %i0, then.71903
	fmul	%f10, %f3, %f1
	lf	%f9, 0(%i23)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f1, %f4
	lf	%f1, 1(%i23)
	fmul	%f1, %f9, %f1
	fadd	%f9, %f10, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i23)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f9, %f1
	jzero	%i0, %i0, cont.71904
then.71903:
	fmov	%f3, %f11
cont.71904:
	movi	%i31, 3
	jeq	%i4, %i31, then.71905
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.71906
then.71905:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.71906:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71900
then.71901:
	lf	%f9, 0(%i5)
	fmul	%f9, %f9, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f9, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.71902:
	jzero	%i0, %i0, cont.71900
then.71899:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f9, %i4
	fmul	%f9, %f9, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f9, %f4
	jeq	%i4, %i0, then.71907
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.71909
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71908
then.71909:
	mov	%i4, %i0
cont.71910:
	jzero	%i0, %i0, cont.71908
then.71907:
	mov	%i4, %i0
cont.71908:
	jeq	%i4, %i0, then.71911
	mov	%i4, %i11
	jzero	%i0, %i0, cont.71912
then.71911:
	ceqi	%i4, %i11, 0
cont.71912:
cont.71900:
	jeq	%i4, %i0, then.71913
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67034
then.71913:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.71914:
	set_label	%i31, loop_start.67033
	jmp	%i0, 0(%i31)
then.71897:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67034
loop_end.67034:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.71915
	lw	%i4, 160(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i14, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i13, 0(%i4)
cont.71915:
cont.71895:
cont.71894:
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.67002
	jmp	%i0, 0(%i31)
then.71892:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71916
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.71917
then.71916:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67003
cont.71917:
cont.71893:
	set_label	%i31, loop_start.67002
	jmp	%i0, 0(%i31)
then.71860:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67003
loop_end.67003:
	mov	%i0, %i31
	addi	%i4, %i20, 1
	mov	%i20, %i4
	set_label	%i31, loop_start.66998
	jmp	%i0, 0(%i31)
then.71857:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66999
loop_end.66999:
	mov	%i0, %i31
cont.71855:
cont.71854:
	jzero	%i0, %i0, cont.71823
then.71822:
	movi	%i20, 1
loop_start.67054:
	slli	%i4, %i20, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71919
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i19, 0(%i31)
	mov	%i15, %i0
loop_start.67058:
	slli	%i4, %i15, 2
	add	%i31, %i19, %i4
	lw	%i14, 0(%i31)
	movi	%i31, -1
	jeq	%i14, %i31, then.71922
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 10(%i4)
	lw	%i13, 6(%i4)
	lw	%i11, 4(%i4)
	lw	%i12, 1(%i4)
	lf	%f4, 0(%i21)
	lf	%f3, 1(%i21)
	lf	%f1, 2(%i21)
	slli	%i4, %i14, 2
	add	%i31, %i10, %i4
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i12, %i31, then.71924
	movi	%i31, 2
	jeq	%i12, %i31, then.71926
	lf	%f6, 0(%i5)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.71928
	mov	%i13, %i0
	jzero	%i0, %i0, cont.71925
then.71928:
	lf	%f5, 1(%i5)
	fmul	%f5, %f5, %f4
	lf	%f4, 2(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f5, %f3
	lf	%f3, 3(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i21)
	fmul	%f3, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.71930
	jeq	%i13, %i0, then.71932
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fadd	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.71933
then.71932:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.71933:
	movi	%i13, 1
	jzero	%i0, %i0, cont.71931
then.71930:
	mov	%i13, %i0
cont.71931:
cont.71929:
	jzero	%i0, %i0, cont.71925
then.71926:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.71934
	lf	%f3, 0(%i5)
	lf	%f1, 3(%i21)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71935
then.71934:
	mov	%i13, %i0
cont.71935:
cont.71927:
	jzero	%i0, %i0, cont.71925
then.71924:
	lf	%f5, 0(%i5)
	fsub	%f6, %f5, %f4
	lf	%f5, 1(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 1(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f3
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 1(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71936
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71938
	lf	%f5, 1(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71937
then.71938:
	mov	%i4, %i0
cont.71939:
	jzero	%i0, %i0, cont.71937
then.71936:
	mov	%i4, %i0
cont.71937:
	jeq	%i4, %i0, then.71940
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 1
	jzero	%i0, %i0, cont.71941
then.71940:
	lf	%f5, 2(%i5)
	fsub	%f6, %f5, %f3
	lf	%f5, 3(%i5)
	fmul	%f7, %f6, %f5
	lf	%f5, 0(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f4
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71942
	lf	%f5, 2(%i9)
	fmul	%f5, %f7, %f5
	fadd	%f6, %f5, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f6, %f5, %f6
	lf	%f5, 2(%i11)
	flt	%i4, %f6, %f5
	jeq	%i4, %i0, then.71944
	lf	%f5, 3(%i5)
	feq	%i4, %f5, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71943
then.71944:
	mov	%i4, %i0
cont.71945:
	jzero	%i0, %i0, cont.71943
then.71942:
	mov	%i4, %i0
cont.71943:
	jeq	%i4, %i0, then.71946
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i13, 2
	jzero	%i0, %i0, cont.71947
then.71946:
	lf	%f5, 4(%i5)
	fsub	%f5, %f5, %f1
	lf	%f1, 5(%i5)
	fmul	%f5, %f5, %f1
	lf	%f1, 0(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i11)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.71948
	lf	%f1, 1(%i9)
	fmul	%f1, %f5, %f1
	fadd	%f3, %f1, %f3
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i11)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.71950
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.71949
then.71950:
	mov	%i4, %i0
cont.71951:
	jzero	%i0, %i0, cont.71949
then.71948:
	mov	%i4, %i0
cont.71949:
	jeq	%i4, %i0, then.71952
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i13, 3
	jzero	%i0, %i0, cont.71953
then.71952:
	mov	%i13, %i0
cont.71953:
cont.71947:
cont.71941:
cont.71925:
	jeq	%i13, %i0, then.71954
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	flt	%i4, %f0, %f3
	jeq	%i4, %i0, cont.71956
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, cont.71957
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f8, %f3, %f1
	lf	%f1, 0(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lf	%f1, 1(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lf	%f1, 2(%i9)
	fmul	%f3, %f1, %f8
	lw	%i4, 207(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i12, %i0
loop_start.67089:
	slli	%i4, %i12, 2
	add	%i31, %i19, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.71959
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i23, 9(%i4)
	lw	%i11, 6(%i4)
	lw	%i22, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i21, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i22)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i22)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i22)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.71961
	movi	%i31, 2
	jeq	%i4, %i31, then.71963
	fmul	%f10, %f4, %f4
	lf	%f9, 0(%i5)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f3, %f3
	lf	%f9, 1(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f1, %f1
	lf	%f9, 2(%i5)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i21, %i0, then.71965
	fmul	%f10, %f3, %f1
	lf	%f9, 0(%i23)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f1, %f4
	lf	%f1, 1(%i23)
	fmul	%f1, %f9, %f1
	fadd	%f9, %f10, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i23)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f9, %f1
	jzero	%i0, %i0, cont.71966
then.71965:
	fmov	%f3, %f11
cont.71966:
	movi	%i31, 3
	jeq	%i4, %i31, then.71967
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.71968
then.71967:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.71968:
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.71962
then.71963:
	lf	%f9, 0(%i5)
	fmul	%f9, %f9, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f9, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i11
	ceq	%i4, %i4, %i5
cont.71964:
	jzero	%i0, %i0, cont.71962
then.71961:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f9, %i4
	fmul	%f9, %f9, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f9, %f4
	jeq	%i4, %i0, then.71969
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.71971
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71970
then.71971:
	mov	%i4, %i0
cont.71972:
	jzero	%i0, %i0, cont.71970
then.71969:
	mov	%i4, %i0
cont.71970:
	jeq	%i4, %i0, then.71973
	mov	%i4, %i11
	jzero	%i0, %i0, cont.71974
then.71973:
	ceqi	%i4, %i11, 0
cont.71974:
cont.71962:
	jeq	%i4, %i0, then.71975
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67090
then.71975:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.71976:
	set_label	%i31, loop_start.67089
	jmp	%i0, 0(%i31)
then.71959:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67090
loop_end.67090:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.71977
	lw	%i4, 160(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f5, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i14, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i13, 0(%i4)
cont.71977:
cont.71957:
cont.71956:
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.67058
	jmp	%i0, 0(%i31)
then.71954:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.71978
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.71979
then.71978:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67059
cont.71979:
cont.71955:
	set_label	%i31, loop_start.67058
	jmp	%i0, 0(%i31)
then.71922:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67059
loop_end.67059:
	mov	%i0, %i31
	addi	%i4, %i20, 1
	mov	%i20, %i4
	set_label	%i31, loop_start.67054
	jmp	%i0, 0(%i31)
then.71919:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67055
loop_end.67055:
	mov	%i0, %i31
cont.71823:
	addi	%i4, %i8, 1
	mov	%i8, %i4
	set_label	%i31, loop_start.66967
	jmp	%i0, 0(%i31)
then.71820:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.66968
loop_end.66968:
	mov	%i0, %i31
	lw	%i4, 160(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f3
	jeq	%i4, %i0, then.71980
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.71981
then.71980:
	mov	%i4, %i0
cont.71981:
	jeq	%i4, %i0, cont.71982
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i15, 10(%i4)
	lw	%i14, 9(%i4)
	lw	%i13, 8(%i4)
	lw	%i19, 7(%i4)
	lw	%i12, 6(%i4)
	lw	%i11, 5(%i4)
	lw	%i10, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i7, 2(%i4)
	lw	%i6, 1(%i4)
	lw	%i5, 0(%i4)
	movi	%i31, 1
	jeq	%i6, %i31, then.71983
	movi	%i31, 2
	jeq	%i6, %i31, then.71985
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i11)
	fsub	%f4, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i11)
	fsub	%f3, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f5, 2(%i4)
	lf	%f1, 2(%i11)
	fsub	%f9, %f5, %f1
	lf	%f1, 0(%i10)
	fmul	%f8, %f4, %f1
	lf	%f1, 1(%i10)
	fmul	%f7, %f3, %f1
	lf	%f1, 2(%i10)
	fmul	%f1, %f9, %f1
	jeq	%i8, %i0, then.71987
	lf	%f5, 2(%i14)
	fmul	%f6, %f3, %f5
	lf	%f5, 1(%i14)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f8, %f5
	lw	%i4, 171(%i0)
	sf	%f5, 0(%i4)
	lf	%f5, 2(%i14)
	fmul	%f6, %f4, %f5
	lf	%f5, 0(%i14)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f7, %f5
	lw	%i4, 171(%i0)
	sf	%f5, 1(%i4)
	lf	%f5, 1(%i14)
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i14)
	fmul	%f3, %f3, %f4
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.71988
then.71987:
	lw	%i4, 171(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f7, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.71988:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f1, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f3, %f3, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71989
	movui	%i31, 260096
	mif	%f3, %i31
	jzero	%i0, %i0, cont.71990
then.71989:
	jeq	%i12, %i0, then.71991
	movui	%i31, 784384
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	jzero	%i0, %i0, cont.71992
then.71991:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.71992:
cont.71990:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.71984
then.71985:
	lf	%f1, 0(%i10)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i10)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i10)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.71986:
	jzero	%i0, %i0, cont.71984
then.71983:
	lw	%i4, 157(%i0)
	lw	%i20, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i20, %i20, 1
	slli	%i4, %i20, 2
	add	%i31, %i9, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.71993
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.71994
then.71993:
	flt	%i4, %f0, %f1
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
cont.71994:
	fneg	%f1, %f1
	slli	%i9, %i20, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i9
	sf	%f1, 0(%i31)
cont.71984:
	lw	%i20, 163(%i0)
	mov	%i4, %i5
	mov	%i5, %i6
	mov	%i6, %i7
	mov	%i7, %i8
	mov	%i8, %i10
	mov	%i9, %i11
	mov	%i10, %i12
	mov	%i11, %i19
	mov	%i12, %i13
	mov	%i13, %i14
	mov	%i14, %i15
	mov	%i15, %i20
	subi	%i1, %i1, 8
	sf	%f2, 0(%i1)
	set_label	%i31, utexture.2996
	jmp	%i3, 0(%i31)
	lf	%f2, 0(%i1)
	addi	%i1, %i1, 8
	mov	%i9, %i0
	lw	%i4, 151(%i0)
	lw	%i8, 0(%i4)
loop_start.67122:
	slli	%i4, %i9, 2
	add	%i31, %i8, %i4
	lw	%i7, 0(%i31)
	lw	%i14, 0(%i7)
	movi	%i31, -1
	jeq	%i14, %i31, then.71996
	movi	%i31, 99
	jeq	%i14, %i31, then.71998
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i13, 9(%i4)
	lw	%i12, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i11, 3(%i4)
	lw	%i10, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i14, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i10, %i31, then.72000
	movi	%i31, 2
	jeq	%i10, %i31, then.72002
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72004
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72001
then.72004:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i6)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i6)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i6)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i11, %i0, then.72006
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i13)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i13)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.72007
then.72006:
	fmov	%f5, %f9
cont.72007:
	movi	%i31, 3
	jeq	%i10, %i31, then.72008
	jzero	%i0, %i0, cont.72009
then.72008:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.72009:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72010
	jeq	%i12, %i0, then.72012
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72013
then.72012:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72013:
	movi	%i4, 1
	jzero	%i0, %i0, cont.72011
then.72010:
	mov	%i4, %i0
cont.72011:
cont.72005:
	jzero	%i0, %i0, cont.72001
then.72002:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72014
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72015
then.72014:
	mov	%i4, %i0
cont.72015:
cont.72003:
	jzero	%i0, %i0, cont.72001
then.72000:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72016
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72018
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72017
then.72018:
	mov	%i4, %i0
cont.72019:
	jzero	%i0, %i0, cont.72017
then.72016:
	mov	%i4, %i0
cont.72017:
	jeq	%i4, %i0, then.72020
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72021
then.72020:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72022
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72024
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72023
then.72024:
	mov	%i4, %i0
cont.72025:
	jzero	%i0, %i0, cont.72023
then.72022:
	mov	%i4, %i0
cont.72023:
	jeq	%i4, %i0, then.72026
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.72027
then.72026:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72028
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i6)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72030
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72029
then.72030:
	mov	%i4, %i0
cont.72031:
	jzero	%i0, %i0, cont.72029
then.72028:
	mov	%i4, %i0
cont.72029:
	jeq	%i4, %i0, then.72032
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.72033
then.72032:
	mov	%i4, %i0
cont.72033:
cont.72027:
cont.72021:
cont.72001:
	jeq	%i4, %i0, then.72034
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72036
	movi	%i6, 1
loop_start.67153:
	slli	%i4, %i6, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72039
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sf	%f2, 4(%i1)
	set_label	%i31, shadow_check_and_group.2950
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lf	%f2, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	jeq	%i4, %i0, then.72041
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67154
then.72041:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72042:
	set_label	%i31, loop_start.67153
	jmp	%i0, 0(%i31)
then.72039:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67154
loop_end.67154:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.71999
then.72036:
	mov	%i4, %i0
cont.72037:
	jzero	%i0, %i0, cont.71999
then.72034:
	mov	%i4, %i0
cont.72035:
	jzero	%i0, %i0, cont.71999
then.71998:
	movi	%i4, 1
cont.71999:
	jeq	%i4, %i0, then.72043
	movi	%i6, 1
loop_start.67158:
	slli	%i4, %i6, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72046
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 24
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sf	%f2, 4(%i1)
	set_label	%i31, shadow_check_and_group.2950
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lf	%f2, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	jeq	%i4, %i0, then.72048
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67159
then.72048:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72049:
	set_label	%i31, loop_start.67158
	jmp	%i0, 0(%i31)
then.72046:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67159
loop_end.67159:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72050
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67123
then.72050:
	addi	%i4, %i9, 1
	mov	%i9, %i4
cont.72051:
	set_label	%i31, loop_start.67122
	jmp	%i0, 0(%i31)
then.72043:
	addi	%i4, %i9, 1
	mov	%i9, %i4
cont.72044:
	set_label	%i31, loop_start.67122
	jmp	%i0, 0(%i31)
then.71996:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67123
loop_end.67123:
	mov	%i4, %i31
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.72052
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f3, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72053
	jzero	%i0, %i0, cont.72054
then.72053:
	fmov	%f1, %f0
cont.72054:
	fmul	%f2, %f2, %f1
	lf	%f1, 0(%i19)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.72052:
cont.71982:
cont.71582:
	subi	%i4, %i16, 2
	mov	%i16, %i4
cont.71580:
	set_label	%i30, loop_start.66762
	jmp	%i0, 0(%i30)
loop_end.66763:
	mov	%i4, %i31
	fmov	%f1, %f31
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
trace_diffuse_rays.3022:
	subi	%i1, %i1, 8
	sw	%i3, 0(%i1)
	mov	%i12, %i4
	mov	%i11, %i5
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
	subi	%i13, %i4, 1
loop_start.67166:
	jleq	%i0, %i13, then.72056
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67167
then.72056:
	slli	%i5, %i13, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 10(%i4)
	lw	%i9, 9(%i4)
	lw	%i8, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f2, 0(%i6)
	lf	%f1, 0(%i8)
	fsub	%f1, %f2, %f1
	sf	%f1, 0(%i10)
	lf	%f2, 1(%i6)
	lf	%f1, 1(%i8)
	fsub	%f1, %f2, %f1
	sf	%f1, 1(%i10)
	lf	%f2, 2(%i6)
	lf	%f1, 2(%i8)
	fsub	%f1, %f2, %f1
	sf	%f1, 2(%i10)
	movi	%i31, 2
	jeq	%i4, %i31, then.72058
	movi	%i31, 2
	jleq	%i4, %i31, cont.72060
	lf	%f6, 0(%i10)
	lf	%f5, 1(%i10)
	lf	%f4, 2(%i10)
	fmul	%f2, %f6, %f6
	lf	%f1, 0(%i7)
	fmul	%f3, %f2, %f1
	fmul	%f2, %f5, %f5
	lf	%f1, 1(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f4
	lf	%f1, 2(%i7)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	jeq	%i5, %i0, then.72061
	fmul	%f2, %f5, %f4
	lf	%f1, 0(%i9)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f4, %f6
	lf	%f1, 1(%i9)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	fmul	%f2, %f6, %f5
	lf	%f1, 2(%i9)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	jzero	%i0, %i0, cont.72062
then.72061:
	fmov	%f2, %f3
cont.72062:
	movi	%i31, 3
	jeq	%i4, %i31, then.72063
	fmov	%f1, %f2
	jzero	%i0, %i0, cont.72064
then.72063:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f2, %f1
cont.72064:
	sf	%f1, 3(%i10)
cont.72060:
	jzero	%i0, %i0, cont.72059
then.72058:
	lf	%f2, 0(%i10)
	lf	%f4, 1(%i10)
	lf	%f3, 2(%i10)
	lf	%f1, 0(%i7)
	fmul	%f2, %f1, %f2
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f4
	fadd	%f2, %f2, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f3
	fadd	%f1, %f2, %f1
	sf	%f1, 3(%i10)
cont.72059:
	subi	%i4, %i13, 1
	mov	%i13, %i4
cont.72057:
	set_label	%i30, loop_start.67166
	jmp	%i0, 0(%i30)
loop_end.67167:
	mov	%i0, %i31
	movi	%i10, 118
loop_start.67170:
	jleq	%i0, %i10, then.72066
	mov	%i31, %i0
	set_label	%i30, loop_end.67171
	jmp	%i0, 0(%i30)
then.72066:
	slli	%i4, %i10, 2
	add	%i31, %i12, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f2, 0(%i4)
	lf	%f1, 0(%i11)
	fmul	%f3, %f2, %f1
	lf	%f2, 1(%i4)
	lf	%f1, 1(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f3, %f3, %f1
	lf	%f2, 2(%i4)
	lf	%f1, 2(%i11)
	fmul	%f1, %f2, %f1
	fadd	%f2, %f3, %f1
	flt	%i4, %f2, %f0
	ceq	%i30, %i4, %i0
	jzero	%i0, %i30, Lrelax_skip_2
	set_label	%i30, then.72068
	jmp	%i0, 0(%i30)
Lrelax_skip_2:
	addi	%i4, %i10, 1
	slli	%i4, %i4, 2
	add	%i31, %i12, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i13, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i13
	subi	%i1, %i1, 24
	sw	%i10, 0(%i1)
	sw	%i11, 1(%i1)
	sw	%i12, 2(%i1)
	sw	%i13, 3(%i1)
	sf	%f2, 4(%i1)
	set_label	%i31, trace_or_matrix_fast.2981
	jmp	%i3, 0(%i31)
	lw	%i10, 0(%i1)
	lw	%i11, 1(%i1)
	lw	%i12, 2(%i1)
	lw	%i13, 3(%i1)
	lf	%f2, 4(%i1)
	addi	%i1, %i1, 24
	lw	%i4, 160(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f3
	jeq	%i4, %i0, then.72070
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72071
then.72070:
	mov	%i4, %i0
cont.72071:
	ceq	%i30, %i4, %i0
	jzero	%i0, %i30, Lrelax_skip_3
	set_label	%i30, cont.72069
	jmp	%i0, 0(%i30)
Lrelax_skip_3:
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	lw	%i16, 9(%i5)
	lw	%i8, 8(%i5)
	lw	%i9, 7(%i5)
	lw	%i4, 6(%i5)
	lw	%i7, 5(%i5)
	lw	%i6, 4(%i5)
	lw	%i15, 3(%i5)
	lw	%i14, 1(%i5)
	lw	%i5, 0(%i5)
	movi	%i31, 1
	jeq	%i14, %i31, then.72073
	movi	%i31, 2
	jeq	%i14, %i31, then.72075
	lw	%i13, 163(%i0)
	lf	%f3, 0(%i13)
	lf	%f1, 0(%i7)
	fsub	%f4, %f3, %f1
	lw	%i13, 163(%i0)
	lf	%f3, 1(%i13)
	lf	%f1, 1(%i7)
	fsub	%f3, %f3, %f1
	lw	%i13, 163(%i0)
	lf	%f5, 2(%i13)
	lf	%f1, 2(%i7)
	fsub	%f9, %f5, %f1
	lf	%f1, 0(%i6)
	fmul	%f8, %f4, %f1
	lf	%f1, 1(%i6)
	fmul	%f7, %f3, %f1
	lf	%f1, 2(%i6)
	fmul	%f1, %f9, %f1
	jeq	%i15, %i0, then.72077
	lf	%f5, 2(%i16)
	fmul	%f6, %f3, %f5
	lf	%f5, 1(%i16)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f8, %f5
	lw	%i13, 171(%i0)
	sf	%f5, 0(%i13)
	lf	%f5, 2(%i16)
	fmul	%f6, %f4, %f5
	lf	%f5, 0(%i16)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f7, %f5
	lw	%i13, 171(%i0)
	sf	%f5, 1(%i13)
	lf	%f5, 1(%i16)
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i16)
	fmul	%f3, %f3, %f4
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
	lw	%i13, 171(%i0)
	sf	%f1, 2(%i13)
	jzero	%i0, %i0, cont.72078
then.72077:
	lw	%i13, 171(%i0)
	sf	%f8, 0(%i13)
	lw	%i13, 171(%i0)
	sf	%f7, 1(%i13)
	lw	%i13, 171(%i0)
	sf	%f1, 2(%i13)
cont.72078:
	lw	%i13, 171(%i0)
	lf	%f1, 0(%i13)
	fmul	%f3, %f1, %f1
	lw	%i13, 171(%i0)
	lf	%f1, 1(%i13)
	fmul	%f1, %f1, %f1
	fadd	%f3, %f3, %f1
	lw	%i13, 171(%i0)
	lf	%f1, 2(%i13)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	feq	%i13, %f1, %f0
	jeq	%i13, %i0, then.72079
	movui	%i31, 260096
	mif	%f3, %i31
	jzero	%i0, %i0, cont.72080
then.72079:
	jeq	%i4, %i0, then.72081
	movui	%i31, 784384
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	jzero	%i0, %i0, cont.72082
then.72081:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.72082:
cont.72080:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.72074
then.72075:
	lf	%f1, 0(%i6)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.72076:
	jzero	%i0, %i0, cont.72074
then.72073:
	lw	%i4, 157(%i0)
	lw	%i14, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i14, %i14, 1
	slli	%i4, %i14, 2
	add	%i31, %i13, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72083
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.72084
then.72083:
	flt	%i4, %f0, %f1
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
cont.72084:
	fneg	%f1, %f1
	slli	%i13, %i14, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i13
	sf	%f1, 0(%i31)
cont.72074:
	lf	%f1, 0(%i8)
	lw	%i4, 176(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i8)
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i8)
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
	movi	%i31, 1
	jeq	%i5, %i31, then.72085
	movi	%i31, 2
	jeq	%i5, %i31, then.72087
	movi	%i31, 3
	jeq	%i5, %i31, then.72089
	ceqi	%i31, %i5, 4
	jzero	%i0, %i31, cont.72091
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i7)
	fsub	%f4, %f3, %f1
	lf	%f1, 0(%i6)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fmul	%f6, %f4, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i7)
	fsub	%f4, %f3, %f1
	lf	%f1, 2(%i6)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fmul	%f5, %f4, %f1
	fmul	%f3, %f6, %f6
	fmul	%f1, %f5, %f5
	fadd	%f4, %f3, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f6
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72092
	movui	%i31, 268032
	mif	%f3, %i31
	jzero	%i0, %i0, cont.72093
then.72092:
	finv	%f1, %f6
	fmul	%f3, %f5, %f1
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f3
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f6, %f1
	jzero	%i0, %i31, else.72094
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f6
	jzero	%i0, %i31, else.72096
	fmul	%f5, %f6, %f6
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	jzero	%i0, %i0, cont.72095
else.72096:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f6
	fmul	%f6, %f3, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i0)
	fadd	%f3, %f3, %f1
cont.72097:
	jzero	%i0, %i0, cont.72095
else.72094:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f6
	fmul	%f6, %f3, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	lf	%f1, 1(%i0)
	fadd	%f3, %f3, %f1
cont.72095:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.72093:
	fmov	%f1, %f3
	ffloor	%f1, %f1
	fsub	%f3, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f5, 1(%i4)
	lf	%f1, 1(%i7)
	fsub	%f6, %f5, %f1
	lf	%f1, 1(%i6)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fmul	%f6, %f6, %f1
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f4
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.72098
	movui	%i31, 268032
	mif	%f4, %i31
	jzero	%i0, %i0, cont.72099
then.72098:
	finv	%f1, %f4
	fmul	%f4, %f6, %f1
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f4
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f6, %f1
	jzero	%i0, %i31, else.72100
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f6
	jzero	%i0, %i31, else.72102
	fmul	%f5, %f6, %f6
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	jzero	%i0, %i0, cont.72101
else.72102:
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f6
	fmul	%f6, %f4, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	lf	%f1, 2(%i0)
	fadd	%f4, %f4, %f1
cont.72103:
	jzero	%i0, %i0, cont.72101
else.72100:
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f6
	fmul	%f6, %f4, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	lf	%f1, 1(%i0)
	fadd	%f4, %f4, %f1
cont.72101:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f4, %f4, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
cont.72099:
	fmov	%f1, %f4
	ffloor	%f1, %f1
	fsub	%f5, %f4, %f1
	movui	%i31, 254361
	ori	%i31, %i31, -1638
	mif	%f4, %i31
	movui	%i31, 258048
	mif	%f1, %i31
	fsub	%f1, %f1, %f3
	fmul	%f1, %f1, %f1
	fsub	%f3, %f4, %f1
	movui	%i31, 258048
	mif	%f1, %i31
	fsub	%f1, %f1, %f5
	fmul	%f1, %f1, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72104
	fmov	%f3, %f0
	jzero	%i0, %i0, cont.72105
then.72104:
	fmov	%f3, %f1
cont.72105:
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f3, %f1, %f3
	movui	%i31, 256409
	ori	%i31, %i31, -1638
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
cont.72091:
	jzero	%i0, %i0, cont.72086
then.72089:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i7)
	fsub	%f4, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i7)
	fsub	%f1, %f3, %f1
	fmul	%f3, %f4, %f4
	fmul	%f1, %f1, %f1
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	fmov	%f1, %f3
	ffloor	%f1, %f1
	fsub	%f3, %f3, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fsub	%f3, %f1, %f3
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72106
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.72108
	fmul	%f5, %f3, %f3
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
	fmul	%f1, %f1, %f3
	jzero	%i0, %i0, cont.72107
else.72108:
	lf	%f1, 3(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72110
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72112
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.72113
else.72112:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.72113:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.72111
else.72110:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
cont.72111:
cont.72109:
	jzero	%i0, %i0, cont.72107
else.72106:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.72114
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72116
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.72117
else.72116:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.72117:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.72115
else.72114:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f5
cont.72115:
cont.72107:
	fmul	%f3, %f1, %f1
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f3, %f1, %f3
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
cont.72090:
	jzero	%i0, %i0, cont.72086
then.72087:
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	movui	%i31, 256000
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72118
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.72120
	fmul	%f5, %f3, %f3
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
	fmul	%f1, %f1, %f3
	jzero	%i0, %i0, cont.72119
else.72120:
	lf	%f1, 3(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72122
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72124
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.72125
else.72124:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.72125:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.72123
else.72122:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
cont.72123:
cont.72121:
	jzero	%i0, %i0, cont.72119
else.72118:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.72126
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72128
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.72129
else.72128:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.72129:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.72127
else.72126:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f5
cont.72127:
cont.72119:
	fmul	%f4, %f1, %f1
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f1, %f4
	lw	%i4, 176(%i0)
	sf	%f1, 0(%i4)
	movui	%i31, 276464
	mif	%f3, %i31
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f1, %f4
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
cont.72088:
	jzero	%i0, %i0, cont.72086
then.72085:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i7)
	fsub	%f4, %f3, %f1
	movui	%i31, 251084
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f1, %f4, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	movui	%i31, 268800
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	flt	%i5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i7)
	fsub	%f4, %f3, %f1
	movui	%i31, 251084
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f1, %f4, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	movui	%i31, 268800
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i5, %i0, then.72130
	jeq	%i4, %i0, then.72132
	movui	%i31, 276464
	mif	%f1, %i31
	jzero	%i0, %i0, cont.72131
then.72132:
	fmov	%f1, %f0
cont.72133:
	jzero	%i0, %i0, cont.72131
then.72130:
	jeq	%i4, %i0, then.72134
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.72135
then.72134:
	movui	%i31, 276464
	mif	%f1, %i31
cont.72135:
cont.72131:
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
cont.72086:
	mov	%i8, %i0
	lw	%i4, 151(%i0)
	lw	%i7, 0(%i4)
loop_start.67220:
	slli	%i4, %i8, 2
	add	%i31, %i7, %i4
	lw	%i6, 0(%i31)
	lw	%i18, 0(%i6)
	movi	%i31, -1
	jeq	%i18, %i31, then.72137
	movi	%i31, 99
	jeq	%i18, %i31, then.72139
	slli	%i5, %i18, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i17, 9(%i4)
	lw	%i16, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i13, 4(%i4)
	lw	%i15, 3(%i4)
	lw	%i14, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i18, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i14, %i31, then.72141
	movi	%i31, 2
	jeq	%i14, %i31, then.72143
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72145
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72142
then.72145:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i13)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i15, %i0, then.72147
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i17)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i17)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i17)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.72148
then.72147:
	fmov	%f5, %f9
cont.72148:
	movi	%i31, 3
	jeq	%i14, %i31, then.72149
	jzero	%i0, %i0, cont.72150
then.72149:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.72150:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72151
	jeq	%i16, %i0, then.72153
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72154
then.72153:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72154:
	movi	%i4, 1
	jzero	%i0, %i0, cont.72152
then.72151:
	mov	%i4, %i0
cont.72152:
cont.72146:
	jzero	%i0, %i0, cont.72142
then.72143:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72155
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72156
then.72155:
	mov	%i4, %i0
cont.72156:
cont.72144:
	jzero	%i0, %i0, cont.72142
then.72141:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72157
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72159
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72158
then.72159:
	mov	%i4, %i0
cont.72160:
	jzero	%i0, %i0, cont.72158
then.72157:
	mov	%i4, %i0
cont.72158:
	jeq	%i4, %i0, then.72161
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72162
then.72161:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72163
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72165
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72164
then.72165:
	mov	%i4, %i0
cont.72166:
	jzero	%i0, %i0, cont.72164
then.72163:
	mov	%i4, %i0
cont.72164:
	jeq	%i4, %i0, then.72167
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.72168
then.72167:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72169
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72171
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72170
then.72171:
	mov	%i4, %i0
cont.72172:
	jzero	%i0, %i0, cont.72170
then.72169:
	mov	%i4, %i0
cont.72170:
	jeq	%i4, %i0, then.72173
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.72174
then.72173:
	mov	%i4, %i0
cont.72174:
cont.72168:
cont.72162:
cont.72142:
	jeq	%i4, %i0, then.72175
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72177
	movi	%i17, 1
loop_start.67251:
	slli	%i4, %i17, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72180
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	mov	%i15, %i0
loop_start.67255:
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72183
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i14, 0(%i31)
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 9(%i4)
	lw	%i20, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i13, 4(%i4)
	lw	%i19, 3(%i4)
	lw	%i18, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i14, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i18, %i31, then.72185
	movi	%i31, 2
	jeq	%i18, %i31, then.72187
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72189
	mov	%i5, %i0
	jzero	%i0, %i0, cont.72186
then.72189:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i13)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i19, %i0, then.72191
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i21)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i21)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i21)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.72192
then.72191:
	fmov	%f5, %f9
cont.72192:
	movi	%i31, 3
	jeq	%i18, %i31, then.72193
	jzero	%i0, %i0, cont.72194
then.72193:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.72194:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72195
	jeq	%i20, %i0, then.72197
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72198
then.72197:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72198:
	movi	%i5, 1
	jzero	%i0, %i0, cont.72196
then.72195:
	mov	%i5, %i0
cont.72196:
cont.72190:
	jzero	%i0, %i0, cont.72186
then.72187:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72199
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72200
then.72199:
	mov	%i5, %i0
cont.72200:
cont.72188:
	jzero	%i0, %i0, cont.72186
then.72185:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72201
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72203
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72202
then.72203:
	mov	%i4, %i0
cont.72204:
	jzero	%i0, %i0, cont.72202
then.72201:
	mov	%i4, %i0
cont.72202:
	jeq	%i4, %i0, then.72205
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72206
then.72205:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72207
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72209
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72208
then.72209:
	mov	%i4, %i0
cont.72210:
	jzero	%i0, %i0, cont.72208
then.72207:
	mov	%i4, %i0
cont.72208:
	jeq	%i4, %i0, then.72211
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.72212
then.72211:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72213
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72215
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72214
then.72215:
	mov	%i4, %i0
cont.72216:
	jzero	%i0, %i0, cont.72214
then.72213:
	mov	%i4, %i0
cont.72214:
	jeq	%i4, %i0, then.72217
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.72218
then.72217:
	mov	%i5, %i0
cont.72218:
cont.72212:
cont.72206:
cont.72186:
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	jeq	%i5, %i0, then.72219
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72220
then.72219:
	mov	%i4, %i0
cont.72220:
	jeq	%i4, %i0, then.72221
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f4, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i14, %i0
loop_start.67287:
	slli	%i4, %i14, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72224
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i13, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72226
	movi	%i31, 2
	jeq	%i4, %i31, then.72228
	fmul	%f9, %f4, %f4
	lf	%f8, 0(%i5)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f3, %f3
	lf	%f8, 1(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i18, %i0, then.72230
	fmul	%f9, %f3, %f1
	lf	%f8, 0(%i20)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f4
	lf	%f1, 1(%i20)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i20)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f8, %f1
	jzero	%i0, %i0, cont.72231
then.72230:
	fmov	%f3, %f10
cont.72231:
	movi	%i31, 3
	jeq	%i4, %i31, then.72232
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.72233
then.72232:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.72233:
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.72227
then.72228:
	lf	%f8, 0(%i5)
	fmul	%f8, %f8, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f8, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
cont.72229:
	jzero	%i0, %i0, cont.72227
then.72226:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f8, %f4
	jeq	%i4, %i0, then.72234
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.72236
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72235
then.72236:
	mov	%i4, %i0
cont.72237:
	jzero	%i0, %i0, cont.72235
then.72234:
	mov	%i4, %i0
cont.72235:
	jeq	%i4, %i0, then.72238
	mov	%i4, %i13
	jzero	%i0, %i0, cont.72239
then.72238:
	ceqi	%i4, %i13, 0
cont.72239:
cont.72227:
	jeq	%i4, %i0, then.72240
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67288
then.72240:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.72241:
	set_label	%i31, loop_start.67287
	jmp	%i0, 0(%i31)
then.72224:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67288
loop_end.67288:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72242
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67256
then.72242:
	addi	%i4, %i15, 1
	mov	%i15, %i4
cont.72243:
	set_label	%i31, loop_start.67255
	jmp	%i0, 0(%i31)
then.72221:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72244
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.72245
then.72244:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67256
cont.72245:
cont.72222:
	set_label	%i31, loop_start.67255
	jmp	%i0, 0(%i31)
then.72183:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67256
loop_end.67256:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72246
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67252
then.72246:
	addi	%i4, %i17, 1
	mov	%i17, %i4
cont.72247:
	set_label	%i31, loop_start.67251
	jmp	%i0, 0(%i31)
then.72180:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67252
loop_end.67252:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.72140
then.72177:
	mov	%i4, %i0
cont.72178:
	jzero	%i0, %i0, cont.72140
then.72175:
	mov	%i4, %i0
cont.72176:
	jzero	%i0, %i0, cont.72140
then.72139:
	movi	%i4, 1
cont.72140:
	jeq	%i4, %i0, then.72248
	movi	%i17, 1
loop_start.67308:
	slli	%i4, %i17, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72251
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	mov	%i15, %i0
loop_start.67312:
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72254
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i14, 0(%i31)
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 9(%i4)
	lw	%i20, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i13, 4(%i4)
	lw	%i19, 3(%i4)
	lw	%i18, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i14, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i18, %i31, then.72256
	movi	%i31, 2
	jeq	%i18, %i31, then.72258
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72260
	mov	%i5, %i0
	jzero	%i0, %i0, cont.72257
then.72260:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i13)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i19, %i0, then.72262
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i21)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i21)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i21)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.72263
then.72262:
	fmov	%f5, %f9
cont.72263:
	movi	%i31, 3
	jeq	%i18, %i31, then.72264
	jzero	%i0, %i0, cont.72265
then.72264:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.72265:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72266
	jeq	%i20, %i0, then.72268
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72269
then.72268:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72269:
	movi	%i5, 1
	jzero	%i0, %i0, cont.72267
then.72266:
	mov	%i5, %i0
cont.72267:
cont.72261:
	jzero	%i0, %i0, cont.72257
then.72258:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72270
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72271
then.72270:
	mov	%i5, %i0
cont.72271:
cont.72259:
	jzero	%i0, %i0, cont.72257
then.72256:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72272
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72274
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72273
then.72274:
	mov	%i4, %i0
cont.72275:
	jzero	%i0, %i0, cont.72273
then.72272:
	mov	%i4, %i0
cont.72273:
	jeq	%i4, %i0, then.72276
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72277
then.72276:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72278
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72280
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72279
then.72280:
	mov	%i4, %i0
cont.72281:
	jzero	%i0, %i0, cont.72279
then.72278:
	mov	%i4, %i0
cont.72279:
	jeq	%i4, %i0, then.72282
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.72283
then.72282:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72284
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72286
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72285
then.72286:
	mov	%i4, %i0
cont.72287:
	jzero	%i0, %i0, cont.72285
then.72284:
	mov	%i4, %i0
cont.72285:
	jeq	%i4, %i0, then.72288
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.72289
then.72288:
	mov	%i5, %i0
cont.72289:
cont.72283:
cont.72277:
cont.72257:
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	jeq	%i5, %i0, then.72290
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72291
then.72290:
	mov	%i4, %i0
cont.72291:
	jeq	%i4, %i0, then.72292
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f4, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i14, %i0
loop_start.67344:
	slli	%i4, %i14, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72295
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i13, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72297
	movi	%i31, 2
	jeq	%i4, %i31, then.72299
	fmul	%f9, %f4, %f4
	lf	%f8, 0(%i5)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f3, %f3
	lf	%f8, 1(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i18, %i0, then.72301
	fmul	%f9, %f3, %f1
	lf	%f8, 0(%i20)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f4
	lf	%f1, 1(%i20)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i20)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f8, %f1
	jzero	%i0, %i0, cont.72302
then.72301:
	fmov	%f3, %f10
cont.72302:
	movi	%i31, 3
	jeq	%i4, %i31, then.72303
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.72304
then.72303:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.72304:
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.72298
then.72299:
	lf	%f8, 0(%i5)
	fmul	%f8, %f8, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f8, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
cont.72300:
	jzero	%i0, %i0, cont.72298
then.72297:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f8, %f4
	jeq	%i4, %i0, then.72305
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.72307
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72306
then.72307:
	mov	%i4, %i0
cont.72308:
	jzero	%i0, %i0, cont.72306
then.72305:
	mov	%i4, %i0
cont.72306:
	jeq	%i4, %i0, then.72309
	mov	%i4, %i13
	jzero	%i0, %i0, cont.72310
then.72309:
	ceqi	%i4, %i13, 0
cont.72310:
cont.72298:
	jeq	%i4, %i0, then.72311
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67345
then.72311:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.72312:
	set_label	%i31, loop_start.67344
	jmp	%i0, 0(%i31)
then.72295:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67345
loop_end.67345:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72313
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67313
then.72313:
	addi	%i4, %i15, 1
	mov	%i15, %i4
cont.72314:
	set_label	%i31, loop_start.67312
	jmp	%i0, 0(%i31)
then.72292:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72315
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.72316
then.72315:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67313
cont.72316:
cont.72293:
	set_label	%i31, loop_start.67312
	jmp	%i0, 0(%i31)
then.72254:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67313
loop_end.67313:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72317
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67309
then.72317:
	addi	%i4, %i17, 1
	mov	%i17, %i4
cont.72318:
	set_label	%i31, loop_start.67308
	jmp	%i0, 0(%i31)
then.72251:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67309
loop_end.67309:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72319
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67221
then.72319:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.72320:
	set_label	%i31, loop_start.67220
	jmp	%i0, 0(%i31)
then.72248:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.72249:
	set_label	%i31, loop_start.67220
	jmp	%i0, 0(%i31)
then.72137:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67221
loop_end.67221:
	mov	%i4, %i31
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.72321
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f3, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72322
	jzero	%i0, %i0, cont.72323
then.72322:
	fmov	%f1, %f0
cont.72323:
	fmul	%f2, %f2, %f1
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.72321:
cont.72072:
	set_label	%i31, cont.72069
	jmp	%i0, 0(%i31)
then.72068:
	slli	%i4, %i10, 2
	add	%i31, %i12, %i4
	lw	%i4, 0(%i31)
	lw	%i7, 1(%i4)
	lw	%i13, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f2, %f2, %f1
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i13
	subi	%i1, %i1, 24
	sw	%i10, 0(%i1)
	sw	%i11, 1(%i1)
	sw	%i12, 2(%i1)
	sw	%i13, 3(%i1)
	sf	%f2, 4(%i1)
	set_label	%i31, trace_or_matrix_fast.2981
	jmp	%i3, 0(%i31)
	lw	%i10, 0(%i1)
	lw	%i11, 1(%i1)
	lw	%i12, 2(%i1)
	lw	%i13, 3(%i1)
	lf	%f2, 4(%i1)
	addi	%i1, %i1, 24
	lw	%i4, 160(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f3
	jeq	%i4, %i0, then.72324
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72325
then.72324:
	mov	%i4, %i0
cont.72325:
	ceq	%i30, %i4, %i0
	jzero	%i0, %i30, Lrelax_skip_4
	set_label	%i30, cont.72326
	jmp	%i0, 0(%i30)
Lrelax_skip_4:
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	lw	%i16, 9(%i5)
	lw	%i8, 8(%i5)
	lw	%i9, 7(%i5)
	lw	%i4, 6(%i5)
	lw	%i7, 5(%i5)
	lw	%i6, 4(%i5)
	lw	%i15, 3(%i5)
	lw	%i14, 1(%i5)
	lw	%i5, 0(%i5)
	movi	%i31, 1
	jeq	%i14, %i31, then.72327
	movi	%i31, 2
	jeq	%i14, %i31, then.72329
	lw	%i13, 163(%i0)
	lf	%f3, 0(%i13)
	lf	%f1, 0(%i7)
	fsub	%f4, %f3, %f1
	lw	%i13, 163(%i0)
	lf	%f3, 1(%i13)
	lf	%f1, 1(%i7)
	fsub	%f3, %f3, %f1
	lw	%i13, 163(%i0)
	lf	%f5, 2(%i13)
	lf	%f1, 2(%i7)
	fsub	%f9, %f5, %f1
	lf	%f1, 0(%i6)
	fmul	%f8, %f4, %f1
	lf	%f1, 1(%i6)
	fmul	%f7, %f3, %f1
	lf	%f1, 2(%i6)
	fmul	%f1, %f9, %f1
	jeq	%i15, %i0, then.72331
	lf	%f5, 2(%i16)
	fmul	%f6, %f3, %f5
	lf	%f5, 1(%i16)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f8, %f5
	lw	%i13, 171(%i0)
	sf	%f5, 0(%i13)
	lf	%f5, 2(%i16)
	fmul	%f6, %f4, %f5
	lf	%f5, 0(%i16)
	fmul	%f5, %f9, %f5
	fadd	%f6, %f6, %f5
	movui	%i31, 258048
	mif	%f5, %i31
	fmul	%f5, %f6, %f5
	fadd	%f5, %f7, %f5
	lw	%i13, 171(%i0)
	sf	%f5, 1(%i13)
	lf	%f5, 1(%i16)
	fmul	%f5, %f4, %f5
	lf	%f4, 0(%i16)
	fmul	%f3, %f3, %f4
	fadd	%f4, %f5, %f3
	movui	%i31, 258048
	mif	%f3, %i31
	fmul	%f3, %f4, %f3
	fadd	%f1, %f1, %f3
	lw	%i13, 171(%i0)
	sf	%f1, 2(%i13)
	jzero	%i0, %i0, cont.72332
then.72331:
	lw	%i13, 171(%i0)
	sf	%f8, 0(%i13)
	lw	%i13, 171(%i0)
	sf	%f7, 1(%i13)
	lw	%i13, 171(%i0)
	sf	%f1, 2(%i13)
cont.72332:
	lw	%i13, 171(%i0)
	lf	%f1, 0(%i13)
	fmul	%f3, %f1, %f1
	lw	%i13, 171(%i0)
	lf	%f1, 1(%i13)
	fmul	%f1, %f1, %f1
	fadd	%f3, %f3, %f1
	lw	%i13, 171(%i0)
	lf	%f1, 2(%i13)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	feq	%i13, %f1, %f0
	jeq	%i13, %i0, then.72333
	movui	%i31, 260096
	mif	%f3, %i31
	jzero	%i0, %i0, cont.72334
then.72333:
	jeq	%i4, %i0, then.72335
	movui	%i31, 784384
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	jzero	%i0, %i0, cont.72336
then.72335:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.72336:
cont.72334:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f3
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.72328
then.72329:
	lf	%f1, 0(%i6)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i6)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i6)
	fneg	%f1, %f1
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.72330:
	jzero	%i0, %i0, cont.72328
then.72327:
	lw	%i4, 157(%i0)
	lw	%i14, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i14, %i14, 1
	slli	%i4, %i14, 2
	add	%i31, %i13, %i4
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72337
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.72338
then.72337:
	flt	%i4, %f0, %f1
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
cont.72338:
	fneg	%f1, %f1
	slli	%i13, %i14, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i13
	sf	%f1, 0(%i31)
cont.72328:
	lf	%f1, 0(%i8)
	lw	%i4, 176(%i0)
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i8)
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i8)
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
	movi	%i31, 1
	jeq	%i5, %i31, then.72339
	movi	%i31, 2
	jeq	%i5, %i31, then.72341
	movi	%i31, 3
	jeq	%i5, %i31, then.72343
	ceqi	%i31, %i5, 4
	jzero	%i0, %i31, cont.72345
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i7)
	fsub	%f4, %f3, %f1
	lf	%f1, 0(%i6)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fmul	%f6, %f4, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i7)
	fsub	%f4, %f3, %f1
	lf	%f1, 2(%i6)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	fmul	%f5, %f4, %f1
	fmul	%f3, %f6, %f6
	fmul	%f1, %f5, %f5
	fadd	%f4, %f3, %f1
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f6
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72346
	movui	%i31, 268032
	mif	%f3, %i31
	jzero	%i0, %i0, cont.72347
then.72346:
	finv	%f1, %f6
	fmul	%f3, %f5, %f1
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f3
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f6, %f1
	jzero	%i0, %i31, else.72348
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f6
	jzero	%i0, %i31, else.72350
	fmul	%f5, %f6, %f6
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	jzero	%i0, %i0, cont.72349
else.72350:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f6
	fmul	%f6, %f3, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i0)
	fadd	%f3, %f3, %f1
cont.72351:
	jzero	%i0, %i0, cont.72349
else.72348:
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f6
	fmul	%f6, %f3, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f3, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f6
	lf	%f1, 1(%i0)
	fadd	%f3, %f3, %f1
cont.72349:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
cont.72347:
	fmov	%f1, %f3
	ffloor	%f1, %f1
	fsub	%f3, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f5, 1(%i4)
	lf	%f1, 1(%i7)
	fsub	%f6, %f5, %f1
	lf	%f1, 1(%i6)
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f1, %f5, %f1
	fmul	%f6, %f6, %f1
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f4
	movui	%i31, 232731
	ori	%i31, %i31, 1815
	mif	%f1, %i31
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.72352
	movui	%i31, 268032
	mif	%f4, %i31
	jzero	%i0, %i0, cont.72353
then.72352:
	finv	%f1, %f4
	fmul	%f4, %f6, %f1
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f4
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f6, %f1
	jzero	%i0, %i31, else.72354
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f6
	jzero	%i0, %i31, else.72356
	fmul	%f5, %f6, %f6
	movui	%i31, 245673
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 774478
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 252579
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 778395
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 255159
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 780970
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	jzero	%i0, %i0, cont.72355
else.72356:
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f6
	fmul	%f6, %f4, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	lf	%f1, 2(%i0)
	fadd	%f4, %f4, %f1
cont.72357:
	jzero	%i0, %i0, cont.72355
else.72354:
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f6
	fmul	%f6, %f4, %f1
	fmul	%f5, %f6, %f6
	movui	%i31, 769961
	ori	%i31, %i31, -245
	mif	%f1, %i31
	fmul	%f4, %f1, %f5
	movui	%i31, 250190
	ori	%i31, %i31, -339
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 776867
	ori	%i31, %i31, -460
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 254107
	ori	%i31, %i31, 1221
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 779447
	ori	%i31, %i31, -676
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 256682
	ori	%i31, %i31, 162
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f5
	movui	%i31, 784383
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	lf	%f1, 1(%i0)
	fadd	%f4, %f4, %f1
cont.72355:
	movui	%i31, 270080
	mif	%f1, %i31
	fmul	%f4, %f4, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
cont.72353:
	fmov	%f1, %f4
	ffloor	%f1, %f1
	fsub	%f5, %f4, %f1
	movui	%i31, 254361
	ori	%i31, %i31, -1638
	mif	%f4, %i31
	movui	%i31, 258048
	mif	%f1, %i31
	fsub	%f1, %f1, %f3
	fmul	%f1, %f1, %f1
	fsub	%f3, %f4, %f1
	movui	%i31, 258048
	mif	%f1, %i31
	fsub	%f1, %f1, %f5
	fmul	%f1, %f1, %f1
	fsub	%f1, %f3, %f1
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72358
	fmov	%f3, %f0
	jzero	%i0, %i0, cont.72359
then.72358:
	fmov	%f3, %f1
cont.72359:
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f3, %f1, %f3
	movui	%i31, 256409
	ori	%i31, %i31, -1638
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
cont.72345:
	jzero	%i0, %i0, cont.72340
then.72343:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i7)
	fsub	%f4, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i7)
	fsub	%f1, %f3, %f1
	fmul	%f3, %f4, %f4
	fmul	%f1, %f1, %f1
	fadd	%f1, %f3, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f3, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f3, %f3, %f1
	fmov	%f1, %f3
	ffloor	%f1, %f1
	fsub	%f3, %f3, %f1
	movui	%i31, 263312
	ori	%i31, %i31, -37
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fsub	%f3, %f1, %f3
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72360
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.72362
	fmul	%f5, %f3, %f3
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
	fmul	%f1, %f1, %f3
	jzero	%i0, %i0, cont.72361
else.72362:
	lf	%f1, 3(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72364
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72366
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.72367
else.72366:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.72367:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.72365
else.72364:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
cont.72365:
cont.72363:
	jzero	%i0, %i0, cont.72361
else.72360:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.72368
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72370
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.72371
else.72370:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.72371:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.72369
else.72368:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f5
cont.72369:
cont.72361:
	fmul	%f3, %f1, %f1
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f3, %f1, %f3
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 2(%i4)
cont.72344:
	jzero	%i0, %i0, cont.72340
then.72341:
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	movui	%i31, 256000
	mif	%f1, %i31
	fmul	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72372
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.72374
	fmul	%f5, %f3, %f3
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
	fmul	%f1, %f1, %f3
	jzero	%i0, %i0, cont.72373
else.72374:
	lf	%f1, 3(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72376
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72378
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.72379
else.72378:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.72379:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.72377
else.72376:
	lf	%f1, 3(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
cont.72377:
cont.72375:
	jzero	%i0, %i0, cont.72373
else.72372:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f3
	jzero	%i0, %i31, else.72380
	lf	%f1, 0(%i0)
	finv	%f1, %f1
	fmul	%f1, %f3, %f1
	ffloor	%f1, %f1
	fmov	%f4, %f1
	lf	%f1, 0(%i0)
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 1(%i0)
	fleq	%i31, %f3, %f1
	jzero	%i0, %i31, else.72382
	fmov	%f5, %f3
	jzero	%i0, %i0, cont.72383
else.72382:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
cont.72383:
	fmul	%f4, %f5, %f5
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
	fmul	%f1, %f1, %f5
	jzero	%i0, %i0, cont.72381
else.72380:
	lf	%f1, 0(%i0)
	fsub	%f5, %f1, %f3
	fmul	%f4, %f5, %f5
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f3, %f1, %f4
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 254634
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
	fmul	%f3, %f1, %f4
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f3, %f1
	fmul	%f1, %f1, %f5
cont.72381:
cont.72373:
	fmul	%f4, %f1, %f1
	movui	%i31, 276464
	mif	%f1, %i31
	fmul	%f1, %f1, %f4
	lw	%i4, 176(%i0)
	sf	%f1, 0(%i4)
	movui	%i31, 276464
	mif	%f3, %i31
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f1, %f4
	fmul	%f1, %f3, %f1
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
cont.72342:
	jzero	%i0, %i0, cont.72340
then.72339:
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i7)
	fsub	%f4, %f3, %f1
	movui	%i31, 251084
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f1, %f4, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	movui	%i31, 268800
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	flt	%i5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i7)
	fsub	%f4, %f3, %f1
	movui	%i31, 251084
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f1, %f4, %f1
	ffloor	%f1, %f1
	fmov	%f3, %f1
	movui	%i31, 268800
	mif	%f1, %i31
	fmul	%f1, %f3, %f1
	fsub	%f3, %f4, %f1
	movui	%i31, 266752
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i5, %i0, then.72384
	jeq	%i4, %i0, then.72386
	movui	%i31, 276464
	mif	%f1, %i31
	jzero	%i0, %i0, cont.72385
then.72386:
	fmov	%f1, %f0
cont.72387:
	jzero	%i0, %i0, cont.72385
then.72384:
	jeq	%i4, %i0, then.72388
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.72389
then.72388:
	movui	%i31, 276464
	mif	%f1, %i31
cont.72389:
cont.72385:
	lw	%i4, 176(%i0)
	sf	%f1, 1(%i4)
cont.72340:
	mov	%i8, %i0
	lw	%i4, 151(%i0)
	lw	%i7, 0(%i4)
loop_start.67414:
	slli	%i4, %i8, 2
	add	%i31, %i7, %i4
	lw	%i6, 0(%i31)
	lw	%i18, 0(%i6)
	movi	%i31, -1
	jeq	%i18, %i31, then.72391
	movi	%i31, 99
	jeq	%i18, %i31, then.72393
	slli	%i5, %i18, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i17, 9(%i4)
	lw	%i16, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i13, 4(%i4)
	lw	%i15, 3(%i4)
	lw	%i14, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i18, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i14, %i31, then.72395
	movi	%i31, 2
	jeq	%i14, %i31, then.72397
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72399
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72396
then.72399:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i13)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i15, %i0, then.72401
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i17)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i17)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i17)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.72402
then.72401:
	fmov	%f5, %f9
cont.72402:
	movi	%i31, 3
	jeq	%i14, %i31, then.72403
	jzero	%i0, %i0, cont.72404
then.72403:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.72404:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72405
	jeq	%i16, %i0, then.72407
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72408
then.72407:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72408:
	movi	%i4, 1
	jzero	%i0, %i0, cont.72406
then.72405:
	mov	%i4, %i0
cont.72406:
cont.72400:
	jzero	%i0, %i0, cont.72396
then.72397:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72409
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72410
then.72409:
	mov	%i4, %i0
cont.72410:
cont.72398:
	jzero	%i0, %i0, cont.72396
then.72395:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72411
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72413
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72412
then.72413:
	mov	%i4, %i0
cont.72414:
	jzero	%i0, %i0, cont.72412
then.72411:
	mov	%i4, %i0
cont.72412:
	jeq	%i4, %i0, then.72415
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72416
then.72415:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72417
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72419
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72418
then.72419:
	mov	%i4, %i0
cont.72420:
	jzero	%i0, %i0, cont.72418
then.72417:
	mov	%i4, %i0
cont.72418:
	jeq	%i4, %i0, then.72421
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.72422
then.72421:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72423
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72425
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72424
then.72425:
	mov	%i4, %i0
cont.72426:
	jzero	%i0, %i0, cont.72424
then.72423:
	mov	%i4, %i0
cont.72424:
	jeq	%i4, %i0, then.72427
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.72428
then.72427:
	mov	%i4, %i0
cont.72428:
cont.72422:
cont.72416:
cont.72396:
	jeq	%i4, %i0, then.72429
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72431
	movi	%i17, 1
loop_start.67445:
	slli	%i4, %i17, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72434
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	mov	%i15, %i0
loop_start.67449:
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72437
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i14, 0(%i31)
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 9(%i4)
	lw	%i20, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i13, 4(%i4)
	lw	%i19, 3(%i4)
	lw	%i18, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i14, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i18, %i31, then.72439
	movi	%i31, 2
	jeq	%i18, %i31, then.72441
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72443
	mov	%i5, %i0
	jzero	%i0, %i0, cont.72440
then.72443:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i13)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i19, %i0, then.72445
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i21)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i21)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i21)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.72446
then.72445:
	fmov	%f5, %f9
cont.72446:
	movi	%i31, 3
	jeq	%i18, %i31, then.72447
	jzero	%i0, %i0, cont.72448
then.72447:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.72448:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72449
	jeq	%i20, %i0, then.72451
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72452
then.72451:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72452:
	movi	%i5, 1
	jzero	%i0, %i0, cont.72450
then.72449:
	mov	%i5, %i0
cont.72450:
cont.72444:
	jzero	%i0, %i0, cont.72440
then.72441:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72453
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72454
then.72453:
	mov	%i5, %i0
cont.72454:
cont.72442:
	jzero	%i0, %i0, cont.72440
then.72439:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72455
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72457
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72456
then.72457:
	mov	%i4, %i0
cont.72458:
	jzero	%i0, %i0, cont.72456
then.72455:
	mov	%i4, %i0
cont.72456:
	jeq	%i4, %i0, then.72459
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72460
then.72459:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72461
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72463
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72462
then.72463:
	mov	%i4, %i0
cont.72464:
	jzero	%i0, %i0, cont.72462
then.72461:
	mov	%i4, %i0
cont.72462:
	jeq	%i4, %i0, then.72465
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.72466
then.72465:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72467
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72469
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72468
then.72469:
	mov	%i4, %i0
cont.72470:
	jzero	%i0, %i0, cont.72468
then.72467:
	mov	%i4, %i0
cont.72468:
	jeq	%i4, %i0, then.72471
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.72472
then.72471:
	mov	%i5, %i0
cont.72472:
cont.72466:
cont.72460:
cont.72440:
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	jeq	%i5, %i0, then.72473
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72474
then.72473:
	mov	%i4, %i0
cont.72474:
	jeq	%i4, %i0, then.72475
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f4, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i14, %i0
loop_start.67481:
	slli	%i4, %i14, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72478
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i13, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72480
	movi	%i31, 2
	jeq	%i4, %i31, then.72482
	fmul	%f9, %f4, %f4
	lf	%f8, 0(%i5)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f3, %f3
	lf	%f8, 1(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i18, %i0, then.72484
	fmul	%f9, %f3, %f1
	lf	%f8, 0(%i20)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f4
	lf	%f1, 1(%i20)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i20)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f8, %f1
	jzero	%i0, %i0, cont.72485
then.72484:
	fmov	%f3, %f10
cont.72485:
	movi	%i31, 3
	jeq	%i4, %i31, then.72486
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.72487
then.72486:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.72487:
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.72481
then.72482:
	lf	%f8, 0(%i5)
	fmul	%f8, %f8, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f8, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
cont.72483:
	jzero	%i0, %i0, cont.72481
then.72480:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f8, %f4
	jeq	%i4, %i0, then.72488
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.72490
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72489
then.72490:
	mov	%i4, %i0
cont.72491:
	jzero	%i0, %i0, cont.72489
then.72488:
	mov	%i4, %i0
cont.72489:
	jeq	%i4, %i0, then.72492
	mov	%i4, %i13
	jzero	%i0, %i0, cont.72493
then.72492:
	ceqi	%i4, %i13, 0
cont.72493:
cont.72481:
	jeq	%i4, %i0, then.72494
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67482
then.72494:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.72495:
	set_label	%i31, loop_start.67481
	jmp	%i0, 0(%i31)
then.72478:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67482
loop_end.67482:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72496
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67450
then.72496:
	addi	%i4, %i15, 1
	mov	%i15, %i4
cont.72497:
	set_label	%i31, loop_start.67449
	jmp	%i0, 0(%i31)
then.72475:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72498
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.72499
then.72498:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67450
cont.72499:
cont.72476:
	set_label	%i31, loop_start.67449
	jmp	%i0, 0(%i31)
then.72437:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67450
loop_end.67450:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72500
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67446
then.72500:
	addi	%i4, %i17, 1
	mov	%i17, %i4
cont.72501:
	set_label	%i31, loop_start.67445
	jmp	%i0, 0(%i31)
then.72434:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67446
loop_end.67446:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.72394
then.72431:
	mov	%i4, %i0
cont.72432:
	jzero	%i0, %i0, cont.72394
then.72429:
	mov	%i4, %i0
cont.72430:
	jzero	%i0, %i0, cont.72394
then.72393:
	movi	%i4, 1
cont.72394:
	jeq	%i4, %i0, then.72502
	movi	%i17, 1
loop_start.67502:
	slli	%i4, %i17, 2
	add	%i31, %i6, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72505
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i16, 0(%i31)
	mov	%i15, %i0
loop_start.67506:
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72508
	slli	%i4, %i15, 2
	add	%i31, %i16, %i4
	lw	%i14, 0(%i31)
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i21, 9(%i4)
	lw	%i20, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i13, 4(%i4)
	lw	%i19, 3(%i4)
	lw	%i18, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f3, 0(%i4)
	lf	%f1, 0(%i5)
	fsub	%f6, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 1(%i4)
	lf	%f1, 1(%i5)
	fsub	%f5, %f3, %f1
	lw	%i4, 163(%i0)
	lf	%f3, 2(%i4)
	lf	%f1, 2(%i5)
	fsub	%f4, %f3, %f1
	slli	%i5, %i14, 2
	lw	%i4, 248(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i18, %i31, then.72510
	movi	%i31, 2
	jeq	%i18, %i31, then.72512
	lf	%f1, 0(%i5)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72514
	mov	%i5, %i0
	jzero	%i0, %i0, cont.72511
then.72514:
	lf	%f3, 1(%i5)
	fmul	%f7, %f3, %f6
	lf	%f3, 2(%i5)
	fmul	%f3, %f3, %f5
	fadd	%f7, %f7, %f3
	lf	%f3, 3(%i5)
	fmul	%f3, %f3, %f4
	fadd	%f3, %f7, %f3
	fmul	%f8, %f6, %f6
	lf	%f7, 0(%i13)
	fmul	%f9, %f8, %f7
	fmul	%f8, %f5, %f5
	lf	%f7, 1(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 2(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f9, %f9, %f7
	jeq	%i19, %i0, then.72516
	fmul	%f8, %f5, %f4
	lf	%f7, 0(%i21)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f9, %f7
	fmul	%f7, %f4, %f6
	lf	%f4, 1(%i21)
	fmul	%f4, %f7, %f4
	fadd	%f7, %f8, %f4
	fmul	%f5, %f6, %f5
	lf	%f4, 2(%i21)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f7, %f4
	jzero	%i0, %i0, cont.72517
then.72516:
	fmov	%f5, %f9
cont.72517:
	movi	%i31, 3
	jeq	%i18, %i31, then.72518
	jzero	%i0, %i0, cont.72519
then.72518:
	movui	%i31, 260096
	mif	%f4, %i31
	fsub	%f5, %f5, %f4
cont.72519:
	fmul	%f4, %f3, %f3
	fmul	%f1, %f1, %f5
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72520
	jeq	%i20, %i0, then.72522
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fadd	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72523
then.72522:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	fsub	%f3, %f3, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72523:
	movi	%i5, 1
	jzero	%i0, %i0, cont.72521
then.72520:
	mov	%i5, %i0
cont.72521:
cont.72515:
	jzero	%i0, %i0, cont.72511
then.72512:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72524
	lf	%f1, 1(%i5)
	fmul	%f3, %f1, %f6
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f5
	fadd	%f3, %f3, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f3, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72525
then.72524:
	mov	%i5, %i0
cont.72525:
cont.72513:
	jzero	%i0, %i0, cont.72511
then.72510:
	lf	%f1, 0(%i5)
	fsub	%f3, %f1, %f6
	lf	%f1, 1(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72526
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72528
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72527
then.72528:
	mov	%i4, %i0
cont.72529:
	jzero	%i0, %i0, cont.72527
then.72526:
	mov	%i4, %i0
cont.72527:
	jeq	%i4, %i0, then.72530
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72531
then.72530:
	lf	%f1, 2(%i5)
	fsub	%f3, %f1, %f5
	lf	%f1, 3(%i5)
	fmul	%f7, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72532
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f3, %f1, %f4
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 2(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72534
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72533
then.72534:
	mov	%i4, %i0
cont.72535:
	jzero	%i0, %i0, cont.72533
then.72532:
	mov	%i4, %i0
cont.72533:
	jeq	%i4, %i0, then.72536
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.72537
then.72536:
	lf	%f1, 4(%i5)
	fsub	%f3, %f1, %f4
	lf	%f1, 5(%i5)
	fmul	%f4, %f3, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f6
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 0(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72538
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f3, %f1, %f5
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f3, %f1, %f3
	lf	%f1, 1(%i13)
	flt	%i4, %f3, %f1
	jeq	%i4, %i0, then.72540
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72539
then.72540:
	mov	%i4, %i0
cont.72541:
	jzero	%i0, %i0, cont.72539
then.72538:
	mov	%i4, %i0
cont.72539:
	jeq	%i4, %i0, then.72542
	lw	%i4, 154(%i0)
	sf	%f4, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.72543
then.72542:
	mov	%i5, %i0
cont.72543:
cont.72537:
cont.72531:
cont.72511:
	lw	%i4, 154(%i0)
	lf	%f3, 0(%i4)
	jeq	%i5, %i0, then.72544
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72545
then.72544:
	mov	%i4, %i0
cont.72545:
	jeq	%i4, %i0, then.72546
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f4, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f7, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f6, %f3, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f3, %f1, %f4
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f5, %f3, %f1
	mov	%i14, %i0
loop_start.67538:
	slli	%i4, %i14, 2
	add	%i31, %i16, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72549
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i20, 9(%i4)
	lw	%i13, 6(%i4)
	lw	%i19, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i18, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i19)
	fsub	%f4, %f7, %f1
	lf	%f1, 1(%i19)
	fsub	%f3, %f6, %f1
	lf	%f1, 2(%i19)
	fsub	%f1, %f5, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72551
	movi	%i31, 2
	jeq	%i4, %i31, then.72553
	fmul	%f9, %f4, %f4
	lf	%f8, 0(%i5)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f3, %f3
	lf	%f8, 1(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f1, %f1
	lf	%f8, 2(%i5)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i18, %i0, then.72555
	fmul	%f9, %f3, %f1
	lf	%f8, 0(%i20)
	fmul	%f8, %f9, %f8
	fadd	%f9, %f10, %f8
	fmul	%f8, %f1, %f4
	lf	%f1, 1(%i20)
	fmul	%f1, %f8, %f1
	fadd	%f8, %f9, %f1
	fmul	%f3, %f4, %f3
	lf	%f1, 2(%i20)
	fmul	%f1, %f3, %f1
	fadd	%f3, %f8, %f1
	jzero	%i0, %i0, cont.72556
then.72555:
	fmov	%f3, %f10
cont.72556:
	movi	%i31, 3
	jeq	%i4, %i31, then.72557
	fmov	%f1, %f3
	jzero	%i0, %i0, cont.72558
then.72557:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f3, %f1
cont.72558:
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.72552
then.72553:
	lf	%f8, 0(%i5)
	fmul	%f8, %f8, %f4
	lf	%f4, 1(%i5)
	fmul	%f3, %f4, %f3
	fadd	%f4, %f8, %f3
	lf	%f3, 2(%i5)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
cont.72554:
	jzero	%i0, %i0, cont.72552
then.72551:
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f8, %i4
	fmul	%f8, %f8, %f4
	lf	%f4, 0(%i5)
	flt	%i4, %f8, %f4
	jeq	%i4, %i0, then.72559
	fleq	%i4, %f0, %f3
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f3
	lf	%f3, 1(%i5)
	flt	%i4, %f4, %f3
	jeq	%i4, %i0, then.72561
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f3, %i4
	fmul	%f3, %f3, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f3, %f1
	jzero	%i0, %i0, cont.72560
then.72561:
	mov	%i4, %i0
cont.72562:
	jzero	%i0, %i0, cont.72560
then.72559:
	mov	%i4, %i0
cont.72560:
	jeq	%i4, %i0, then.72563
	mov	%i4, %i13
	jzero	%i0, %i0, cont.72564
then.72563:
	ceqi	%i4, %i13, 0
cont.72564:
cont.72552:
	jeq	%i4, %i0, then.72565
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67539
then.72565:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.72566:
	set_label	%i31, loop_start.67538
	jmp	%i0, 0(%i31)
then.72549:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67539
loop_end.67539:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72567
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67507
then.72567:
	addi	%i4, %i15, 1
	mov	%i15, %i4
cont.72568:
	set_label	%i31, loop_start.67506
	jmp	%i0, 0(%i31)
then.72546:
	slli	%i5, %i14, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72569
	addi	%i4, %i15, 1
	mov	%i15, %i4
	jzero	%i0, %i0, cont.72570
then.72569:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67507
cont.72570:
cont.72547:
	set_label	%i31, loop_start.67506
	jmp	%i0, 0(%i31)
then.72508:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67507
loop_end.67507:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72571
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67503
then.72571:
	addi	%i4, %i17, 1
	mov	%i17, %i4
cont.72572:
	set_label	%i31, loop_start.67502
	jmp	%i0, 0(%i31)
then.72505:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67503
loop_end.67503:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72573
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67415
then.72573:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.72574:
	set_label	%i31, loop_start.67414
	jmp	%i0, 0(%i31)
then.72502:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.72503:
	set_label	%i31, loop_start.67414
	jmp	%i0, 0(%i31)
then.72391:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67415
loop_end.67415:
	mov	%i4, %i31
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.72575
	lw	%i4, 171(%i0)
	lf	%f3, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f3, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f4, %f4, %f1
	lw	%i4, 171(%i0)
	lf	%f3, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f4, %f1
	fneg	%f1, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72576
	jzero	%i0, %i0, cont.72577
then.72576:
	fmov	%f1, %f0
cont.72577:
	fmul	%f2, %f2, %f1
	lf	%f1, 0(%i9)
	fmul	%f3, %f2, %f1
	lw	%i4, 181(%i0)
	lf	%f2, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 181(%i0)
	lf	%f2, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f3, %f1
	fadd	%f1, %f2, %f1
	lw	%i4, 181(%i0)
	sf	%f1, 2(%i4)
cont.72575:
cont.72326:
cont.72069:
	subi	%i4, %i10, 2
	mov	%i10, %i4
cont.72067:
	set_label	%i30, loop_start.67170
	jmp	%i0, 0(%i30)
loop_end.67171:
	mov	%i4, %i31
	fmov	%f1, %f31
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 0(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
pretrace_pixels.3073:
	subi	%i1, %i1, 8
	sw	%i3, 1(%i1)
	mov	%i26, %i4
	mov	%i25, %i5
	mov	%i24, %i6
	fmov	%f18, %f1
loop_start.67562:
	jleq	%i0, %i25, then.72579
	mov	%i31, %i0
	set_label	%i30, loop_end.67563
	jmp	%i0, 0(%i30)
then.72579:
	lw	%i4, 199(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 195(%i0)
	lw	%i4, 0(%i4)
	sub	%i4, %i25, %i4
	itof	%f1, %i4
	fmul	%f4, %f4, %f1
	lw	%i4, 212(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f1, %f1, %f18
	lw	%i4, 227(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 212(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f1, %f1, %f2
	lw	%i4, 227(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 212(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f1, %f1, %f3
	lw	%i4, 227(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f1, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f4, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f4, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72581
	movui	%i31, 260096
	mif	%f4, %i31
	jzero	%i0, %i0, cont.72582
then.72581:
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
cont.72582:
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f4
	lw	%i4, 227(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f4
	lw	%i4, 227(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f4
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
	mov	%i23, %i0
	movui	%i31, 260096
	mif	%f17, %i31
	slli	%i4, %i25, 2
	add	%i31, %i26, %i4
	lw	%i4, 0(%i31)
	lw	%i22, 7(%i4)
	lw	%i21, 4(%i4)
	lw	%i20, 3(%i4)
	lw	%i19, 2(%i4)
	lw	%i18, 1(%i4)
	fmov	%f16, %f0
loop_start.67567:
	movi	%i31, 4
	jleq	%i23, %i31, then.72584
	mov	%i31, %i0
	set_label	%i30, loop_end.67568
	jmp	%i0, 0(%i30)
then.72584:
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	mov	%i9, %i0
	lw	%i4, 151(%i0)
	lw	%i8, 0(%i4)
loop_start.67569:
	slli	%i4, %i9, 2
	add	%i31, %i8, %i4
	lw	%i7, 0(%i31)
	lw	%i4, 0(%i7)
	movi	%i31, -1
	jeq	%i4, %i31, then.72587
	movi	%i31, 99
	jeq	%i4, %i31, then.72589
	lw	%i5, 227(%i0)
	lw	%i6, 202(%i0)
	subi	%i1, %i1, 24
	sw	%i7, 0(%i1)
	sw	%i8, 1(%i1)
	sw	%i9, 2(%i1)
	sf	%f2, 3(%i1)
	sf	%f3, 4(%i1)
	set_label	%i31, solver.2861
	jmp	%i3, 0(%i31)
	lw	%i7, 0(%i1)
	lw	%i8, 1(%i1)
	lw	%i9, 2(%i1)
	lf	%f2, 3(%i1)
	lf	%f3, 4(%i1)
	addi	%i1, %i1, 24
	mov	%i4, %i30
	jeq	%i4, %i0, cont.72591
	lw	%i4, 154(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, cont.72592
	movi	%i15, 1
loop_start.67572:
	slli	%i4, %i15, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72594
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i14, 0(%i31)
	mov	%i13, %i0
loop_start.67576:
	slli	%i4, %i13, 2
	add	%i31, %i14, %i4
	lw	%i12, 0(%i31)
	movi	%i31, -1
	jeq	%i12, %i31, then.72597
	slli	%i5, %i12, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i11, 9(%i4)
	lw	%i10, 6(%i4)
	lw	%i17, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lw	%i16, 202(%i0)
	lf	%f4, 0(%i16)
	lf	%f1, 0(%i17)
	fsub	%f9, %f4, %f1
	lw	%i16, 202(%i0)
	lf	%f4, 1(%i16)
	lf	%f1, 1(%i17)
	fsub	%f8, %f4, %f1
	lw	%i16, 202(%i0)
	lf	%f4, 2(%i16)
	lf	%f1, 2(%i17)
	fsub	%f7, %f4, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72599
	movi	%i31, 2
	jeq	%i4, %i31, then.72601
	lw	%i16, 227(%i0)
	lf	%f4, 0(%i16)
	lw	%i16, 227(%i0)
	lf	%f1, 1(%i16)
	lw	%i16, 227(%i0)
	lf	%f11, 2(%i16)
	fmul	%f6, %f4, %f4
	lf	%f5, 0(%i6)
	fmul	%f10, %f6, %f5
	fmul	%f6, %f1, %f1
	lf	%f5, 1(%i6)
	fmul	%f5, %f6, %f5
	fadd	%f10, %f10, %f5
	fmul	%f6, %f11, %f11
	lf	%f5, 2(%i6)
	fmul	%f5, %f6, %f5
	fadd	%f10, %f10, %f5
	jeq	%i5, %i0, then.72603
	fmul	%f6, %f1, %f11
	lf	%f5, 0(%i11)
	fmul	%f5, %f6, %f5
	fadd	%f10, %f10, %f5
	fmul	%f6, %f11, %f4
	lf	%f5, 1(%i11)
	fmul	%f5, %f6, %f5
	fadd	%f5, %f10, %f5
	fmul	%f4, %f4, %f1
	lf	%f1, 2(%i11)
	fmul	%f1, %f4, %f1
	fadd	%f6, %f5, %f1
	jzero	%i0, %i0, cont.72604
then.72603:
	fmov	%f6, %f10
cont.72604:
	feq	%i16, %f6, %f0
	jeq	%i16, %i0, then.72605
	mov	%i11, %i0
	jzero	%i0, %i0, cont.72600
then.72605:
	lw	%i16, 227(%i0)
	lf	%f5, 0(%i16)
	lw	%i16, 227(%i0)
	lf	%f4, 1(%i16)
	lw	%i16, 227(%i0)
	lf	%f13, 2(%i16)
	fmul	%f10, %f5, %f9
	lf	%f1, 0(%i6)
	fmul	%f11, %f10, %f1
	fmul	%f10, %f4, %f8
	lf	%f1, 1(%i6)
	fmul	%f1, %f10, %f1
	fadd	%f11, %f11, %f1
	fmul	%f10, %f13, %f7
	lf	%f1, 2(%i6)
	fmul	%f1, %f10, %f1
	fadd	%f1, %f11, %f1
	jeq	%i5, %i0, then.72607
	fmul	%f11, %f13, %f8
	fmul	%f10, %f4, %f7
	fadd	%f11, %f11, %f10
	lf	%f10, 0(%i11)
	fmul	%f12, %f11, %f10
	fmul	%f11, %f5, %f7
	fmul	%f10, %f13, %f9
	fadd	%f11, %f11, %f10
	lf	%f10, 1(%i11)
	fmul	%f10, %f11, %f10
	fadd	%f10, %f12, %f10
	fmul	%f5, %f5, %f8
	fmul	%f4, %f4, %f9
	fadd	%f5, %f5, %f4
	lf	%f4, 2(%i11)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f10, %f4
	movui	%i31, 258048
	mif	%f4, %i31
	fmul	%f4, %f5, %f4
	fadd	%f4, %f1, %f4
	jzero	%i0, %i0, cont.72608
then.72607:
	fmov	%f4, %f1
cont.72608:
	fmul	%f5, %f9, %f9
	lf	%f1, 0(%i6)
	fmul	%f10, %f5, %f1
	fmul	%f5, %f8, %f8
	lf	%f1, 1(%i6)
	fmul	%f1, %f5, %f1
	fadd	%f10, %f10, %f1
	fmul	%f5, %f7, %f7
	lf	%f1, 2(%i6)
	fmul	%f1, %f5, %f1
	fadd	%f10, %f10, %f1
	jeq	%i5, %i0, then.72609
	fmul	%f5, %f8, %f7
	lf	%f1, 0(%i11)
	fmul	%f1, %f5, %f1
	fadd	%f10, %f10, %f1
	fmul	%f5, %f7, %f9
	lf	%f1, 1(%i11)
	fmul	%f1, %f5, %f1
	fadd	%f7, %f10, %f1
	fmul	%f5, %f9, %f8
	lf	%f1, 2(%i11)
	fmul	%f1, %f5, %f1
	fadd	%f5, %f7, %f1
	jzero	%i0, %i0, cont.72610
then.72609:
	fmov	%f5, %f10
cont.72610:
	movi	%i31, 3
	jeq	%i4, %i31, then.72611
	fmov	%f1, %f5
	jzero	%i0, %i0, cont.72612
then.72611:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f5, %f1
cont.72612:
	fmul	%f5, %f4, %f4
	fmul	%f1, %f6, %f1
	fsub	%f1, %f5, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72613
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f5, %i31
	finv	%f1, %f1
	fmul	%f5, %f5, %f1
	ceqi	%i4, %i10, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f5
	fsub	%f4, %f1, %f4
	finv	%f1, %f6
	fmul	%f1, %f4, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i11, 1
	jzero	%i0, %i0, cont.72614
then.72613:
	mov	%i11, %i0
cont.72614:
cont.72606:
	jzero	%i0, %i0, cont.72600
then.72601:
	lw	%i4, 227(%i0)
	lf	%f4, 0(%i4)
	lf	%f1, 0(%i6)
	fmul	%f5, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f4, 1(%i4)
	lf	%f1, 1(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f5, %f5, %f1
	lw	%i4, 227(%i0)
	lf	%f4, 2(%i4)
	lf	%f1, 2(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f5, %f5, %f1
	flt	%i4, %f0, %f5
	jeq	%i4, %i0, then.72615
	lf	%f1, 0(%i6)
	fmul	%f4, %f1, %f9
	lf	%f1, 1(%i6)
	fmul	%f1, %f1, %f8
	fadd	%f4, %f4, %f1
	lf	%f1, 2(%i6)
	fmul	%f1, %f1, %f7
	fadd	%f1, %f4, %f1
	fneg	%f4, %f1
	finv	%f1, %f5
	fmul	%f1, %f4, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i11, 1
	jzero	%i0, %i0, cont.72616
then.72615:
	mov	%i11, %i0
cont.72616:
cont.72602:
	jzero	%i0, %i0, cont.72600
then.72599:
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72617
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72618
then.72617:
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	flt	%i5, %f1, %f0
	mov	%i4, %i10
	xor	%i4, %i4, %i5
	lf	%f4, 0(%i6)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f4
	fsub	%f4, %f1, %f9
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	finv	%f1, %f1
	fmul	%f5, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f8
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 1(%i6)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72619
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f7
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 2(%i6)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72621
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72620
then.72621:
	mov	%i4, %i0
cont.72622:
	jzero	%i0, %i0, cont.72620
then.72619:
	mov	%i4, %i0
cont.72620:
cont.72618:
	jeq	%i4, %i0, then.72623
	movi	%i11, 1
	jzero	%i0, %i0, cont.72624
then.72623:
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72625
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72626
then.72625:
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	flt	%i5, %f1, %f0
	mov	%i4, %i10
	xor	%i4, %i4, %i5
	lf	%f4, 1(%i6)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f4
	fsub	%f4, %f1, %f8
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	finv	%f1, %f1
	fmul	%f5, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f7
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 2(%i6)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72627
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f9
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i6)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72629
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72628
then.72629:
	mov	%i4, %i0
cont.72630:
	jzero	%i0, %i0, cont.72628
then.72627:
	mov	%i4, %i0
cont.72628:
cont.72626:
	jeq	%i4, %i0, then.72631
	movi	%i11, 2
	jzero	%i0, %i0, cont.72632
then.72631:
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72633
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72634
then.72633:
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	flt	%i5, %f1, %f0
	mov	%i4, %i10
	xor	%i4, %i4, %i5
	lf	%f4, 2(%i6)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
	fmul	%f1, %f1, %f4
	fsub	%f4, %f1, %f7
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	finv	%f1, %f1
	fmul	%f5, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f9
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i6)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72635
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f4, %f1, %f8
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 1(%i6)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72637
	lw	%i4, 154(%i0)
	sf	%f5, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72636
then.72637:
	mov	%i4, %i0
cont.72638:
	jzero	%i0, %i0, cont.72636
then.72635:
	mov	%i4, %i0
cont.72636:
cont.72634:
	jeq	%i4, %i0, then.72639
	movi	%i11, 3
	jzero	%i0, %i0, cont.72640
then.72639:
	mov	%i11, %i0
cont.72640:
cont.72632:
cont.72624:
cont.72600:
	jeq	%i11, %i0, then.72641
	lw	%i4, 154(%i0)
	lf	%f4, 0(%i4)
	flt	%i4, %f0, %f4
	jeq	%i4, %i0, cont.72643
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, cont.72644
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f9, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f1, %f9
	lw	%i4, 202(%i0)
	lf	%f1, 0(%i4)
	fadd	%f8, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f4, %f1, %f9
	lw	%i4, 202(%i0)
	lf	%f1, 1(%i4)
	fadd	%f7, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f4, %f1, %f9
	lw	%i4, 202(%i0)
	lf	%f1, 2(%i4)
	fadd	%f6, %f4, %f1
	mov	%i10, %i0
loop_start.67630:
	slli	%i4, %i10, 2
	add	%i31, %i14, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72646
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i27, 9(%i4)
	lw	%i6, 6(%i4)
	lw	%i17, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i16, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i17)
	fsub	%f5, %f8, %f1
	lf	%f1, 1(%i17)
	fsub	%f4, %f7, %f1
	lf	%f1, 2(%i17)
	fsub	%f1, %f6, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72648
	movi	%i31, 2
	jeq	%i4, %i31, then.72650
	fmul	%f11, %f5, %f5
	lf	%f10, 0(%i5)
	fmul	%f12, %f11, %f10
	fmul	%f11, %f4, %f4
	lf	%f10, 1(%i5)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	fmul	%f11, %f1, %f1
	lf	%f10, 2(%i5)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	jeq	%i16, %i0, then.72652
	fmul	%f11, %f4, %f1
	lf	%f10, 0(%i27)
	fmul	%f10, %f11, %f10
	fadd	%f11, %f12, %f10
	fmul	%f10, %f1, %f5
	lf	%f1, 1(%i27)
	fmul	%f1, %f10, %f1
	fadd	%f10, %f11, %f1
	fmul	%f4, %f5, %f4
	lf	%f1, 2(%i27)
	fmul	%f1, %f4, %f1
	fadd	%f4, %f10, %f1
	jzero	%i0, %i0, cont.72653
then.72652:
	fmov	%f4, %f12
cont.72653:
	movi	%i31, 3
	jeq	%i4, %i31, then.72654
	fmov	%f1, %f4
	jzero	%i0, %i0, cont.72655
then.72654:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f4, %f1
cont.72655:
	flt	%i5, %f1, %f0
	mov	%i4, %i6
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.72649
then.72650:
	lf	%f10, 0(%i5)
	fmul	%f10, %f10, %f5
	lf	%f5, 1(%i5)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f10, %f4
	lf	%f4, 2(%i5)
	fmul	%f1, %f4, %f1
	fadd	%f1, %f5, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i6
	ceq	%i4, %i4, %i5
cont.72651:
	jzero	%i0, %i0, cont.72649
then.72648:
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f10, %i4
	fmul	%f10, %f10, %f5
	lf	%f5, 0(%i5)
	flt	%i4, %f10, %f5
	jeq	%i4, %i0, then.72656
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f4
	lf	%f4, 1(%i5)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.72658
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f4, %f1
	jzero	%i0, %i0, cont.72657
then.72658:
	mov	%i4, %i0
cont.72659:
	jzero	%i0, %i0, cont.72657
then.72656:
	mov	%i4, %i0
cont.72657:
	jeq	%i4, %i0, then.72660
	mov	%i4, %i6
	jzero	%i0, %i0, cont.72661
then.72660:
	ceqi	%i4, %i6, 0
cont.72661:
cont.72649:
	jeq	%i4, %i0, then.72662
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67631
then.72662:
	addi	%i4, %i10, 1
	mov	%i10, %i4
cont.72663:
	set_label	%i31, loop_start.67630
	jmp	%i0, 0(%i31)
then.72646:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67631
loop_end.67631:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.72664
	lw	%i4, 160(%i0)
	sf	%f9, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i12, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i11, 0(%i4)
cont.72664:
cont.72644:
cont.72643:
	addi	%i4, %i13, 1
	mov	%i13, %i4
	set_label	%i31, loop_start.67576
	jmp	%i0, 0(%i31)
then.72641:
	slli	%i5, %i12, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72665
	addi	%i4, %i13, 1
	mov	%i13, %i4
	jzero	%i0, %i0, cont.72666
then.72665:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67577
cont.72666:
cont.72642:
	set_label	%i31, loop_start.67576
	jmp	%i0, 0(%i31)
then.72597:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67577
loop_end.67577:
	mov	%i0, %i31
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.67572
	jmp	%i0, 0(%i31)
then.72594:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67573
loop_end.67573:
	mov	%i0, %i31
cont.72592:
cont.72591:
	jzero	%i0, %i0, cont.72590
then.72589:
	movi	%i15, 1
loop_start.67651:
	slli	%i4, %i15, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72668
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i14, 0(%i31)
	mov	%i13, %i0
loop_start.67655:
	slli	%i4, %i13, 2
	add	%i31, %i14, %i4
	lw	%i12, 0(%i31)
	movi	%i31, -1
	jeq	%i12, %i31, then.72671
	slli	%i5, %i12, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i11, 9(%i4)
	lw	%i10, 6(%i4)
	lw	%i17, 5(%i4)
	lw	%i6, 4(%i4)
	lw	%i5, 3(%i4)
	lw	%i4, 1(%i4)
	lw	%i16, 202(%i0)
	lf	%f4, 0(%i16)
	lf	%f1, 0(%i17)
	fsub	%f5, %f4, %f1
	lw	%i16, 202(%i0)
	lf	%f4, 1(%i16)
	lf	%f1, 1(%i17)
	fsub	%f4, %f4, %f1
	lw	%i16, 202(%i0)
	lf	%f6, 2(%i16)
	lf	%f1, 2(%i17)
	fsub	%f1, %f6, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72673
	movi	%i31, 2
	jeq	%i4, %i31, then.72675
	lw	%i16, 227(%i0)
	lf	%f7, 0(%i16)
	lw	%i16, 227(%i0)
	lf	%f6, 1(%i16)
	lw	%i16, 227(%i0)
	lf	%f11, 2(%i16)
	fmul	%f9, %f7, %f7
	lf	%f8, 0(%i6)
	fmul	%f10, %f9, %f8
	fmul	%f9, %f6, %f6
	lf	%f8, 1(%i6)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f11, %f11
	lf	%f8, 2(%i6)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	jeq	%i5, %i0, then.72677
	fmul	%f9, %f6, %f11
	lf	%f8, 0(%i11)
	fmul	%f8, %f9, %f8
	fadd	%f10, %f10, %f8
	fmul	%f9, %f11, %f7
	lf	%f8, 1(%i11)
	fmul	%f8, %f9, %f8
	fadd	%f8, %f10, %f8
	fmul	%f7, %f7, %f6
	lf	%f6, 2(%i11)
	fmul	%f6, %f7, %f6
	fadd	%f9, %f8, %f6
	jzero	%i0, %i0, cont.72678
then.72677:
	fmov	%f9, %f10
cont.72678:
	feq	%i16, %f9, %f0
	jeq	%i16, %i0, then.72679
	mov	%i11, %i0
	jzero	%i0, %i0, cont.72674
then.72679:
	lw	%i16, 227(%i0)
	lf	%f8, 0(%i16)
	lw	%i16, 227(%i0)
	lf	%f7, 1(%i16)
	lw	%i16, 227(%i0)
	lf	%f13, 2(%i16)
	fmul	%f10, %f8, %f5
	lf	%f6, 0(%i6)
	fmul	%f11, %f10, %f6
	fmul	%f10, %f7, %f4
	lf	%f6, 1(%i6)
	fmul	%f6, %f10, %f6
	fadd	%f11, %f11, %f6
	fmul	%f10, %f13, %f1
	lf	%f6, 2(%i6)
	fmul	%f6, %f10, %f6
	fadd	%f6, %f11, %f6
	jeq	%i5, %i0, then.72681
	fmul	%f11, %f13, %f4
	fmul	%f10, %f7, %f1
	fadd	%f11, %f11, %f10
	lf	%f10, 0(%i11)
	fmul	%f12, %f11, %f10
	fmul	%f11, %f8, %f1
	fmul	%f10, %f13, %f5
	fadd	%f11, %f11, %f10
	lf	%f10, 1(%i11)
	fmul	%f10, %f11, %f10
	fadd	%f10, %f12, %f10
	fmul	%f8, %f8, %f4
	fmul	%f7, %f7, %f5
	fadd	%f8, %f8, %f7
	lf	%f7, 2(%i11)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f10, %f7
	movui	%i31, 258048
	mif	%f7, %i31
	fmul	%f7, %f8, %f7
	fadd	%f6, %f6, %f7
	jzero	%i0, %i0, cont.72682
then.72681:
cont.72682:
	fmul	%f8, %f5, %f5
	lf	%f7, 0(%i6)
	fmul	%f10, %f8, %f7
	fmul	%f8, %f4, %f4
	lf	%f7, 1(%i6)
	fmul	%f7, %f8, %f7
	fadd	%f10, %f10, %f7
	fmul	%f8, %f1, %f1
	lf	%f7, 2(%i6)
	fmul	%f7, %f8, %f7
	fadd	%f10, %f10, %f7
	jeq	%i5, %i0, then.72683
	fmul	%f8, %f4, %f1
	lf	%f7, 0(%i11)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f10, %f7
	fmul	%f7, %f1, %f5
	lf	%f1, 1(%i11)
	fmul	%f1, %f7, %f1
	fadd	%f7, %f8, %f1
	fmul	%f4, %f5, %f4
	lf	%f1, 2(%i11)
	fmul	%f1, %f4, %f1
	fadd	%f4, %f7, %f1
	jzero	%i0, %i0, cont.72684
then.72683:
	fmov	%f4, %f10
cont.72684:
	movi	%i31, 3
	jeq	%i4, %i31, then.72685
	fmov	%f1, %f4
	jzero	%i0, %i0, cont.72686
then.72685:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f4, %f1
cont.72686:
	fmul	%f4, %f6, %f6
	fmul	%f1, %f9, %f1
	fsub	%f1, %f4, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72687
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
	ceqi	%i4, %i10, 0
	slli	%i4, %i4, 1
	sub	%i4, %i0, %i4
	addi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f1, %f1, %f4
	fsub	%f4, %f1, %f6
	finv	%f1, %f9
	fmul	%f1, %f4, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i11, 1
	jzero	%i0, %i0, cont.72688
then.72687:
	mov	%i11, %i0
cont.72688:
cont.72680:
	jzero	%i0, %i0, cont.72674
then.72675:
	lw	%i4, 227(%i0)
	lf	%f7, 0(%i4)
	lf	%f6, 0(%i6)
	fmul	%f8, %f7, %f6
	lw	%i4, 227(%i0)
	lf	%f7, 1(%i4)
	lf	%f6, 1(%i6)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	lw	%i4, 227(%i0)
	lf	%f7, 2(%i4)
	lf	%f6, 2(%i6)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f8, %f6
	flt	%i4, %f0, %f7
	jeq	%i4, %i0, then.72689
	lf	%f6, 0(%i6)
	fmul	%f6, %f6, %f5
	lf	%f5, 1(%i6)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f6, %f4
	lf	%f4, 2(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f1, %f5, %f1
	fneg	%f4, %f1
	finv	%f1, %f7
	fmul	%f1, %f4, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i11, 1
	jzero	%i0, %i0, cont.72690
then.72689:
	mov	%i11, %i0
cont.72690:
cont.72676:
	jzero	%i0, %i0, cont.72674
then.72673:
	lw	%i4, 227(%i0)
	lf	%f6, 0(%i4)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.72691
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72692
then.72691:
	lw	%i4, 227(%i0)
	lf	%f6, 0(%i4)
	flt	%i5, %f6, %f0
	mov	%i4, %i10
	xor	%i4, %i4, %i5
	lf	%f7, 0(%i6)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f6, %i4
	fmul	%f6, %f6, %f7
	fsub	%f7, %f6, %f5
	lw	%i4, 227(%i0)
	lf	%f6, 0(%i4)
	finv	%f6, %f6
	fmul	%f8, %f7, %f6
	lw	%i4, 227(%i0)
	lf	%f6, 1(%i4)
	fmul	%f6, %f8, %f6
	fadd	%f7, %f6, %f4
	fleq	%i4, %f0, %f7
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f7, %f6, %f7
	lf	%f6, 1(%i6)
	flt	%i4, %f7, %f6
	jeq	%i4, %i0, then.72693
	lw	%i4, 227(%i0)
	lf	%f6, 2(%i4)
	fmul	%f6, %f8, %f6
	fadd	%f7, %f6, %f1
	fleq	%i4, %f0, %f7
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f7, %f6, %f7
	lf	%f6, 2(%i6)
	flt	%i4, %f7, %f6
	jeq	%i4, %i0, then.72695
	lw	%i4, 154(%i0)
	sf	%f8, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72694
then.72695:
	mov	%i4, %i0
cont.72696:
	jzero	%i0, %i0, cont.72694
then.72693:
	mov	%i4, %i0
cont.72694:
cont.72692:
	jeq	%i4, %i0, then.72697
	movi	%i11, 1
	jzero	%i0, %i0, cont.72698
then.72697:
	lw	%i4, 227(%i0)
	lf	%f6, 1(%i4)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.72699
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72700
then.72699:
	lw	%i4, 227(%i0)
	lf	%f6, 1(%i4)
	flt	%i5, %f6, %f0
	mov	%i4, %i10
	xor	%i4, %i4, %i5
	lf	%f7, 1(%i6)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f6, %i4
	fmul	%f6, %f6, %f7
	fsub	%f7, %f6, %f4
	lw	%i4, 227(%i0)
	lf	%f6, 1(%i4)
	finv	%f6, %f6
	fmul	%f8, %f7, %f6
	lw	%i4, 227(%i0)
	lf	%f6, 2(%i4)
	fmul	%f6, %f8, %f6
	fadd	%f7, %f6, %f1
	fleq	%i4, %f0, %f7
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f7, %f6, %f7
	lf	%f6, 2(%i6)
	flt	%i4, %f7, %f6
	jeq	%i4, %i0, then.72701
	lw	%i4, 227(%i0)
	lf	%f6, 0(%i4)
	fmul	%f6, %f8, %f6
	fadd	%f7, %f6, %f5
	fleq	%i4, %f0, %f7
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f7, %f6, %f7
	lf	%f6, 0(%i6)
	flt	%i4, %f7, %f6
	jeq	%i4, %i0, then.72703
	lw	%i4, 154(%i0)
	sf	%f8, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72702
then.72703:
	mov	%i4, %i0
cont.72704:
	jzero	%i0, %i0, cont.72702
then.72701:
	mov	%i4, %i0
cont.72702:
cont.72700:
	jeq	%i4, %i0, then.72705
	movi	%i11, 2
	jzero	%i0, %i0, cont.72706
then.72705:
	lw	%i4, 227(%i0)
	lf	%f6, 2(%i4)
	feq	%i4, %f6, %f0
	jeq	%i4, %i0, then.72707
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72708
then.72707:
	lw	%i4, 227(%i0)
	lf	%f6, 2(%i4)
	flt	%i5, %f6, %f0
	mov	%i4, %i10
	xor	%i4, %i4, %i5
	lf	%f7, 2(%i6)
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f6, %i4
	fmul	%f6, %f6, %f7
	fsub	%f6, %f6, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	finv	%f1, %f1
	fmul	%f6, %f6, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f5, %f1, %f5
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f5, %f1, %f5
	lf	%f1, 0(%i6)
	flt	%i4, %f5, %f1
	jeq	%i4, %i0, then.72709
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f4, %f1, %f4
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 1(%i6)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72711
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72710
then.72711:
	mov	%i4, %i0
cont.72712:
	jzero	%i0, %i0, cont.72710
then.72709:
	mov	%i4, %i0
cont.72710:
cont.72708:
	jeq	%i4, %i0, then.72713
	movi	%i11, 3
	jzero	%i0, %i0, cont.72714
then.72713:
	mov	%i11, %i0
cont.72714:
cont.72706:
cont.72698:
cont.72674:
	jeq	%i11, %i0, then.72715
	lw	%i4, 154(%i0)
	lf	%f4, 0(%i4)
	flt	%i4, %f0, %f4
	jeq	%i4, %i0, cont.72717
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, cont.72718
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f9, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f1, %f9
	lw	%i4, 202(%i0)
	lf	%f1, 0(%i4)
	fadd	%f8, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 1(%i4)
	fmul	%f4, %f1, %f9
	lw	%i4, 202(%i0)
	lf	%f1, 1(%i4)
	fadd	%f7, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f1, 2(%i4)
	fmul	%f4, %f1, %f9
	lw	%i4, 202(%i0)
	lf	%f1, 2(%i4)
	fadd	%f6, %f4, %f1
	mov	%i10, %i0
loop_start.67709:
	slli	%i4, %i10, 2
	add	%i31, %i14, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72720
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i27, 9(%i4)
	lw	%i6, 6(%i4)
	lw	%i17, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i16, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i17)
	fsub	%f5, %f8, %f1
	lf	%f1, 1(%i17)
	fsub	%f4, %f7, %f1
	lf	%f1, 2(%i17)
	fsub	%f1, %f6, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72722
	movi	%i31, 2
	jeq	%i4, %i31, then.72724
	fmul	%f11, %f5, %f5
	lf	%f10, 0(%i5)
	fmul	%f12, %f11, %f10
	fmul	%f11, %f4, %f4
	lf	%f10, 1(%i5)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	fmul	%f11, %f1, %f1
	lf	%f10, 2(%i5)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	jeq	%i16, %i0, then.72726
	fmul	%f11, %f4, %f1
	lf	%f10, 0(%i27)
	fmul	%f10, %f11, %f10
	fadd	%f11, %f12, %f10
	fmul	%f10, %f1, %f5
	lf	%f1, 1(%i27)
	fmul	%f1, %f10, %f1
	fadd	%f10, %f11, %f1
	fmul	%f4, %f5, %f4
	lf	%f1, 2(%i27)
	fmul	%f1, %f4, %f1
	fadd	%f4, %f10, %f1
	jzero	%i0, %i0, cont.72727
then.72726:
	fmov	%f4, %f12
cont.72727:
	movi	%i31, 3
	jeq	%i4, %i31, then.72728
	fmov	%f1, %f4
	jzero	%i0, %i0, cont.72729
then.72728:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f4, %f1
cont.72729:
	flt	%i5, %f1, %f0
	mov	%i4, %i6
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.72723
then.72724:
	lf	%f10, 0(%i5)
	fmul	%f10, %f10, %f5
	lf	%f5, 1(%i5)
	fmul	%f4, %f5, %f4
	fadd	%f5, %f10, %f4
	lf	%f4, 2(%i5)
	fmul	%f1, %f4, %f1
	fadd	%f1, %f5, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i6
	ceq	%i4, %i4, %i5
cont.72725:
	jzero	%i0, %i0, cont.72723
then.72722:
	fleq	%i4, %f0, %f5
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f10, %i4
	fmul	%f10, %f10, %f5
	lf	%f5, 0(%i5)
	flt	%i4, %f10, %f5
	jeq	%i4, %i0, then.72730
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f5, %i4
	fmul	%f5, %f5, %f4
	lf	%f4, 1(%i5)
	flt	%i4, %f5, %f4
	jeq	%i4, %i0, then.72732
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f4, %i4
	fmul	%f4, %f4, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f4, %f1
	jzero	%i0, %i0, cont.72731
then.72732:
	mov	%i4, %i0
cont.72733:
	jzero	%i0, %i0, cont.72731
then.72730:
	mov	%i4, %i0
cont.72731:
	jeq	%i4, %i0, then.72734
	mov	%i4, %i6
	jzero	%i0, %i0, cont.72735
then.72734:
	ceqi	%i4, %i6, 0
cont.72735:
cont.72723:
	jeq	%i4, %i0, then.72736
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67710
then.72736:
	addi	%i4, %i10, 1
	mov	%i10, %i4
cont.72737:
	set_label	%i31, loop_start.67709
	jmp	%i0, 0(%i31)
then.72720:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67710
loop_end.67710:
	mov	%i4, %i31
	jeq	%i4, %i0, cont.72738
	lw	%i4, 160(%i0)
	sf	%f9, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f8, 0(%i4)
	lw	%i4, 163(%i0)
	sf	%f7, 1(%i4)
	lw	%i4, 163(%i0)
	sf	%f6, 2(%i4)
	lw	%i4, 168(%i0)
	sw	%i12, 0(%i4)
	lw	%i4, 157(%i0)
	sw	%i11, 0(%i4)
cont.72738:
cont.72718:
cont.72717:
	addi	%i4, %i13, 1
	mov	%i13, %i4
	set_label	%i31, loop_start.67655
	jmp	%i0, 0(%i31)
then.72715:
	slli	%i5, %i12, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72739
	addi	%i4, %i13, 1
	mov	%i13, %i4
	jzero	%i0, %i0, cont.72740
then.72739:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67656
cont.72740:
cont.72716:
	set_label	%i31, loop_start.67655
	jmp	%i0, 0(%i31)
then.72671:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67656
loop_end.67656:
	mov	%i0, %i31
	addi	%i4, %i15, 1
	mov	%i15, %i4
	set_label	%i31, loop_start.67651
	jmp	%i0, 0(%i31)
then.72668:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67652
loop_end.67652:
	mov	%i0, %i31
cont.72590:
	addi	%i4, %i9, 1
	mov	%i9, %i4
	set_label	%i31, loop_start.67569
	jmp	%i0, 0(%i31)
then.72587:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67570
loop_end.67570:
	mov	%i0, %i31
	lw	%i4, 160(%i0)
	lf	%f4, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f4
	jeq	%i4, %i0, then.72741
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f4, %f1
	jzero	%i0, %i0, cont.72742
then.72741:
	mov	%i4, %i0
cont.72742:
	ceq	%i30, %i4, %i0
	jzero	%i0, %i30, Lrelax_skip_5
	set_label	%i30, then.72743
	jmp	%i0, 0(%i30)
Lrelax_skip_5:
	lw	%i4, 168(%i0)
	lw	%i27, 0(%i4)
	slli	%i5, %i27, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i14, 10(%i4)
	lw	%i13, 9(%i4)
	lw	%i12, 8(%i4)
	lw	%i17, 7(%i4)
	lw	%i11, 6(%i4)
	lw	%i10, 5(%i4)
	lw	%i9, 4(%i4)
	lw	%i8, 3(%i4)
	lw	%i16, 2(%i4)
	lw	%i7, 1(%i4)
	lw	%i6, 0(%i4)
	lf	%f1, 0(%i17)
	fmul	%f19, %f1, %f17
	movi	%i31, 1
	jeq	%i7, %i31, then.72745
	movi	%i31, 2
	jeq	%i7, %i31, then.72747
	lw	%i4, 163(%i0)
	lf	%f4, 0(%i4)
	lf	%f1, 0(%i10)
	fsub	%f5, %f4, %f1
	lw	%i4, 163(%i0)
	lf	%f4, 1(%i4)
	lf	%f1, 1(%i10)
	fsub	%f4, %f4, %f1
	lw	%i4, 163(%i0)
	lf	%f6, 2(%i4)
	lf	%f1, 2(%i10)
	fsub	%f10, %f6, %f1
	lf	%f1, 0(%i9)
	fmul	%f9, %f5, %f1
	lf	%f1, 1(%i9)
	fmul	%f8, %f4, %f1
	lf	%f1, 2(%i9)
	fmul	%f1, %f10, %f1
	jeq	%i8, %i0, then.72749
	lf	%f6, 2(%i13)
	fmul	%f7, %f4, %f6
	lf	%f6, 1(%i13)
	fmul	%f6, %f10, %f6
	fadd	%f7, %f7, %f6
	movui	%i31, 258048
	mif	%f6, %i31
	fmul	%f6, %f7, %f6
	fadd	%f6, %f9, %f6
	lw	%i4, 171(%i0)
	sf	%f6, 0(%i4)
	lf	%f6, 2(%i13)
	fmul	%f7, %f5, %f6
	lf	%f6, 0(%i13)
	fmul	%f6, %f10, %f6
	fadd	%f7, %f7, %f6
	movui	%i31, 258048
	mif	%f6, %i31
	fmul	%f6, %f7, %f6
	fadd	%f6, %f8, %f6
	lw	%i4, 171(%i0)
	sf	%f6, 1(%i4)
	lf	%f6, 1(%i13)
	fmul	%f6, %f5, %f6
	lf	%f5, 0(%i13)
	fmul	%f4, %f4, %f5
	fadd	%f5, %f6, %f4
	movui	%i31, 258048
	mif	%f4, %i31
	fmul	%f4, %f5, %f4
	fadd	%f1, %f1, %f4
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.72750
then.72749:
	lw	%i4, 171(%i0)
	sf	%f9, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f8, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
cont.72750:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f1, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f4, %f4, %f1
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f1
	fadd	%f1, %f4, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72751
	movui	%i31, 260096
	mif	%f4, %i31
	jzero	%i0, %i0, cont.72752
then.72751:
	jeq	%i11, %i0, then.72753
	movui	%i31, 784384
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
	jzero	%i0, %i0, cont.72754
then.72753:
	movui	%i31, 260096
	mif	%f4, %i31
	finv	%f1, %f1
	fmul	%f4, %f4, %f1
cont.72754:
cont.72752:
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f4
	lw	%i4, 171(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f4
	lw	%i4, 171(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f4
	lw	%i4, 171(%i0)
	sf	%f1, 2(%i4)
	jzero	%i0, %i0, cont.72746
then.72747:
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
cont.72748:
	jzero	%i0, %i0, cont.72746
then.72745:
	lw	%i4, 157(%i0)
	lw	%i5, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 171(%i0)
	sf	%f0, 2(%i4)
	subi	%i5, %i5, 1
	slli	%i15, %i5, 2
	lw	%i4, 227(%i0)
	add	%i31, %i4, %i15
	lf	%f1, 0(%i31)
	feq	%i4, %f1, %f0
	jeq	%i4, %i0, then.72755
	fmov	%f1, %f0
	jzero	%i0, %i0, cont.72756
then.72755:
	flt	%i4, %f0, %f1
	slli	%i4, %i4, 1
	addi	%i4, %i4, -1
	itof	%f1, %i4
cont.72756:
	fneg	%f1, %f1
	slli	%i5, %i5, 2
	lw	%i4, 171(%i0)
	add	%i31, %i4, %i5
	sf	%f1, 0(%i31)
cont.72746:
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	lw	%i4, 202(%i0)
	sf	%f1, 2(%i4)
	lw	%i15, 163(%i0)
	mov	%i4, %i6
	mov	%i5, %i7
	mov	%i6, %i16
	mov	%i7, %i8
	mov	%i8, %i9
	mov	%i9, %i10
	mov	%i10, %i11
	mov	%i11, %i17
	subi	%i1, %i1, 8
	sf	%f2, 0(%i1)
	sf	%f3, 1(%i1)
	set_label	%i31, utexture.2996
	jmp	%i3, 0(%i31)
	lf	%f2, 0(%i1)
	lf	%f3, 1(%i1)
	addi	%i1, %i1, 8
	slli	%i5, %i27, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i5, %i5, %i4
	slli	%i4, %i23, 2
	add	%i31, %i19, %i4
	sw	%i5, 0(%i31)
	slli	%i4, %i23, 2
	add	%i31, %i18, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
	lf	%f4, 0(%i17)
	movui	%i31, 258048
	mif	%f1, %i31
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72757
	slli	%i4, %i23, 2
	add	%i31, %i20, %i4
	sw	%i0, 0(%i31)
	jzero	%i0, %i0, cont.72758
then.72757:
	movi	%i5, 1
	slli	%i4, %i23, 2
	add	%i31, %i20, %i4
	sw	%i5, 0(%i31)
	slli	%i4, %i23, 2
	add	%i31, %i21, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 176(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 176(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 176(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
	slli	%i4, %i23, 2
	add	%i31, %i21, %i4
	lw	%i4, 0(%i31)
	movui	%i31, 243712
	mif	%f1, %i31
	fmul	%f4, %f1, %f19
	lf	%f1, 0(%i4)
	fmul	%f1, %f1, %f4
	sf	%f1, 0(%i4)
	lf	%f1, 1(%i4)
	fmul	%f1, %f1, %f4
	sf	%f1, 1(%i4)
	lf	%f1, 2(%i4)
	fmul	%f1, %f1, %f4
	sf	%f1, 2(%i4)
	slli	%i4, %i23, 2
	add	%i31, %i22, %i4
	lw	%i5, 0(%i31)
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	sf	%f1, 0(%i5)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	sf	%f1, 1(%i5)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	sf	%f1, 2(%i5)
cont.72758:
	movui	%i31, 786432
	mif	%f6, %i31
	lw	%i4, 227(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f5, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f5, %f5, %f1
	lw	%i4, 227(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f1, %f5, %f1
	fmul	%f5, %f6, %f1
	lw	%i4, 227(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f1, %f4, %f1
	lw	%i4, 227(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 227(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f1, %f4, %f1
	lw	%i4, 227(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 227(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 171(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f5, %f1
	fadd	%f1, %f4, %f1
	lw	%i4, 227(%i0)
	sf	%f1, 2(%i4)
	lf	%f1, 1(%i17)
	fmul	%f5, %f17, %f1
	mov	%i12, %i0
	lw	%i4, 151(%i0)
	lw	%i11, 0(%i4)
loop_start.67749:
	slli	%i4, %i12, 2
	add	%i31, %i11, %i4
	lw	%i10, 0(%i31)
	lw	%i5, 0(%i10)
	movi	%i31, -1
	jeq	%i5, %i31, then.72760
	movi	%i31, 99
	jeq	%i5, %i31, then.72762
	slli	%i6, %i5, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i6
	lw	%i4, 0(%i31)
	lw	%i9, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i14, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i4, 1(%i4)
	lw	%i13, 163(%i0)
	lf	%f4, 0(%i13)
	lf	%f1, 0(%i14)
	fsub	%f8, %f4, %f1
	lw	%i13, 163(%i0)
	lf	%f4, 1(%i13)
	lf	%f1, 1(%i14)
	fsub	%f7, %f4, %f1
	lw	%i13, 163(%i0)
	lf	%f4, 2(%i13)
	lf	%f1, 2(%i14)
	fsub	%f6, %f4, %f1
	slli	%i13, %i5, 2
	lw	%i5, 248(%i0)
	add	%i31, %i5, %i13
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i4, %i31, then.72764
	movi	%i31, 2
	jeq	%i4, %i31, then.72766
	lf	%f1, 0(%i5)
	feq	%i13, %f1, %f0
	jeq	%i13, %i0, then.72768
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72765
then.72768:
	lf	%f4, 1(%i5)
	fmul	%f9, %f4, %f8
	lf	%f4, 2(%i5)
	fmul	%f4, %f4, %f7
	fadd	%f9, %f9, %f4
	lf	%f4, 3(%i5)
	fmul	%f4, %f4, %f6
	fadd	%f4, %f9, %f4
	fmul	%f10, %f8, %f8
	lf	%f9, 0(%i7)
	fmul	%f11, %f10, %f9
	fmul	%f10, %f7, %f7
	lf	%f9, 1(%i7)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	fmul	%f10, %f6, %f6
	lf	%f9, 2(%i7)
	fmul	%f9, %f10, %f9
	fadd	%f11, %f11, %f9
	jeq	%i6, %i0, then.72770
	fmul	%f10, %f7, %f6
	lf	%f9, 0(%i9)
	fmul	%f9, %f10, %f9
	fadd	%f10, %f11, %f9
	fmul	%f9, %f6, %f8
	lf	%f6, 1(%i9)
	fmul	%f6, %f9, %f6
	fadd	%f9, %f10, %f6
	fmul	%f7, %f8, %f7
	lf	%f6, 2(%i9)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f9, %f6
	jzero	%i0, %i0, cont.72771
then.72770:
	fmov	%f7, %f11
cont.72771:
	movi	%i31, 3
	jeq	%i4, %i31, then.72772
	jzero	%i0, %i0, cont.72773
then.72772:
	movui	%i31, 260096
	mif	%f6, %i31
	fsub	%f7, %f7, %f6
cont.72773:
	fmul	%f6, %f4, %f4
	fmul	%f1, %f1, %f7
	fsub	%f1, %f6, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72774
	jeq	%i8, %i0, then.72776
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f6, %i31
	finv	%f1, %f1
	fmul	%f1, %f6, %f1
	fadd	%f4, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f4, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72777
then.72776:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f6, %i31
	finv	%f1, %f1
	fmul	%f1, %f6, %f1
	fsub	%f4, %f4, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f4, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72777:
	movi	%i4, 1
	jzero	%i0, %i0, cont.72775
then.72774:
	mov	%i4, %i0
cont.72775:
cont.72769:
	jzero	%i0, %i0, cont.72765
then.72766:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72778
	lf	%f1, 1(%i5)
	fmul	%f4, %f1, %f8
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f7
	fadd	%f4, %f4, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f6
	fadd	%f1, %f4, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72779
then.72778:
	mov	%i4, %i0
cont.72779:
cont.72767:
	jzero	%i0, %i0, cont.72765
then.72764:
	lf	%f1, 0(%i5)
	fsub	%f4, %f1, %f8
	lf	%f1, 1(%i5)
	fmul	%f9, %f4, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f9, %f1
	fadd	%f4, %f1, %f7
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 1(%i7)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72780
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f9, %f1
	fadd	%f4, %f1, %f6
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 2(%i7)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72782
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72781
then.72782:
	mov	%i4, %i0
cont.72783:
	jzero	%i0, %i0, cont.72781
then.72780:
	mov	%i4, %i0
cont.72781:
	jeq	%i4, %i0, then.72784
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72785
then.72784:
	lf	%f1, 2(%i5)
	fsub	%f4, %f1, %f7
	lf	%f1, 3(%i5)
	fmul	%f9, %f4, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f9, %f1
	fadd	%f4, %f1, %f8
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i7)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72786
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f9, %f1
	fadd	%f4, %f1, %f6
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 2(%i7)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72788
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72787
then.72788:
	mov	%i4, %i0
cont.72789:
	jzero	%i0, %i0, cont.72787
then.72786:
	mov	%i4, %i0
cont.72787:
	jeq	%i4, %i0, then.72790
	lw	%i4, 154(%i0)
	sf	%f9, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.72791
then.72790:
	lf	%f1, 4(%i5)
	fsub	%f4, %f1, %f6
	lf	%f1, 5(%i5)
	fmul	%f6, %f4, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f4, %f1, %f8
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 0(%i7)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72792
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f6, %f1
	fadd	%f4, %f1, %f7
	fleq	%i4, %f0, %f4
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f4, %f1, %f4
	lf	%f1, 1(%i7)
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72794
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72793
then.72794:
	mov	%i4, %i0
cont.72795:
	jzero	%i0, %i0, cont.72793
then.72792:
	mov	%i4, %i0
cont.72793:
	jeq	%i4, %i0, then.72796
	lw	%i4, 154(%i0)
	sf	%f6, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.72797
then.72796:
	mov	%i4, %i0
cont.72797:
cont.72791:
cont.72785:
cont.72765:
	jeq	%i4, %i0, then.72798
	lw	%i4, 154(%i0)
	lf	%f4, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f4, %f1
	jeq	%i4, %i0, then.72800
	movi	%i6, 1
loop_start.67780:
	slli	%i4, %i6, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72803
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i10, 1(%i1)
	sw	%i11, 2(%i1)
	sw	%i12, 3(%i1)
	sf	%f2, 4(%i1)
	sf	%f3, 5(%i1)
	sf	%f5, 6(%i1)
	set_label	%i31, shadow_check_and_group.2950
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i10, 1(%i1)
	lw	%i11, 2(%i1)
	lw	%i12, 3(%i1)
	lf	%f2, 4(%i1)
	lf	%f3, 5(%i1)
	lf	%f5, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	jeq	%i4, %i0, then.72805
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67781
then.72805:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72806:
	set_label	%i31, loop_start.67780
	jmp	%i0, 0(%i31)
then.72803:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67781
loop_end.67781:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.72763
then.72800:
	mov	%i4, %i0
cont.72801:
	jzero	%i0, %i0, cont.72763
then.72798:
	mov	%i4, %i0
cont.72799:
	jzero	%i0, %i0, cont.72763
then.72762:
	movi	%i4, 1
cont.72763:
	jeq	%i4, %i0, then.72807
	movi	%i6, 1
loop_start.67785:
	slli	%i4, %i6, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72810
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i5, 0(%i31)
	mov	%i4, %i0
	subi	%i1, %i1, 32
	sw	%i6, 0(%i1)
	sw	%i10, 1(%i1)
	sw	%i11, 2(%i1)
	sw	%i12, 3(%i1)
	sf	%f2, 4(%i1)
	sf	%f3, 5(%i1)
	sf	%f5, 6(%i1)
	set_label	%i31, shadow_check_and_group.2950
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i10, 1(%i1)
	lw	%i11, 2(%i1)
	lw	%i12, 3(%i1)
	lf	%f2, 4(%i1)
	lf	%f3, 5(%i1)
	lf	%f5, 6(%i1)
	addi	%i1, %i1, 32
	mov	%i4, %i30
	jeq	%i4, %i0, then.72812
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67786
then.72812:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72813:
	set_label	%i31, loop_start.67785
	jmp	%i0, 0(%i31)
then.72810:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67786
loop_end.67786:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72814
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67750
then.72814:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.72815:
	set_label	%i31, loop_start.67749
	jmp	%i0, 0(%i31)
then.72807:
	addi	%i4, %i12, 1
	mov	%i12, %i4
cont.72808:
	set_label	%i31, loop_start.67749
	jmp	%i0, 0(%i31)
then.72760:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67750
loop_end.67750:
	mov	%i4, %i31
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.72816
	lw	%i4, 171(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f6, %f4, %f1
	lw	%i4, 171(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f6, %f6, %f1
	lw	%i4, 171(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f1, %f6, %f1
	fneg	%f1, %f1
	fmul	%f1, %f1, %f19
	lw	%i4, 227(%i0)
	lf	%f6, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f4, 0(%i4)
	fmul	%f7, %f6, %f4
	lw	%i4, 227(%i0)
	lf	%f6, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f4, 1(%i4)
	fmul	%f4, %f6, %f4
	fadd	%f7, %f7, %f4
	lw	%i4, 227(%i0)
	lf	%f6, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f4, 2(%i4)
	fmul	%f4, %f6, %f4
	fadd	%f4, %f7, %f4
	fneg	%f7, %f4
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, cont.72817
	lw	%i4, 186(%i0)
	lf	%f6, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f4, 0(%i4)
	fmul	%f4, %f1, %f4
	fadd	%f4, %f6, %f4
	lw	%i4, 186(%i0)
	sf	%f4, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f6, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f4, 1(%i4)
	fmul	%f4, %f1, %f4
	fadd	%f4, %f6, %f4
	lw	%i4, 186(%i0)
	sf	%f4, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f6, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f4, 2(%i4)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f6, %f1
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.72817:
	flt	%i4, %f0, %f7
	jeq	%i4, %i0, cont.72818
	fmul	%f1, %f7, %f7
	fmul	%f1, %f1, %f1
	fmul	%f4, %f1, %f5
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	fadd	%f1, %f1, %f4
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	fadd	%f1, %f1, %f4
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	fadd	%f1, %f1, %f4
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.72818:
cont.72816:
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	lw	%i4, 207(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	lw	%i4, 207(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	lw	%i4, 207(%i0)
	sf	%f1, 2(%i4)
	lw	%i4, 6(%i0)
	lw	%i4, 0(%i4)
	subi	%i11, %i4, 1
loop_start.67792:
	jleq	%i0, %i11, then.72820
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67793
then.72820:
	slli	%i5, %i11, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i10, 10(%i4)
	lw	%i9, 9(%i4)
	lw	%i8, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i5, 1(%i4)
	lw	%i4, 163(%i0)
	lf	%f4, 0(%i4)
	lf	%f1, 0(%i8)
	fsub	%f1, %f4, %f1
	sf	%f1, 0(%i10)
	lw	%i4, 163(%i0)
	lf	%f4, 1(%i4)
	lf	%f1, 1(%i8)
	fsub	%f1, %f4, %f1
	sf	%f1, 1(%i10)
	lw	%i4, 163(%i0)
	lf	%f4, 2(%i4)
	lf	%f1, 2(%i8)
	fsub	%f1, %f4, %f1
	sf	%f1, 2(%i10)
	movi	%i31, 2
	jeq	%i5, %i31, then.72822
	movi	%i31, 2
	jleq	%i5, %i31, cont.72824
	lf	%f9, 0(%i10)
	lf	%f8, 1(%i10)
	lf	%f7, 2(%i10)
	fmul	%f4, %f9, %f9
	lf	%f1, 0(%i7)
	fmul	%f6, %f4, %f1
	fmul	%f4, %f8, %f8
	lf	%f1, 1(%i7)
	fmul	%f1, %f4, %f1
	fadd	%f6, %f6, %f1
	fmul	%f4, %f7, %f7
	lf	%f1, 2(%i7)
	fmul	%f1, %f4, %f1
	fadd	%f6, %f6, %f1
	jeq	%i6, %i0, then.72825
	fmul	%f4, %f8, %f7
	lf	%f1, 0(%i9)
	fmul	%f1, %f4, %f1
	fadd	%f6, %f6, %f1
	fmul	%f4, %f7, %f9
	lf	%f1, 1(%i9)
	fmul	%f1, %f4, %f1
	fadd	%f6, %f6, %f1
	fmul	%f4, %f9, %f8
	lf	%f1, 2(%i9)
	fmul	%f1, %f4, %f1
	fadd	%f4, %f6, %f1
	jzero	%i0, %i0, cont.72826
then.72825:
	fmov	%f4, %f6
cont.72826:
	movi	%i31, 3
	jeq	%i5, %i31, then.72827
	fmov	%f1, %f4
	jzero	%i0, %i0, cont.72828
then.72827:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f4, %f1
cont.72828:
	sf	%f1, 3(%i10)
cont.72824:
	jzero	%i0, %i0, cont.72823
then.72822:
	lf	%f4, 0(%i10)
	lf	%f7, 1(%i10)
	lf	%f6, 2(%i10)
	lf	%f1, 0(%i7)
	fmul	%f4, %f1, %f4
	lf	%f1, 1(%i7)
	fmul	%f1, %f1, %f7
	fadd	%f4, %f4, %f1
	lf	%f1, 2(%i7)
	fmul	%f1, %f1, %f6
	fadd	%f1, %f4, %f1
	sf	%f1, 3(%i10)
cont.72823:
	subi	%i4, %i11, 1
	mov	%i11, %i4
cont.72821:
	set_label	%i30, loop_start.67792
	jmp	%i0, 0(%i30)
loop_end.67793:
	mov	%i0, %i31
	lw	%i4, 496(%i0)
	lw	%i4, 0(%i4)
	subi	%i12, %i4, 1
loop_start.67796:
	jleq	%i0, %i12, then.72830
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67797
then.72830:
	slli	%i5, %i12, 2
	lw	%i4, 314(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lf	%f4, 4(%i4)
	lw	%i7, 2(%i4)
	lw	%i11, 1(%i4)
	lw	%i8, 0(%i4)
	movui	%i31, 321254
	ori	%i31, %i31, -1240
	mif	%f1, %i31
	lw	%i4, 160(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 151(%i0)
	lw	%i5, 0(%i4)
	mov	%i4, %i0
	mov	%i6, %i11
	subi	%i1, %i1, 48
	sw	%i8, 0(%i1)
	sw	%i11, 1(%i1)
	sw	%i12, 2(%i1)
	sw	%i16, 3(%i1)
	sw	%i17, 4(%i1)
	sw	%i18, 5(%i1)
	sw	%i19, 6(%i1)
	sw	%i20, 7(%i1)
	sf	%f2, 8(%i1)
	sf	%f3, 9(%i1)
	sf	%f4, 10(%i1)
	sf	%f5, 11(%i1)
	set_label	%i31, trace_or_matrix_fast.2981
	jmp	%i3, 0(%i31)
	lw	%i8, 0(%i1)
	lw	%i11, 1(%i1)
	lw	%i12, 2(%i1)
	lw	%i16, 3(%i1)
	lw	%i17, 4(%i1)
	lw	%i18, 5(%i1)
	lw	%i19, 6(%i1)
	lw	%i20, 7(%i1)
	lf	%f2, 8(%i1)
	lf	%f3, 9(%i1)
	lf	%f4, 10(%i1)
	lf	%f5, 11(%i1)
	addi	%i1, %i1, 48
	lw	%i4, 160(%i0)
	lf	%f6, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f6
	jeq	%i4, %i0, then.72832
	movui	%i31, 314347
	ori	%i31, %i31, -992
	mif	%f1, %i31
	flt	%i4, %f6, %f1
	jzero	%i0, %i0, cont.72833
then.72832:
	mov	%i4, %i0
cont.72833:
	jeq	%i4, %i0, cont.72834
	lw	%i4, 168(%i0)
	lw	%i4, 0(%i4)
	slli	%i5, %i4, 2
	lw	%i4, 157(%i0)
	lw	%i4, 0(%i4)
	add	%i4, %i5, %i4
	ceq	%i31, %i4, %i8
	jzero	%i0, %i31, cont.72835
	mov	%i10, %i0
	lw	%i4, 151(%i0)
	lw	%i9, 0(%i4)
loop_start.67799:
	slli	%i4, %i10, 2
	add	%i31, %i9, %i4
	lw	%i30, 0(%i31)
	sw	%i30, 0(%i1)
	lw	%i31, 0(%i1)
	lw	%i5, 0(%i31)
	movi	%i31, -1
	jeq	%i5, %i31, then.72837
	movi	%i31, 99
	jeq	%i5, %i31, then.72839
	slli	%i6, %i5, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i6
	lw	%i4, 0(%i31)
	lw	%i13, 9(%i4)
	lw	%i8, 6(%i4)
	lw	%i15, 5(%i4)
	lw	%i7, 4(%i4)
	lw	%i6, 3(%i4)
	lw	%i4, 1(%i4)
	lw	%i14, 163(%i0)
	lf	%f6, 0(%i14)
	lf	%f1, 0(%i15)
	fsub	%f9, %f6, %f1
	lw	%i14, 163(%i0)
	lf	%f6, 1(%i14)
	lf	%f1, 1(%i15)
	fsub	%f8, %f6, %f1
	lw	%i14, 163(%i0)
	lf	%f6, 2(%i14)
	lf	%f1, 2(%i15)
	fsub	%f7, %f6, %f1
	slli	%i14, %i5, 2
	lw	%i5, 248(%i0)
	add	%i31, %i5, %i14
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i4, %i31, then.72841
	movi	%i31, 2
	jeq	%i4, %i31, then.72843
	lf	%f1, 0(%i5)
	feq	%i14, %f1, %f0
	jeq	%i14, %i0, then.72845
	mov	%i4, %i0
	jzero	%i0, %i0, cont.72842
then.72845:
	lf	%f6, 1(%i5)
	fmul	%f10, %f6, %f9
	lf	%f6, 2(%i5)
	fmul	%f6, %f6, %f8
	fadd	%f10, %f10, %f6
	lf	%f6, 3(%i5)
	fmul	%f6, %f6, %f7
	fadd	%f6, %f10, %f6
	fmul	%f11, %f9, %f9
	lf	%f10, 0(%i7)
	fmul	%f12, %f11, %f10
	fmul	%f11, %f8, %f8
	lf	%f10, 1(%i7)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	fmul	%f11, %f7, %f7
	lf	%f10, 2(%i7)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	jeq	%i6, %i0, then.72847
	fmul	%f11, %f8, %f7
	lf	%f10, 0(%i13)
	fmul	%f10, %f11, %f10
	fadd	%f11, %f12, %f10
	fmul	%f10, %f7, %f9
	lf	%f7, 1(%i13)
	fmul	%f7, %f10, %f7
	fadd	%f10, %f11, %f7
	fmul	%f8, %f9, %f8
	lf	%f7, 2(%i13)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f10, %f7
	jzero	%i0, %i0, cont.72848
then.72847:
	fmov	%f8, %f12
cont.72848:
	movi	%i31, 3
	jeq	%i4, %i31, then.72849
	jzero	%i0, %i0, cont.72850
then.72849:
	movui	%i31, 260096
	mif	%f7, %i31
	fsub	%f8, %f8, %f7
cont.72850:
	fmul	%f7, %f6, %f6
	fmul	%f1, %f1, %f8
	fsub	%f1, %f7, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72851
	jeq	%i8, %i0, then.72853
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f7, %i31
	finv	%f1, %f1
	fmul	%f1, %f7, %f1
	fadd	%f6, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f6, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72854
then.72853:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f7, %i31
	finv	%f1, %f1
	fmul	%f1, %f7, %f1
	fsub	%f6, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f6, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72854:
	movi	%i4, 1
	jzero	%i0, %i0, cont.72852
then.72851:
	mov	%i4, %i0
cont.72852:
cont.72846:
	jzero	%i0, %i0, cont.72842
then.72843:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72855
	lf	%f1, 1(%i5)
	fmul	%f6, %f1, %f9
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f8
	fadd	%f6, %f6, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f7
	fadd	%f1, %f6, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72856
then.72855:
	mov	%i4, %i0
cont.72856:
cont.72844:
	jzero	%i0, %i0, cont.72842
then.72841:
	lf	%f1, 0(%i5)
	fsub	%f6, %f1, %f9
	lf	%f1, 1(%i5)
	fmul	%f10, %f6, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f8
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 1(%i7)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72857
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f7
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 2(%i7)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72859
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72858
then.72859:
	mov	%i4, %i0
cont.72860:
	jzero	%i0, %i0, cont.72858
then.72857:
	mov	%i4, %i0
cont.72858:
	jeq	%i4, %i0, then.72861
	lw	%i4, 154(%i0)
	sf	%f10, 0(%i4)
	movi	%i4, 1
	jzero	%i0, %i0, cont.72862
then.72861:
	lf	%f1, 2(%i5)
	fsub	%f6, %f1, %f8
	lf	%f1, 3(%i5)
	fmul	%f10, %f6, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f9
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 0(%i7)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72863
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f7
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 2(%i7)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72865
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72864
then.72865:
	mov	%i4, %i0
cont.72866:
	jzero	%i0, %i0, cont.72864
then.72863:
	mov	%i4, %i0
cont.72864:
	jeq	%i4, %i0, then.72867
	lw	%i4, 154(%i0)
	sf	%f10, 0(%i4)
	movi	%i4, 2
	jzero	%i0, %i0, cont.72868
then.72867:
	lf	%f1, 4(%i5)
	fsub	%f6, %f1, %f7
	lf	%f1, 5(%i5)
	fmul	%f7, %f6, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f6, %f1, %f9
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 0(%i7)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72869
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f6, %f1, %f8
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 1(%i7)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72871
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72870
then.72871:
	mov	%i4, %i0
cont.72872:
	jzero	%i0, %i0, cont.72870
then.72869:
	mov	%i4, %i0
cont.72870:
	jeq	%i4, %i0, then.72873
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i4, 3
	jzero	%i0, %i0, cont.72874
then.72873:
	mov	%i4, %i0
cont.72874:
cont.72868:
cont.72862:
cont.72842:
	jeq	%i4, %i0, then.72875
	lw	%i4, 154(%i0)
	lf	%f6, 0(%i4)
	movui	%i31, 777420
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72877
	movi	%i8, 1
loop_start.67830:
	slli	%i4, %i8, 2
	lw	%i30, 0(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72880
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i7, 0(%i31)
	mov	%i6, %i0
loop_start.67834:
	slli	%i4, %i6, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72883
	slli	%i4, %i6, 2
	add	%i31, %i7, %i4
	lw	%i28, 0(%i31)
	slli	%i5, %i28, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i27, 9(%i4)
	lw	%i15, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i14, 4(%i4)
	lw	%i13, 3(%i4)
	lw	%i4, 1(%i4)
	lw	%i29, 163(%i0)
	lf	%f6, 0(%i29)
	lf	%f1, 0(%i5)
	fsub	%f9, %f6, %f1
	lw	%i29, 163(%i0)
	lf	%f6, 1(%i29)
	lf	%f1, 1(%i5)
	fsub	%f8, %f6, %f1
	lw	%i29, 163(%i0)
	lf	%f6, 2(%i29)
	lf	%f1, 2(%i5)
	fsub	%f7, %f6, %f1
	slli	%i29, %i28, 2
	lw	%i5, 248(%i0)
	add	%i31, %i5, %i29
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i4, %i31, then.72885
	movi	%i31, 2
	jeq	%i4, %i31, then.72887
	lf	%f1, 0(%i5)
	feq	%i29, %f1, %f0
	jeq	%i29, %i0, then.72889
	mov	%i5, %i0
	jzero	%i0, %i0, cont.72886
then.72889:
	lf	%f6, 1(%i5)
	fmul	%f10, %f6, %f9
	lf	%f6, 2(%i5)
	fmul	%f6, %f6, %f8
	fadd	%f10, %f10, %f6
	lf	%f6, 3(%i5)
	fmul	%f6, %f6, %f7
	fadd	%f6, %f10, %f6
	fmul	%f11, %f9, %f9
	lf	%f10, 0(%i14)
	fmul	%f12, %f11, %f10
	fmul	%f11, %f8, %f8
	lf	%f10, 1(%i14)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	fmul	%f11, %f7, %f7
	lf	%f10, 2(%i14)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	jeq	%i13, %i0, then.72891
	fmul	%f11, %f8, %f7
	lf	%f10, 0(%i27)
	fmul	%f10, %f11, %f10
	fadd	%f11, %f12, %f10
	fmul	%f10, %f7, %f9
	lf	%f7, 1(%i27)
	fmul	%f7, %f10, %f7
	fadd	%f10, %f11, %f7
	fmul	%f8, %f9, %f8
	lf	%f7, 2(%i27)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f10, %f7
	jzero	%i0, %i0, cont.72892
then.72891:
	fmov	%f8, %f12
cont.72892:
	movi	%i31, 3
	jeq	%i4, %i31, then.72893
	jzero	%i0, %i0, cont.72894
then.72893:
	movui	%i31, 260096
	mif	%f7, %i31
	fsub	%f8, %f8, %f7
cont.72894:
	fmul	%f7, %f6, %f6
	fmul	%f1, %f1, %f8
	fsub	%f1, %f7, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72895
	jeq	%i15, %i0, then.72897
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f7, %i31
	finv	%f1, %f1
	fmul	%f1, %f7, %f1
	fadd	%f6, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f6, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72898
then.72897:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f7, %i31
	finv	%f1, %f1
	fmul	%f1, %f7, %f1
	fsub	%f6, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f6, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72898:
	movi	%i5, 1
	jzero	%i0, %i0, cont.72896
then.72895:
	mov	%i5, %i0
cont.72896:
cont.72890:
	jzero	%i0, %i0, cont.72886
then.72887:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72899
	lf	%f1, 1(%i5)
	fmul	%f6, %f1, %f9
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f8
	fadd	%f6, %f6, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f7
	fadd	%f1, %f6, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72900
then.72899:
	mov	%i5, %i0
cont.72900:
cont.72888:
	jzero	%i0, %i0, cont.72886
then.72885:
	lf	%f1, 0(%i5)
	fsub	%f6, %f1, %f9
	lf	%f1, 1(%i5)
	fmul	%f10, %f6, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f8
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 1(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72901
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f7
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 2(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72903
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72902
then.72903:
	mov	%i4, %i0
cont.72904:
	jzero	%i0, %i0, cont.72902
then.72901:
	mov	%i4, %i0
cont.72902:
	jeq	%i4, %i0, then.72905
	lw	%i4, 154(%i0)
	sf	%f10, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72906
then.72905:
	lf	%f1, 2(%i5)
	fsub	%f6, %f1, %f8
	lf	%f1, 3(%i5)
	fmul	%f10, %f6, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f9
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 0(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72907
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f7
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 2(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72909
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72908
then.72909:
	mov	%i4, %i0
cont.72910:
	jzero	%i0, %i0, cont.72908
then.72907:
	mov	%i4, %i0
cont.72908:
	jeq	%i4, %i0, then.72911
	lw	%i4, 154(%i0)
	sf	%f10, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.72912
then.72911:
	lf	%f1, 4(%i5)
	fsub	%f6, %f1, %f7
	lf	%f1, 5(%i5)
	fmul	%f7, %f6, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f6, %f1, %f9
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 0(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72913
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f6, %f1, %f8
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 1(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72915
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72914
then.72915:
	mov	%i4, %i0
cont.72916:
	jzero	%i0, %i0, cont.72914
then.72913:
	mov	%i4, %i0
cont.72914:
	jeq	%i4, %i0, then.72917
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.72918
then.72917:
	mov	%i5, %i0
cont.72918:
cont.72912:
cont.72906:
cont.72886:
	lw	%i4, 154(%i0)
	lf	%f6, 0(%i4)
	jeq	%i5, %i0, then.72919
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f6, %f1
	jzero	%i0, %i0, cont.72920
then.72919:
	mov	%i4, %i0
cont.72920:
	jeq	%i4, %i0, then.72921
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f7, %f6, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f6, %f1, %f7
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f10, %f6, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f6, %f1, %f7
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f9, %f6, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f6, %f1, %f7
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f8, %f6, %f1
	mov	%i14, %i0
loop_start.67866:
	slli	%i4, %i14, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72924
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i28, 9(%i4)
	lw	%i13, 6(%i4)
	lw	%i27, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i15, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i27)
	fsub	%f7, %f10, %f1
	lf	%f1, 1(%i27)
	fsub	%f6, %f9, %f1
	lf	%f1, 2(%i27)
	fsub	%f1, %f8, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72926
	movi	%i31, 2
	jeq	%i4, %i31, then.72928
	fmul	%f12, %f7, %f7
	lf	%f11, 0(%i5)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f6, %f6
	lf	%f11, 1(%i5)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f1, %f1
	lf	%f11, 2(%i5)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	jeq	%i15, %i0, then.72930
	fmul	%f12, %f6, %f1
	lf	%f11, 0(%i28)
	fmul	%f11, %f12, %f11
	fadd	%f12, %f13, %f11
	fmul	%f11, %f1, %f7
	lf	%f1, 1(%i28)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f12, %f1
	fmul	%f6, %f7, %f6
	lf	%f1, 2(%i28)
	fmul	%f1, %f6, %f1
	fadd	%f6, %f11, %f1
	jzero	%i0, %i0, cont.72931
then.72930:
	fmov	%f6, %f13
cont.72931:
	movi	%i31, 3
	jeq	%i4, %i31, then.72932
	fmov	%f1, %f6
	jzero	%i0, %i0, cont.72933
then.72932:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f6, %f1
cont.72933:
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.72927
then.72928:
	lf	%f11, 0(%i5)
	fmul	%f11, %f11, %f7
	lf	%f7, 1(%i5)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f11, %f6
	lf	%f6, 2(%i5)
	fmul	%f1, %f6, %f1
	fadd	%f1, %f7, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
cont.72929:
	jzero	%i0, %i0, cont.72927
then.72926:
	fleq	%i4, %f0, %f7
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f11, %i4
	fmul	%f11, %f11, %f7
	lf	%f7, 0(%i5)
	flt	%i4, %f11, %f7
	jeq	%i4, %i0, then.72934
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f6
	lf	%f6, 1(%i5)
	flt	%i4, %f7, %f6
	jeq	%i4, %i0, then.72936
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f6, %f6, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f6, %f1
	jzero	%i0, %i0, cont.72935
then.72936:
	mov	%i4, %i0
cont.72937:
	jzero	%i0, %i0, cont.72935
then.72934:
	mov	%i4, %i0
cont.72935:
	jeq	%i4, %i0, then.72938
	mov	%i4, %i13
	jzero	%i0, %i0, cont.72939
then.72938:
	ceqi	%i4, %i13, 0
cont.72939:
cont.72927:
	jeq	%i4, %i0, then.72940
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67867
then.72940:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.72941:
	set_label	%i31, loop_start.67866
	jmp	%i0, 0(%i31)
then.72924:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67867
loop_end.67867:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72942
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67835
then.72942:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.72943:
	set_label	%i31, loop_start.67834
	jmp	%i0, 0(%i31)
then.72921:
	slli	%i5, %i28, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.72944
	addi	%i4, %i6, 1
	mov	%i6, %i4
	jzero	%i0, %i0, cont.72945
then.72944:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67835
cont.72945:
cont.72922:
	set_label	%i31, loop_start.67834
	jmp	%i0, 0(%i31)
then.72883:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67835
loop_end.67835:
	mov	%i4, %i31
	jeq	%i4, %i0, then.72946
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67831
then.72946:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.72947:
	set_label	%i31, loop_start.67830
	jmp	%i0, 0(%i31)
then.72880:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67831
loop_end.67831:
	mov	%i4, %i31
	jzero	%i0, %i0, cont.72840
then.72877:
	mov	%i4, %i0
cont.72878:
	jzero	%i0, %i0, cont.72840
then.72875:
	mov	%i4, %i0
cont.72876:
	jzero	%i0, %i0, cont.72840
then.72839:
	movi	%i4, 1
cont.72840:
	jeq	%i4, %i0, then.72948
	movi	%i8, 1
loop_start.67887:
	slli	%i4, %i8, 2
	lw	%i30, 0(%i1)
	add	%i31, %i30, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72951
	slli	%i5, %i4, 2
	lw	%i4, 97(%i0)
	add	%i31, %i4, %i5
	lw	%i7, 0(%i31)
	mov	%i6, %i0
loop_start.67891:
	slli	%i4, %i6, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72954
	slli	%i4, %i6, 2
	add	%i31, %i7, %i4
	lw	%i28, 0(%i31)
	slli	%i5, %i28, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i27, 9(%i4)
	lw	%i15, 6(%i4)
	lw	%i5, 5(%i4)
	lw	%i14, 4(%i4)
	lw	%i13, 3(%i4)
	lw	%i4, 1(%i4)
	lw	%i29, 163(%i0)
	lf	%f6, 0(%i29)
	lf	%f1, 0(%i5)
	fsub	%f9, %f6, %f1
	lw	%i29, 163(%i0)
	lf	%f6, 1(%i29)
	lf	%f1, 1(%i5)
	fsub	%f8, %f6, %f1
	lw	%i29, 163(%i0)
	lf	%f6, 2(%i29)
	lf	%f1, 2(%i5)
	fsub	%f7, %f6, %f1
	slli	%i29, %i28, 2
	lw	%i5, 248(%i0)
	add	%i31, %i5, %i29
	lw	%i5, 0(%i31)
	movi	%i31, 1
	jeq	%i4, %i31, then.72956
	movi	%i31, 2
	jeq	%i4, %i31, then.72958
	lf	%f1, 0(%i5)
	feq	%i29, %f1, %f0
	jeq	%i29, %i0, then.72960
	mov	%i5, %i0
	jzero	%i0, %i0, cont.72957
then.72960:
	lf	%f6, 1(%i5)
	fmul	%f10, %f6, %f9
	lf	%f6, 2(%i5)
	fmul	%f6, %f6, %f8
	fadd	%f10, %f10, %f6
	lf	%f6, 3(%i5)
	fmul	%f6, %f6, %f7
	fadd	%f6, %f10, %f6
	fmul	%f11, %f9, %f9
	lf	%f10, 0(%i14)
	fmul	%f12, %f11, %f10
	fmul	%f11, %f8, %f8
	lf	%f10, 1(%i14)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	fmul	%f11, %f7, %f7
	lf	%f10, 2(%i14)
	fmul	%f10, %f11, %f10
	fadd	%f12, %f12, %f10
	jeq	%i13, %i0, then.72962
	fmul	%f11, %f8, %f7
	lf	%f10, 0(%i27)
	fmul	%f10, %f11, %f10
	fadd	%f11, %f12, %f10
	fmul	%f10, %f7, %f9
	lf	%f7, 1(%i27)
	fmul	%f7, %f10, %f7
	fadd	%f10, %f11, %f7
	fmul	%f8, %f9, %f8
	lf	%f7, 2(%i27)
	fmul	%f7, %f8, %f7
	fadd	%f8, %f10, %f7
	jzero	%i0, %i0, cont.72963
then.72962:
	fmov	%f8, %f12
cont.72963:
	movi	%i31, 3
	jeq	%i4, %i31, then.72964
	jzero	%i0, %i0, cont.72965
then.72964:
	movui	%i31, 260096
	mif	%f7, %i31
	fsub	%f8, %f8, %f7
cont.72965:
	fmul	%f7, %f6, %f6
	fmul	%f1, %f1, %f8
	fsub	%f1, %f7, %f1
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, then.72966
	jeq	%i15, %i0, then.72968
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f7, %i31
	finv	%f1, %f1
	fmul	%f1, %f7, %f1
	fadd	%f6, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f6, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	jzero	%i0, %i0, cont.72969
then.72968:
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f7, %i31
	finv	%f1, %f1
	fmul	%f1, %f7, %f1
	fsub	%f6, %f6, %f1
	lf	%f1, 4(%i5)
	fmul	%f1, %f6, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
cont.72969:
	movi	%i5, 1
	jzero	%i0, %i0, cont.72967
then.72966:
	mov	%i5, %i0
cont.72967:
cont.72961:
	jzero	%i0, %i0, cont.72957
then.72958:
	lf	%f1, 0(%i5)
	flt	%i4, %f1, %f0
	jeq	%i4, %i0, then.72970
	lf	%f1, 1(%i5)
	fmul	%f6, %f1, %f9
	lf	%f1, 2(%i5)
	fmul	%f1, %f1, %f8
	fadd	%f6, %f6, %f1
	lf	%f1, 3(%i5)
	fmul	%f1, %f1, %f7
	fadd	%f1, %f6, %f1
	lw	%i4, 154(%i0)
	sf	%f1, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72971
then.72970:
	mov	%i5, %i0
cont.72971:
cont.72959:
	jzero	%i0, %i0, cont.72957
then.72956:
	lf	%f1, 0(%i5)
	fsub	%f6, %f1, %f9
	lf	%f1, 1(%i5)
	fmul	%f10, %f6, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f8
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 1(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72972
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f7
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 2(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72974
	lf	%f1, 1(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72973
then.72974:
	mov	%i4, %i0
cont.72975:
	jzero	%i0, %i0, cont.72973
then.72972:
	mov	%i4, %i0
cont.72973:
	jeq	%i4, %i0, then.72976
	lw	%i4, 154(%i0)
	sf	%f10, 0(%i4)
	movi	%i5, 1
	jzero	%i0, %i0, cont.72977
then.72976:
	lf	%f1, 2(%i5)
	fsub	%f6, %f1, %f8
	lf	%f1, 3(%i5)
	fmul	%f10, %f6, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f9
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 0(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72978
	lw	%i4, 244(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f10, %f1
	fadd	%f6, %f1, %f7
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 2(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72980
	lf	%f1, 3(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72979
then.72980:
	mov	%i4, %i0
cont.72981:
	jzero	%i0, %i0, cont.72979
then.72978:
	mov	%i4, %i0
cont.72979:
	jeq	%i4, %i0, then.72982
	lw	%i4, 154(%i0)
	sf	%f10, 0(%i4)
	movi	%i5, 2
	jzero	%i0, %i0, cont.72983
then.72982:
	lf	%f1, 4(%i5)
	fsub	%f6, %f1, %f7
	lf	%f1, 5(%i5)
	fmul	%f7, %f6, %f1
	lw	%i4, 244(%i0)
	lf	%f1, 0(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f6, %f1, %f9
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 0(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72984
	lw	%i4, 244(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f7, %f1
	fadd	%f6, %f1, %f8
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f1, %i4
	fmul	%f6, %f1, %f6
	lf	%f1, 1(%i14)
	flt	%i4, %f6, %f1
	jeq	%i4, %i0, then.72986
	lf	%f1, 5(%i5)
	feq	%i4, %f1, %f0
	ceqi	%i4, %i4, 0
	jzero	%i0, %i0, cont.72985
then.72986:
	mov	%i4, %i0
cont.72987:
	jzero	%i0, %i0, cont.72985
then.72984:
	mov	%i4, %i0
cont.72985:
	jeq	%i4, %i0, then.72988
	lw	%i4, 154(%i0)
	sf	%f7, 0(%i4)
	movi	%i5, 3
	jzero	%i0, %i0, cont.72989
then.72988:
	mov	%i5, %i0
cont.72989:
cont.72983:
cont.72977:
cont.72957:
	lw	%i4, 154(%i0)
	lf	%f6, 0(%i4)
	jeq	%i5, %i0, then.72990
	movui	%i31, 779468
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f6, %f1
	jzero	%i0, %i0, cont.72991
then.72990:
	mov	%i4, %i0
cont.72991:
	jeq	%i4, %i0, then.72992
	movui	%i31, 246333
	ori	%i31, %i31, 1802
	mif	%f1, %i31
	fadd	%f7, %f6, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f6, %f1, %f7
	lw	%i4, 163(%i0)
	lf	%f1, 0(%i4)
	fadd	%f10, %f6, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f6, %f1, %f7
	lw	%i4, 163(%i0)
	lf	%f1, 1(%i4)
	fadd	%f9, %f6, %f1
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f6, %f1, %f7
	lw	%i4, 163(%i0)
	lf	%f1, 2(%i4)
	fadd	%f8, %f6, %f1
	mov	%i14, %i0
loop_start.67923:
	slli	%i4, %i14, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	movi	%i31, -1
	jeq	%i4, %i31, then.72995
	slli	%i5, %i4, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i28, 9(%i4)
	lw	%i13, 6(%i4)
	lw	%i27, 5(%i4)
	lw	%i5, 4(%i4)
	lw	%i15, 3(%i4)
	lw	%i4, 1(%i4)
	lf	%f1, 0(%i27)
	fsub	%f7, %f10, %f1
	lf	%f1, 1(%i27)
	fsub	%f6, %f9, %f1
	lf	%f1, 2(%i27)
	fsub	%f1, %f8, %f1
	movi	%i31, 1
	jeq	%i4, %i31, then.72997
	movi	%i31, 2
	jeq	%i4, %i31, then.72999
	fmul	%f12, %f7, %f7
	lf	%f11, 0(%i5)
	fmul	%f13, %f12, %f11
	fmul	%f12, %f6, %f6
	lf	%f11, 1(%i5)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	fmul	%f12, %f1, %f1
	lf	%f11, 2(%i5)
	fmul	%f11, %f12, %f11
	fadd	%f13, %f13, %f11
	jeq	%i15, %i0, then.73001
	fmul	%f12, %f6, %f1
	lf	%f11, 0(%i28)
	fmul	%f11, %f12, %f11
	fadd	%f12, %f13, %f11
	fmul	%f11, %f1, %f7
	lf	%f1, 1(%i28)
	fmul	%f1, %f11, %f1
	fadd	%f11, %f12, %f1
	fmul	%f6, %f7, %f6
	lf	%f1, 2(%i28)
	fmul	%f1, %f6, %f1
	fadd	%f6, %f11, %f1
	jzero	%i0, %i0, cont.73002
then.73001:
	fmov	%f6, %f13
cont.73002:
	movi	%i31, 3
	jeq	%i4, %i31, then.73003
	fmov	%f1, %f6
	jzero	%i0, %i0, cont.73004
then.73003:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f6, %f1
cont.73004:
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
	jzero	%i0, %i0, cont.72998
then.72999:
	lf	%f11, 0(%i5)
	fmul	%f11, %f11, %f7
	lf	%f7, 1(%i5)
	fmul	%f6, %f7, %f6
	fadd	%f7, %f11, %f6
	lf	%f6, 2(%i5)
	fmul	%f1, %f6, %f1
	fadd	%f1, %f7, %f1
	flt	%i5, %f1, %f0
	mov	%i4, %i13
	ceq	%i4, %i4, %i5
cont.73000:
	jzero	%i0, %i0, cont.72998
then.72997:
	fleq	%i4, %f0, %f7
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f11, %i4
	fmul	%f11, %f11, %f7
	lf	%f7, 0(%i5)
	flt	%i4, %f11, %f7
	jeq	%i4, %i0, then.73005
	fleq	%i4, %f0, %f6
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f7, %i4
	fmul	%f7, %f7, %f6
	lf	%f6, 1(%i5)
	flt	%i4, %f7, %f6
	jeq	%i4, %i0, then.73007
	fleq	%i4, %f0, %f1
	slli	%i4, %i4, 1
	subi	%i4, %i4, 1
	itof	%f6, %i4
	fmul	%f6, %f6, %f1
	lf	%f1, 2(%i5)
	flt	%i4, %f6, %f1
	jzero	%i0, %i0, cont.73006
then.73007:
	mov	%i4, %i0
cont.73008:
	jzero	%i0, %i0, cont.73006
then.73005:
	mov	%i4, %i0
cont.73006:
	jeq	%i4, %i0, then.73009
	mov	%i4, %i13
	jzero	%i0, %i0, cont.73010
then.73009:
	ceqi	%i4, %i13, 0
cont.73010:
cont.72998:
	jeq	%i4, %i0, then.73011
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67924
then.73011:
	addi	%i4, %i14, 1
	mov	%i14, %i4
cont.73012:
	set_label	%i31, loop_start.67923
	jmp	%i0, 0(%i31)
then.72995:
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67924
loop_end.67924:
	mov	%i4, %i31
	jeq	%i4, %i0, then.73013
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67892
then.73013:
	addi	%i4, %i6, 1
	mov	%i6, %i4
cont.73014:
	set_label	%i31, loop_start.67891
	jmp	%i0, 0(%i31)
then.72992:
	slli	%i5, %i28, 2
	lw	%i4, 15(%i0)
	add	%i31, %i4, %i5
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	jeq	%i4, %i0, then.73015
	addi	%i4, %i6, 1
	mov	%i6, %i4
	jzero	%i0, %i0, cont.73016
then.73015:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67892
cont.73016:
cont.72993:
	set_label	%i31, loop_start.67891
	jmp	%i0, 0(%i31)
then.72954:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67892
loop_end.67892:
	mov	%i4, %i31
	jeq	%i4, %i0, then.73017
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67888
then.73017:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.73018:
	set_label	%i31, loop_start.67887
	jmp	%i0, 0(%i31)
then.72951:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67888
loop_end.67888:
	mov	%i4, %i31
	jeq	%i4, %i0, then.73019
	movi	%i4, 1
	mov	%i31, %i4
	jzero	%i0, %i0, loop_end.67800
then.73019:
	addi	%i4, %i10, 1
	mov	%i10, %i4
cont.73020:
	set_label	%i31, loop_start.67799
	jmp	%i0, 0(%i31)
then.72948:
	addi	%i4, %i10, 1
	mov	%i10, %i4
cont.72949:
	set_label	%i31, loop_start.67799
	jmp	%i0, 0(%i31)
then.72837:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67800
loop_end.67800:
	mov	%i4, %i31
	ceqi	%i31, %i4, 0
	jzero	%i0, %i31, cont.73021
	lw	%i4, 171(%i0)
	lf	%f6, 0(%i4)
	lf	%f1, 0(%i11)
	fmul	%f7, %f6, %f1
	lw	%i4, 171(%i0)
	lf	%f6, 1(%i4)
	lf	%f1, 1(%i11)
	fmul	%f1, %f6, %f1
	fadd	%f7, %f7, %f1
	lw	%i4, 171(%i0)
	lf	%f6, 2(%i4)
	lf	%f1, 2(%i11)
	fmul	%f1, %f6, %f1
	fadd	%f6, %f7, %f1
	fmul	%f1, %f4, %f19
	fmul	%f1, %f1, %f6
	lw	%i4, 227(%i0)
	lf	%f7, 0(%i4)
	lf	%f6, 0(%i11)
	fmul	%f8, %f7, %f6
	lw	%i4, 227(%i0)
	lf	%f7, 1(%i4)
	lf	%f6, 1(%i11)
	fmul	%f6, %f7, %f6
	fadd	%f8, %f8, %f6
	lw	%i4, 227(%i0)
	lf	%f7, 2(%i4)
	lf	%f6, 2(%i11)
	fmul	%f6, %f7, %f6
	fadd	%f6, %f8, %f6
	fmul	%f7, %f4, %f6
	flt	%i4, %f0, %f1
	jeq	%i4, %i0, cont.73022
	lw	%i4, 186(%i0)
	lf	%f6, 0(%i4)
	lw	%i4, 176(%i0)
	lf	%f4, 0(%i4)
	fmul	%f4, %f1, %f4
	fadd	%f4, %f6, %f4
	lw	%i4, 186(%i0)
	sf	%f4, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f6, 1(%i4)
	lw	%i4, 176(%i0)
	lf	%f4, 1(%i4)
	fmul	%f4, %f1, %f4
	fadd	%f4, %f6, %f4
	lw	%i4, 186(%i0)
	sf	%f4, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f6, 2(%i4)
	lw	%i4, 176(%i0)
	lf	%f4, 2(%i4)
	fmul	%f1, %f1, %f4
	fadd	%f1, %f6, %f1
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73022:
	flt	%i4, %f0, %f7
	jeq	%i4, %i0, cont.73023
	fmul	%f1, %f7, %f7
	fmul	%f1, %f1, %f1
	fmul	%f4, %f1, %f5
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	fadd	%f1, %f1, %f4
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	fadd	%f1, %f1, %f4
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	fadd	%f1, %f1, %f4
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
cont.73023:
cont.73021:
cont.72835:
cont.72834:
	subi	%i4, %i12, 1
	mov	%i12, %i4
cont.72831:
	set_label	%i30, loop_start.67796
	jmp	%i0, 0(%i30)
loop_end.67797:
	mov	%i0, %i31
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	flt	%i4, %f1, %f17
	jeq	%i4, %i0, then.73024
	movi	%i4, 4
	jleq	%i4, %i23, cont.73026
	addi	%i4, %i23, 1
	movi	%i5, -1
	slli	%i4, %i4, 2
	add	%i31, %i19, %i4
	sw	%i5, 0(%i31)
cont.73026:
	movi	%i31, 2
	jeq	%i16, %i31, then.73027
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67568
then.73027:
	movui	%i31, 260096
	mif	%f4, %i31
	lf	%f1, 0(%i17)
	fsub	%f1, %f4, %f1
	fmul	%f4, %f17, %f1
	addi	%i5, %i23, 1
	lw	%i4, 160(%i0)
	lf	%f1, 0(%i4)
	fadd	%f1, %f16, %f1
	mov	%i23, %i5
	fmov	%f17, %f4
	fmov	%f16, %f1
cont.73028:
	jzero	%i0, %i0, cont.72744
then.73024:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67568
then.72743:
	movi	%i5, -1
	slli	%i4, %i23, 2
	add	%i31, %i19, %i4
	sw	%i5, 0(%i31)
	jeq	%i23, %i0, then.73029
	lw	%i4, 227(%i0)
	lf	%f4, 0(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 0(%i4)
	fmul	%f5, %f4, %f1
	lw	%i4, 227(%i0)
	lf	%f4, 1(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 1(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f5, %f5, %f1
	lw	%i4, 227(%i0)
	lf	%f4, 2(%i4)
	lw	%i4, 87(%i0)
	lf	%f1, 2(%i4)
	fmul	%f1, %f4, %f1
	fadd	%f1, %f5, %f1
	fneg	%f4, %f1
	flt	%i4, %f0, %f4
	jeq	%i4, %i0, then.73031
	fmul	%f1, %f4, %f4
	fmul	%f1, %f1, %f4
	fmul	%f4, %f1, %f17
	lw	%i4, 92(%i0)
	lf	%f1, 0(%i4)
	fmul	%f4, %f4, %f1
	lw	%i4, 186(%i0)
	lf	%f1, 0(%i4)
	fadd	%f1, %f1, %f4
	lw	%i4, 186(%i0)
	sf	%f1, 0(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 1(%i4)
	fadd	%f1, %f1, %f4
	lw	%i4, 186(%i0)
	sf	%f1, 1(%i4)
	lw	%i4, 186(%i0)
	lf	%f1, 2(%i4)
	fadd	%f1, %f1, %f4
	lw	%i4, 186(%i0)
	sf	%f1, 2(%i4)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67568
then.73031:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67568
cont.73032:
then.73029:
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67568
cont.73030:
cont.72744:
cont.72585:
	set_label	%i30, loop_start.67567
	jmp	%i0, 0(%i30)
loop_end.67568:
	mov	%i0, %i31
	slli	%i4, %i25, 2
	add	%i31, %i26, %i4
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
	slli	%i4, %i25, 2
	add	%i31, %i26, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 6(%i4)
	sw	%i24, 0(%i4)
	slli	%i4, %i25, 2
	add	%i31, %i26, %i4
	lw	%i4, 0(%i31)
	lw	%i14, 7(%i4)
	lw	%i13, 6(%i4)
	lw	%i12, 5(%i4)
	lw	%i11, 3(%i4)
	lw	%i10, 2(%i4)
	lw	%i9, 1(%i4)
	mov	%i8, %i0
loop_start.67955:
	movi	%i31, 4
	jleq	%i8, %i31, then.73034
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67956
then.73034:
	slli	%i4, %i8, 2
	add	%i31, %i10, %i4
	lw	%i4, 0(%i31)
	jleq	%i0, %i4, then.73036
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67956
then.73036:
	slli	%i4, %i8, 2
	add	%i31, %i11, %i4
	lw	%i4, 0(%i31)
	jeq	%i4, %i0, cont.73038
	lw	%i5, 0(%i13)
	lw	%i4, 181(%i0)
	sf	%f0, 0(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 1(%i4)
	lw	%i4, 181(%i0)
	sf	%f0, 2(%i4)
	slli	%i5, %i5, 2
	lw	%i4, 235(%i0)
	add	%i31, %i4, %i5
	lw	%i7, 0(%i31)
	slli	%i4, %i8, 2
	add	%i31, %i14, %i4
	lw	%i6, 0(%i31)
	slli	%i4, %i8, 2
	add	%i31, %i9, %i4
	lw	%i4, 0(%i31)
	lf	%f1, 0(%i4)
	lw	%i5, 207(%i0)
	sf	%f1, 0(%i5)
	lf	%f1, 1(%i4)
	lw	%i5, 207(%i0)
	sf	%f1, 1(%i5)
	lf	%f1, 2(%i4)
	lw	%i5, 207(%i0)
	sf	%f1, 2(%i5)
	lw	%i5, 6(%i0)
	lw	%i5, 0(%i5)
	subi	%i20, %i5, 1
loop_start.67962:
	jleq	%i0, %i20, then.73040
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67963
then.73040:
	slli	%i15, %i20, 2
	lw	%i5, 15(%i0)
	add	%i31, %i5, %i15
	lw	%i5, 0(%i31)
	lw	%i19, 10(%i5)
	lw	%i18, 9(%i5)
	lw	%i17, 5(%i5)
	lw	%i16, 4(%i5)
	lw	%i15, 3(%i5)
	lw	%i5, 1(%i5)
	lf	%f4, 0(%i4)
	lf	%f1, 0(%i17)
	fsub	%f1, %f4, %f1
	sf	%f1, 0(%i19)
	lf	%f4, 1(%i4)
	lf	%f1, 1(%i17)
	fsub	%f1, %f4, %f1
	sf	%f1, 1(%i19)
	lf	%f4, 2(%i4)
	lf	%f1, 2(%i17)
	fsub	%f1, %f4, %f1
	sf	%f1, 2(%i19)
	movi	%i31, 2
	jeq	%i5, %i31, then.73042
	movi	%i31, 2
	jleq	%i5, %i31, cont.73044
	lf	%f8, 0(%i19)
	lf	%f7, 1(%i19)
	lf	%f6, 2(%i19)
	fmul	%f4, %f8, %f8
	lf	%f1, 0(%i16)
	fmul	%f5, %f4, %f1
	fmul	%f4, %f7, %f7
	lf	%f1, 1(%i16)
	fmul	%f1, %f4, %f1
	fadd	%f5, %f5, %f1
	fmul	%f4, %f6, %f6
	lf	%f1, 2(%i16)
	fmul	%f1, %f4, %f1
	fadd	%f5, %f5, %f1
	jeq	%i15, %i0, then.73045
	fmul	%f4, %f7, %f6
	lf	%f1, 0(%i18)
	fmul	%f1, %f4, %f1
	fadd	%f5, %f5, %f1
	fmul	%f4, %f6, %f8
	lf	%f1, 1(%i18)
	fmul	%f1, %f4, %f1
	fadd	%f5, %f5, %f1
	fmul	%f4, %f8, %f7
	lf	%f1, 2(%i18)
	fmul	%f1, %f4, %f1
	fadd	%f4, %f5, %f1
	jzero	%i0, %i0, cont.73046
then.73045:
	fmov	%f4, %f5
cont.73046:
	movi	%i31, 3
	jeq	%i5, %i31, then.73047
	fmov	%f1, %f4
	jzero	%i0, %i0, cont.73048
then.73047:
	movui	%i31, 260096
	mif	%f1, %i31
	fsub	%f1, %f4, %f1
cont.73048:
	sf	%f1, 3(%i19)
cont.73044:
	jzero	%i0, %i0, cont.73043
then.73042:
	lf	%f4, 0(%i19)
	lf	%f6, 1(%i19)
	lf	%f5, 2(%i19)
	lf	%f1, 0(%i16)
	fmul	%f4, %f1, %f4
	lf	%f1, 1(%i16)
	fmul	%f1, %f1, %f6
	fadd	%f4, %f4, %f1
	lf	%f1, 2(%i16)
	fmul	%f1, %f1, %f5
	fadd	%f1, %f4, %f1
	sf	%f1, 3(%i19)
cont.73043:
	subi	%i5, %i20, 1
	mov	%i20, %i5
cont.73041:
	set_label	%i30, loop_start.67962
	jmp	%i0, 0(%i30)
loop_end.67963:
	mov	%i0, %i31
	movi	%i15, 118
loop_start.67966:
	jleq	%i0, %i15, then.73050
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67967
then.73050:
	slli	%i4, %i15, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	lw	%i4, 0(%i4)
	lf	%f4, 0(%i4)
	lf	%f1, 0(%i6)
	fmul	%f5, %f4, %f1
	lf	%f4, 1(%i4)
	lf	%f1, 1(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f5, %f5, %f1
	lf	%f4, 2(%i4)
	lf	%f1, 2(%i6)
	fmul	%f1, %f4, %f1
	fadd	%f4, %f5, %f1
	flt	%i4, %f4, %f0
	jeq	%i4, %i0, then.73052
	addi	%i4, %i15, 1
	slli	%i4, %i4, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 799072
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	subi	%i1, %i1, 48
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sw	%i10, 4(%i1)
	sw	%i11, 5(%i1)
	sw	%i12, 6(%i1)
	sw	%i13, 7(%i1)
	sw	%i14, 8(%i1)
	sw	%i15, 9(%i1)
	sf	%f2, 10(%i1)
	sf	%f3, 11(%i1)
	set_label	%i31, trace_diffuse_ray.3014
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lw	%i10, 4(%i1)
	lw	%i11, 5(%i1)
	lw	%i12, 6(%i1)
	lw	%i13, 7(%i1)
	lw	%i14, 8(%i1)
	lw	%i15, 9(%i1)
	lf	%f2, 10(%i1)
	lf	%f3, 11(%i1)
	addi	%i1, %i1, 48
	jzero	%i0, %i0, cont.73053
then.73052:
	slli	%i4, %i15, 2
	add	%i31, %i7, %i4
	lw	%i4, 0(%i31)
	lw	%i5, 1(%i4)
	lw	%i4, 0(%i4)
	movui	%i31, 274784
	mif	%f1, %i31
	finv	%f1, %f1
	fmul	%f1, %f4, %f1
	subi	%i1, %i1, 48
	sw	%i6, 0(%i1)
	sw	%i7, 1(%i1)
	sw	%i8, 2(%i1)
	sw	%i9, 3(%i1)
	sw	%i10, 4(%i1)
	sw	%i11, 5(%i1)
	sw	%i12, 6(%i1)
	sw	%i13, 7(%i1)
	sw	%i14, 8(%i1)
	sw	%i15, 9(%i1)
	sf	%f2, 10(%i1)
	sf	%f3, 11(%i1)
	set_label	%i31, trace_diffuse_ray.3014
	jmp	%i3, 0(%i31)
	lw	%i6, 0(%i1)
	lw	%i7, 1(%i1)
	lw	%i8, 2(%i1)
	lw	%i9, 3(%i1)
	lw	%i10, 4(%i1)
	lw	%i11, 5(%i1)
	lw	%i12, 6(%i1)
	lw	%i13, 7(%i1)
	lw	%i14, 8(%i1)
	lw	%i15, 9(%i1)
	lf	%f2, 10(%i1)
	lf	%f3, 11(%i1)
	addi	%i1, %i1, 48
cont.73053:
	subi	%i4, %i15, 2
	mov	%i15, %i4
cont.73051:
	set_label	%i30, loop_start.67966
	jmp	%i0, 0(%i30)
loop_end.67967:
	mov	%i0, %i31
	slli	%i4, %i8, 2
	add	%i31, %i12, %i4
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
cont.73038:
	addi	%i4, %i8, 1
	mov	%i8, %i4
cont.73037:
cont.73035:
	set_label	%i30, loop_start.67955
	jmp	%i0, 0(%i30)
loop_end.67956:
	mov	%i0, %i31
	subi	%i6, %i25, 1
	addi	%i5, %i24, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.73054
	mov	%i4, %i5
	jzero	%i0, %i0, cont.73055
then.73054:
	subi	%i4, %i5, 5
cont.73055:
	mov	%i25, %i6
	mov	%i24, %i4
cont.72580:
	set_label	%i30, loop_start.67562
	jmp	%i0, 0(%i30)
loop_end.67563:
	mov	%i4, %i31
	fmov	%f1, %f31
	mov	%i30, %i4
	fmov	%f30, %f1
	lw	%i3, 1(%i1)
	addi	%i1, %i1, 8
	jmp	%i0, 0(%i3)
calc_dirvecs.3118:
	fmov	%f7, %f1
loop_start.67978:
	jleq	%i0, %i4, then.73057
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67979
then.73057:
	itof	%f2, %i4
	movui	%i31, 255180
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fmul	%f6, %f2, %f1
	movui	%i31, 259686
	ori	%i31, %i31, 1638
	mif	%f1, %i31
	fsub	%f5, %f6, %f1
	mov	%i7, %i0
	fmov	%f8, %f0
	fmov	%f4, %f0
	movi	%i8, 5
loop_start.67980:
	jleq	%i8, %i7, then.73060
	fmul	%f2, %f4, %f4
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f8, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f8, %f1
	jzero	%i0, %i31, else.73062
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.73064
	fmul	%f4, %f8, %f8
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
	fmul	%f1, %f1, %f8
	jzero	%i0, %i0, cont.73063
else.73064:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f8
	fmul	%f8, %f2, %f1
	fmul	%f4, %f8, %f8
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
	fmul	%f2, %f1, %f8
	lf	%f1, 2(%i0)
	fadd	%f1, %f2, %f1
cont.73065:
	jzero	%i0, %i0, cont.73063
else.73062:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f8
	fmul	%f8, %f2, %f1
	fmul	%f4, %f8, %f8
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
	fmul	%f2, %f1, %f8
	lf	%f1, 1(%i0)
	fadd	%f1, %f2, %f1
cont.73063:
	fmul	%f2, %f1, %f5
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73066
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73068
	fmul	%f8, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f4, %f1, %f8
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f8
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f8
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f2
	jzero	%i0, %i0, cont.73067
else.73068:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73070
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
	jzero	%i0, %i31, else.73072
	fmov	%f8, %f2
	jzero	%i0, %i0, cont.73073
else.73072:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
cont.73073:
	fmul	%f4, %f8, %f8
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
	fmul	%f4, %f1, %f8
	jzero	%i0, %i0, cont.73071
else.73070:
	lf	%f1, 3(%i0)
	fsub	%f8, %f1, %f2
	fmul	%f4, %f8, %f8
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
	fmul	%f4, %f1, %f8
cont.73071:
cont.73069:
	jzero	%i0, %i0, cont.73067
else.73066:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73074
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
	jzero	%i0, %i31, else.73076
	fmov	%f8, %f2
	jzero	%i0, %i0, cont.73077
else.73076:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
cont.73077:
	fmul	%f4, %f8, %f8
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
	fmul	%f4, %f1, %f8
	jzero	%i0, %i0, cont.73075
else.73074:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
	fmul	%f4, %f8, %f8
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
	fmul	%f4, %f1, %f8
cont.73075:
cont.73067:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f4, %f4
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f4, %f1
	fmul	%f4, %f1, %f3
	addi	%i7, %i7, 1
	fmul	%f2, %f4, %f4
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73078
	movui	%i31, 784384
	mif	%f2, %i31
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73080
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
	jzero	%i0, %i0, cont.73079
else.73080:
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
cont.73081:
	jzero	%i0, %i0, cont.73079
else.73078:
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
cont.73079:
	fmul	%f2, %f1, %f7
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73082
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73084
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
	jzero	%i0, %i0, cont.73083
else.73084:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73086
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
	jzero	%i0, %i31, else.73088
	fmov	%f9, %f2
	jzero	%i0, %i0, cont.73089
else.73088:
	lf	%f1, 0(%i0)
	fsub	%f9, %f1, %f2
cont.73089:
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
	jzero	%i0, %i0, cont.73087
else.73086:
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
cont.73087:
cont.73085:
	jzero	%i0, %i0, cont.73083
else.73082:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73090
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
	jzero	%i0, %i31, else.73092
	fmov	%f9, %f2
	jzero	%i0, %i0, cont.73093
else.73092:
	lf	%f1, 0(%i0)
	fsub	%f9, %f1, %f2
cont.73093:
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
	jzero	%i0, %i0, cont.73091
else.73090:
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
cont.73091:
cont.73083:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f8, %f8
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f8, %f1
	fmul	%f1, %f1, %f3
	fmov	%f8, %f4
	fmov	%f4, %f1
	set_label	%i31, loop_start.67980
	jmp	%i0, 0(%i31)
then.73060:
	fmul	%f2, %f8, %f8
	fmul	%f1, %f4, %f4
	fadd	%f2, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	finv	%f1, %f3
	fmul	%f5, %f8, %f1
	finv	%f1, %f3
	fmul	%f4, %f4, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	slli	%i8, %i5, 2
	lw	%i7, 235(%i0)
	add	%i31, %i7, %i8
	lw	%i8, 0(%i31)
	slli	%i7, %i6, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	lw	%i7, 0(%i7)
	sf	%f5, 0(%i7)
	sf	%f4, 1(%i7)
	sf	%f1, 2(%i7)
	addi	%i7, %i6, 40
	slli	%i7, %i7, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	lw	%i7, 0(%i7)
	fneg	%f3, %f4
	sf	%f5, 0(%i7)
	sf	%f1, 1(%i7)
	sf	%f3, 2(%i7)
	addi	%i7, %i6, 80
	slli	%i7, %i7, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	lw	%i7, 0(%i7)
	fneg	%f2, %f5
	sf	%f1, 0(%i7)
	sf	%f2, 1(%i7)
	sf	%f3, 2(%i7)
	addi	%i7, %i6, 1
	slli	%i7, %i7, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	lw	%i7, 0(%i7)
	fneg	%f1, %f1
	sf	%f2, 0(%i7)
	sf	%f3, 1(%i7)
	sf	%f1, 2(%i7)
	addi	%i7, %i6, 41
	slli	%i7, %i7, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	lw	%i7, 0(%i7)
	sf	%f2, 0(%i7)
	sf	%f1, 1(%i7)
	sf	%f4, 2(%i7)
	addi	%i7, %i6, 81
	slli	%i7, %i7, 2
	add	%i31, %i8, %i7
	lw	%i7, 0(%i31)
	lw	%i7, 0(%i7)
	sf	%f1, 0(%i7)
	sf	%f5, 1(%i7)
	sf	%f4, 2(%i7)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.67981
loop_end.67981:
	mov	%i0, %i31
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f5, %f6, %f1
	mov	%i8, %i0
	fmov	%f6, %f0
	fmov	%f4, %f0
	addi	%i7, %i6, 2
	movi	%i9, 5
loop_start.68008:
	jleq	%i9, %i8, then.73095
	fmul	%f2, %f4, %f4
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f6, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f6, %f1
	jzero	%i0, %i31, else.73097
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f6
	jzero	%i0, %i31, else.73099
	fmul	%f4, %f6, %f6
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
	fmul	%f1, %f1, %f6
	jzero	%i0, %i0, cont.73098
else.73099:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f6
	fmul	%f6, %f2, %f1
	fmul	%f4, %f6, %f6
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
	fmul	%f2, %f1, %f6
	lf	%f1, 2(%i0)
	fadd	%f1, %f2, %f1
cont.73100:
	jzero	%i0, %i0, cont.73098
else.73097:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f6
	fmul	%f6, %f2, %f1
	fmul	%f4, %f6, %f6
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
	fmul	%f2, %f1, %f6
	lf	%f1, 1(%i0)
	fadd	%f1, %f2, %f1
cont.73098:
	fmul	%f2, %f1, %f5
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73101
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73103
	fmul	%f6, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f4, %f1, %f6
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f6
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f4, %f1
	fmul	%f4, %f1, %f2
	jzero	%i0, %i0, cont.73102
else.73103:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73105
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
	jzero	%i0, %i31, else.73107
	fmov	%f6, %f2
	jzero	%i0, %i0, cont.73108
else.73107:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
cont.73108:
	fmul	%f4, %f6, %f6
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
	fmul	%f4, %f1, %f6
	jzero	%i0, %i0, cont.73106
else.73105:
	lf	%f1, 3(%i0)
	fsub	%f6, %f1, %f2
	fmul	%f4, %f6, %f6
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
	fmul	%f4, %f1, %f6
cont.73106:
cont.73104:
	jzero	%i0, %i0, cont.73102
else.73101:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73109
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
	jzero	%i0, %i31, else.73111
	fmov	%f6, %f2
	jzero	%i0, %i0, cont.73112
else.73111:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
cont.73112:
	fmul	%f4, %f6, %f6
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
	fmul	%f4, %f1, %f6
	jzero	%i0, %i0, cont.73110
else.73109:
	lf	%f1, 0(%i0)
	fsub	%f6, %f1, %f2
	fmul	%f4, %f6, %f6
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
	fmul	%f4, %f1, %f6
cont.73110:
cont.73102:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f4, %f4
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f4, %f1
	fmul	%f4, %f1, %f3
	addi	%i8, %i8, 1
	fmul	%f2, %f4, %f4
	movui	%i31, 253132
	ori	%i31, %i31, -819
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f8, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fleq	%i31, %f8, %f1
	jzero	%i0, %i31, else.73113
	movui	%i31, 784384
	mif	%f1, %i31
	fleq	%i31, %f1, %f8
	jzero	%i0, %i31, else.73115
	fmul	%f6, %f8, %f8
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
	fmul	%f1, %f1, %f8
	jzero	%i0, %i0, cont.73114
else.73115:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f8
	fmul	%f8, %f2, %f1
	fmul	%f6, %f8, %f8
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
	fmul	%f2, %f1, %f8
	lf	%f1, 2(%i0)
	fadd	%f1, %f2, %f1
cont.73116:
	jzero	%i0, %i0, cont.73114
else.73113:
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f8
	fmul	%f8, %f2, %f1
	fmul	%f6, %f8, %f8
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
	fmul	%f2, %f1, %f8
	lf	%f1, 1(%i0)
	fadd	%f1, %f2, %f1
cont.73114:
	fmul	%f2, %f1, %f7
	lf	%f1, 1(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73117
	lf	%f1, 2(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73119
	fmul	%f8, %f2, %f2
	movui	%i31, 758819
	ori	%i31, %i31, 973
	mif	%f1, %i31
	fmul	%f6, %f1, %f8
	movui	%i31, 245891
	ori	%i31, %i31, 972
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f8
	movui	%i31, 778922
	ori	%i31, %i31, -2033
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f8
	movui	%i31, 260095
	ori	%i31, %i31, -13
	mif	%f1, %i31
	fadd	%f1, %f6, %f1
	fmul	%f6, %f1, %f2
	jzero	%i0, %i0, cont.73118
else.73119:
	lf	%f1, 3(%i0)
	fleq	%i31, %f2, %f1
	jzero	%i0, %i31, else.73121
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
	jzero	%i0, %i31, else.73123
	fmov	%f8, %f2
	jzero	%i0, %i0, cont.73124
else.73123:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
cont.73124:
	fmul	%f6, %f8, %f8
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
	fmul	%f6, %f1, %f8
	jzero	%i0, %i0, cont.73122
else.73121:
	lf	%f1, 3(%i0)
	fsub	%f8, %f1, %f2
	fmul	%f6, %f8, %f8
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
	fmul	%f6, %f1, %f8
cont.73122:
cont.73120:
	jzero	%i0, %i0, cont.73118
else.73117:
	lf	%f1, 0(%i0)
	fleq	%i31, %f1, %f2
	jzero	%i0, %i31, else.73125
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
	jzero	%i0, %i31, else.73127
	fmov	%f8, %f2
	jzero	%i0, %i0, cont.73128
else.73127:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
cont.73128:
	fmul	%f6, %f8, %f8
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
	fmul	%f6, %f1, %f8
	jzero	%i0, %i0, cont.73126
else.73125:
	lf	%f1, 0(%i0)
	fsub	%f8, %f1, %f2
	fmul	%f6, %f8, %f8
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
	fmul	%f6, %f1, %f8
cont.73126:
cont.73118:
	movui	%i31, 260096
	mif	%f2, %i31
	fmul	%f1, %f6, %f6
	fsub	%f1, %f2, %f1
	frsqrt	%f1, %f1
	fmul	%f1, %f6, %f1
	fmul	%f1, %f1, %f3
	fmov	%f6, %f4
	fmov	%f4, %f1
	set_label	%i31, loop_start.68008
	jmp	%i0, 0(%i31)
then.73095:
	fmul	%f2, %f6, %f6
	fmul	%f1, %f4, %f4
	fadd	%f2, %f2, %f1
	movui	%i31, 260096
	mif	%f1, %i31
	fadd	%f1, %f2, %f1
	frsqrt	%f1, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f1
	fmul	%f3, %f2, %f1
	finv	%f1, %f3
	fmul	%f5, %f6, %f1
	finv	%f1, %f3
	fmul	%f4, %f4, %f1
	movui	%i31, 260096
	mif	%f2, %i31
	finv	%f1, %f3
	fmul	%f1, %f2, %f1
	slli	%i9, %i5, 2
	lw	%i8, 235(%i0)
	add	%i31, %i8, %i9
	lw	%i9, 0(%i31)
	slli	%i8, %i7, 2
	add	%i31, %i9, %i8
	lw	%i8, 0(%i31)
	lw	%i8, 0(%i8)
	sf	%f5, 0(%i8)
	sf	%f4, 1(%i8)
	sf	%f1, 2(%i8)
	addi	%i8, %i7, 40
	slli	%i8, %i8, 2
	add	%i31, %i9, %i8
	lw	%i8, 0(%i31)
	lw	%i8, 0(%i8)
	fneg	%f3, %f4
	sf	%f5, 0(%i8)
	sf	%f1, 1(%i8)
	sf	%f3, 2(%i8)
	addi	%i8, %i7, 80
	slli	%i8, %i8, 2
	add	%i31, %i9, %i8
	lw	%i8, 0(%i31)
	lw	%i8, 0(%i8)
	fneg	%f2, %f5
	sf	%f1, 0(%i8)
	sf	%f2, 1(%i8)
	sf	%f3, 2(%i8)
	addi	%i8, %i7, 1
	slli	%i8, %i8, 2
	add	%i31, %i9, %i8
	lw	%i8, 0(%i31)
	lw	%i8, 0(%i8)
	fneg	%f1, %f1
	sf	%f2, 0(%i8)
	sf	%f3, 1(%i8)
	sf	%f1, 2(%i8)
	addi	%i8, %i7, 41
	slli	%i8, %i8, 2
	add	%i31, %i9, %i8
	lw	%i8, 0(%i31)
	lw	%i8, 0(%i8)
	sf	%f2, 0(%i8)
	sf	%f1, 1(%i8)
	sf	%f4, 2(%i8)
	addi	%i7, %i7, 81
	slli	%i7, %i7, 2
	add	%i31, %i9, %i7
	lw	%i7, 0(%i31)
	lw	%i7, 0(%i7)
	sf	%f1, 0(%i7)
	sf	%f5, 1(%i7)
	sf	%f4, 2(%i7)
	mov	%i31, %i0
	jzero	%i0, %i0, loop_end.68009
loop_end.68009:
	mov	%i0, %i31
	subi	%i7, %i4, 1
	addi	%i5, %i5, 1
	movi	%i4, 5
	jleq	%i4, %i5, then.73129
	jzero	%i0, %i0, cont.73130
then.73129:
	subi	%i5, %i5, 5
cont.73130:
	mov	%i4, %i7
cont.73058:
	set_label	%i30, loop_start.67978
	jmp	%i0, 0(%i30)
loop_end.67979:
	mov	%i4, %i31
	fmov	%f1, %f31
	mov	%i30, %i4
	fmov	%f30, %f1
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
min_caml_read_int:
	movui	%i5, 0xf0000
	lb	%i30, 0(%i5)
	slli	%i30, %i30, 8
	lb	%i31, 0(%i5)
	or	%i30, %i31, %i30
	slli	%i30, %i30, 8
	lb	%i31, 0(%i5)
	or	%i30, %i31, %i30
	slli	%i30, %i30, 8
	lb	%i31, 0(%i5)
	or	%i30, %i31, %i30
	jmp	%i0, 0(%i3)
min_caml_read_float:
	movui	%i5, 0xf0000
	lb	%i30, 0(%i5)
	slli	%i30, %i30, 8
	lb	%i31, 0(%i5)
	or	%i30, %i31, %i30
	slli	%i30, %i30, 8
	lb	%i31, 0(%i5)
	or	%i30, %i31, %i30
	slli	%i30, %i30, 8
	lb	%i31, 0(%i5)
	or	%i30, %i31, %i30
	mif	%f30, %i30
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
