# 8086 Assembly Programs

the respective programs are in the [programs](./programs/) directory and their screenshots are in [ss](/ss/) directory

## 1. Write an assembly language program to perform the subtraction of two 8-bit number using 8085/8086 instruction set.

| Memory Address | Opcode | Instruction | Comments            |
| -------------- | ------ | ----------- | ------------------- |
| 0100           | B0 2D  | MOV AL, 45  | First number in AL  |
| 0102           | B3 1E  | MOV BL, 30  | Second number in BL |
| 0104           | 2A C3  | SUB AL, BL  | AL = AL - BL        |
| 0106           | 8A C8  | MOV CL, AL  | Store result in CL  |
| 0108           | C3     | RET         | Return to DOS       |

## 2. Write an assembly language program to move data block starting at location 'X' to location 'Y' without overlap using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction   | Comments                           |
| -------------- | -------- | ------------- | ---------------------------------- |
| 0100           | BE 00 10 | MOV SI, 1000h | Source index (location X)          |
| 0103           | BF 00 20 | MOV DI, 2000h | Destination index (location Y)     |
| 0106           | B9 0A 00 | MOV CX, 10    | Number of bytes to move            |
| 0109           | 8A 04    | MOV AL, [SI]  | Load byte from source              |
| 010B           | 88 05    | MOV [DI], AL  | Store byte to destination          |
| 010D           | 46       | INC SI        | Next source byte                   |
| 010E           | 47       | INC DI        | Next destination byte              |
| 010F           | E2 F8    | LOOP 0109     | Decrement CX and repeat until CX=0 |
| 0111           | C3       | RET           | Return to DOS                      |

## 3. Write an assembly language program to move data block starting at location 'X' to location 'Y' with overlap using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction   | Comments                              |
| -------------- | -------- | ------------- | ------------------------------------- |
| 0100           | BE 00 10 | MOV SI, 1000h | Source base address (location X)      |
| 0103           | BF 05 10 | MOV DI, 1005h | Destination base address (location Y) |
| 0106           | B9 0A 00 | MOV CX, 10    | Number of bytes to move               |
| 0109           | 03 F1    | ADD SI, CX    | Point to end of source block          |
| 010B           | 4E       | DEC SI        | Last byte of source                   |
| 010C           | 03 F9    | ADD DI, CX    | Point to end of destination block     |
| 010E           | 4F       | DEC DI        | Last byte of destination              |
| 010F           | 8A 04    | MOV AL, [SI]  | Load byte from source                 |
| 0111           | 88 05    | MOV [DI], AL  | Store byte to destination             |
| 0113           | 4E       | DEC SI        | Previous source byte                  |
| 0114           | 4F       | DEC DI        | Previous destination byte             |
| 0115           | E2 F8    | LOOP 010F     | Decrement CX and repeat until CX=0    |
| 0117           | C3       | RET           | Return to DOS                         |

## 4. Write an assembly language program to arrange set of 8-bit numbers starting at location in ASCENDING/DESCENDING order. Display the stored vector in address data field using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction    | Comments                               |
| -------------- | -------- | -------------- | -------------------------------------- |
| 0100           | BE 00 10 | MOV SI, 1000h  | Starting address of the array          |
| 0103           | B9 05 00 | MOV CX, 5      | Number of elements (5 for example)     |
| 0106           | 49       | DEC CX         | CX = N-1 for outer loop                |
| 0107           | 8B FE    | MOV DI, SI     | Reset DI to start of array             |
| 0109           | 51       | PUSH CX        | Save outer loop counter                |
| 010A           | 8B D9    | MOV BX, CX     | BX = inner loop counter                |
| 010C           | 8A 05    | MOV AL, [DI]   | Get current element                    |
| 010E           | 8A 65 01 | MOV AH, [DI+1] | Get next element                       |
| 0111           | 3A C4    | CMP AL, AH     | Compare elements                       |
| 0113           | 7E 06    | JLE 011B       | If AL <= AH, skip swap                 |
| 0115           | 88 25    | MOV [DI], AH   | Store next element in current position |
| 0117           | 88 45 01 | MOV [DI+1], AL | Store current element in next position |
| 011A           | 47       | INC DI         | Move to next element                   |
| 011B           | 4B       | DEC BX         | Decrement inner loop counter           |
| 011C           | 75 EE    | JNZ 010C       | Repeat inner loop until BX=0           |
| 011E           | 59       | POP CX         | Restore outer loop counter             |
| 011F           | E2 E6    | LOOP 0107      | Repeat outer loop until CX=0           |
| 0121           | C3       | RET            | Return to DOS                          |

