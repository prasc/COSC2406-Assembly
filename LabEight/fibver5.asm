TITLE   Fibonacci Version 1 - Using Register Parameters  (FibVer1.asm)
; This is a recursive version of Fibonacci
; using registers for parameter passing

INCLUDE Irvine32.INC

Fib PROTO,
	num:DWORD


.data
prompt	BYTE	"Enter value n for fib(n): ", 0
msg1a	BYTE	"Calculating fib(", 0
msg1b	BYTE	") - please wait...", 0dh, 0ah, 0
msg2a	BYTE	"Fib(", 0
msg2b	BYTE	") = ", 0
		
n		DWORD	10

.code

main PROC
	mov	edx, OFFSET prompt
	call WriteString
	call ReadDec
	mov n, eax
    
	mov	edx, OFFSET msg1a
	call WriteString
	call WriteDec
	mov edx, OFFSET msg1b
	call WriteString

	INVOKE Fib, n

	mov edx, OFFSET msg2a
	call WriteString
	mov ebx, n
	xchg eax, ebx
	call WriteDec
	mov edx, OFFSET msg2b
	call WriteString
	xchg eax, ebx
	call WriteDec
	call Crlf

	exit
main ENDP

;****************************************************************
Fib PROC,
	num:DWORD
	LOCAL temp:DWORD

; Receives: EAX is N
; Internally, ebx used to hold an interim value
; Returns: EAX is Fib(n-1)+Fib(n-2), Fib(0) = 0, Fib(1) = 1
;****************************************************************
	
	mov eax, num				; moving n into eax

	cmp eax, 1					; base case: n=0 or n=1, jmp to end and return n	
	jbe fibEnd					; jump if below or equal to 0 

	dec num						; n-1
	INVOKE Fib, num				; calculate Fib(n-1)

	mov temp, eax				; use local var to hold Fib(n-1)


	dec num						; n-2
	INVOKE Fib, num				; calculate Fib(n-2)

	add eax, temp				; add Fib(n-1) to Fib(n-2)


fibEnd:
	ret							; return answer in eax
fib ENDP

END main