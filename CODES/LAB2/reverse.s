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
	LDR R0, =SRC       ; Load the address of SRC into R0
	LDR R1, =DST       ; Load the address of DST into R1
	MOV R2, #10        ; R2 will be used as a counter, there are 10 elements to reverse
	ADD  R0, #36    ; Point R0 to the last element in SRC (36 bytes ahead)
	
UP 
	LDR R3, [R0], #-4  ; Load the value from SRC into R3 and decrement R0 by 4 (moving backward)
	STR R3, [R1], #4   ; Store the value in DST and increment R1 by 4 (moving forward)
	SUBS R2, R2, #1    ; Decrement the counter
	BNE UP             ; Repeat until all elements are reversed
	
STOP 
	B STOP             ; Infinite loop to stop execution
	
SRC DCD 0X11111111, 0X22222222, 0X33333333, 0X44444444, 0X55555555, 0X66666666, 0X77777777, 0X88888888, 0X99999999, 0XAAAAAAAA

	AREA data, DATA, READWRITE
DST DCD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

	END
