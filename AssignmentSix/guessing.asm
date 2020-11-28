; Assignment Six		(guessing.asm)

; Program Description:	Program immitates a while loop structure in Java
; Author:				Pras
; Creation Date:		November, 26

INCLUDE Irvine32.inc

.data
lowRange		DWORD	?
hiRange			DWORD	?

lowerNum		DWORD	?
upperNum		DWORD	?
numToGuess		DWORD	?
guess			DWORD	?
countGuesses	DWORD	?

outPrompt		BYTE	"You guessed the number in ", 0
outPrompt2		BYTE	" tries.", 0

gPrompt			BYTE	"Guess a number between ", 0
andPrompt		BYTE	" and ", 0
colonPrompt		BYTE	": ", 0

rangePrompt		BYTE	"Your guess is out of range.", 0
congratsPrompt	BYTE	"Congratulations -you guessed it!", 0
lPrompt			BYTE	"Your guess is too low.", 0
hPrompt			BYTE	"Your guess is too high.", 0

.code
main PROC
	call Randomize				;initialize randomize function

	mov lowRange, 1				;set low end of range
	mov hiRange, 30				;set high end of range
	call betterRandomNumber
	mov lowerNum, eax			; save value from proc to lowerNum
	
	mov lowRange, 90
	mov hiRange, 120
	call betterRandomNumber
	mov upperNum, eax

	mov ebx, lowerNum
	mov ecx, upperNum

	mov lowRange, ebx			; use previously generated num as low end of range
	mov hiRange, ecx			; use previously generated num as high end of range
	call betterRandomNumber
	mov numToGuess, eax			; save value based on two previous ranges

	mov guess, 0				; initialize to zero
	mov countGuesses, 0			; initialize to zero

L0:	
	mov ebx, numToGuess			
	cmp guess, ebx				; check if guess != numToGuess
	jz DONE						; if guess == numToGuess, you're done

L1:
	mov edx, OFFSET gPrompt		
	call WriteString
	mov eax, lowerNum
	call WriteDec
	mov edx, OFFSET andPrompt
	call WriteString
	mov eax, upperNum
	call WriteDec
	mov edx, OFFSET colonPrompt
	call WriteString			;print instructions

	call ReadInt
	mov guess, eax					;Store user's guess into guess variable
	inc countGuesses				;increment number of guesses

	mov ebx, lowerNum
	mov ecx, upperNum
	cmp guess, ebx					;if guess < lowerNumber 
	ja L2
	cmp guess, ecx
	jb L2
	mov edx, OFFSET rangePrompt
	call WriteString
	call CrLf

L2:
	mov ebx, numToGuess
	cmp guess, ebx					; else if guess == numberToGuess
	jnz L3
	mov edx, OFFSET congratsPrompt
	call WriteString
	call CrLf
	jmp DONE

L3:	
	mov ebx, numToGuess				; else if guess < numberToGuess
	cmp guess, ebx
	ja L4
	mov edx, OFFSET lPrompt
	call WriteString
	call CrLf
	jmp L0

L4:			
	mov edx, OFFSET hPrompt			; print hPrompt
	call WriteString
	call CrLf
	jmp L0

DONE: 
	mov edx, OFFSET outPrompt
	call WriteString
	mov eax, countGuesses
	call WriteDec
	mov edx, OFFSET outPrompt2
	call WriteString
	call CrLf

	exit
main ENDP

betterRandomNumber PROC
	
	mov eax, hiRange				; prepare eax for randomrange function
	sub eax, lowRange
	dec eax
	call RandomRange				; call randomrange fnuction and it will generate value from range in eax
	add eax, lowRange				; add this to increase floor of range to low number

	ret
betterRandomNumber ENDP

END main