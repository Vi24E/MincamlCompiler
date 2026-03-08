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

.global min_caml_fabs
min_caml_fabs:
    fabs %f30, %f1
    jmp	%i0, 0(%i3)
