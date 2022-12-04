[org 0x7c00]

mov [BOOT_PART], dl
mov bp, 0x7c00
mov sp, bp

call ReadPart

jmp PROGRAM_SPACE

%include "printing.asm"
%include "FileReader.asm"

times 510-($-$$) db 0 

dw 0xaa55      