.data
display_ready_addr: 	.word 0xFFFF0008
display_register_addr:	.word 0xFFFF000C
register:		.word 0xFFFF0004
register_check_char:	.word 0xFFFF0000
respuesta:		.word 0x00000061
respuesta2:		.word 0x00000041
acierto:  .asciz "Acertaste!\n"
fallo:  .asciz "Fallaste!\n"
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
	la	a2, pregunta
	jal escribir

setup:
	la	t0, display_ready_addr
	lw	a0, 0(t0)
	la	t0, display_register_addr
	lw	a1, 0(t0)
	la	t0, register
	lw	s3, 0(t0)
	la	t0, respuesta
	lw	s4, 0(t0)
	la	t0, respuesta2
	lw	s6, 0(t0)
	
	# Comprobamos si el usuario ha escrito un caracter, en caso contrario volvemos hacia arriba para volver a leer y esperar que este introduzca uno.
	la	t0, register_check_char
	lw	s5, 0(t0)
	
	lw	t0, 0(s5)
	beq	t0, zero, setup
	
	# Comprobamos si el caracter escrito es la respuesta correcta
	lb	t0, 0(s3)
	beq	t0, s4, final
	
	lb	t0, 0(s3)
	beq	t0, s6, final

	# Comprobamos si el caracter escrito es la respuesta erronea
	lb	t0, 0(s3)
	bne	t0, s4, final2
	
	b setup
	
final:
	la	a2, acierto
	jal escribir
	
	# Terminate
	li	a7, 10
	ecall

final2:
	la	a2, fallo
	jal escribir
	
	# Terminate
	li	a7, 10
	ecall

