; Assignment Four		(Fibonacci.asm)

; Program Description:		Question Two
; Author:					Pras Cheliyan
; Creation Date:			November 18, 2020


INCLUDE Irvine32.inc

.data
prompt			BYTE	"Enter a signed integer ", 0
.code

main PROC
	ARRAY_SIZE = 5
	mov ecx, ARRAY_SIZE

L1:	mov edx, OFFSET prompt	; System.out.print(prompt)
	call WriteString		;
	call ReadInt
	mov arrOne, ax			; arrOne in.nextInt()
	loop L1					; loop again starting from line 20

	mov ecx, ARRAY_SIZE		; reset loop counter
	mov esi, 0
	mov edi, 0

L2:	movsx ebx, [arrOne + esi]
	mov [arrTwo + edi], ebx
	add edi, type arrTwo
	add esi, TYPE arrOne
	loop L2

	mov ecx, ARRAY_SIZE		; reset loop counter
	mov esi, 0

L3: mov eax, [arrTwo + esi]
	add esi, TYPE arrTwo
	call WriteInt
	mov al, ' '
	call WriteChar
	loop L3

	exit
main ENDP
; (insert additional procedures here)
END main