## 5. Write an assembly language program to perform the multiplication of two 8-bit numbers using 8085/8086 instruction set.

| Memory Address | Opcode | Instruction | Comments                     |
| -------------- | ------ | ----------- | ---------------------------- |
| 0100           | B0 0C  | MOV AL, 12  | First number                 |
| 0102           | B3 0F  | MOV BL, 15  | Second number                |
| 0104           | F6 E3  | MUL BL      | AX = AL \* BL (result in AX) |
| 0106           | 8B C8  | MOV CX, AX  | Store result in CX           |
| 0108           | C3     | RET         | Return to DOS                |

## 6. Write an assembly language program to perform the division of two 8-bit numbers using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction | Comments                                         |
| -------------- | -------- | ----------- | ------------------------------------------------ |
| 0100           | B8 90 00 | MOV AX, 144 | Dividend in AX (16-bit to handle larger results) |
| 0103           | B3 0C    | MOV BL, 12  | Divisor in BL                                    |
| 0105           | F6 F3    | DIV BL      | Divide AX by BL; AL = Quotient, AH = Remainder   |
| 0107           | 8A C8    | MOV CL, AL  | Store quotient in CL                             |
| 0109           | 8A EC    | MOV CH, AH  | Store remainder in CH                            |
| 010B           | C3       | RET         | Return to DOS                                    |

## 7. Write an assembly language program to find the larger number in array of data using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction   | Comments                                |
| -------------- | -------- | ------------- | --------------------------------------- |
| 0100           | BE 00 10 | MOV SI, 1000h | Starting address of the array           |
| 0103           | B9 0A 00 | MOV CX, 10    | Array size (10 elements)                |
| 0106           | 8A 04    | MOV AL, [SI]  | Initialize largest with first element   |
| 0108           | 46       | INC SI        | Move to next element                    |
| 0109           | 3A 04    | CMP AL, [SI]  | Compare largest with current element    |
| 010B           | 73 02    | JAE 010F      | If AL >= current, skip update           |
| 010D           | 8A 04    | MOV AL, [SI]  | Update largest                          |
| 010F           | 46       | INC SI        | Move to next element                    |
| 0110           | E2 F7    | LOOP 0109     | Continue until all elements are checked |
| 0112           | 8A D8    | MOV BL, AL    | Store largest in BL                     |
| 0114           | C3       | RET           | Return to DOS                           |

## 8. Write an assembly language program to convert two BCD numbers in memory of the equivalent IIEX number using 8085/8086 instruction set.

