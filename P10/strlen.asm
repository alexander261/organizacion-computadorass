section .text
    global strlen
strlen:
    push ebp
    mov ebp,esp

    mov eax,[ebp + 8]
    xor esi,esi

    CONTAR_LETRAS:

        mov ecx,[eax + esi]

        CMP ecx,0
            JE FIN_STRLEN
        
        inc esi

        JMP CONTAR_LETRAS
        
    FIN_STRLEN:

        mov eax,esi
        
        pop ebp
        ret