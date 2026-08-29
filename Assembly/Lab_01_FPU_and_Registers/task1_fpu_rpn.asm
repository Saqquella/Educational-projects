section .data
    a: dd 0xc1600000   ; -14.0 в формате IEEE-754
    b: dd 0x40b80000   ; 5.75
    c: dd 0x41ba0000   ; 23.25
    r: dd 0            ; Результат: -459.1875

section .text
    global main
main:
    ; Вычисление выражения (a-b)*c в обратной польской нотации (ab-c*)
    fld dword [a]      ; Загрузка 'a' в стек FPU (st0)
    fld dword [b]      ; Загрузка 'b' в стек FPU (st0=b, st1=a)
    fsub               ; st0 = a - b
    fld dword [c]      ; Загрузка 'c'
    fmul               ; st0 = (a - b) * c
    fst dword [r]      ; Сохранение результата в память
    mov eax, dword [r]
    ret
