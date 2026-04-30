; post2a.asm - Ayala
ORG 100h
section .data
    prompt db "Pulse una tecla (ESC para salir): $"
    msgScan db " Scan: $"
    msgAscii db " ASCII: $"
    crlf db 0Dh, 0Ah, "$"

section .text
start:
    mov ah, 09h
    mov dx, prompt
    int 21h

.leer:
    mov ah, 00h
    int 16h             ; AH = scan code, AL = ASCII
    mov bl, ah          ; Guardar scan
    mov bh, al          ; Guardar ASCII

    cmp bl, 01h         ; ¿Es ESC?
    je .fin

    mov ah, 09h
    mov dx, msgScan
    int 21h
    mov al, bl
    call impHex         ; Mostrar scan en hex

    mov ah, 09h
    mov dx, msgAscii
    int 21h
    mov al, bh
    call impHex         ; Mostrar ASCII en hex

    mov ah, 09h
    mov dx, crlf
    int 21h
    jmp .leer

.fin:
    mov ah, 4Ch
    xor al, al
    int 21h

; --- Subrutina: imprime AL como 2 dígitos hexadecimales ---
impHex:
    push ax
    mov ah, al
    shr al, 4           ; Nibble alto
    call nibbleToChar
    mov dl, al
    mov ah, 02h
    int 21h
    pop ax
    and al, 0Fh         ; Nibble bajo
    call nibbleToChar
    mov dl, al
    mov ah, 02h
    int 21h
    ret

nibbleToChar:
    cmp al, 9
    jle .digit
    add al, 37h
    ret
.digit:
    add al, 30h
    ret