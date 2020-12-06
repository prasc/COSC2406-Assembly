; Assignment Nine		(floatingpoint.asm)
; Program Description:		This program displays the single-precision floating point binary value of a number
; Author:					Pras
; Creation Date:			December 4th 2020	


INCLUDE Irvine32.inc

.data
prompt	BYTE	"Enter a float value: ", 0
output	BYTE	"Real number in binary: ", 0

num		REAL4	?

.code

main PROC
	FINIT

	mov edx, OFFSET prompt
	call WriteString
	call ReadFloat

	fstp	num				; store userinput into num 

	push num
	call displayNum

	;mov edx, OFFSET output
	;call WriteString
	;call WriteFloat

	;call showFPUStack
	exit
main ENDP

displayNum PROC
	ENTER 0, 0

	fld REAL4 PTR [ebp + 8]
	call WriteFloat


	call showFPUStack
	LEAVE
	ret 4
displayNum ENDP

; (insert additional procedures here)
END main


