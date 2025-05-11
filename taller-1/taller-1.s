.data
mensaje: .asciz "%ld \n"

.text
.global _start
.extern printf

_start:
    movq %rsp, %rbp         # Guardar stack original
    andq $-16, %rsp         # Alinear stack a 16 bytes
    subq $8, %rsp           # Simular return address

    mov $1, %rax
    mov $1, %rbx

bucle:
    cmp $16, %rbx
    jge fin_bucle

    movq $mensaje, %rdi
    movq %rbx, %rsi
    xorq %rax, %rax         # Limpieza para printf
    call printf

    inc %rbx
    jmp bucle

fin_bucle:
    movq %rbp, %rsp         # Restaurar stack original

    mov $60, %rax
    xor %rdi, %rdi
    syscall

