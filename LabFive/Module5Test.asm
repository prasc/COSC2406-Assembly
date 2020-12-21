
; Author:			Pras  Cheliyan
; Creation Date:	Nov 20 2020


INCLUDE Irvine32.inc

.data

prompt		BYTE	"The number box: ", 0
count		DWORD	?

.code
main PROC
	mov edx, OFFSET prompt
	call WriteString
	call CrLf

	mov ecx, 8					; set ecx to outter loop count									 

outer:	
	mov count, ecx				; preserve outter loop count
	mov ecx, 5					; set ecx to inner loop count
	inner:
	mov eax, ecx				; move inner loop count to eax
	call WriteInt				; print inner loop count
	mov al, " "					; print blank space
	call WriteChar			
	loop inner					; repeat inner loop until 0			
	call CrLf					; print new line
	mov ecx, count				
	loop outer					; do that 8 times


	exit
main ENDP

END main
