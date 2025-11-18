%include "../LIB/pc_iox.inc"
;gcc -m32 main.c p11.o ../LIB/libpc_iox.a -o main
;nasm -f elf p11.asm

section .text
    global pBin8b
pBin8b:
    push ebp
    mov ebp,esp

    mov eax,10 ;Valor prueba
    mov ecx,32 ;iteraciones prueba
    mov esi,0


    push ecx
    
    mov ebx,32
    sub ebx,ecx ;Diferencia
    
    mov ecx,ebx
    shl eax,cl
    
    pop ecx

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
        call putchar
        
        pop eax
        pop ecx

        LOOP IMPRIMIR_BIT

    pop ebp
    ret