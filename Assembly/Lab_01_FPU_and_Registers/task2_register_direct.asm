section .data
    a db 12
    b db 22
    c db 6
    result dw 0

section .text
    global main
main:
    mov ebp, esp       ; Настройка кадра стека для отладки
    
    ; Зануление регистров (очистка верхних разрядов)
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx

    mov al, [a]        ; Загружаем a (12)
    mov bl, [b]        ; Загружаем b (22)
    sub al, bl         ; AL = 12 - 22 = -10 (0xF6)
    
    mov cl, [c]        ; Загружаем c (6)
    imul cl            ; AX = AL * CL (-10 * 6 = -60 / 0xFFC4)
    
    mov [result], ax   ; Сохраняем результат
    ret