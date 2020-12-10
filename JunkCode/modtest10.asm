INCLUDE Irvine32.inc

.data
varA	REAL4	4.0
varB	REAL4	5.0
varC	REAL4	6.0

four	DWORD	4
six		DWORD	6

.code

main PROC

	PUSH varC         ; varA, varB, var C
	PUSH varB         ; are REAL4 values
	PUSH varA
	call calculate    ; returns answer on top of FPU 


	call ShowFPUStack
	exit
main ENDP

calculate PROC
	
	push ebp
	mov ebp, esp
	sub esp,12


	FLD real4 ptr [ebp + 16]		; varB is on top of stack

	FILD six						; load 6 onto stack
	fmul							; 6*B

	FILD four
	fsub							; (6*B - 4)
	
	fsqrt							; sqrt(6*B - 4)

	FLD real4 ptr [ebp + 8]			; varA is on top of stack

	fild four
	fmul							; 4*A

	fadd							; 4*A + sqrt(6*B - 4)

	FLD real4 ptr [ebp + 12]		; varC is on top of stack
	fdiv							; (4*A + sqrt(6*B - 4)) / C

	mov esp, ebp
	pop ebp
	
	ret 12
calculate ENDP

END main