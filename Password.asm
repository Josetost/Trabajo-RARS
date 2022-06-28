.data
display_ready_addr: 	.word 0xFFFF0008
display_register_addr:	.word 0xFFFF000C
register:		.word 0xFFFF0004
password:		.word 0x00000061
string:	.asciz "Acertaste!\n"

.text
setup:
	# s0 <- display ready bit addr
	# s1 <- display register addr
	# s2 <- pointer to string
	# s3 <- register byte
	la	t0, display_ready_addr
	lw	s0, 0(t0)
	la	t0, display_register_addr
	lw	s1, 0(t0)
	la	t0, register
	lw	s3, 0(t0)
	la	t0, password
	lw	s4, 0(t0)
	la	s2, string
	
	# Check if the character given is equal to the "password"
	lb	t0, 0(s3)
	beq	t0, s4, display_char
	b setup
	
wait_for_ready:
	# while(ready_bit == 0);
	lw	t0, 0(s0)
	beq	t0, zero, wait_for_ready
	
display_char:
	# Check for null character
	lb	t0, 0(s2)
	beq	t0, zero, end_of_string

	# Write to display
	sw	t0, 0(s1)
	
	# Increment string pointer
	addi	s2, s2, 1
	j	wait_for_ready
	
end_of_string:
	# Terminate
	li	a7, 10
	ecall
