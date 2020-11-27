; Assignment Six		(isdigit.asm)

; Program Description:	Program will parse user input and return number of chars and letters
; Author:				Pras
; Creation Date:		November, 26

INCLUDE Irvine32.inc

.data
prompt		BYTE		"Please enter a string: ", 0
lPrompt		BYTE		"The number of letters are: ", 0
bPrompt		BYTE		"The number of chars read are: ", 0
byteCount	DWORD		?
buffer		BYTE		256 DUP(?)
letterCount	DWORD		?

.code
main PROC
	mov edx, OFFSET prompt		;Print prompt
	call WriteString

	mov edx, OFFSET buffer		;initialize buffer for readString
	mov ecx, SIZEOF buffer		;initialzie chars to read
	call ReadString
	mov byteCount, eax			;store chars read into variable
	call CrLf

	mov esi, 0
	mov ecx, byteCount
L1:
	mov al, buffer[esi]
	call isLetter
	jnz L2						;If ZF = 0, not a letter so don't inc count
	inc letterCount
L2:
	add esi, TYPE buffer
	loop L1

	mov edx, OFFSET lPrompt
	call WriteString
	mov eax, letterCount
	call WriteDec
	call CrLf

	mov edx, OFFSET bPrompt
	call WriteString
	mov eax, byteCount
	call WriteDec

	exit
main ENDP

isLetter PROC
PUSH AX
	cmp al, 065					;ascii value for 'A' which is lowest char
	jb L1

	cmp al, 122					;ascii value for 'z' which is highest char
	ja L1

	xor al, al					;this will set zero flag	
	;test al, 0

L1:
	POP AX
	ret

isLetter ENDP

END main