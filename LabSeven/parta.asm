; Lab Seven		(parta.asm)


INCLUDE Irvine32.inc

.data
prompt	BYTE	"Please enter three numbers: ", 0
varA	BYTE	?
varB	BYTE	?
varC	BYTE	?

equat1	BYTE	"4A + (B - 1) * 2C = ", 0
equat2	BYTE	"(10 + B) / (C - A) = ", 0
equat3	BYTE	"(3A + 4B) / 6C = ", 0

.code

main PROC
	mov edx, OFFSET prompt
	call WriteString
	call CrLf

	call ReadInt
	mov varA, al		; store user input in varA
	call ReadInt
	mov varB, al		; store user input in varB
	call ReadInt
	mov varC, al		; store user input in varC

	;===================================
	; Equation One: 4A + (B – 1) * 2C
	;===================================
	mov edx, offset equat1	
	call WriteString

	mov al, varA
	mov bl, 4
	imul bl				; (4 * A)
	mov bl, al

	mov cl, varB
	dec cl				; (B - 1)
				
	mov al, varC
	add al, al			; (2*C)

	imul cl					; (B - 1) * 2C

	add al, bl			;	(4 * A) + ((B - 1) * 2C)
	movsx eax, al
	call WriteInt
	call CrLf

	;===================================
	; Equation Two: (10 + B) / (C – A)
	;===================================
	mov edx, offset equat2	
	call WriteString

	mov al, varB
	add al, 10			; (10 + B)
	
	mov bl, varC
	sub bl, varA		; (C - A)

	cbw
	idiv bl				; (10 + B) / (C – A)

	movsx eax, al
	call WriteInt		; show quotient
	call CrLf

	;===================================
	; Equation Three: (3A + 4B) / 6C
	;===================================
	mov edx, offset equat3	
	call WriteString

	mov al, varA
	mov bl, 3
	imul bl				;3*A
	mov cl, al			; store 3*A in cl

	mov al, varB
	mov bl, 4
	imul bl				;4*B
	mov dl, al			;store 4*B in dl

	mov al, varC
	mov bl, 6
	imul bl				;6*C
	mov bl, al			;store 6*C in bl

	add cl, dl			; (3A + 4B)
	mov al, cl
	cbw
	idiv bl				; (3A + 4B) / 6C

	movsx eax, al
	call WriteInt		; show quotient
	call CrLf


	exit
main ENDP
; (insert additional procedures here)
END main