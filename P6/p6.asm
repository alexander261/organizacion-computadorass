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
    mov ebx,0x5C4B2A60 ;Valor a sumar
    mov eax,0x2207511 ;Matricula

    add eax,ebx
    call pHex_dw ;resultado = 0x5E6B-9F71

    ;Guardamos el resultado de la suma en EBX
    mov ebx,eax

    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------
    
    ;------------------------------- INCISO B 
    ;Guardamos los 16bits menos significativos  de EBX en la pila 
    push bx ;resultado = 9F71

    ;------------------------------- INCISO C
    
    mov al,8
    mul bl
    call pHex_w ;resultado: AX=0388

    ;Guardamos el valor de la multiplicacion en la variable N 
    mov word[N],ax

    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------

    ;-------------------------------- INCISO D 
    ;Incrementamos el valor de N
    INC word[N]

    ;------------------------------- INCISO E
    mov dx,0
    mov ax,bx
    mov bx,0x00FF
    div bx ;AX = cociente y en DX = residuo

    call pHex_w ;Imprimir Cociente

    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------

    mov ax,dx
    call pHex_w ;Imprimir Residuo

    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------


    ;------------------------------- INCISO F y G
    ADD word[N],dx
    DEC word[N]
    
    ;Guardamos las banderas
    pushfd
    pop eax
    call pHex_dw ;Imprimir los valores de la pila
    ;Que banderas estan activas? al momento de usar INC y DEC
    ;Se actualizan todas las banderas a excepcion de la bandera de Acarreo
    

    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------
    
    ;------------------------------INCISO H
    pop ax
    call pHex_w

    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------


    ;Imprimimos el Valor de N
    mov ax,[N]
    ;call pHex_w
    ;------------- Salto de Linea
	mov al,10
	call putchar
    ;-------------


	mov	eax, 1
	int	0x80

section .data
    N dw 0