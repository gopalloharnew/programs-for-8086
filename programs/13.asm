; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Calculate factorial using recursive procedure
MOV CX, 5       ; Number to calculate factorial
MOV AX, 1       ; Initialize result
CALL FACTORIAL  ; Call recursive factorial procedure
MOV DX, AX      ; Store result in DX
JMP END_PROGRAM

FACTORIAL PROC
    CMP CX, 1    ; Check if we reached base case
    JBE RETURN   ; If CX <= 1, return
    
    PUSH CX      ; Save current value
    DEC CX       ; Decrease for recursive call
    CALL FACTORIAL ; Recursive call
    POP CX       ; Restore value
    MUL CX       ; Multiply result by current value
    
RETURN:
    RET          ; Return from procedure
FACTORIAL ENDP

END_PROGRAM:
ret