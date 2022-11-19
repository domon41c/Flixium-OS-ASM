[org 0x7c00]

mov bp, 0x7c00
mov sp, bp

mov bx, String
call Printing

jmp $

Printing:
    mov ah, 0x0e
    .Loop:
    cmp [bx], byte 0
    je .Exit
        mov al, [bx]
        int 0x10
        inc bx
        jmp .Loop
    .Exit:
    ret

String:
    db 'Flixium-OS: Booting completed!',0

times 510-($-$$) db 0 

dw 0xaa55      