; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Convert two BCD numbers to HEX
MOV AL, [1000h]  ; First BCD number (e.g. 25h for BCD 25)
MOV BL, [1001h]  ; Second BCD number (e.g. 63h for BCD 63)

; Convert first BCD number
MOV CL, AL       ; Save original BCD
AND AL, 0F0h     ; Mask to get upper digit (tens)
SHR AL, 4        ; Shift right to get proper position
MOV DL, 10       ; Multiplier
MUL DL           ; Multiply tens digit by 10
MOV DH, AL       ; Save tens in DH

MOV AL, CL       ; Restore original BCD
AND AL, 0Fh      ; Mask to get lower digit (units)
ADD AL, DH       ; Add tens and units
MOV DL, AL       ; Store first HEX result in DL

; Convert second BCD number
MOV CL, BL       ; Save original BCD
AND BL, 0F0h     ; Mask to get upper digit (tens)
SHR BL, 4        ; Shift right to get proper position
MOV AL, BL       ; Move to AL for multiplication
MOV BL, 10       ; Multiplier
MUL BL           ; Multiply tens digit by 10
MOV DH, AL       ; Save tens in DH

MOV AL, CL       ; Restore original BCD
AND AL, 0Fh      ; Mask to get lower digit (units)
ADD AL, DH       ; Add tens and units
MOV DH, AL       ; Store second HEX result in DH

ret