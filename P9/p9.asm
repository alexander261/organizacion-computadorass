
%include "../LIB/pc_iox.inc"

extern pBin_b
extern pBin_w
extern pBin_dw

; nasm -f elf p9.asm && ld -m elf_i386 -o P9 p9.o ../LIB/pbin.o  ../LIB/libpc_iox.a && ./P9
section .data
    N equ 3
    vector1 times N db 0
    vector2 times N db 0

section .text
    global _start

_start:
        
    mov ecx,N

    mov ebx,vector1
    call CAPTURAR_VECTOR
    call PRINT_SALTO_DE_LINEA
    
    mov ebx,vector2
    call CAPTURAR_VECTOR
    call PRINT_SALTO_DE_LINEA
    call PRINT_SALTO_DE_LINEA

    mov ebx,vector1
    mov edx,vector2

    call SUMAR_VECTOR
    call MOSTRAR_NUMEROS_VECTOR


    call PRINT_SALTO_DE_LINEA
    call PRODUCTO_ESCALAR_VECTOR
    call PRINT_SALTO_DE_LINEA

    mov eax,1
    int 0x80
        
        PRINT_SALTO_DE_LINEA:
            push eax
            
            mov al,10
            call putchar

            pop eax
            ret

        SUMAR_VECTOR:

            push ecx
            push eax
            push esi
            
            xor esi,esi

            NUMERO_SUMAR_VECTOR:

                ; (x1 + x2 + ...), (y1 + y2 +...)
                mov al,[edx + esi]
                add [ebx + esi],al
                inc esi

                loop NUMERO_SUMAR_VECTOR
        
            FIN_SUMAR_VECTOR:
                pop esi
                pop eax
                pop ecx

        ret

    MOSTRAR_NUMEROS_VECTOR:

        push ecx
        push eax
        push esi

        CMP ecx,0
            JB FIN_MOSTRAR_NUMEROS_VECTOR
        CMP ecx,10
            JA FIN_MOSTRAR_NUMEROS_VECTOR

        MOSTRAR_NUMERO_VECTOR:
            mov al,[ebx + esi]
            call pHex_b        
            inc esi
            mov al,10
            call putchar
            loop MOSTRAR_NUMERO_VECTOR
        
        FIN_MOSTRAR_NUMEROS_VECTOR:
            pop esi
            pop eax
            pop ecx

        ret

    CAPTURAR_VECTOR:

        push ecx
        push eax
        push esi

        CMP ecx,0
            JB FIN_CAPTURAR_VECTOR
        CMP ecx,10
            JA FIN_CAPTURAR_VECTOR
        

        PEDIR_NUMEROS_VECTOR:
            call getch
            CMP al,'9'
                JA PEDIR_NUMEROS_VECTOR ;es mayor a '9'
            CMP al,'0'
                JB PEDIR_NUMEROS_VECTOR ; Es menor a '0'
            call putchar
            sub al,'0'
            mov [ebx + esi],al
            inc esi
            loop PEDIR_NUMEROS_VECTOR
    
        FIN_CAPTURAR_VECTOR:
            pop esi
            pop eax
            pop ecx

    ret


    PRODUCTO_ESCALAR_VECTOR:

        push ecx
        push esi

        xor esi,esi

        SUMAR_VALOR:

            add eax,[ebx + esi]
            inc esi

            loop SUMAR_VALOR

        call pHex_b

        pop esi
        pop ecx

    ret