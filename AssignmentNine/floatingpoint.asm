; Assignment Nine		(floatingpoint.asm)
; Program Description:		This program displays the single-precision floating point binary value of a number
; Author:					Pras
; Creation Date:			December 4th 2020	


INCLUDE Irvine32.inc

.data
prompt	BYTE	"Enter a float value: ", 0
output	BYTE	"Real number in binary: ", 0

num		REAL4	?
dwordnum	DWORD	?
buffer	BYTE	32 DUP(0), 0

.code

main PROC
	FINIT

	mov edx, OFFSET prompt
	call WriteString
	call ReadFloat

	fstp	num				; store userinput into num 

	push num
	call displayNum


	call showFPUStack
	exit
main ENDP

displayNum PROC
	ENTER 0, 0

	mov edx, OFFSET output
	call WriteString

	fld DWORD PTR [ebp + 8]
	fist dwordnum
	mov eax, dwordnum

	shl eax, 1
	mov al, '0'
	jnc pos
	mov al, '-'
	call WriteChar
	mov al, '1'
pos:
	call WriteChar
	mov al, '.'
	call WriteChar

	;Sorry Mike, I give up
	;I tried for a couple hours and have no idea what to do
	

	LEAVE
	ret 4
displayNum ENDP

; (insert additional procedures here)
END main


