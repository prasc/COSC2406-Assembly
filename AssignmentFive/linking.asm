; Assignment Five		(linking.asm)

; Program Description:
; Author:				Pras Cheliyan
; Creation Date:		November, 22, 2020

INCLUDE Irvine32.inc

.data
letters		BYTE	256 DUP(?)
index		BYTE	256 DUP(?)
prompt		BYTE	"Please enter the name of the data file: ", 0


.code
	mov edx, OFFSET prompt
	Call WriteString




main PROC
	; write your code here
	exit
main ENDP
; (insert additional procedures here)
END main