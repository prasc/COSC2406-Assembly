TITLE {Read and Print} (readAndPrint.asm)
; 

INCLUDE Irvine32.inc

.data
arr		SWORD	5 DUP(?)
prompt	BYTE	"Enter an integer: ", 0
comma	BYTE	", ", 0

.code
main PROC
	mov edx, OFFSET prompt	;Syso prompt
	call WriteString		
	
	call ReadInt			
	mov arr, ax			;array[0] = in.nextInt()

	call WriteString		;Syso prompt

	call ReadInt			
	mov arr[+2], ax		;array[1] = in.nextInt()

	call WriteString		;Syso prompt

	call ReadInt			
	mov arr[+4], ax		;array[2] = in.nextInt()

	call WriteString		;Syso prompt

	call ReadInt			
	mov arr[+6], ax		;array[3] = in.nextInt()

	call WriteString		;Syso prompt

	call ReadInt			
	mov arr[+8], ax		;array[4] = in.nextInt()

	mov al, '{'		
	call WriteChar		; print {
	
	movsx eax, arr	
	call WriteInt		;print array[0]

	mov edx, OFFSET comma		
	call WriteString

	movsx eax, arr[+2]	;print array[1]
	call WriteInt

	call WriteString

	movsx eax, arr[+4]	;print array[2]
	call WriteInt

	call WriteString

	movsx eax, arr[+6]	;print array[3]
	call WriteInt

	call WriteString

	movsx eax, arr[+8]	;print array[4]
	call WriteInt
	
	mov al, '}'		
	call WriteChar		; print }


	exit
main ENDP
END main