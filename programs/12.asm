; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Generate Fibonacci series
MOV CX, 10       ; Number of Fibonacci numbers to generate
MOV BX, 1000h    ; Starting address to store the series

MOV AX, 0        ; First Fibonacci number
MOV [BX], AX     ; Store first number
INC BX
INC BX          ; Move to next word

MOV AX, 1        ; Second Fibonacci number
MOV [BX], AX     ; Store second number
INC BX
INC BX          ; Move to next word

SUB CX, 2        ; Already stored 2 numbers

FIBONACCI_LOOP:
    MOV AX, [BX-2]  ; Get previous number
    MOV DX, [BX-4]  ; Get number before previous
    ADD AX, DX      ; Calculate next Fibonacci number
    MOV [BX], AX    ; Store the number
    ADD BX, 2       ; Move to next word
    LOOP FIBONACCI_LOOP

ret