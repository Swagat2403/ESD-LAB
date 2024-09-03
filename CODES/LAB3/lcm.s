	AREA RESET, DATA, READONLY

	EXPORT __Vectors

__Vectors

	DCD 0x10000100 ;stack pointer value when stack is empty
	DCD Reset_Handler ; reset vecto
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler

	LDR R0,=0x1
	LDR R1,=N1
	LDR R2,=N2
	LDR R7,=LCM
	LDR R1,[R1]
	LDR R2,[R2]

BACK MUL R1,R0
	MOV R5,R1

LOOP CMP R5,R2
	BLO EXIT1
	SUB R5,R2
	BHS LOOP

EXIT1
	MOV R6,R5
	CMP R6,#0x0
	BEQ EXIT2
	ADD R0,#0x1
	BNE BACK

EXIT2 STR R1,[R7]

STOP B STOP

N1 DCD 0x5
N2 DCD 0x2
REM DCD 0x0
	AREA data, DATA, READWRITE

LCM DCD 0

	END
	