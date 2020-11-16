; AssignmentThree		(QuestionTwo.asm)
; Program Description:	Question Two
; Author:				Pras Cheliyan
; Creation Date:		November 16, 2020
; Course:				COSC2406

INCLUDE Irvine32.inc

.data
P			DWORD	?
Q			DWORD	?
R			DWORD	?
S			DWORD	?
T			DWORD	?
pPrompt		BYTE	"Enter a signed value for P ", 0
qPrompt		BYTE	"Enter an unsigned value for Q ", 0
rPrompt		BYTE	"Enter a signed value for R ", 0
sPrompt		BYTE	"Enter an unsigned value for S ", 0
tPrompt		BYTE	"Enter a signed value for T ", 0
answerText	BYTE	"P-(2T+4Q) +(3R-S)= ", 0
answer		DWORD	?

.code

main PROC
	mov edx, OFFSET pPrompt	; System.out.print(pPrompt)
	call WriteString		;

	call ReadInt			; P = in.nextInt()
	mov P, eax	
	
	mov edx, OFFSET qPrompt	; System.out.print(qPrompt)
	call WriteString		;

	call ReadInt			; Q = in.nextInt()
	mov Q, eax	
	
	mov edx, OFFSET rPrompt	; System.out.print(rPrompt)
	call WriteString		;

	call ReadInt			; R = in.nextInt()
	mov R, eax	
	
	mov edx, OFFSET sPrompt	; System.out.print(sPrompt)
	call WriteString		;

	call ReadInt			; S = in.nextInt()
	mov S, eax	

	mov edx, OFFSET tPrompt	; System.out.print(tPrompt)
	call WriteString		;

	call ReadInt			; T = in.nextInt()
	mov T, eax	

	add T, eax				; T + T = 2T

	mov Q, eax
	add Q, eax
	add Q, eax
	add Q, eax				; Q + Q + Q +Q = 4Q

	mov ebx, Q
	add T, ebx				; Add Q and T

	mov eax, R
	add R, eax
	add R, eax				; R + R + R = 3R

	mov eax, S
	sub R, eax				; 3R - S

	mov eax, T
	sub P, eax				; P - (2T + 4Q)

	mov eax, R
	add P, eax				; P - (2T + 4Q) + (3R - S)

	mov eax, P
	mov answer, eax			; answer = answer to question above
	
	call CrLf
	mov edx, OFFSET answerText	 
	call WriteString		; Print answer prompt
	call WriteInt			; Print answer
	call CrLf



	exit
main ENDP
; (insert additional procedures here)
END main