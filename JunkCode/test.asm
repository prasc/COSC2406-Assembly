INCLUDE Irvine32.inc

.data
varA	DWORD	?
varB	DWORD	?
varC	DWORD	?
varD	DWORD	?

prompt1	BYTE	"Please enter varA: ", 0
prompt2	BYTE	"Please enter varB: ", 0
prompt3	BYTE	"Please enter varC: ", 0
prompt4	BYTE	"Please enter varD: ", 0

output	BYTE	"(A - B) / (C * D) = ", 0

.code

main PROC
	mov edx, offset prompt1
	call WriteString
	call ReadDec
	mov varA, eax
	
	mov edx, offset prompt2
	call WriteString
	call ReadDec
	mov varB, eax

	mov edx, offset prompt3
	call WriteString
	call ReadDec
	mov varC, eax

	
	mov edx, offset prompt4
	call WriteString
	call ReadDec
	mov varD, eax


	push varD
	push varC
	push varB
	push varA
	call calculate

	mov edx, offset output
	call WriteString
	call WriteInt


	exit
main ENDP

calculate PROC
	push ebp
	mov ebp, esp
	sub esp, 4

	mov ebx, [ebp + 8]			;ebx = varA
	sub ebx, [ebp + 12]			;ebx = varA - varB

	mov eax, [ebp + 16]			; eax = varC
	mov ecx, [ebp + 20]			; ecx = varD
	mul ecx						; eax = varC * varD

	mov [ebp - 4], eax			; local var = varC * varD
	mov eax, ebx				; eax = varA - varB

	div DWORD PTR [ebp - 4]


	mov esp, ebp
	pop ebp
	ret 4
calculate ENDP




END main