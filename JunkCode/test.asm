INCLUDE Irvine32.inc

.data
prompt			BYTE		"Enter three positive integers for A, B and C:  ", 0	
output			BYTE		"A + B - C ="
a				DWORD       ?
b				DWORD       ?
cee				DWORD		?
result			DWORD		?

.code

main PROC
	mov edx, OFFSET prompt
	call WriteString
	call CrLf

	call ReadDec
	mov a, eax

	call ReadDec
	mov b, eax

	call ReadDec
	mov cee, eax

	mov eax, a
	add eax, b

	sub eax, cee

	mov edx, OFFSET output
	call WriteString
	call WriteDec


	exit
main ENDP

populateNumbersArray PROC
	call Randomize
	mov ecx, LENGTHOF numbers

L1:
	push eax				; to preserve high value 
	call RandomRange		
	add eax, ebx
	mov wArray[esi], eax
	add esi, TYPE wArray	
	pop eax					; to restore high value for next call 
	loop L1


	ret
populateNumbersArray ENDP

; (insert additional procedures here)
END main