	AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x10000000
    DCD Reset_Handler
    ALIGN
    AREA mycode, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler

Reset_Handler
    MOV R0, #0x0A        ; Set R0 with the decimal value 10 (divisor)
    MOV R9, #0           ; Clear R9 to accumulate the result
    MOV R10, #1          ; Initialize R10 as the multiplier (1, 10, 100, ...)
    LDR R1, =SRC         ; Load the address of the source hex number
    LDR R2, =DST         ; Load the address of the destination
    LDR R3, [R1]         ; Load the 8-digit hex number from SRC
	LDR R11,=0X0A

UP 
    MOV R4, R3           ; Move R3 to R4 for temporary storage
    BL DIV               ; Call the DIV subroutine to divide R4 by 10
    MUL R5, R5, R10      ; Multiply the remainder by the current multiplier
    ADD R9, R9, R5       ; Add the result to R9
    MOV R5, #0           ; Clear R5 for the next remainder
    MUL R10, R10,R11   ; Increase the multiplier (1, 10, 100, ...)
    MOV R3, R4           ; Move the updated value back to R3
    CMP R3, #0           ; Check if the remaining hex value is zero
    BNE UP               ; Repeat if there are still digits to process

    STR R9, [R2]         ; Store the final decimal result in DST
    B STOP               ; End the program

DIV 
    MOV R5, #0           ; Clear R5 to hold the remainder
DIV_LOOP
    CMP R4, R0           ; Compare R4 with the divisor (10)
    BCC DONE_DIV         ; If R4 < R0, division is complete
    SUBS R4, R4, R0      ; Subtract 10 from R4 if R4 >= 10
    ADD R5, R5, #1       ; Increment R5 (remainder)
    B DIV_LOOP           ; Repeat until R4 < 10
	

DONE_DIV
    BX LR                ; Return from the subroutine

STOP
    B STOP               ; Infinite loop to stop execution

SRC DCD 0x000000CD       ; Example 8-digit hexadecimal number
    AREA data, DATA, READWRITE
DST DCD 0                ; Reserve space for the decimal result
    END