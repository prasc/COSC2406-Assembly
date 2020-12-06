; Lab 9		(fpu.asm)

; Program Description:	Get properties of rectangle based on user input	
; Author:				Pras
; Creation Date:		Dec 04 2020	


INCLUDE Irvine32.inc

getPerimeter PROTO,
	namedWidth: REAL4, namedHeight:REAL4

.data
recWidth		REAL4	?
recHeight		REAL4	?
recArea			REAL4	?
recPerim		REAL4	?
areaPerimRatio	REAL4	?

msg1	BYTE	"Please enter the rectangle width: ",0
msg2	BYTE	"Please enter the rectangle height: ",0
msg3	BYTE	"The area of the rectangle is: ",0
msg4	BYTE	"The perimeter of the rectangle is: ",0
msg5	BYTE	"The ratio of width/height is: ",0

.code
main PROC
	FINIT	

getWidth:
	mov edx, OFFSET msg1			 
	call WriteString				; ask for width
	call ReadFloat					; store userinput on stack
	fldz							; put a zero on the stack
	fcomp							; compare ST(0) and ST(1)
	fnstsw ax						; move flag as signed word to ax
	sahf							; store ah into flags
	jb CONT							; if zero is below userinput, move on

	FFREE st(0)						; input is invalid so clear it
	jmp getWidth					; ask for width again

CONT:
	fstp recWidth					; move userinput into variable

	mov edx, OFFSET msg2
	call WriteString
	call ReadFloat
	fldz							; put zero onto stack
	fcomip ST(0), ST(1)				; compare zero to item on stack
	jb CONT2						; if zero is below the item, move on
	fabs							; if its negative, get the absolute value of it 

CONT2:
	fstp recHeight					; pop user input off stack and store it into recHeight

;*********************GET AREA
	push recWidth
	push recHeight
	call getArea					; call getArea with two the two params above it

	mov edx, OFFSET msg3
	call WriteString
	call WriteFloat
	call CrLf
	fstp recArea					; pop off item on stack and move it into recArea

;*********************GET PERIMETER
	;push recHeight
	;push recWidth
	INVOKE getPerimeter, recWidth, recHeight				; call proc  

	mov edx, OFFSET msg4			
	call WriteString
	call WriteFloat
	call CrLf
	fstp recPerim					; pop off item on stack and move it into recPerim
							

;*********************GET RATIO	
	fld recWidth					; puting width on stack
	fld recHeight					; putting height on stack
	fdiv							; dividing width by height

	mov edx, OFFSET msg4
	call WriteString
	call WriteFloat
	call CrLf
	fstp areaPerimRatio				; store item on top of stack into areaPerimRatio


	call showFPUStack
	exit
main ENDP

getArea PROC
	ENTER 0, 0
	fld REAL4 PTR [ebp + 8]		;ST(0) = height
	fld REAL4 PTR [ebp + 12]	;ST(1) = width

	fmul						;height * width

	LEAVE
	ret 8
getArea ENDP

getPerimeter PROC,
	namedWidth: REAL4, namedHeight:REAL4
	LOCAL factor:dword

	mov factor, 2			; store integer 2 into factor

	fld namedWidth				; ST(0) = width
	fimul factor				; ST(0) = 2*width

	fld namedHeight				; ST(0) = recHeight, ST(1) = 2*width
	fimul factor				; ST(0) = 2*recHeight, ST(1) = 2*width

	fadd						; ST(0) + ST(1)

	ret
getPerimeter ENDP

END main

