; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Convert hexadecimal to BCD
MOV AL, 42       ; Hex number to convert (42 decimal)
MOV AH, 0        ; Clear AH
MOV BL, 10       ; Divisor
DIV BL           ; Divide by 10, AL=quotient, AH=remainder
                 ; AL contains tens digit, AH contains ones digit
SHL AL, 4        ; Shift tens digit to upper nibble
OR AL, AH        ; Combine with ones digit
MOV BL, AL       ; Store BCD result in BL

ret