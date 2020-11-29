; Assignment Seven		(powers.asm)

; Program Description:		Number asks user for input and outputs whether number if a power of two or not	
; Author:					Pras
; Creation Date:			Nov. 28, 2020	


INCLUDE Irvine32.inc

.data
prompt		BYTE	"Please enter a number which is a power of 2: ", 0
numInBin	BYTE	"This is the number in binary: ", 0
ifTrue		BYTE	"This number IS a power of 2", 0
ifFalse		BYTE	"This number IS NOT a power of 2", 0

input		DWORD	?
.code

main PROC
	mov edx, OFFSET	prompt		; ask user for a number
	call WriteString
	call CrLf

	call ReadDec				; read user input
	mov input, eax				; store user input into variable

	mov eax, input				; pass param to proc
	call isPowerOfTwo			; call isPowerOfTwo

	mov edx, OFFSET ifTrue		; assume number is power of two
	jz tru						; if correct, print string
	mov edx, OFFSET ifFalse		; if not power of two, change message
tru:
	call WriteString

	exit
main ENDP

isPowerOfTwo PROC
	pushad						; preserve registers
	clc							; clear register

L1:
	shl eax, 1					;shift  eax 1 to left
	jc L2						; if MSB was 1, carry flag will be set, move to L2
	loop L1						; if MSB was 0, proceed to next digit
L2:	
	test eax, eax				; if is power of two, rest of digits should be all zeros and zero flag should be set

	popad
	ret
isPowerOfTwo ENDP

END main