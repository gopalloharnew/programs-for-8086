; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Move data block without overlap
MOV SI, 1000h      ; Source index (location X)
MOV DI, 2000h      ; Destination index (location Y)
MOV CX, 10         ; Number of bytes to move

LOOP_START:
    MOV AL, [SI]   ; Load byte from source
    MOV [DI], AL   ; Store byte to destination
    INC SI         ; Next source byte
    INC DI         ; Next destination byte
    LOOP LOOP_START ; Decrement CX and repeat until CX=0

ret