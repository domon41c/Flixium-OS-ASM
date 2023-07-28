gdt_null:
    dd 0
    dd 0

gdt_code:
    dw 0xFFFF       ;Limit
    dw 0x0000       ;Low
    db 0x00         ;Medium  
    db 10011010b    ;Flags
    db 11001111b    ;Flags and limit
    db 0x00         ;High

gdt_data:
    dw 0xFFFF       ;Limit
    dw 0x0000       ;Low
    db 0x00         ;Medium
    db 10010010b    ;Flags
    db 11001111b    ;Flags and limit
    db 0x00         ;High

gdt_end:

gdt_criptor:
    gdt_size:
        dw gdt_end - gdt_null - 1
        dq gdt_null

code equ gdt_code - gdt_null
data equ gdt_data - gdt_null

[bits 32]

EditGDT:
    mov [gdt_code + 6], byte 10101111b
    mov [gdt_code + 6], byte 10101111b
    ret

[bits 16]



