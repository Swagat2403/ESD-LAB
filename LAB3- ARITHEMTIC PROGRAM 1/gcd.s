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
    LDR R0, =SRC1         
    LDR R1, =SRC2         
    LDR R2, [R0]          
    LDR R3, [R1]          
    LDR R4, =DST          

UP 
    CMP R2, R3            ; Compare R2 and R3
    BEQ FIN               ; If equal, branch to FIN
    SUBGT R2, R2, R3      ; If R2 > R3, subtract R3 from R2
    SUBLE R3, R3, R2      ; If R2 <= R3, subtract R2 from R3
    B UP                  ; Branch back to UP to continue the loop

FIN 
    STR R2, [R4]          

STOP 
    B STOP

    
SRC1 DCD 0x06
SRC2 DCD 0x08
	AREA data, DATA, READWRITE
DST DCD 0x0               
    ALIGN
    END
