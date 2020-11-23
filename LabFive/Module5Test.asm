
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

	mov ecx, 8																					 

L1:	
	mov count, ecx
	mov ecx, 5
	L2:
	mov eax, ecx
	call WriteInt
	mov al, " "
	call WriteChar
	loop L2
	call CrLf
	mov ecx, count
	loop L1


	exit
main ENDP

END main
