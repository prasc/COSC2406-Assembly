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
	call Randomize					;initialize randomize function
	mov ecx, LENGTHOF numbers		;set loop counter
	mov esi, 0						;reset index register

L1:	
	mov eax, 200 - 0 + 1			;prepare eax for randomrange function
	call RandomRange
	mov numbers[esi], ax			;move word from ax into numbers array at esi
	add esi, TYPE WORD				;increment index by two
	loop L1

	mov edx, OFFSET filled			;print message filled
	call WriteString				
	call CrLf

	mov ebx, OFFSET numbers			;move address of numbers array to ebx
	mov ecx, LENGTHOF numbers		;set loop counter to length of numbers
	call outputArray				;call outputArray
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
	mov esi, 0						;reset index register
	dec ecx							;instead of loop running 10 times, will run 10-1

	mov al, '{'						;print char
	call WriteChar

L1:	
	movzx eax, WORD PTR [ebx]		;go to address of ebx and take a word, then extend it into eax
	call WriteInt					;print number in eax
	mov edx, OFFSET comma			
	call WriteString				
	add ebx, TYPE WORD				;increment ebx address by a word
	loop L1							

	movzx eax, WORD PTR [ebx]		;loop only ran 9 times, now we run 10th here
	call WriteInt					;only prints int, without printing extra comma
	mov al, '}'						;print char
	call WriteChar

	ret
outputArray ENDP

createRunningTool PROC
	pushfd							;preserve flags
	pushad							;preserve registers

	mov eax, 0						;reset eax

L1:	
	movzx esi, WORD PTR [ebx]		;go to ebx address, take a word, extend into esi
	add eax, esi					;add esi value to eax
	mov [edx], ax					;go to edx address, move 2 bytes from ax
	add ebx, TYPE WORD					
	add edx, TYPE WORD
	loop L1

	popad
	popfd

	ret
createRunningTool ENDP

END main