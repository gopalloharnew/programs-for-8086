; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Division of two 8-bit numbers
MOV AX, 144      ; Dividend in AX (16-bit to handle larger results)
MOV BL, 12       ; Divisor in BL
DIV BL           ; Divide AX by BL
                 ; AL = Quotient, AH = Remainder
MOV CL, AL       ; Store quotient in CL
MOV CH, AH       ; Store remainder in CH

ret