| Memory Address | Opcode      | Instruction     | Comments                                |
| -------------- | ----------- | --------------- | --------------------------------------- |
| 0100           | A0 00 10    | MOV AL, [1000h] | First BCD number (e.g. 25h for BCD 25)  |
| 0103           | 8A 1E 01 10 | MOV BL, [1001h] | Second BCD number (e.g. 63h for BCD 63) |
| 0107           | 8A C8       | MOV CL, AL      | Save original BCD                       |
| 0109           | 24 F0       | AND AL, 0F0h    | Mask to get upper digit (tens)          |
| 010B           | C0 E8 04    | SHR AL, 4       | Shift right to get proper position      |
| 010E           | B2 0A       | MOV DL, 10      | Multiplier                              |
| 0110           | F6 E2       | MUL DL          | Multiply tens digit by 10               |
| 0112           | 8A F0       | MOV DH, AL      | Save tens in DH                         |
| 0114           | 8A C1       | MOV AL, CL      | Restore original BCD                    |
| 0116           | 24 0F       | AND AL, 0Fh     | Mask to get lower digit (units)         |
| 0118           | 02 C6       | ADD AL, DH      | Add tens and units                      |
| 011A           | 8A D0       | MOV DL, AL      | Store first HEX result in DL            |
| 011C           | 8A CB       | MOV CL, BL      | Save original BCD                       |
| 011E           | 80 E3 F0    | AND BL, 0F0h    | Mask to get upper digit (tens)          |
| 0121           | C0 EB 04    | SHR BL, 4       | Shift right to get proper position      |
| 0124           | 8A C3       | MOV AL, BL      | Move to AL for multiplication           |
| 0126           | B3 0A       | MOV BL, 10      | Multiplier                              |
| 0128           | F6 E3       | MUL BL          | Multiply tens digit by 10               |
| 012A           | 8A F0       | MOV DH, AL      | Save tens in DH                         |
| 012C           | 8A C1       | MOV AL, CL      | Restore original BCD                    |
| 012E           | 24 0F       | AND AL, 0Fh     | Mask to get lower digit (units)         |
| 0130           | 02 C6       | ADD AL, DH      | Add tens and units                      |
| 0132           | 8A F0       | MOV DH, AL      | Store second HEX result in DH           |
| 0134           | C3          | RET             | Return to DOS                           |

## 9. Write an assembly language program to convert given hexadecimal number into its equivalent BCD number using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction | Comments                                |
| -------------- | -------- | ----------- | --------------------------------------- |
| 0100           | B0 2A    | MOV AL, 42  | Hex number to convert (42 decimal)      |
| 0102           | B4 00    | MOV AH, 0   | Clear AH                                |
| 0104           | B3 0A    | MOV BL, 10  | Divisor                                 |
| 0106           | F6 F3    | DIV BL      | Divide by 10, AL=quotient, AH=remainder |
| 0108           | C0 E0 04 | SHL AL, 4   | Shift tens digit to upper nibble        |
| 010B           | 0A C4    | OR AL, AH   | Combine with ones digit                 |
| 010D           | 8A D8    | MOV BL, AL  | Store BCD result in BL                  |
| 010F           | C3       | RET         | Return to DOS                           |

## 10. Write an assembly language program to convert given hexadecimal number into its equivalent ASCII number using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction | Comments                        |
| -------------- | -------- | ----------- | ------------------------------- |
| 0100           | B0 3B    | MOV AL, 3Bh | Hex number to convert           |
| 0102           | 8A D8    | MOV BL, AL  | Copy to BL                      |
| 0104           | C0 EB 04 | SHR BL, 4   | Shift right to get upper nibble |
| 0107           | 80 FB 09 | CMP BL, 9   | Compare with 9                  |
| 010A           | 76 04    | JBE 0110    | If <= 9, it's a digit           |
| 010C           | 80 C3 37 | ADD BL, 37h | Convert to ASCII A-F            |
| 010F           | EB 03    | JMP 0114    | Jump to NEXT                    |
| 0111           | 80 C3 30 | ADD BL, 30h | Convert to ASCII 0-9            |
| 0114           | 8A F8    | MOV BH, AL  | Copy to BH                      |
| 0116           | 80 E7 0F | AND BH, 0Fh | Mask to get lower nibble        |
| 0119           | 80 FF 09 | CMP BH, 9   | Compare with 9                  |
| 011C           | 76 04    | JBE 0122    | If <= 9, it's a digit           |
| 011E           | 80 C7 37 | ADD BH, 37h | Convert to ASCII A-F            |
| 0121           | EB 03    | JMP 0126    | Jump to DONE                    |
| 0123           | 80 C7 30 | ADD BH, 30h | Convert to ASCII 0-9            |
| 0126           | C3       | RET         | Return to DOS                   |

## 11. Write an assembly language program to convert given ASCII character into its equivalent hexadecimal number using 8085/8086 instruction set.

