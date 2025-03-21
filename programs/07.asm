; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

; Find the largest number in an array
MOV SI, 1000h    ; Starting address of the array
MOV CX, 10       ; Array size (10 elements)
MOV AL, [SI]     ; Initialize largest with first element
INC SI           ; Move to next element

COMPARE_LOOP:
    CMP AL, [SI]     ; Compare largest with current element
    JAE SKIP_UPDATE  ; If AL >= current, skip update
    MOV AL, [SI]     ; Update largest
    
SKIP_UPDATE:
    INC SI           ; Move to next element
    LOOP COMPARE_LOOP ; Continue until all elements are checked

MOV BL, AL           ; Store largest in BL

ret