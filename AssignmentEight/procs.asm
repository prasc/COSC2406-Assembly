; Assignment Eight		(procs.asm)

; Program Description:		This program creates multiple orcedures that demosntrate advanced procedure methods	
; Author:					Pras
; Creation Date:			Dec 1 2020		


INCLUDE Irvine32.inc
PopulateArrayRandomly PROTO,
	arrayPtr:PTR SDWORD,
	arrayLen:SDWORD,
	hiNum:SDWORD,
	lowNum:SDWORD


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
invalidMsg		BYTE		"Invalid selection.", 0

.code

main PROC
	call Randomize				;initialize randomize function

	push -3000
	push 4500
	push LENGTHOF randomNumArray
	push OFFSET randomNumArray

	call PopulateArrayRandomly

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

	call ReadDec				; store user choice in eax
	call CrLf

	cmp eax, 1					; if user chooses 1, jump to averages
	jz averages

	cmp eax, 2					; if user chooses 1, jump to count negatives
	jz countnegs

	cmp eax, 3					; if user chooses 3, jump to generate new
	jz gennew
	
	cmp eax, 4					; if user chooses 4, jump to print values
	jz printvals

	cmp eax, 0					; if user chooses 0, jump to good bye
	jz bye

	mov edx, offset invalidMsg
	call WriteString
	call CrLf
	call CrLf
	jmp options

	
averages:
	push LENGTHOF randomNumArray
	push OFFSET randomNumArray
	call AverageOfArray
	
	mov edx, OFFSET avgMsg		; Print average message
	call WriteString
	call WriteInt				; Print average
	call CrLf
	call CrLf
	jmp options					; Jump back to menu


countnegs:
	push LENGTHOF randomNumArray
	push OFFSET randomNumArray
	call CountNegativeNumbers


	mov edx, OFFSET negsMsg		; Print negative values message
	call WriteString
	call WriteInt				; Print number
	call CrLf
	call CrLf
	jmp options					; Jump back to menu

gennew:
	INVOKE PopulateArrayRandomly, OFFSET randomNumArray, LENGTHOF randomNumArray, 4500, -3000

	mov edx, OFFSET genMsg		; Print numbers generated message
	call WriteString
	call CrLf
	call CrLf
	jmp options					; Jump back to menu

printvals:
	push 10
	push LENGTHOF randomNumArray
	push OFFSET randomNumArray
	call PrintArray

	mov edx, OFFSET printMsg	; Print array values
	call WriteString
	call CrLf
	call CrLf
	jmp options					; Jump back to menu

bye: 
	mov edx, OFFSET gbye		; Print good bye
	call WriteString


	exit
main ENDP

;****************************************************************
;AVERAGE OF ARRAY

; Receives: LENGTHOF randomNumArray, OFFSET randomNumArray
; Internally, [ebp - 4] holds sum
; Returns: average in eax
;****************************************************************

AverageOfArray PROC
	push ebp
	mov ebp, esp
	sub esp, 4					; make space for local variable

	mov ebx, 60

	mov esi, [ebp + 8]			; offset of array
	mov ecx, [ebp + 12]			; lengthof array (60)

L1:	
	mov eax, DWORD PTR [esi]			; offset of array
	add [ebp - 4], eax					; sum
	add  esi, TYPE DWORD
	loop L1

	mov eax, [ebp - 4]
	cdq
	idiv ebx

	mov esp, ebp
	pop ebp
	ret	4						; return answer in eax
AverageOfArray ENDP

;****************************************************************
;Count Negative Numbers

; Receives: LENGTHOF randomNumArray, OFFSET randomNumArray
; Internally, Local variable count holds amount of negative numbers
; Returns: negative numbers in eax
;****************************************************************

CountNegativeNumbers PROC USES esi ecx,
	arrayPtr:PTR DWORD,
	arrayLen:DWORD
	LOCAL count:DWORD

	mov esi, arrayPtr			; offset of array
	mov ecx, arrayLen			; lengthof array (60)

L1:	
	mov eax, DWORD PTR [esi]	; offset of array
	cmp eax, 0
	jge notNeg
	inc count
notNeg:
	add  esi, TYPE DWORD
	loop L1

	mov eax, count

	ret
CountNegativeNumbers ENDP

;****************************************************************
;Populate Array Randomly

; Receives: LENGTHOF randomNumArray, OFFSET randomNumArray, 3000, -4500
; Internally, Local variable range holds high - low + 1 -low
; Returns: Nothing
;****************************************************************

PopulateArrayRandomly PROC,
	arrayPtr:PTR SDWORD,
	arrayLen:SDWORD,
	hiNum:SDWORD,
	lowNum:SDWORD
	LOCAL range:SDWORD

	mov esi, arrayPtr
	mov ecx, arrayLen



L1:
	mov eax, hiNum				; high
	sub eax, lowNum				; high - low
	inc eax						; high - low + 1
	call RandomRange			; generate random number
	add eax, lowNum				; add low to fix low end of range
	mov DWORD PTR [esi], eax	
	add esi, type SDWORD
	loop L1						; populate array with 60 random values from -3000 to 4500


	ret
PopulateArrayRandomly ENDP

;****************************************************************
;Print Array

; Receives: LENGTHOF randomNumArray, OFFSET randomNumArray, number of elements to print per line
; Internally, Nothing
; Returns: Nothing
;****************************************************************

PrintArray PROC
	enter 0,  0
	pushad

	mov esi, [ebp + 8]			; offset of array
	mov ecx, [ebp + 12]			; lengthof array (60)
	mov ebx, [ebp + 16]			; num elements to print (10)


L1:	
	cmp ebx, 0
	je printNewLine
	mov eax, DWORD PTR [esi]			; offset of array
	call WriteInt
	mov al, ' '
	call WriteChar
	add  esi, TYPE DWORD
	dec ebx
	loop L1

printNewLine:
	call CrLf
	mov ebx, 10
	cmp ecx, 0
	jne L1

	call CrLf

	popad
	leave
	ret
PrintArray ENDP

END main