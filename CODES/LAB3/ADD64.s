	AREA RESET,DATA,READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x10000000
    DCD Reset_Handler
    ALIGN
    AREA mycode,CODE,READONLY
    ENTRY
    EXPORT Reset_Handler
    
Reset_Handler
    LDR R0,=SRC     ; Load address of source array
    LDR R1,=DST     ; Load address of destination array
    MOV R2,#10      ; Counter for 10 64-bit numbers
    MOV R3,#0       ; Initialize sum to 0
    MOV R4,#0       ; Initialize carry to 0
    
ADD_LOOP 
    LDR R5,[R0],#4  ; Load lower 32 bits
    LDR R6,[R0],#4  ; Load upper 32 bits
    ADDS R3,R3,R5   ; Add lower 32 bits to sum
    ADC R4,R4,R6    ; Add upper 32 bits to sum with carry
    SUBS R2,#1      ; Decrement counter
    BNE ADD_LOOP    ; Continue if not zero

    STR R3,[R1],#4  ; Store lower 32 bits of result
    STR R4,[R1]     ; Store upper 32 bits of result
    
STOP B STOP
    
SRC DCD 0X11111111,0X22222222,0X33333333,0X44444444,0X55555555,0X66666666,0X77777777,0X88888888,0X99999999,0XAAAAAAAA
    DCD 0X11111111,0X22222222,0X33333333,0X44444444,0X55555555,0X66666666,0X77777777,0X88888888,0X99999999,0XAAAAAAAA
    AREA data,DATA,READWRITE
DST DCD 0,0
    END