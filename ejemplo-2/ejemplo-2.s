
.data
mensaje: .asciz "%ld \n"	# Cadena de formato para imprimir un número largo

.text
.global main
.extern printf		# Declaración de la función printf de la libc

main:

  subq $8, %rsp		# Alineacion de datos

  mov $4, %rax		# rax = 4
  mov $15, %rbx		# rbx = 15
  add %rbx, %rax	# rax = rax + rbx

  # Bloque de impresión
  movq $mensaje, %rdi		# Dirección de la cadena de formato en rdi
  movq %rax, %rsi		# El valor de rax se pasa a rsi para printf
  xorq %rax, %rax
  call printf			# Llamada a printf

  addq $8, %rsp

  # Finaliza el programa
  mov $60, %rax		# syscall para exit
  mov $0, %rdi		# Código de salida 0 (indica éxito)
  syscall		# Llamada al sistema
