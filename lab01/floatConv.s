; --- INSTRUCTION MEMORY ---
	AREA main, CODE, READONLY
	EXPORT __main
	ENTRY
__main PROC
	
	; load address of temp value into r1 
	LDR r1,=temp
	
	; store value of temp into r0
	LDR r0,[r1,#0x00]

	
	; set values for representing 1.8 = 9/5
	MOV r2, #0x9
	MOV r3, #0x5
	MOV r4, #0x20
	
	VMOV.F32 s0, r0
	VMOV.F32 s2, r2
	VMOV.F32 s3, r3
	VMOV.F32 s4, r4
	VCVT.F32.u32 s0, s0
	VCVT.F32.u32 s2, s2
	VCVT.F32.u32 s3, s3
	VCVT.F32.u32 s4, s4
	
	; mul r0 by r1 and store result in r0
	VMUL.F32 s0, s0, s2

	; signed division
	VDIV.F32 s0, s0, s3
	; add 32
	VADD.F32 s0, s0, s4
	
	VSTR.32 s0, [r1, #0x00]
	
Stop B Stop
	ENDP
		
; --- DATA MEMORY ---
	AREA data, DATA, READWRITE
temp DCD 29
	END	
		
		