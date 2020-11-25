; Lab Six			(Recursion.asm)

INCLUDE Irvine32.inc

.data
num		DWORD	?
answer	DWORD	?
prompt	BYTE	"Enter the n value for func(n) or negative to terminate ", 0
out1	BYTE	"func(", 0
out2	BYTE	") =", 0

bye		BYTE	"Good bye!", 0


.code

main PROC
	
L1:	
	mov edx, OFFSET prompt		;ask user for num
	call WriteString
	call ReadInt
	call CrLf
	mov num, eax				
	
	mov eax, 0					;answer for func(0)

	cmp num, 1					;check if n == 1
	jne L2						;if not, jump to L2
	mov eax, 3					;if yes did, set eax to 3

L2:
	cmp num, 2					;check if n == 2
	jne L3						;if not, jump to L3
	mov eax, 2					;if yes, set eax to 2
	
L3:
	cmp num, 2					
	jng L4	
	mov eax, num
	call func
	mov answer, eax


L4:
	mov edx, OFFSET out1
	call WriteString
	mov ebx, eax			;store eax value
	mov eax, num			
	call WriteDec			;print num
	mov  edx, OFFSET out2
	call WriteString
	mov eax, ebx			;restore eax value
	call WriteDec
	call CrLf

	cmp num, 0
	jge	L1

	mov edx, OFFSET bye
	call WriteString

	exit
main ENDP

func PROC
; func(n) = 2 *func(n-1) + func(n-3) for n > 2

	mov ebx, 0			;setting initial values
	mov edx, 3
	mov esi, 2
	
	mov edi, esi
	add edi, edi
	sub edi, ebx		; answer for func(3) initially

	mov ecx, eax
L1:	
	cmp ecx, 3
	jng L2
	mov ebx, edx
	mov edx, esi
	mov esi, edi

	mov edi, esi
	add edi, edi
	sub edi, ebx

	dec ecx
	jmp L1

L2:	
	mov eax, edi



ret
func ENDP

END main