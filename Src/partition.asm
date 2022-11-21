[org 0x7e00]

mov bx, ReadPartSuccess
call Printing

jmp $

%include "printing.asm"

ReadPartSuccess:
    db 'Flixium-OS: Booting completed!   PartitionReading: Success!', 0

times 2048-($-$$) db 0