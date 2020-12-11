; Assignment Ten		(substring.asm)

; Program Description:		This program will return a sub string of a string that a user will input
; Author:					Pras
; Creation Date:			December 9 2020


INCLUDE Irvine32.inc

str_substring PROTO,
	namedSource:PTR BYTE, 
	namedTarget:PTR BYTE, 
	fIndex:DWORD, 
	lIndex:DWORD

.data
prompt		BYTE	"Enter a string: ", 0
startIndex	BYTE	"Start index: ", 0
endIndex	BYTE	"End index: ", 0
output		BYTE	"Substring: ", 0

source		BYTE	20 DUP(?)
target		BYTE	20 DUP(?)
indexFirst	DWORD	?
indexLast	DWORD	?

.code

main PROC
	mov edx, OFFSET	prompt		; ask user for string
	call WriteString

	mov edx, OFFSET source
	mov ecx, SIZEOF source
	call ReadString				; store string into source

	mov edx, OFFSET endIndex
	call WriteString
	call ReadDec				
	mov indexLast, eax			; store start index into indexFirst

	mov edx, OFFSET startIndex
	call WriteString
	call ReadDec				
	mov indexFirst, eax			; store start index into indexFirst

	INVOKE str_substring, ADDR source, ADDR target, indexFirst, indexLast

	mov edx, OFFSET	output
	call WriteString

	exit
main ENDP

str_substring PROC,
	namedSource:PTR BYTE, 
	namedTarget:PTR BYTE, 
	fIndex:DWORD, 
	lIndex:DWORD

	mov ecx, fIndex			

	ret
str_substring ENDP

END main