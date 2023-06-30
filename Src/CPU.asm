CPU_Detection:
    pushfd
    pop eax
    mov ecx, eax
    xor eax, 1 << 21

    push eax
    popfd

    pushfd
    pop eax

    push ecx
    popfd

    xor eax, ecx
    jz NoCPU

    ret

LongMode_Detection:
    mov eax, 0x80000001
    cpuid
    test edx, 1 << 29
    jz LongMode_Disable
    ret

LongMode_Disable:
    hlt     ;Long mode has disable

NoCPU:
    hlt     ;This CPU not supported