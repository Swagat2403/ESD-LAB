	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10000000
	DCD Reset_Handler
	ALIGN
	AREA mydata,CODE,READONLY
	ENTRY 
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0,=SRC
	ADD R0,#36
	
	LDR R1,=SRC
	ADD R1,#56
	
	MOV R2,#10
	
UP
	LDR R3,[R0],#-4
	STR R3,[R1],#-4
	SUBS R2,#01
	BNE UP

STOP B STOP
SRC DCD 0X11111111, 0X22222222, 0X33333333, 0X44444444, 0X55555555, 0X66666666, 0X77777777, 0X88888888, 0X99999999, 0XAAAAAAAA


	AREA mydata, DATA, READWRITE


	END
	