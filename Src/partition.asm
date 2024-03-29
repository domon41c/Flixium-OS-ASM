
jmp StartProtectMode

%include "GDT.asm"
%include "printing.asm"

StartProtectMode:
    call StartA20
    cli
    lgdt [gdt_criptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp code:LaunchProtectMode

StartA20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

[bits 32]

%include "CPU.asm"
%include "Page.asm"

LaunchProtectMode:

    mov ax, data
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    mov [0xb8000], byte 'F'
    mov [0xb8002], byte 'l'
    mov [0xb8004], byte 'i'
    mov [0xb8006], byte 'x'
    mov [0xb8008], byte 'i'
    mov [0xb800a], byte 'u'
    mov [0xb800c], byte 'm'
    mov [0xb800e], byte '-'
    mov [0xb800e], byte '-'
    mov [0xb8010], byte 'O'
    mov [0xb8012], byte 'S'
    mov [0xb8014], byte ' '

    call CPU_Detection
    call LongMode_Detection
    call Paging
    call EditGDT
    jmp code:Open_64bit

[bits 64]
[extern _start]

%include "IDT.asm"

Open_64bit:
    mov edi, 0xb8000
    mov rax, 0x1f201f201f201f20
    mov ecx, 500
    rep stosq
    call _start
    jmp $

times 2048-($-$$) db 0