TITLE {PrintResults} (PrintResults.asm)
; Ask user for two inputs, add , subtract, and print them.

INCLUDE Irvine32.inc
;BYTE	-> 1
;WORD	-> 2
;DWORD	-> 4

.data
a		DWORD	? 
b		DWORD	?
str1	BYTE	"a + b = ", 0
str2	BYTE	"a - c = ", 0
prompt	BYTE	"Enter an integer: "

.code
main PROC
	mov edx, OFFSET prompt	;Syso (prompt)				; you're moving into edx, the location of prompt
	call WriteString		;							; writestring will print whatever you put in edx (edx is only for printng strings)

	call ReadInt			;a = in.nextInt()			; call ReadInt will store any signed input the user types in, into eax automatically
	mov a, eax				;							; mov the signed input from user that is stoerd in eax, into the first 4 bytes of the array a
														;4 bytes because eax = 32bits/4 bytes and a is an array of DWORDS = 4 bytes

	call WriteString		;Ask question again			; print whatever is in edx, since we didnt change the value in edx, it will print same thing

	call ReadInt			;collect b, which moves b to eax
	mov b, eax				;		mov leftside = right, mov left, right		means left = right

	mov edx, OFFSET str1	;Move str1 to edx			;putting new string into edx
	call WriteString		;Print str1					;printing new string that we just moved into edx

	mov eax, a				;store value of a in eax				;first we need to store value of a into a register because we cant add two variables
	add eax, b				;add eax (which is holding a) to b		;you can't do add a,b because you can't add two varaibles, thats why we store a into a register first
	call WriteInt			;print eax which is holding a + b		; WriteInt will print anything in eax. Only eax
	call CrLf				;Print new line

	mov edx, OFFSET str2	;Move str2 to edx
	call WriteString		;Print str2

	mov eax, a				;store value of a in eax
	sub eax, b				;subtract eax (which is holding a) to b
	call WriteInt			;print eax which is holding a - b
	call CrLf				;Print new line

	; edx = writeString
	; eax = writeDec, writeInt
	exit
main ENDP
END main