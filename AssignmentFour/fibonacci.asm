; Assignment Four		(Fibonacci.asm)

; Program Description:		Question Two
; Author:					Pras Cheliyan
; Creation Date:			November 18, 2020


INCLUDE Irvine32.inc

.data
	arrFib	WORD	0, 1, 38 DUP(?)
	comma	BYTE	", ",0

.code
main PROC

	mov ecx, 38
	mov esi, 2

L1:	mov ax, arrFib[esi]
	add ax, arrFib[esi - 2]
	mov arrFib[esi + 2], ax
	add esi, TYPE WORD
	loop L1					

	mov ecx, 40
	mov esi, 0
	mov edx, OFFSET comma


L2:	movzx eax, arrFib[esi]
	call WriteDec
	call WriteString
	add esi, TYPE WORD
	loop L2
	

	Call CrLf

	exit
main ENDP
; (insert additional procedures here)
END main