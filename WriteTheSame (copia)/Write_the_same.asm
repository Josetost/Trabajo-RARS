.data
display_register_addr:	.word 0xFFFF000C
register:		.word 0xFFFF0004
register_check_char:	.word 0xFFFF0000

.text
setup:
	# s1 <- display register addr
	# s2 <- pointer to string
	# s5 <- register_check_char
	la	t0, display_register_addr
	lw	a1, 0(t0)
	la	t0, register
	lw	a2, 0(t0)
	la	t0, register_check_char
	lw	a3, 0(t0)
	
	jal escribir
	b setup
	
