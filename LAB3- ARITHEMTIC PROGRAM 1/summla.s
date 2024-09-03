	AREA RESET,DATA,READONLY
	EXPORT __Vectors
	
__Vectors
	DCD 0X10000000
	DCD Reset_Handler
	ALIGN 
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0,=NUM
	LDR R2,=RES
	
	MLA R1,R0,R0,R0 ;N(N+1)=N*N+N
	LSR R1,#1
	STR R1,[R2]
	
STOP B STOP
	
	
	
NUM EQU 10
	AREA data,DATA,READWRITE
RES DCD 0