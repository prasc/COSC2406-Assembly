; Assignment Four		(Loops.asm)

; Program Description:		Question One
; Author:					Pras Cheliyan
; Creation Date:			November 18, 2020


INCLUDE Irvine32.inc

ARRAY_SIZE = 5

.data
arrOne			WORD	ARRAY_SIZE DUP(?)
arrTwo			DWORD	ARRAY_SIZE DUP(?)
prompt			BYTE	"Enter a signed integer ", 0
.code

main PROC
	mov ecx, LENGTHOF arrOne
	mov esi, 0

L1:	mov edx, OFFSET prompt	; System.out.print(prompt)
	call WriteString		;
	call ReadInt
	mov arrOne[esi], ax		; arrOne in.nextInt()
	add esi, TYPE WORD
	loop L1					; loop again starting from line 20

	mov ecx, ARRAY_SIZE		; reset loop counter
	mov esi, 0
	mov edi, 0

L2:	movsx ebx, arrOne[esi]
	mov arrTwo[edi], ebx
	add edi, TYPE DWORD
	add esi, TYPE WORD
	loop L2

	mov ecx, ARRAY_SIZE		; reset loop counter
	mov esi, 0

L3: mov eax, arrTwo[esi]
	call WriteInt
	mov al, ' '
	call WriteChar
	add esi, TYPE DWORD
	loop L3

	exit
main ENDP
; (insert additional procedures here)
END main