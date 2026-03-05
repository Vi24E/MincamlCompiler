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
	mov	%vi1, %i0
	sw	%vi1, 0(%i0)
	print_debug	1
	mov	%vi2, %i0
	sw	%vi2, 4(%i0)
	mov	%vi3, %i0
	sw	%vi3, 8(%i0)
	mov	%vi4, %i0
	sw	%vi4, 12(%i0)
	.virtual_def	%vi7, %vi10
	jeq	%i0, %i0, then.473
	movi	%vi8, 2
	mov	%vi3, %vi8
	mov	%vi9, %vi8
	mov	%vi10, %vi9
	set_label	%i31, cont.474
	jmp	%i0, 0(%i31)
then.473:
	movi	%vi5, 1
	mov	%vi3, %vi5
	mov	%vi6, %vi5
	mov	%vi7, %vi6
cont.474:
	.virtual_def	%vi7, %vi10
	jeq	%i0, %i0, then.475
	mov	%vi11, %i0
	set_label	%i31, cont.476
	jmp	%i0, 0(%i31)
then.475:
	movi	%vi11, 1
cont.476:
	sw	%vi11, 16(%i0)
	tern	%vi12, %vi11, %vi7, %vi10
	sw	%vi12, 20(%i0)
fin:
	set_label	%i31, fin
	jmp	%i0, 0(%i31)
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
