# Trabajo-RARS
Repositorio para la evaluacion extraordinaria de Arquitectura de computadores


## Ejecución programas
Para ejecutar los programas simplemente hay que seguir los siguientes pasos:
  - Activar la opcion de ensamblar todos los archivos del directorio.
  - Ensamblar el programa desde el directorio main, el que tiene nombre distinto de "funcion".
  - Abrir la herramienta Keyboard and Display MMIO simulator.
  - Conectarla al programa.
  - Ejecutar el programa.

## Programas:


### Pregunta.asm

#### Objetivo
Este programa tiene como funcioalidad buscar la respuesta correcta, una vez encontrada aparecera por la consola la palabra "Acertaste", si la respondes mal, aparecerá "Fallaste". 

#### Implementacion
Para realizar la implementacion de este simplemente necesitaba comparar dos registros, en uno tenia guardado la palabra y en otro el caracter que se esta escribiendo por el teclado. Una vez completado esta comprobacion simplemente escribo la palabra recorriendola byte a byte.

#### Funcionamiento
  - Escribir por el Keyboard del simulador la respuesta que creas que es la correcta.

##

### Write_the_same.asm

#### Objetivo.
Este programa tiene como funcionalidad escribir por la consola lo mismo que se escribe por la entrada del teclado.

#### Implementacion.
Para empezar necesitaba hacer una comprobacion para ver si se habia pulsado una tecla por el teclado para seguir avanzando en el teclado, esto es basicamente porque al escribir una letra el programa escribia infinitamente esta tecla porque nunca se reseteaba, una vez completada esta comprobacion pasamos al siguiente paso que es simplemente escribir el char por la consola.

#### Funcionamiento
  - Escribir por el teclado del simulador todos los caracteres que uno quiera.
  - Apareceran por pantalla seguidamente.

##

### Encriptado

#### Objetivo
El proposito de este programa es encriptar todo lo que se escribe por el teclado y mostralo por la consola.

#### Implementacion
La implementacion es una copia del write_the_same pero antes de mostrar el caracter le sumo 5 al registro. Es un encriptado muy sencillo pero para una simple demostración es suficiente. Se podrían implementar algoritmos mas dificiles para hacer el encriptado mas dificil de averiguar. 

#### Funcionamiento
 - Escribir lo que uno quiera y te dara un codigo en la consola encriptado.

##

### Desencriptado

#### Objetivo
Como su propio nombre dice es un programa que se basa en desencriptar lo que escribas, util para desencriptar lo escrito en el programa de encriptado.

#### Implementacion
La implementacion es simplemente hacer el algoritmo inverso al del encriptado, en nuestro caso como sumabamos 5, ahora restamos 5 antes de mostrar el caracter por la consola.

#### Funcionamiento
 Si has ejecutado el programa anterior y has guardado la salida de este:
  - Poner por el teclado los carácteres encriptados y te saldra el mensaje que habias puesto anteriormente.

##



- [Jose Manuel Tostado Felipe](https://github.com/Josetost)
