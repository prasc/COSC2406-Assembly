INCLUDE Irvine32.inc


PopulateArray PROTO,
	arr:PTR SWORD,
	cols: DWORD,
	rows: DWORD

.data
NUM_ROWS = 5
NUM_COLS = 6

theArray		SWORD	NUM_ROWS * NUM_COLS DUP (?)


.code


main PROC
	call Randomize

	INVOKE PopulateArray, ADDR theArray, NUM_ROWS, NUM_COLS
	
main ENDP

PopulateArray PROC,
	arr:PTR SWORD,
	cols: DWORD,
	rows: DWORD

	pushad
	pushfd

	mov esi, arr
	mov edi, 0

	mov ecx, rows
Outer:
	push ecx				; preserve current row

	mov ecx, cols
Inner:
	mov eax, 1000 - (-1000)	+ 1				; (high - low  + 1) 
	call RandomRange
	add eax, -1000							; + low
	mov WORD PTR [esi +  edi], ax
	add edi, TYPE WORD
	loop Inner

	add esi, edi
	mov edi, 0

	pop ecx
	loop Outer

	
	popad
	popfd

	ret
PopulateArray ENDP


END main