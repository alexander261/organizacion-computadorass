%include "../LIB/pc_iox.inc"

; nasm -f elf p6.asm
; ld -m elf_i386 -o P6 p6.o ../LIB/libpc_iox.a 
; ./P6
;nasm -f elf p6.asm && ld -m elf_i386 -o P6 p6.o ../LIB/libpc_iox.a && ./P6

section .text
    global _start

_start:
    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------


    ;------------------------------- INCISO A
    ;mov eax,0x12345678

    mov ebx,0x00000001
    mov eax,0x11111110

    add eax,ebx
    call pHex_dw  

    ;Guardamos el resultado de la suma en EBX
    mov ebx,eax

    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------
    
    ;------------------------------- INCISO B 
    ;Guardamos los 16bits menos significativos  de EBX en la pila 
    push bx

    ;------------------------------- INCISO C
    mov al,3
    mul bl
    call pHex_dw

    ;Guardamos el valor de la multiplicacion en la variable N 
    mov word[N],ax

    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------


    ;Incrementamos el valor de N
    INC word[N]
    mov ax,[N]
    call pHex_dw


    mov eax,1
    int 0x80

section .data
N dw 0