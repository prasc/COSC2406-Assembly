; Assignment Four		(Loops.asm)

; Program Description:		Question One
; Author:					Pras Cheliyan
; Creation Date:			November 18, 2020


INCLUDE Irvine32.inc

.data
arrOne			WORD	SIZEOF ARRAY_SIZE
arrTwo			DWORD	SIZEOF ARRAY_SIZE
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

	movsx ebx,  arrOne
	mov arrTwo, ebx




	exit
main ENDP
; (insert additional procedures here)
END main