| Memory Address | Opcode | Instruction | Comments                         |
| -------------- | ------ | ----------- | -------------------------------- |
| 0100           | B0 41  | MOV AL, 'A' | ASCII character to convert       |
| 0102           | 3C 30  | CMP AL, '0' | Check if it's a digit            |
| 0104           | 72 23  | JB 0129     | If below '0', invalid            |
| 0106           | 3C 39  | CMP AL, '9' | Check if it's a digit            |
| 0108           | 76 13  | JBE 011D    | If '0'-'9', convert as digit     |
| 010A           | 3C 41  | CMP AL, 'A' | Check if it's uppercase letter   |
| 010C           | 72 1B  | JB 0129     | If below 'A', invalid            |
| 010E           | 3C 46  | CMP AL, 'F' | Check if it's uppercase letter   |
| 0110           | 76 0F  | JBE 0121    | If 'A'-'F', convert as uppercase |
| 0112           | 3C 61  | CMP AL, 'a' | Check if it's lowercase letter   |
| 0114           | 72 13  | JB 0129     | If below 'a', invalid            |
| 0116           | 3C 66  | CMP AL, 'f' | Check if it's lowercase letter   |
| 0118           | 76 0C  | JBE 0126    | If 'a'-'f', convert as lowercase |
| 011A           | EB 0D  | JMP 0129    | Otherwise invalid                |
| 011C           | 2C 30  | SUB AL, 30h | Convert digit ASCII to HEX       |
| 011E           | EB 09  | JMP 0129    | Jump to DONE                     |
| 0120           | 2C 37  | SUB AL, 37h | Convert uppercase ASCII to HEX   |
| 0122           | EB 05  | JMP 0129    | Jump to DONE                     |
| 0124           | 2C 57  | SUB AL, 57h | Convert lowercase ASCII to HEX   |
| 0126           | 8A D8  | MOV BL, AL  | Store result in BL               |
| 0128           | C3     | RET         | Return to DOS                    |

## 12. Write an ALP program to generate a Fibonacci series using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction    | Comments                                |
| -------------- | -------- | -------------- | --------------------------------------- |
| 0100           | B9 0A 00 | MOV CX, 10     | Number of Fibonacci numbers to generate |
| 0103           | BB 00 10 | MOV BX, 1000h  | Starting address to store the series    |
| 0106           | B8 00 00 | MOV AX, 0      | First Fibonacci number                  |
| 0109           | 89 07    | MOV [BX], AX   | Store first number                      |
| 010B           | 43       | INC BX         | Move to next byte                       |
| 010C           | 43       | INC BX         | Move to next byte                       |
| 010D           | B8 01 00 | MOV AX, 1      | Second Fibonacci number                 |
| 0110           | 89 07    | MOV [BX], AX   | Store second number                     |
| 0112           | 43       | INC BX         | Move to next byte                       |
| 0113           | 43       | INC BX         | Move to next byte                       |
| 0114           | 83 E9 02 | SUB CX, 2      | Already stored 2 numbers                |
| 0117           | 8B 47 FE | MOV AX, [BX-2] | Get previous number                     |
| 011A           | 8B 57 FC | MOV DX, [BX-4] | Get number before previous              |
| 011D           | 03 C2    | ADD AX, DX     | Calculate next Fibonacci number         |
| 011F           | 89 07    | MOV [BX], AX   | Store the number                        |
| 0121           | 83 C3 02 | ADD BX, 2      | Move to next word                       |
| 0124           | E2 F1    | LOOP 0117      | Loop until CX = 0                       |
| 0126           | C3       | RET            | Return to DOS                           |

## 13. Write an ALP to find the factorial of a given number using recursive procedure using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction | Comments                           |
| -------------- | -------- | ----------- | ---------------------------------- |
| 0100           | B9 05 00 | MOV CX, 5   | Number to calculate factorial      |
| 0103           | B8 01 00 | MOV AX, 1   | Initialize result                  |
| 0106           | E8 03 00 | CALL 010C   | Call recursive factorial procedure |
| 0109           | 8B D0    | MOV DX, AX  | Store result in DX                 |
| 010B           | EB 0D    | JMP 011A    | Jump to END_PROGRAM                |
| 010D           | 83 F9 01 | CMP CX, 1   | Check if we reached base case      |
| 0110           | 76 06    | JBE 0118    | If CX <= 1, return                 |
| 0112           | 51       | PUSH CX     | Save current value                 |
| 0113           | 49       | DEC CX      | Decrease for recursive call        |
| 0114           | E8 F7 FF | CALL 010D   | Recursive call                     |
| 0117           | 59       | POP CX      | Restore value                      |
| 0118           | F7 E1    | MUL CX      | Multiply result by current value   |
| 011A           | C3       | RET         | Return from procedure              |

