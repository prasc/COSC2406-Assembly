TITLE Subtract Two Nums (SubTwoNums.asm)

INCLUDE Irvine32.inc

.data
prompt	BYTE	"Please enter a number: ", 0
msg		BYTE	"(2 * num2 + 20 - 3 * num1) is: ", 0

.code
main PROC
	mov edx, OFFSET prompt		;Ask the question
		call WriteString
		call ReadInt			;collect first num
	mov ebx, eax				;store first num in ebx. ebx = eax
		call WriteString		;Ask question again
		call ReadInt			;collect second num
	mov ecx, eax				;store second num in ecx

	add ecx, ecx				; ecx = num2 + num2
	add ecx, 20					; ecx = num2 + num2 + 20
	
	mov eax, ebx				; ebp is going to store the initial value of ebx
	add ebx, ebx				; ebx = ebx + ebx;
	add ebx, ebx				; ebx = ebx + ebx + ebx;
	sub ebx, eax				; now we have num1 * 4 and we are gonna subtract the num1 value from it.

	sub ecx, ebx				;ecx = ecx - ebx
	mov edx, OFFSET msg		;print opening text
		call WriteString
	xchg eax, ecx				;put answers in eax
		call WriteInt			;print answer
		call CrLf
	exit
main ENDP
END main