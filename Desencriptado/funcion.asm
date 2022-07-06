#--------------------------------------------
#-- Funcion de escribir:
#--   Entradas: a1: dirrecion registro pantalla
#--   Entradas: a3: registro
#--   Entradas: a5: registro checkear bit
#--------------------------------------------

.globl escribir

escribir:
	# Mover los datos a otros registros
	mv s1, a1
	mv s2, a2
	mv s3, a3
	
wait_for_ready:
	# Mientras que no se haya vuelto a escribir 
	lw	t0, 0(s3)
	beq	t0, zero, wait_for_ready
	
display_char:
	# Comrpobar caracter nulo
	lb	t0, 0(s2)
	beq	t0, zero, end_of_string

	# Escribirmos en la pantalla
	addi	t0, t0, -5
	sw	t0, 0(s1)

	# Repetimos
	j	wait_for_ready
	
end_of_string:
	ret	
