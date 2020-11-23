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
	mov edx, OFFSET letters 
	mov ecx, SIZEOF msgLength
	call ReadFromFile





	

	call CloseFile
	
	exit
main ENDP
; (insert additional procedures here)
END main