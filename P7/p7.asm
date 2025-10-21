
%include "../LIB/pc_iox.inc"

extern pBin_b
extern pBin_w
extern pBin_dw


; nasm -f elf p7.asm
; ld -m elf_i386 -o P7 p7.o ../LIB/pbin.o  ../LIB/libpc_iox.a
; ./P7
; nasm -f elf p7.asm && ld -m elf_i386 -o P7 p7.o ../LIB/pbin.o  ../LIB/libpc_iox.a && ./P7
section .text
    global _start

_start:

    ;----------------------------------------- INCISO A

    mov eax,0x22446688
    ror eax,4
    call pBin_dw

    mov al,10
    call putchar
    ;----------------------------------------- INCISO B 

    mov ax,0x3F48
    shl ax,3
    call pBin_w

    mov al,10
    call putchar

    ;----------------------------------------- INCISO C

    ;bits	0,	5,	13,	18	y	30
    ;0010-0000-1101-0110-1000-0101-1111-0011 ;Valor original
    ;0100-0000-0000-0100-0010-0000-0010-0001 ;XOR

    mov esi,0x20D685F3
    mov eax,0x40042021
    xor esi,eax

    ;----------------------------------------- INCISO D

    push esi
    mov eax,esi
    call pBin_dw

    mov al,10
    call putchar
    ;----------------------------------------- INCISO E

    ;1010-0111 Valor 0xA7
    ;0100-1000 

    mov ch,0xA7
    mov al,0x48
    xor al,ch

    call pBin_b

    mov al,10
    call putchar

    ;----------------------------------------- INCISO F
    ;	1,	4,	6,	10	y	14 Bits 

    ;0110-0111-1101-1010 ;Valor original
    ;0100-0100-0101-0010

    mov BP,0x67DA
    mov ax,0x4452
    xor ax,BP

    call pBin_w
    
    ;mov Bp,ax ;0x2388

    mov al,10
    call putchar
    ;----------------------------------------- INCISO G

    mov Bp,0x2388
    shr bp,3
    mov ax,bp
    call pBin_w


    mov al,10
    call putchar
    ;----------------------------------------- INCISO H

    mov ebx,0x0000AAAA
    shr ebx,5
    mov eax,ebx
    call pBin_dw

    mov al,10
    call putchar
    ;----------------------------------------- INCISO I

    mov cx,0x3F48
    shl cx,3
    mov ax,cx
    call pBin_w

    mov al,10
    call putchar
    ;----------------------------------------- INCISO J

    pop esi

    ;----------------------------------------- INCISO K

    shl esi,3
    shl esi,1
    mov eax,esi
    call pBin_dw

    mov al,10
    call putchar
    ;--------------------------------------------------
    mov eax,1
    int 0x80
section .data
