; post2b.asm - Ayala
ORG 100h
section .text
start:
    mov ax, 0B800h
    mov es, ax          ; Apuntar ES al segmento de video

    ; Fila 10, Col 35 -> Offset 1670
    mov di, 1670
    mov byte [es:di], 48h    ; 'H'
    mov byte [es:di+1], 0Fh  ; Blanco brillante

    ; Fila 11, Col 35 -> Offset 1830
    mov di, 1830
    mov byte [es:di], 4Fh    ; 'O'
    mov byte [es:di+1], 0Eh  ; Amarillo

    ; Fila 12, Col 35 -> Offset 1990
    mov di, 1990
    mov byte [es:di], 4Ch    ; 'L'
    mov byte [es:di+1], 0Ah  ; Verde claro

    ; Fila 13, Col 35 -> Offset 2150
    mov di, 2150
    mov byte [es:di], 41h    ; 'A'
    mov byte [es:di+1], 0Ch  ; Rojo claro

    mov ah, 07h
    int 21h
    mov ah, 4Ch
    int 21h