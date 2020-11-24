; Assignment Five		(betterrange.asm)

; Program Description:
; Author:				Pras Cheliyan
; Creation Date:		November, 22, 2020
; Description:			This program generates a random number within the range the user specifies

INCLUDE Irvine32.inc

.data
lowPrompt	BYTE	"Please enter the lower number of the range: ", 0
hiPrompt	BYTE	"Please enter the higher number of the range: ", 0
lowNum		DWORD	?
highNum		DWORD	?

.code
main PROC
	call Randomize				;initialize randomize function
	mov ecx, 5
	
L1:	
	mov edx, OFFSET lowPrompt	; ask user for low number of range
	call WriteString

	call ReadDec
	mov lowNum, eax				; store low number of  range

	mov edx, OFFSET hiPrompt	
	call WriteString			; ask user for high number of range

	call ReadDec			
	mov highNum, eax			;	store high number of range


	mov eax, highNum				; prepare eax for randomrange function
	call RandomRange				; call randomrange fnuction and it will generate value from range in eax
	add eax, lowNum					; add this to increase floor of range to low number
	call WriteDec
	call CrLf
	loop L1					
	
	exit
main ENDP
; (insert additional procedures here)
END main