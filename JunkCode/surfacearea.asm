INCLUDE Irvine32.inc


.data
rval			REAL4	?
surfArea		REAL4	?
volVal			REAL4	?

radiusPrompt	BYTE	"Enter the radius of the sphere: ", 0
saPrompt		BYTE	"The surface area of the sphere with a radius of ", 0
longPrompt		BYTE	" long is ", 0
volPrompt		BYTE	"The volume of this sphere is ", 0


.code


main PROC
	FINIT

userInput:
	mov edx, OFFSET radiusPrompt
	call WriteString
	call ReadFloat
	FLDZ
	fcomi ST(0), ST(1)
	FFREE ST(0)
	jb cont
	jmp userInput



cont: 
	fstp rval


	mov edx, OFFSET saPrompt
	call WriteString
	call WriteFloat

	call CalculateSurfaceArea

	mov edx, OFFSET longPrompt
	call WriteString
	call WriteFloat
	call CrLf
	FFREE ST(0)


	push rval
	call CalculateVolume

	mov edx, OFFSET volPrompt
	call WriteString
	call WriteFloat

	call showFPUStack
	exit
main ENDP

CalculateSurfaceArea PROC
	push ebp
	mov ebp, esp 
	sub esp, 4

	FLD ST(0)
	FMUL

	FLDPI
	FMUL

	mov DWORD PTR [ebp - 4], 4
	FILD DWORD PTR [ebp - 4]
	fmul

	fst surfArea


	mov esp, ebp
	pop ebp
	ret 4
CalculateSurfaceArea ENDP

CalculateVolume PROC
	ENTER 8, 0

	mov DWORD PTR [ebp - 4], 4
	mov DWORD PTR [ebp - 8], 3

	FLD REAL4 PTR [ebp + 8]
	FLD REAL4 PTR [ebp + 8]
	FLD REAL4 PTR [ebp + 8]
	fmul
	fmul

	FLDPI
	fmul

	fild DWORD PTR [ebp - 4]
	fild DWORD PTR [ebp - 8]
	fdiv

	fmul

	
	fst volVal

	LEAVE
	ret 4
CalculateVolume ENDP


END main