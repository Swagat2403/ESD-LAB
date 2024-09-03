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
    LDR R0, =N        ; Load the address of N (upper limit for prime check)
    LDR R0, [R0]      ; Load the value of N into R0
    LDR R1, =RESULT   ; Load the address where we'll store the results
    MOV R2, #2        ; Start checking from 2 (first prime number)
    MOV R7, #0        ; R7 will keep count of prime numbers found

OUTER_LOOP
    CMP R2, R0        ; Compare current number with N
    BGT STOP          ; If greater than N, we're done

    MOV R3, #2        ; Divisor starts from 2
    MOV R4, R2        ; Copy current number to R4

INNER_LOOP
    CMP R3, R4        ; Compare divisor with current number
    BGE PRIME         ; If divisor >= number, it's prime

    MOV R5, R4        ; Initialize R5 with the current number
CHECK_DIVISIBLE
    SUBS R5, R5, R3   ; Subtract divisor from the current number
    CMP R5, #0        ; Check if the result is zero
    BEQ NOT_PRIME     ; If zero, it's divisible, so not prime
    BGT CHECK_DIVISIBLE ; If positive, continue subtracting

    ADD R3, R3, #1    ; Increment divisor
    B INNER_LOOP      ; Continue inner loop

PRIME
    STR R2, [R1], #4  ; Store prime number and increment address
    ADD R7, R7, #1    ; Increment prime number count

NOT_PRIME
    ADD R2, R2, #1    ; Move to next number
    B OUTER_LOOP      ; Continue outer loop

STOP 
  
    B STOP

N   DCD   0x0A        ; Find primes up to 10 (change as needed)

    AREA data, DATA, READWRITE
RESULT
    SPACE 80          ; Allocate space for results (adjust as needed)
COUNT
    SPACE 4           ; Allocate space to store the count of primes

    END
