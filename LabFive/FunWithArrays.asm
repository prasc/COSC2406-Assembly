; LabFive		(FunWithArrays.asm)

; Author:			Pras  Cheliyan
; Creation Date:	Nov 20 2020


INCLUDE Irvine32.inc

.data
numbers		WORD	10	DUP (?)
totals		WORD	10	DUP (?)
filled		BYTE	"The array has been filled with random numbers", 0
comma		BYTE	", "

.code
main PROC
	call Randomize 
	mov ecx, LENGTHOF numbers
	mov esi, 0

L1:	
	mov eax, 200 - 0 + 1
	call RandomRange
	mov numbers[esi], ax
	add esi, TYPE WORD
	loop L1

	mov edx, OFFSET filled
	call WriteString
	call CrLf

	mov ebx, OFFSET numbers 
	mov ecx, LENGTHOF numbers
	call outputArray
	call CrLf

	mov ebx, OFFSET numbers
	mov edx, OFFSET totals
	mov ecx, LENGTHOF numbers
	call createRunningTool

	mov ebx, OFFSET totals 
	mov ecx, LENGTHOF totals
	call outputArray

	exit
main ENDP

outputArray PROC
	
	mov esi, 0

	mov al, '{'
	call WriteChar

L1:	
	movzx eax, WORD PTR [ebx]
	call WriteInt
	mov edx, OFFSET comma
	call WriteString
	add ebx, TYPE WORD
	loop L1

	mov al, '}'
	call WriteChar

	ret
outputArray ENDP

createRunningTool PROC
	pushfd
	pushad

	mov eax, 0

L1:	
	movzx esi, WORD PTR [ebx]
	add eax, esi
	mov [edx], ax
	add ebx, TYPE WORD
	add edx, TYPE WORD
	loop L1

	popad
	popfd

	ret
createRunningTool ENDP

END main