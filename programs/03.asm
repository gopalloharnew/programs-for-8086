; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Move data block with overlap (backward copy)
MOV SI, 1000h      ; Source base address (location X)
MOV DI, 1005h      ; Destination base address (location Y)
MOV CX, 10         ; Number of bytes to move

; Set up for backward copy (start from end of blocks)
ADD SI, CX        ; Point to end of source block
DEC SI            ; Last byte of source
ADD DI, CX        ; Point to end of destination block
DEC DI            ; Last byte of destination

LOOP_START:
    MOV AL, [SI]   ; Load byte from source
    MOV [DI], AL   ; Store byte to destination
    DEC SI         ; Previous source byte
    DEC DI         ; Previous destination byte
    LOOP LOOP_START ; Decrement CX and repeat until CX=0

ret