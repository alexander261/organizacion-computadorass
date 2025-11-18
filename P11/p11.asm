;gcc -m32 main.c p11.o ../LIB/libpc_iox.a -o main
;nasm -f elf p11.asm

extern putchar

section .text
    global pBin8b
    global pBin16b
    global pBin32b

pBin8b:
    push ebp
    mov ebp,esp

    mov eax,[ebp + 8]
    shl eax,24

    mov ecx,8
    mov esi,0

    call PRINT_BITS

    pop ebp
    ret
pBin16b:
    push ebp
    mov ebp,esp

    mov eax,[ebp + 8]
    shl eax,16

    mov ecx,16
    mov esi,0

    call PRINT_BITS

    pop ebp
    ret

pBin32b:
    push ebp
    mov ebp,esp

    mov eax,[ebp + 8]

    mov ecx,32
    mov esi,0

    call PRINT_BITS

    pop ebp
    ret

myPutchar:
    push eax
    push ecx
    push edx

    push eax
    call putchar
    pop eax

    pop edx
    pop ecx
    pop eax
    ret


PRINT_BITS:

    IMPRIMIR_BIT:
        push ecx
        push eax

        inc esi
        mov ecx,esi
        
        
        shl eax,cl
            JC IMPRIMIR_UNO
        
        mov al,'0'
        JMP CONTINUAR_IMPRIMIR_BIT

        IMPRIMIR_UNO:
            mov al,'1'
        
    CONTINUAR_IMPRIMIR_BIT:
        call myPutchar
        
        pop eax
        pop ecx

        LOOP IMPRIMIR_BIT

ret