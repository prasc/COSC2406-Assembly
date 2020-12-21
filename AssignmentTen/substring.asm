; Assignment Ten		(substring.asm)

; Program Description:		This program will return a sub string of a string that a user will input
; Author:					Pras
; Creation Date:			December 9 2020


INCLUDE Irvine32.inc

str_substring PROTO,
	namedSource:PTR BYTE, 
	namedTarget:PTR BYTE, 
	startingIndex:DWORD, 
	endingIndex:DWORD

.data
prompt		BYTE	"Enter a string: ", 0
startIndex	BYTE	"Start index: ", 0
endIndex	BYTE	"End index: ", 0
output		BYTE	"Substring: ", 0

indexFirst	DWORD	?
indexLast	DWORD	?
 
source		BYTE	20 DUP(?)
target		BYTE	20 DUP(?)

.code

main PROC
	mov edx, OFFSET	prompt		; ask user for string
	call WriteString

	mov edx, OFFSET source
	mov ecx, SIZEOF source
	call ReadString				; store string into source

	mov edx, OFFSET startIndex
	call WriteString
	call ReadDec				
	mov indexFirst, eax			; store start index into indexFirst

	mov edx, OFFSET endIndex
	call WriteString
	call ReadDec				
	mov indexLast, eax			; store start index into indexFirst

	mov edx, OFFSET	output
	call WriteString

	INVOKE str_substring, ADDR source, ADDR target, indexFirst, indexLast

	call CrLf

	exit
main ENDP

str_substring PROC,
	namedSource:PTR BYTE, 
	namedTarget:PTR BYTE, 
	startingIndex:DWORD, 
	endingIndex:DWORD

	; if (endingIndex <= startingIndex) return empty string
	mov eax, endingIndex
	cmp eax, startingIndex
	jbe emptyString

	INVOKE Str_length, ADDR namedSource			; length is in eax

	; if (startingIndex > namedSource.length) return empty string
	mov ebx, startingIndex
	cmp ebx, eax
	ja emptyString

	; if (endingIndex > namedSource.length) endingIndex = namedSource.length 
	mov ebx, endingIndex
	cmp ebx, eax
	jbe CONT
	mov endingIndex, eax							; move to lIndex, namedSource.length

CONT:

	mov ecx, endingIndex
	sub ecx, startingIndex
	mov esi, namedSource
	mov edi, endingIndex
	cld
	rep movsb

	mov edx, namedSource
	call WriteString

	call CrLf
	mov edx, endingIndex
	call WriteString


emptyString:

	ret
str_substring ENDP

END main