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
	
	LDR R0, =SRC;/write a program to store 10 elements in code memory and find the sum of elements of the array and store the sum in data memory
	LDR R2, =DST
	MOV R3, #10
	LDR R4, =0x0;/sum of array elements
	LDR R5, =0x0;/carry
 
BACK LDR R1, [R0], #4
	ADDS R4, R1
	ADC R5, #0
	SUBS R3, #1
	BNE BACK
	
	STR R5, [R2], #4
	STR R4, [R2]
STOP B STOP
	
	
SRC DCD 0X11111111,0X22222222,0X33333333,0X44444444,0X55555555,0X66666666,0X77777777,0X88888888,0X99999999,0XAAAAAAAA
	AREA data,DATA,READWRITE
DST DCD 0,0,0,0,0,0,0,0,0,0
	END