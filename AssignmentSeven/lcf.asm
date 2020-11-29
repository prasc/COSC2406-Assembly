; Assignment Seven		(lcf.asm)

; Program Description:		Program finds largest common factor
; Author:					Pras
; Creation Date:			Nov. 28, 2020	


INCLUDE Irvine32.inc

.data
fPrompt		BYTE	"Enter first integer: ", 0
sPrompt		BYTE	"Enter second integer: ", 0

wrong		BYTE	"Zero cannot be used.", 0
output		BYTE	"For the numbers ", 0
output2		BYTE	" and ", 0
output3		BYTE	" the greatest common divisor is ", 0

bye			BYTE	"Goodbye.",0

val1		DWORD	?
val2		DWORD	?
.code

main PROC
	mov val1, 0
	mov val2, 0
L1:
	mov edx, OFFSET	fPrompt		; ask user for val1
	call WriteString
	call CrLf
	call ReadInt
	mov val1, eax				; store val1

	mov edx, OFFSET	sPrompt		; ask user for val2
	call WriteString
	call CrLf
	call ReadInt
	mov val2, eax				; store val2

	cmp val1, 0					; check if val1 == 0
	mov edx, OFFSET wrong
	jne L2						; if it doesn't move on
	call WriteString			; if it does, print string
	call CrLf
	jmp L4						; then jump out of if statement
L2:	
	cmp val2, 0					; check if val2 == 0
	jne L3						; if it doesnt' move on
	call WriteString			; if it does, print string
	call CrLf
	jmp L4						; then jump out of if statement

L3:
	mov edx, OFFSET output		
	call WriteString			; print "For the numbers "
	mov eax, val1
	call WriteInt				; print val 1
	mov edx, OFFSET output2
	call WriteString			; print " and "
	mov eax, val2
	call WriteInt				; print val2
	mov edx, offset output3		; print " the gcm  is "

	call findGCD				; call procedure
	call WriteString			; print gcm
	call CrLf

L4:
	cmp val1, 0					; check if val1 == 0
	jne L1						; if it doesn't start again at L1
	cmp val2, 0					; check if val1 == 0
	jne L1						; if it doesn't start again at L1

	call CrLf
	mov edx, OFFSET bye			
	call WriteString			; otherwise, print "goodbye"

	exit
main ENDP

findGCD PROC


L1:

	ret
findGCD	ENDP
END main