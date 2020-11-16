; AssignmentThree		(QuestionThree.asm)
; Program Description:	Question Three
; Author:				Pras Cheliyan
; Creation Date:		November 16, 2020
; Course:				COSC2406

INCLUDE Irvine32.inc

.data
promptWidth			BYTE	"Enter a width ", 0
promptHeight		BYTE	"Enter a height ", 0
promptAnswer		BYTE	"2*(width + height) is : ", 0
recWidth			DWORD	?
recHeight			DWORD	?

.code
main PROC
	mov edx, OFFSET promptWidth	; System.out.print(promptWidth)
	call WriteString			;

	call ReadDec				; width = in.nextInt()
	mov recWidth, eax		
	
	mov edx, OFFSET promptHeight; System.out.print(promptHeight)
	call WriteString			;

	call ReadDec				; height = in.nextInt()
	mov recHeight, eax	
	
	mov eax, recWidth				
	add recHeight, eax			; width + height

	mov eax, recHeight
	add eax, recHeight			; 2*(width + height)

	mov edx, OFFSET promptAnswer; print answer,stored in eax
	call WriteString
	call WriteDec
	call CrLf


	exit
main ENDP
; (insert additional procedures here)
END main