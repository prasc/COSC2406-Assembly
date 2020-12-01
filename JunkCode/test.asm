INCLUDE Irvine32.inc

.data
varA	SDWORD	?
varB	SDWORD	?
varC	SDWORD	?

.code

main PROC
	mov eax, varA
	mov ebx, 3
	imul ebx				
	mov varA, eax			;varA = 3*A

	mov eax, varB
	mov ebx, 5
	imul ebx	
	mov varB, eax			;varB = 5*B

	mov eax, varA
	add eax, varB			; eax = 3A + 5B
	cdq


	mov ebx, varC
	idiv ebx

	exit
main ENDP

END main