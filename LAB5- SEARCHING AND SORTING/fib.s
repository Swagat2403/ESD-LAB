	AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0X10000000
    DCD Reset_Handler
    ALIGN
    AREA mycode, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
Reset_Handler
    LDR R4, =N        ; Load the address of N (number of Fibonacci numbers to generate)
    LDR R0, [R4]      ; Load the value of N into R0
    LDR R5, =RESULT   ; Load the address where we'll store the results
    MOV R1, #1        ; First Fibonacci number (F1)
    MOV R2, #1        ; Second Fibonacci number (F2)
    MOV R3, #0        ; Counter for loop
LOOP
    LSL R7, R3, #2    ; Multiply counter by 4 (shift left by 2) to get byte offset
    ADD R8, R5, R7    ; Calculate the address to store the current Fibonacci number
    STR R1, [R8]      ; Store current Fibonacci number
    ADD R3, R3, #1    ; Increment counter
    CMP R3, R0        ; Compare counter with N
    BGE STOP          ; If we've stored N numbers, stop
    MOV R6, R2        ; Temporary storage for R2
    ADD R2, R1, R2    ; Calculate next Fibonacci number
    MOV R1, R6        ; R1 becomes previous R2
    B LOOP            ; Continue loop
STOP 
    B STOP
N   DCD 10            ; Generate first 10 Fibonacci numbers (change as needed)
    AREA data, DATA, READWRITE
RESULT
    SPACE 40          ; Allocate space for 10 32-bit integers
    END