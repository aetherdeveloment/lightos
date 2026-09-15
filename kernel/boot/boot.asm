[org 0x7C00]
[bits 16]

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    mov si, msg_welcome
    call print_string

hang:
    cli
    hlt
    jmp hang

print_string:
    mov ah, 0x0E
.next_char:
    lodsb
    test al, al
    jz .done
    int 0x10
    jmp .next_char
.done:
    ret

msg_welcome db "LightOS v1.0 - Booting Kernel...", 0x0D, 0x0A, 0

times 510-($-$$) db 0
dw 0xAA55