INCLUDE Irvine32.inc

.data
varA	SDWORD	?
varB	SDWORD	?
varC	SDWORD	?

opt1	BYTE	"Report the overall average", 0
opt2	BYTE	"Count the negative numbers", 0
opt3	BYTE	"Generate new random numbers", 0
opt4	BYTE	"Print the balues, 10 per line", 0
opt5	BYTE	"Exit", 0
opt6	BYTE	"Please enter a choice", 0

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