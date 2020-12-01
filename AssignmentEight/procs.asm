; Assignment Eight		(procs.asm)

; Program Description:		This program creates multiple orcedures that demosntrate advanced procedure methods	
; Author:					Pras
; Creation Date:			Dec 1 2020		


INCLUDE Irvine32.inc
.data
randomNumArray		SDWORD		60 DUP(?)

avgMsg			BYTE		"The overall average is: ", 0

.code

main PROC
	call Randomize				;initialize randomize function

	mov ecx, LENGTHOF randomNumArray
	mov esi, 0

L1:
	mov eax, 4500				; high
	sub eax, -3000				; high - low
	inc eax						; high - low + 1
	call RandomRange			; generate random number
	add eax, -3000				; add low to fix low end of range
	mov randomNumArray[esi], eax	
	;call WriteInt
	;call CrLf
	add esi, type SDWORD
	loop L1						; populate array with 60 random values from -3000 to 4500


	push OFFSET randomNumArray	; push array onto stack
	push 60						; push number of elemnts in array
	call AverageOfArray

	mov edx, OFFSET avgMsg		; Print average message
	call WriteString
	;call WriteInt				; Print average

	exit
main ENDP

;*******************************************
;AVERAGE OF ARRAY
;*******************************************

AverageOfArray PROC
	LOCAL sum:SDWORD
	push ebp
	mov ebp, esp

	mov esi, [ebp + 12]			;randomNumArray
	mov ecx, [ebp + 8]			;length of randomNumArray

L1:
	add sum, esi
	add esi, type SDWORD
	loop L1


	mov eax, sum

	cdq
	mov ecx, 60
	idiv ecx

	pop ebp
	ret 8
AverageOfArray ENDP



;*******************************************
;COUNT NEGATIVE NUMBERS
;******************************************* 

CountNegativeNumbers PROC

	ret
CountNegativeNumbers ENDP

;******************************************* 
;POPULATE ARRAY RANDOMLY
;******************************************* 

PopulateArrayRandomly PROC

	ret
PopulateArrayRandomly ENDP

;*******************************************
;PRINT ARRAY
;*******************************************

PrintArray PROC

	ret
PrintArray ENDP

END main