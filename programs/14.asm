; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Separate odd and even numbers
MOV SI, 1000h     ; Source array address
MOV DI, 2000h     ; Even numbers destination
MOV BX, 3000h     ; Odd numbers destination
MOV CX, 10        ; Number of elements to process

SEPARATE_LOOP:
    MOV AL, [SI]   ; Get current number
    TEST AL, 1     ; Test if odd (LSB = 1)
    JNZ ODD_NUMBER ; If odd, jump
    
    ; Even number
    MOV [DI], AL   ; Store in even array
    INC DI         ; Next position in even array
    JMP CONTINUE
    
ODD_NUMBER:
    MOV [BX], AL   ; Store in odd array
    INC BX         ; Next position in odd array
    
CONTINUE:
    INC SI         ; Next number in source array
    LOOP SEPARATE_LOOP

ret