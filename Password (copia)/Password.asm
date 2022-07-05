.data
display_ready_addr: 	.word 0xFFFF0008
display_register_addr:	.word 0xFFFF000C
register:		.word 0xFFFF0004
respuesta:		.word 0x00000061
acierto:  .asciz "Acertaste!\n"
pregunta: .asciz "Cual es la primera letra del abecedario? "

.text

	# a0 <- display ready bit addr
	# a1 <- display register addr
	# a2 <- pointer to string
	# a3 <- register byte
	la	t0, display_ready_addr
	lw	a0, 0(t0)
	la	t0, display_register_addr
	lw	a1, 0(t0)
	la	t0, register
	lw	a3, 0(t0)
	la	a2, pregunta
	jal escribir

setup:
	la	t0, display_ready_addr
	lw	a0, 0(t0)
	la	t0, display_register_addr
	lw	a1, 0(t0)
	la	t0, register
	lw	a3, 0(t0)
	la	t0, respuesta
	lw	a4, 0(t0)
	la	a2, acierto
	
	# Comprobamos si el caracter escrito es la respuesta correcta
	lb	t0, 0(a3)
	beq	t0, a4, final

	b setup
	
final:
	jal escribir
	
	# Terminate
	li	a7, 10
	ecall

