; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Convert ASCII character to HEX
MOV AL, 'A'      ; ASCII character to convert

CMP AL, '0'      ; Check if it's a digit
JB DONE          ; If below '0', invalid
CMP AL, '9'      ; Check if it's a digit
JBE DIGIT        ; If '0'-'9', convert as digit

CMP AL, 'A'      ; Check if it's uppercase letter
JB DONE          ; If below 'A', invalid
CMP AL, 'F'      ; Check if it's uppercase letter
JBE UPPER        ; If 'A'-'F', convert as uppercase

CMP AL, 'a'      ; Check if it's lowercase letter
JB DONE          ; If below 'a', invalid
CMP AL, 'f'      ; Check if it's lowercase letter
JBE LOWER        ; If 'a'-'f', convert as lowercase
JMP DONE         ; Otherwise invalid

DIGIT:
    SUB AL, 30h  ; Convert digit ASCII to HEX
    JMP DONE

UPPER:
    SUB AL, 37h  ; Convert uppercase ASCII to HEX (A=10, B=11, etc.)
    JMP DONE

LOWER:
    SUB AL, 57h  ; Convert lowercase ASCII to HEX (a=10, b=11, etc.)

DONE:
    MOV BL, AL   ; Store result in BL

ret