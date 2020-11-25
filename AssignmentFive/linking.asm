; Assignment Five		(linking.asm)

; Program Description:
; Author:				Pras Cheliyan
; Creation Date:		November, 22, 2020

INCLUDE Irvine32.inc

.data
prompt		BYTE	"Please enter the name of the data file: ", 0

fileName	BYTE	20 DUP(?)
fileHandle	DWORD	?
msgLength	DWORD	?
msgLength1	DWORD	?
bytesRead	DWORD	?
location	BYTE	?

letters		BYTE	256 DUP(?)
index		BYTE	256 DUP(?)


.code
main PROC
	mov edx, OFFSET prompt
	call WriteString

	mov edx, OFFSET fileName
	mov ecx, SIZEOF fileName
	call ReadString					;save file name into edx


	mov edx, OFFSET fileName
	call OpenInputFile				;open file using file name from edx
	mov fileHandle, eax				;save file handle

	mov eax, fileHandle
	mov edx, OFFSET msgLength
	mov ecx, 1
	call ReadFromFile
	mov bytesRead, eax;				;+54

	mov eax, msgLength

	mov eax, fileHandle
	mov edx, OFFSET letters
	mov ecx, msgLength
	call ReadFromFile

	mov edx, OFFSET letters
	call WriteString
	Call CrLf

	mov ebx, msgLength
	inc ebx
	mov msgLength1, ebx

	mov eax, fileHandle
	mov edx, OFFSET index
	mov ecx, msgLength1
	call ReadFromFile

	mov edx, OFFSET index
	call WriteString

	mov ecx, msgLength
	mov esi, msgLength

L1:	
	mov al, index[esi]
	mov location, al
	movzx edi, location
	mov al, letters[edi]
	call WriteChar
	mov esi, edi
	loop L1

	call CloseFile
	
	exit
main ENDP
; (insert additional procedures here)
END main