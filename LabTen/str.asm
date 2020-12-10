
INCLUDE Irvine32.inc

.data
NUM_ROWS = 7
NUM_COLS = 5
	
Array	SBYTE	NUM_ROWS * NUM_COLS DUP(?)
plus	BYTE	" + ", 0
equal	BYTE	" = ", 0

.code
main PROC
	call Randomize

	push NUM_COLS
	push NUM_ROWS
	push OFFSET Array
	call popRandom

	push NUM_COLS
	push NUM_ROWS
	push OFFSET Array
	call totalRows

	call CrLf
	push NUM_COLS
	push NUM_ROWS
	call totalWithDisplacement

	exit
main ENDP

totalWithDisplacement PROC
	push ebp
	mov ebp, esp
	sub esp, 8						; make space for local var

	mov ebx, [EBP + 16]
	mov [ebp - 8], ebx
	dec BYTE PTR [ebp - 8]			; store numOfCols - 1

	mov esi, 0					; set esi to starting address
	mov edi, 0						; edi starting at first col

	mov ecx, [EBP + 8]				; ecx has number of rows
Outer:
	push ecx						; store rows 
	mov DWORD PTR [ebp -4], 0		; total = 0

	mov ecx, [EBP + 12]				; ecx has number of cols
Inner:
	movsx eax, Array[esi + edi]		; store current row + col into eax
	call WriteInt

	add [ebp - 4], eax

	cmp edi, [ebp - 8] 
	jnb cont
	mov edx, OFFSET plus
	call WriteString

cont:
	add edi, TYPE BYTE
	loop Inner

	mov edx, OFFSET equal
	call WriteString
	mov eax, [ebp - 4]
	call WriteInt
	call CrLf

	add esi, edi					; add all bytes in first row to offset to get to next row
	mov edi, 0						; reset edi

	pop ecx							; restore current row we are on
	loop Outer
	
	mov esp, ebp
	pop ebp
	ret 12
totalWithDisplacement ENDP

totalRows PROC
	push ebp
	mov ebp, esp
	sub esp, 8						; make space for local var

	mov ebx, [EBP + 16]
	mov [ebp - 8], ebx
	dec BYTE PTR [ebp - 8]			; store numOfCols - 1

	mov esi, [EBP + 8]				; set esi to starting address
	mov edi, 0						; edi starting at first col

	mov ecx, [EBP + 12]				; ecx has number of rows
Outer:
	push ecx						; store rows 
	mov DWORD PTR [ebp -4], 0		; total = 0

	mov ecx, [EBP + 16]				; ecx has number of cols
Inner:
	movsx eax, BYTE PTR [esi + edi]	; store current row + col into eax
	call WriteInt

	add [ebp - 4], eax

	cmp edi, [ebp - 8] 
	jnb cont
	mov edx, OFFSET plus
	call WriteString

cont:
	add edi, TYPE BYTE
	loop Inner

	mov edx, OFFSET equal
	call WriteString
	mov eax, [ebp - 4]
	call WriteInt
	call CrLf

	add esi, edi					; add all bytes in first row to offset to get to next row
	mov edi, 0						; reset edi

	pop ecx							; restore current row we are on
	loop Outer
	
	mov esp, ebp
	pop ebp
	ret 12
totalRows ENDP

popRandom	PROC
	push ebp
	mov ebp, esp

	mov esi, [EBP + 8]				; set esi to starting address
	mov edi, 0						; edi starting at first col

	mov ecx, [EBP + 12]				; ecx has number of rows
Outer:
	push ecx						; store current row we are on

	mov ecx, [EBP + 16]				; ecx has number of columns
Inner:
	mov eax, 100 - (-50) + 1		; (high - low + 1)
	call RandomRange
	sub eax, 50						; (add min of range)

	mov BYTE PTR [esi + edi], al	; store random number at this address
	add edi, TYPE BYTE				; increment edi to next col
	loop Inner						; run inner loop for all columns

	add esi, edi					; add all bytes in first row to offset to get to next row
	mov edi, 0						; reset edi

	pop ecx							; restore current row we are on
	loop Outer
	

	pop ebp
	ret 12
popRandom	ENDP

END main