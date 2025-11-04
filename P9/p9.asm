
%include "../LIB/pc_iox.inc"

extern pBin_b
extern pBin_w
extern pBin_dw

; nasm -f elf p9.asm && ld -m elf_i386 -o P9 p9.o ../LIB/pbin.o  ../LIB/libpc_iox.a && ./P9
section .data
    N equ 2
    vector1 times 10 db 0
    vector2 times 10 db 0

section .text
    global _start

_start:
        
    mov ebx,vector1
    mov ecx,N
    mov esi,0
    call PEDIR_NUMEROS_VECTOR

    mov al,10
    call putchar


    mov ebx,vector2
    mov ecx,N
    mov esi,0
    call PEDIR_NUMEROS_VECTOR


    mov al,10
    call putchar


    mov ebx,vector1
    mov edx,vector2
    mov ecx,N
            mov esi,0

    call NUMEROS_VECTORES_SUMAR


    mov al,10
    call putchar


    mov ebx,vector1
    mov esi,0
    mov ecx,N
    call MOSTRAR_NUMEROS_VECTOR

    mov al,10
    call putchar

    mov eax,1
    int 0x80
        
        NUMEROS_VECTORES_SUMAR:

            push ebx
            push edx
            push ecx

            ; (x1 + x2 + ...), (y1 + y2 +...)
            mov eax,[ebx + esi] ; X1
            mov ebx,[edx + esi] ; X2

            add eax,ebx

            pop ecx
            pop edx
            pop ebx

            mov [ebx + esi],eax
            inc esi

            loop NUMEROS_VECTORES_SUMAR
        
        ret

    MOSTRAR_NUMEROS_VECTOR:
        mov al,[ebx + esi]
        call pHex_b        
        inc esi
        mov al,10
        call putchar
        loop MOSTRAR_NUMEROS_VECTOR
        ret

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
        ret

