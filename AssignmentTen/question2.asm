; Assignment Ten		(2darray.asm)

; Program Description:	Perform multiple operations with 2D Arrays		
; Author:				Pras
; Creation Date:		Dec 9 2020		


INCLUDE Irvine32.inc

sumColumnOfArray PROTO,
	NUM_COLS: DWORD,
	NUM_ROWS: DWORD,
	Array: PTR SWORD,
	COL_INDEX: DWORD

.data
NUM_ROWS = 7
NUM_COLS = 5

Array		SWORD	NUM_ROWS * NUM_COLS DUP(?)
COL_INDEX	DWORD	?
prompt		BYTE	"Please enter a column index: ", 0
output		BYTE	"Total of column is: ", 0

.code

main PROC
	call Randomize

	call populateArray

	push NUM_COLS
	push NUM_ROWS
	push OFFSET Array
	call printArray 
	call CrLf

ask:
	mov edx, OFFSET prompt
	call WriteString
	call ReadInt
	cmp eax, 0
	jb ask
	cmp eax, NUM_COLS
	jae ask

	mov COL_INDEX, eax

	INVOKE sumColumnOfArray, NUM_COLS, NUM_ROWS, OFFSET Array, COL_INDEX
	
	mov edx, OFFSET output
	call WriteString
	call WriteInt

	exit
main ENDP

populateArray PROC
	mov esi, 0
	mov edi, 0


	mov ecx, NUM_ROWS
Outer:
	push ecx

	mov ecx, NUM_COLS
Inner:
	mov eax, 100 - (-50) + 1		; (high - low + 1)
	call RandomRange
	sub eax, 50						
	mov Array[esi + edi], ax

	add edi, TYPE Array
	loop Inner

	add esi, edi					; add all bytes in first row to offset to get to next row
	mov edi, 0						; reset edi

	pop ecx							; restore current row we are on
	loop Outer

	ret
populateArray ENDP

printArray PROC
	push ebp
	mov ebp, esp

	mov esi, [EBP + 8]				; set esi to starting address
	mov edi, 0						; edi starting at first col

	mov ecx, [EBP + 12]				; ecx has number of rows
Outer:
	push ecx						; store current row we are on

	mov al, '|'
	call WriteChar

	mov ecx, [EBP + 16]				; ecx has number of columns
Inner:
	movsx eax, SWORD PTR [esi + edi]
	call WriteInt

	cmp ecx, 1
	je CONT

	mov al, ','
	call WriteChar

CONT:
	add edi, TYPE SWORD				; increment edi to next col
	loop Inner						; run inner loop for all columns

	mov al, '|'
	call WriteChar
	call CrLf

	add esi, edi					; add all bytes in first row to offset to get to next row
	mov edi, 0						; reset edi

	pop ecx							; restore current row we are on
	loop Outer
	

	pop ebp
	ret 12
printArray ENDP

comment ! 
sumColumnOfArray PROC,
	cols: DWORD,
	rows: DWORD,
	arr: PTR SWORD,
	column_index: DWORD
	LOCAL total:DWORD

	mov esi, arr							; set esi to starting address
	mov edi, [column_index]	; edi starting at user input

	mov total, 0

	mov ecx, rows					; ecx has number of rows
L1:
	add total, WORD PTR [esi + edi]
	loop L1

	ret
sumColumnOfArray ENDP
!

END main