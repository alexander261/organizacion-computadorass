%include "../LIB/pc_io.inc"

; nasm -f elf p5b.asm 
;ld -m elf_i386 -o P5 p5b.o ../LIB/libpc_io.a & ./P5

section	.text
	global _start
	
_start:                   
	mov edx, msg
	call puts

    mov eax, msg + 23
    mov byte [eax], 'X'

    mov edx,msg
    call puts

	mov	eax, 1
	int	0x80

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 


