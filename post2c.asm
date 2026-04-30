; post2c.asm - Ayala
ORG 100h
section .text
start:
    mov ax, 0B800h
    mov es, ax
    
    ; AH = fondo azul (1) texto blanco (7) -> 17h
    ; AL = espacio (20h)
    mov ax, 1720h
    xor di, di
    mov cx, 2000        ; 80x25
    cld                 ; Dirección hacia adelante
    rep stosw           ; ¡Pintar todo!

    ; Escribir mensaje centrado (Fila 12, Col 30 -> Offset 1980)
    mov di, 1980
    mov si, titulo
.bucle:
    lodsb               ; Cargar AL, SI++
    or al, al
    jz .fin
    mov ah, 0Fh         ; Atributo blanco
    stosw               ; Guardar AX en ES:DI, DI+=2
    jmp .bucle

.fin:
    mov ah, 07h
    int 21h
    mov ah, 4Ch
    int 21h

titulo db "HOLA DESDE B800h", 0