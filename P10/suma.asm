section .text
    global suma

suma:

    push ebp
    mov ebp,esp

    mov eax,[ebp + 8]
    add eax,[ebp + 12]

    pop ebp

    ret

;nasm –f elf suma.asm
;gcc –m32 –c test.c
;gcc –m32 suma.o test.o -o test
;nasm –f elf suma.asm

