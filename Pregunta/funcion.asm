#--------------------------------------------
#-- Funcion de escribir:
#--   Entradas: a1: dirrecion registro pantalla
#--   Entradas: a3: registro
#--   Entradas: a5: registro checkear bit
#--------------------------------------------

.globl escribir
escribir:
	mv s0, a0
	mv s1, a1
	mv s2, a2
	b display_char

wait_for_ready:
	# while(ready_bit == 0);
	lw	t0, 0(s0)
	beq	t0, zero, wait_for_ready
	
display_char:
	# Comprobamos por el caracter nulo
	lb	t0, 0(s2)
	beq	t0, zero, end_of_string

	# Escribimos en la pantalla
	sw	t0, 0(s1)
	
	# Incrementamos la posicion
	addi	s2, s2, 1
	j	wait_for_ready
	
end_of_string:
	ret
	