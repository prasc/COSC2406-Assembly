; Assignment Eight		(procs.asm)

; Program Description:		This program creates multiple orcedures that demosntrate advanced procedure methods	
; Author:					Pras
; Creation Date:			Dec 1 2020		


INCLUDE Irvine32.inc
.data
opt1	BYTE	"1 - Report the overall average", 0
opt2	BYTE	"2 - Count the negative numbers", 0
opt3	BYTE	"3 - Generate new random numbers", 0
opt4	BYTE	"4 - Print the balues, 10 per line", 0
opt5	BYTE	"0 - Exit", 0
opt6	BYTE	"Please enter a choice", 0

gbye		BYTE	"Goodbye", 0

randomNumArray		SDWORD		60 DUP(?)
choice				BYTE		?

avgMsg			BYTE		"The overall average is: ", 0
negsMsg			BYTE		"The number of negative numbers is: ", 0
genMsg			BYTE		"Array has been repopulated.", 0
printMsg		BYTE		"Array has been printed.", 0
invalidMsg		BYTE		"Invalid selection. Choice: .", 0


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


options:
	mov edx, OFFSET opt1		; Printing menu options
	call WriteString
	call CrLf
	mov edx, OFFSET opt2
	call WriteString
	call CrLf
	mov edx, OFFSET opt3
	call WriteString
	call CrLf
	mov edx, OFFSET opt4
	call WriteString
	call CrLf
	mov edx, OFFSET opt5
	call WriteString
	call CrLf
	mov edx, OFFSET opt6		; asking user to enter a value
	call WriteString
	call CrLf

	call ReadDec
	call CrLf

	cmp eax, 1
	jz averages

	cmp eax, 2
	jz countnegs

	cmp eax, 3
	jz gennew
	
	cmp eax, 4
	jz printvals

	cmp eax, 0
	jz bye

	
averages:
	;push OFFSET randomNumArray	; push array onto stack
	;push 60						; push number of elemnts in array
	;call AverageOfArray
	
	mov edx, OFFSET avgMsg		; Print average message
	call WriteString
	;call WriteInt				; Print average
	call CrLf
	call CrLf
	jmp options


countnegs:
	mov edx, OFFSET negsMsg		; Print average message
	call WriteString
	;call WriteInt				; Print average
	call CrLf
	call CrLf
	jmp options

gennew:
	mov edx, OFFSET genMsg		; Print average message
	call WriteString
	;call WriteInt				; Print average
	call CrLf
	call CrLf
	jmp options

printvals:
	mov edx, OFFSET printMsg	; Print average message
	call WriteString
	;call WriteInt				; Print average
	call CrLf
	call CrLf
	jmp options

bye: 
	mov edx, OFFSET gbye
	call WriteString


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