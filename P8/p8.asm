
%include "../LIB/pc_iox.inc"

extern pBin_b
extern pBin_w
extern pBin_dw

; nasm -f elf p8.asm && ld -m elf_i386 -o P8 p8.o ../LIB/pbin.o  ../LIB/libpc_iox.a && ./P8

section .text
    global _start

_start:

    ;JMP INCISO_D

    INCISO_A:

        mov edx,msg_inciso_a
        call puts
        call getche
        
        
        CMP al,'0'
            JB FIN_INCISO_A ;Menor a cero 

        CMP al,'9'
            JA FIN_INCISO_A ;Mayor a 9

        CMP al,'4'
            JA FIN_INCISO_A ;Mayor a 4

        mov al,10
        call putchar

        mov edx,msg_correcto_inciso_a
        call puts

        FIN_INCISO_A:


    INCISO_B:
        mov edx,msg_inciso_b
        call puts
        call getche
        
        mov bl,al

        mov al,10
        call putchar

        CMP bl,'0'
            JB FIN_INCISO_B ;Menor a cero 

        CMP bl,'9'
            JA VERIFICAR_LETRA_B ;Mayor a 9

        mov edx,msg_numero_inciso_b
        call puts
        JMP FIN_INCISO_B

        VERIFICAR_LETRA_B:
            CMP bl,'A'
                JB FIN_INCISO_B ;Es menor a 'A'

            CMP bl,'Z'
                JA FIN_INCISO_B ; Es mayor a 'Z' 
            
            mov edx,msg_letra_inciso_b
            call puts
            
        FIN_INCISO_B:


    INCISO_C:

        mov cx,5
        mov si,0
        MOSTRAR_C:
            push cx

            inc si
            mov cx,si
            
            IMPRIMIR_VALOR_CX:
                mov al,'*'
                call putchar
            LOOP IMPRIMIR_VALOR_CX
            
            mov al,10
            call putchar

            pop cx
        LOOP MOSTRAR_C

    FIN_INCISO_C:


    INCISO_D:
        mov edx,msg_inciso_d
        call puts

        mov cx,10
        mov esi,0
        

        PEDIR_DATOS_D:
            call getche

            mov ebx,msg_lista_d         
            mov [ebx + esi],al
            INC esi

        LOOP PEDIR_DATOS_D


        mov edx,msg_titulo_d
        call puts

        mov cx,10
        mov esi,0


        mov al,10
        call putchar
        
        mov ebx,msg_lista_d

        MOSTRAR_DATOS_D:

            mov al,[ebx + esi]
            call putchar
            
            mov al,10
            call putchar

            INC esi

        LOOP MOSTRAR_DATOS_D

    FIN_INCISO_D:


    mov eax,1
    int 0x80

section .data
    msg_inciso_a	db  'Ingrese un numero del 0 al 9',0xa,0
    msg_correcto_inciso_a db 'El valor es menor a 5',0xa,0

    msg_inciso_b db 'Ingrese un caracter en el rango [0-9] y [A - Z]',0xa,0
    msg_letra_inciso_b db 'El caracter ingresado es Letra',0xa,0
    msg_numero_inciso_b db 'El caracter ingresado es Numero',0xa,0
    
    msg_inciso_d db 'Ingrese 10 caracteres',0xa,0
    msg_titulo_d db 'Lista de caracteres almacenados',0xa,0
    msg_lista_d db '0123456789',0xa,0

    msg_fin db 'FIN PROGRAMA',0xa,0

