; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Convert HEX number to ASCII
MOV AL, 3Bh      ; Hex number to convert

; Convert upper nibble to ASCII
MOV BL, AL       ; Copy to BL
SHR BL, 4        ; Shift right to get upper nibble
CMP BL, 9        ; Compare with 9
JBE DIGIT1       ; If <= 9, it's a digit
ADD BL, 37h      ; Convert to ASCII A-F
JMP NEXT

DIGIT1:
    ADD BL, 30h  ; Convert to ASCII 0-9

NEXT:
    ; Convert lower nibble to ASCII
    MOV BH, AL   ; Copy to BH
    AND BH, 0Fh  ; Mask to get lower nibble
    CMP BH, 9    ; Compare with 9
    JBE DIGIT2   ; If <= 9, it's a digit
    ADD BH, 37h  ; Convert to ASCII A-F
    JMP DONE

DIGIT2:
    ADD BH, 30h  ; Convert to ASCII 0-9

DONE:
    ; BL and BH now contain ASCII characters for the HEX number

ret