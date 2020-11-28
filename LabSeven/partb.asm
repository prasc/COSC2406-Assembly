; Lab Seven		(partb.asm)


INCLUDE Irvine32.inc

.data
prompt	BYTE	"Please enter three numbers: ", 0
varA	DWORD	?
varB	DWORD	?
varC	DWORD	?

equat1	BYTE	"4A + (B - 1) * 2C = ", 0
equat2	BYTE	"(10 + B) / (C - A) = ", 0
equat3	BYTE	"(3A + 4B) / 6C = ", 0

.code

main PROC
	mov edx, OFFSET prompt
	call WriteString
	call CrLf

	call ReadDec
	mov varA, eax		; store user input in varA
	call ReadDec
	mov varB, eax		; store user input in varB
	call ReadDec
	mov varC, eax		; store user input in varC

	;===================================
	; Equation One: 4A + (B – 1) * 2C
	;===================================
	mov edx, offset equat1	
	call WriteString

	mov eax, varA
	mov ebx, 4
	mul ebx					; (4 * A)
	mov ebx, eax

	mov ecx, varB
	dec ecx						; (B - 1)
				
	mov eax, varC
	add eax, eax				; (2*C)

	mul ecx					; (B - 1) * 2C

	add eax, ebx				;	(4 * A) + ((B - 1) * 2C)
	call WriteDec
	call CrLf

	;===================================
	; Equation Two: (10 + B) / (C – A)
	;===================================
	mov edx, offset equat2	
	call WriteString

	mov eax, varB
	add eax, 10			; (10 + B)
	
	mov ebx, varC
	sub ebx, varA		; (C - A)

	mov edx, [eax + 4]
	div ebx				; (10 + B) / (C – A)

	call WriteDec		; show quotient
	call CrLf

	;===================================
	; Equation Three: (3A + 4B) / 6C
	;===================================
	mov edx, offset equat3	
	call WriteString

	mov eax, varA
	mov ebx, 3
	mul ebx				;3*A
	mov ecx, eax			; store 3*A in cl

	mov eax, varB
	mov ebx, 4
	mul ebx				;4*B
	mov edx, eax			;store 4*B in dl

	mov eax, varC
	mov ebx, 6
	mul ebx				;6*C
	mov ebx, eax			;store 6*C in bl

	add ecx, edx			; (3A + 4B)
	mov eax, ecx
	
	mov edx, [eax + 4]
	div ebx				; (3A + 4B) / 6C

	call WriteDec		; show quotient
	call CrLf


	exit
main ENDP
; (insert additional procedures here)
END main