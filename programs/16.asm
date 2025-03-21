; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Transfer a string in forward direction
MOV SI, 1000h      ; Source string address
MOV DI, 2000h      ; Destination string address
CLD                ; Clear direction flag (forward direction)

TRANSFER_LOOP:
    LODSB          ; Load byte from SI into AL and increment SI
    CMP AL, 0      ; Check for null terminator
    JE DONE        ; If end of string, exit
    STOSB          ; Store AL to DI and increment DI
    JMP TRANSFER_LOOP

DONE:
    MOV AL, 0      ; Null terminator
    STOSB          ; Store null terminator at the end

ret