; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Multiplication of two 8-bit numbers
MOV AL, 12        ; First number
MOV BL, 15        ; Second number
MUL BL            ; AX = AL * BL (result in AX)
MOV CX, AX        ; Store result in CX

ret