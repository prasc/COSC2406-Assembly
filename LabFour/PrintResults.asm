TITLE {PrintResults} (PrintResults.asm)
; Ask user for two inputs, add , subtract, and print them.

INCLUDE Irvine32.inc

.data
a		DWORD	? 
b		DWORD	?
str1	BYTE	"a + b = ", 0
str2	BYTE	"a - c = ", 0
prompt	BYTE	"Enter an integer: "

.code
main PROC
	mov edx, OFFSET prompt	;Syso (prompt)
	call WriteString		;

	call ReadInt			;a = in.nextInt()
	mov a, eax				;

	call WriteString		;Ask question again

	call ReadInt			;collect b, which moves b to eax
	mov b, eax				;store second num in ecx. ecx = eax

	mov edx, OFFSET str1	;Move str1 to edx
	call WriteString		;Print str1

	mov eax, a				;store value of a in eax
	add eax, b				;add eax (which is holding a) to b
	call WriteInt			;print eax which is holding a + b
	call CrLf				;Print new line

	mov edx, OFFSET str2	;Move str2 to edx
	call WriteString		;Print str2

	mov eax, a				;store value of a in eax
	sub eax, b				;subtract eax (which is holding a) to b
	call WriteInt			;print eax which is holding a - b
	call CrLf				;Print new line

	exit
main ENDP
END main