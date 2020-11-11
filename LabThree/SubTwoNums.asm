TITLE Subtract Two Nums (SubTwoNums.asm)

INCLUDE Irvine32.inc

.data
prompt	BYTE	"Please enter a number: ", 0
msg		BYTE	"The first num minus the second num is ", 0

.code
main PROC
	mov edx, OFFSET prompt		;Ask the question
		call WriteString
		call ReadInt			;collect first num
	mov ebx, eax				;store first num in ebx
		call WriteString		;Ask question again
		call ReadInt			;collect second num

	sub ebx, eax				;ebx = ebx - eax
	mov edx, OFFSET msg		;print opening text
		call WriteString
	xchg eax, ebx				;put answers in eax
		call WriteInt			;print answer
		call CrLf
	exit
main ENDP
END main