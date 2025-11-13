%include "../LIB/pc_iox.inc"

;nasm -f elf ejercicios.asm && ld -m elf_i386 ejercicios.o ../LIB/libpc_iox.a ../LIB/pbin.o -o ejercicios && ./ejercicios

section .data

    message db "Hola Mundo",0
    message_activo db "Activa",0
    message_inactivo db "Inactiva",0

section .text
    global _start
_start:

    mov ebx,message
    call PRINT_MESSAGE
    call PRINT_SALTO_LINEA


    call INVERTIR_STR
    call PRINT_MESSAGE
    call PRINT_SALTO_LINEA


    mov cl,0
    mov al,0xAA
    call TEST_BIT


    mov edx,8
    call ES_PAR



    CMP al,1
        JE PRIN_ACTIVO
    
    mov ebx,message_inactivo
    JMP FIN

    PRIN_ACTIVO:
        mov ebx,message_activo

    FIN:
        call PRINT_MESSAGE

    mov eax,1 
    int 0x80

INVERTIR_STR:
    push esi
    push edi
    push ecx
    push edx
    call CONTADOR_STRING

    CMP esi,0
        JE FIN_INVERTIR_STR
    
    dec esi
    mov edi,0

    INVERTIR_CHAR:

        CMP edi,esi
            JAE FIN_INVERTIR_STR
        
        mov dl,[ebx + edi] ;Char Inicio
        mov cl,[ebx + esi] ;char Final

        mov [ebx + esi],dl
        mov [ebx + edi],cl

        inc edi
        dec esi

    JMP INVERTIR_CHAR

    FIN_INVERTIR_STR:
        pop edx
        pop ecx
        pop edi
        pop esi
        ret

CONTADOR_STRING:
    push eax
    mov esi,0

    COUNT:
        mov al,[ebx + esi]

        CMP al,0
            JE FIN_CONTADOR_STRING
        INC esi

    loop COUNT
    
    FIN_CONTADOR_STRING:
        pop eax
        ret

PRINT_MESSAGE:
    push ebx
    push esi

    mov esi,0

    PRINT_CHAR:

        mov al,[ebx + esi]
        CMP al,0
            JE FIN_PRINT_MESSAGE
        
        call putchar
        INC esi
        JMP PRINT_CHAR

    FIN_PRINT_MESSAGE:
        pop esi
        pop ebx
        ret

PRINT_SALTO_LINEA:
    push eax
    mov al,10
    call putchar
    pop eax
    ret

TEST_BIT:
    push eax
    
    CMP cl,0
        JB FIN_TEST_BI
    CMP cl,7
        JA FIN_TEST_BI
        
    ror al,cl

    FIN_TEST_BI:
        pop eax
        ret


ES_PAR:

    mov eax,1
    and eax,edx
        JZ PAR

    mov eax,0
    JMP FIN_ES_PAR
    
    PAR:
        mov eax,1

    FIN_ES_PAR:
        ret