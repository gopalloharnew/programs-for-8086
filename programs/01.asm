; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Subtraction of two 8-bit numbers
MOV AL, 45     ; First number in AL
MOV BL, 30     ; Second number in BL
SUB AL, BL     ; AL = AL - BL
MOV CL, AL     ; Store result in CL

ret