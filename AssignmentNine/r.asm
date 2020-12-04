; Assignment Nine		(r.asm)
; Program Description:		This program calculates the properties of a rhombicosidodecahedron
; Author:					Pras
; Creation Date:			December 4th 2020	


INCLUDE Irvine32.inc

.data
prompt	BYTE	"Please supply the length of one of the edges: ", 0
bye		BYTE	"Goodbye", 0
edge	REAL4	?
temp	REAL4	?

areaMsg		BYTE	"Area of Rhombicosidodecahedron is: ", 0
volMsg		BYTE	"Volume of Rhombicosidodecahedron: ", 0
radMsg		BYTE	"Misphere Radius of Rhombicosidodecahedron: ", 0

two		DWORD	2
three	DWORD	3
four	DWORD	4
five	DWORD	5
ten		DWORD	10
twentyF	DWORD	25
twentyN	DWORD	29
thirty	DWORD	30
sixty	DWORD	60

.code

main PROC
	FINIT

getEdge:
	mov edx, OFFSET prompt
	call WriteString
	call ReadFloat
	FLDZ					;loads zero onto stack
	FCOMP					; compare top of stack to zero (ST0 to ST1) then pop off zero
	FNSTSW AX				; move flag as signed word into AX register
	SAHF					; store ah into flag registers
	je goodbye				; if user types in zero, loop terminated
	jb cont					; if zero is less than edge, jump to cont
	FFREE ST(0)				; otherwise, pop off previous edge value
	jmp getEdge				; and ask for edge again
cont:
	fstp	edge							; take top of stack and move to edge then pop it off stack
	

;**********Calculate Area 

	FILD five								; ST(0) = 5
	fsqrt									; ST(0) = (sqrt5)
	FILD ten
	fmul 									; ST(0) = 10*(sqrt5)
	FILD twentyF							; 
	fadd									; ST(0) = 25 + 10*(sqrt5)									; 
	fsqrt									; ST(0) = sqrt(25 + 10*(sqrt5))
	FILD three
	fmul									; ST(0) = 3*sqrt(25 + 10*(sqrt5))

	fstp temp								; temp = 3*sqrt(25 + 10*(sqrt5))

	FILD three								; ST(0) = 3
	fsqrt									; ST(0) = sqrt(3)
	FILD five
	fmul									; ST(0) = 5 * sqrt(3)

	FILD thirty								; ST(0) = 30, ST(1) = 5 * sqrt(3)
	fadd									; ST(0) = 30 + 5 * sqrt(3)
	
	FLD temp								; ST(0) = temp, ST(1) = 30 + 5 * sqrt(3)
	fadd									; ST(0) = temp + 30 + 5 * sqrt(3)

	FLD edge								; ST(0) = e, ST(1) = temp + 30 + 5 * sqrt(3)
	FLD edge
	fmul									; ST(0) = e^2, ST(1) = temp + 30 + 5 * sqrt(3)

	fmul									; ST(0) = e^2 * (temp + 30 + 5 * sqrt(3))
	
	mov edx, offset areaMsg
	call WriteString
	call WriteFloat		
	call CrLf

;**********Calculate Volume 
	FFREE ST(0)								; empty stack
	
	FILD five								; ST(0) = 5
	fsqrt									; ST(0) = sqrt(5)

	FILD twentyN							; ST(0) = 29, ST(1) = sqrt(5)
	fmul									; ST(0) = 29 * sqrt(5)

	FILD sixty								; ST(0) = 60, ST(1) = 29 * sqrt(5)
	fadd									; ST(0) = 60 + 29 * sqrt(5)

	fstp temp								; temp = 60 + 29 * sqrt(5)

	FLD temp								; ST(0) = temp, ST(1) = 3
	FILD three								; ST(0) = 3
	fdiv									; ST(0) = temp / 3

	FLD edge								; ST(0) = edge, ST(1) = temp/3
	FLD edge
	FLD edge
	fmul
	fmul									; ST(0) = edge^3, ST(1) = temp/3

	fmul									; ST(0) = temp/3 * edge^3

	mov edx, offset volMsg
	call WriteString
	call WriteFloat	
	call CrLf

;**********Calculate Midsphere Radius 
	FFREE ST(0)								; empty stack

	FILD five								; ST(0) = 5
	fsqrt									; ST(0) = sqrt(5)

	FILD four								; ST(0) = 4, ST(1) = sqrt(5)
	fmul									; ST(0) = 4 * sqrt(5)

	FILD ten								; ST(0) = 10, ST(1) = 4 * sqrt(5)
	fadd									; ST(0) = 10 + 4 * sqrt(5)
	fsqrt									; ST(0) = sqrt(10 + 4 * sqrt(5))

	FLD edge								; ST(0) = edge, ST(1) = sqrt(10 + 4 * sqrt(5))
	fmul									; ST(0) = edge * sqrt(10 + 4 * sqrt(5))

	FILD two
	fdiv									; ST(0) = 1/2 * edge * sqrt(10 + 4 * sqrt

	mov edx, offset radMsg
	call WriteString
	call WriteFloat	
	call CrLf

	FFREE ST(0)								; empty stack
	call showFPUStack
	call CrLf
	jmp getEdge


goodbye:
	mov edx, offset bye
	call WriteString

	exit
main ENDP
; (insert additional procedures here)
END main


;fsqrt       