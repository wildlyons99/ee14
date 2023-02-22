; --- INSTRUCTION MEMORY ---
	AREA main, CODE, READONLY
;	EXPORT __main
	ENTRY
__main PROC
	
	; load address of temp value into r1 
	LDR r1,=temp
	
	; store value of temp into r0
	LDR r0,[r1,#0x00]


	; set values for representing 1.8 = 9/5
	MOV r2, #0x9
	MOV r3, #0x5
	
	; mul r0 by r1 and store result in r0
	MUL r0, r0, r2

	; signed division
	SDIV r0, r0, r3
	; add 32
	ADD r0, r0, #0x20
	
	STR r0, [r1, #0x00]
	
Stop B Stop
	ENDP
		
; --- DATA MEMORY ---
	AREA data, DATA, READWRITE
temp DCD 30
	END	
		