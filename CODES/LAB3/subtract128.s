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
	LDR R0,=VAL1
	LDR R1,=VAL2
	LDR R2,=RES
	MOV R3,#4
	LDR R4,=0X20000000
	MSR XPSR,R4
	
UP
	LDR R5,[R0],#4
	LDR R6,[R1],#4
	SBC R7,R5,R6
	STR R7,[R2],#4
	SUB R3,#1
	TEQ R3,#0
	BNE UP
	ADC R9,#0
	STR R9,[R2]
	
STOP B STOP
VAL1 DCD 0X11111111,0X22222222,0X33333333,0XFFFFFFFF

VAL2 DCD 0X55555555,0X66666666,0X77777777,0X88888888





	AREA data, DATA, READWRITE

RES DCD 0,0,0,0,0

	END
	