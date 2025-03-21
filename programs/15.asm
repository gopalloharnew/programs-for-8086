; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Separate positive and negative numbers
MOV SI, 1000h     ; Source array address
MOV DI, 2000h     ; Positive numbers destination
MOV BX, 3000h     ; Negative numbers destination
MOV CX, 10        ; Number of elements to process

SEPARATE_LOOP:
    MOV AL, [SI]   ; Get current number
    TEST AL, 80h   ; Test if negative (MSB = 1)
    JNZ NEG_NUMBER ; If negative, jump
    
    ; Positive number
    MOV [DI], AL   ; Store in positive array
    INC DI         ; Next position in positive array
    JMP CONTINUE
    
NEG_NUMBER:
    MOV [BX], AL   ; Store in negative array
    INC BX         ; Next position in negative array
    
CONTINUE:
    INC SI         ; Next number in source array
    LOOP SEPARATE_LOOP

ret