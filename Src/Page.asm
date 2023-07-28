PageEntry equ 0x1000

Paging:
    mov edi, PageEntry
    mov cr3, edi

    mov dword [edi], 0x2003
    add edi, 0x1000

    mov dword [edi], 0x3003
    add edi, 0x1000

    mov dword [edi], 0x4003
    add edi, 0x1000

    mov ebx, 0x00000003
    mov ecx, 512

    .GetEntry:
        mov dword [edi], ebx
        add ebx, 0x1000
        add edi, 8
        Loop .GetEntry

    mov eax, cr4
    or eax, 1 << 5
    mov cr4, eax

    mov ecx, 0xC0000080
    rdmsr
    or eax, 1 << 8
    wrmsr

    mov eax, cr0
    or eax, 1 << 31
    mov cr0, eax  

    ret