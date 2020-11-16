; AssignmentThree		(QuestionOne.asm)
; Program Description:	Question One
; Author:				Pras Cheliyan
; Creation Date:		November 16, 2020
; Course:				COSC2406

INCLUDE Irvine32.inc

.data
prompt			BYTE	"Enter a number ", 0
numOne			DWORD	?
copyOfNumOne	DWORD	?
strOne			BYTE	"Doubled number in decimal and binary", 0
strTwo			BYTE	"Copy of number in decimal and hex", 0

.code
main PROC
	mov edx, OFFSET prompt	; System.out.print(prompt)
	call WriteString		;

	call ReadDec			; numOne = in.nextInt()
	mov numOne, eax		

	mov copyOfNumOne, eax	; numTwo = numOne

	mov ebx, copyOfNumOne
	add numOne, ebx	
	
	mov eax, numOne
	mov edx, OFFSET strOne
	call CrLf
	call WriteString				; Print label for doubled num
	call CrLf
	call WriteInt
	call CrLf
	call WriteBin
	call CrLf
	call CrLf

	mov eax, copyOfNumOne
	mov edx, OFFSET strTwo
	call WriteString				; Print label for copy of num
	call CrLf
	call WriteInt
	call CrLf
	call WriteHex
	call CrLf

	exit
main ENDP
; (insert additional procedures here)
END main