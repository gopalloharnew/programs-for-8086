; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Sort numbers in ascending order using bubble sort
MOV SI, 1000h      ; Starting address of the array
MOV CX, 5          ; Number of elements (5 for example)
DEC CX             ; CX = N-1 for outer loop

OUTER_LOOP:
    MOV DI, SI     ; Reset DI to start of array
    PUSH CX        ; Save outer loop counter
    MOV BX, CX     ; BX = inner loop counter

INNER_LOOP:
    MOV AL, [DI]     ; Get current element
    MOV AH, [DI+1]   ; Get next element
    CMP AL, AH       ; Compare elements
    JLE SKIP_SWAP    ; If AL <= AH, skip swap
    
    ; Swap elements
    MOV [DI], AH     ; Store next element in current position
    MOV [DI+1], AL   ; Store current element in next position
    
SKIP_SWAP:
    INC DI           ; Move to next element
    DEC BX           ; Decrement inner loop counter
    JNZ INNER_LOOP   ; Repeat inner loop until BX=0
    
    POP CX           ; Restore outer loop counter
    LOOP OUTER_LOOP  ; Repeat outer loop until CX=0

ret