%include "../LIB/pc_io.inc"  	

section	.text
	global _start       
	
_start:                   
	mov edx, msg		
	call puts			


    mov ebx, msg
    mov esi, 9
    mov byte [ebx + esi * 2 + 1],'%'

	mov edx, msg		
	call puts			


	mov	eax, 1	    	
	int	0x80        	

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 