## 14. Write an ALP to separate odd and even numbers using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction   | Comments                      |
| -------------- | -------- | ------------- | ----------------------------- |
| 0100           | BE 00 10 | MOV SI, 1000h | Source array address          |
| 0103           | BF 00 20 | MOV DI, 2000h | Even numbers destination      |
| 0106           | BB 00 30 | MOV BX, 3000h | Odd numbers destination       |
| 0109           | B9 0A 00 | MOV CX, 10    | Number of elements to process |
| 010C           | 8A 04    | MOV AL, [SI]  | Get current number            |
| 010E           | A8 01    | TEST AL, 1    | Test if odd (LSB = 1)         |
| 0110           | 75 05    | JNZ 0117      | If odd, jump                  |
| 0112           | 88 05    | MOV [DI], AL  | Store in even array           |
| 0114           | 47       | INC DI        | Next position in even array   |
| 0115           | EB 03    | JMP 011A      | Jump to CONTINUE              |
| 0117           | 88 07    | MOV [BX], AL  | Store in odd array            |
| 0119           | 43       | INC BX        | Next position in odd array    |
| 011A           | 46       | INC SI        | Next number in source array   |
| 011B           | E2 EF    | LOOP 010C     | Loop until CX = 0             |
| 011D           | C3       | RET           | Return to DOS                 |

## 15. Write an ALP to separate positive and negative numbers using 8085/8086 instruction set.

| Memory Address | Opcode   | Instruction   | Comments                        |
| -------------- | -------- | ------------- | ------------------------------- |
| 0100           | BE 00 10 | MOV SI, 1000h | Source array address            |
| 0103           | BF 00 20 | MOV DI, 2000h | Positive numbers destination    |
| 0106           | BB 00 30 | MOV BX, 3000h | Negative numbers destination    |
| 0109           | B9 0A 00 | MOV CX, 10    | Number of elements to process   |
| 010C           | 8A 04    | MOV AL, [SI]  | Get current number              |
| 010E           | A8 80    | TEST AL, 80h  | Test if negative (MSB = 1)      |
| 0110           | 75 05    | JNZ 0117      | If negative, jump               |
| 0112           | 88 05    | MOV [DI], AL  | Store in positive array         |
| 0114           | 47       | INC DI        | Next position in positive array |
| 0115           | EB 03    | JMP 011A      | Jump to CONTINUE                |
| 0117           | 88 07    | MOV [BX], AL  | Store in negative array         |
| 0119           | 43       | INC BX        | Next position in negative array |
| 011A           | 46       | INC SI        | Next number in source array     |
| 011B           | E2 EF    | LOOP 010C     | Loop until CX = 0               |
| 011D           | C3       | RET           | Return to DOS                   |

## 16. Write an ALP to transfer of a string in forward direction using 8086 instruction set.

| Memory Address | Opcode   | Instruction   | Comments                                   |
| -------------- | -------- | ------------- | ------------------------------------------ |
| 0100           | BE 00 10 | MOV SI, 1000h | Source string address                      |
| 0103           | BF 00 20 | MOV DI, 2000h | Destination string address                 |
| 0106           | FC       | CLD           | Clear direction flag (forward direction)   |
| 0107           | AC       | LODSB         | Load byte from SI into AL and increment SI |
| 0108           | 3C 00    | CMP AL, 0     | Check for null terminator                  |
| 010A           | 74 03    | JE 010F       | If end of string, exit                     |
| 010C           | AA       | STOSB         | Store AL to DI and increment DI            |
| 010D           | EB F8    | JMP 0107      | Jump to TRANSFER_LOOP                      |
| 010F           | B0 00    | MOV AL, 0     | Null terminator                            |
| 0111           | AA       | STOSB         | Store null terminator at the end           |
| 0112           | C3       | RET           | Return to DOS                              |
