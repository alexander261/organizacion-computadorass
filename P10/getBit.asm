section .text
    global getBit
getBit:
    push ebp
    mov ebp,esp

    mov cl,[ebp + 8] ; numero bit
    mov eax,[ebp + 12] ;valor

    shl eax,cl
    add eax,1

    pop ebp
    ret