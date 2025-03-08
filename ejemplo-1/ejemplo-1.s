

.globl _start

 .text

 _start:

	mov $0x3F, %al
	mov $0xF3, %ah

	# Salir al sistema
	mov $60, %rax 	 # 60 es la funcion exit
	xor %rdi, %rdi	 # rdi = 0
	syscall

