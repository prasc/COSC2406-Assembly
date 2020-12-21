TITLE {Read and Print} (readAndPrint.asm)
; 

INCLUDE Irvine32.inc
;word = 2 byte unsigned
;sword = 2 byte signed
;dword = 4 byte unsigned
;sdword = 4 byte signed 

; signed = maintain negative symbol is negative

; ? means undefined value
; 5 DUP(?)   -> 5 undefined values, ?,?,?,?,?
; 3 DUP("hello") ->	"hello", "hello","hello"
; 3 DUP(2 DUP("hi")) -> "hi"

.data 
arr				SWORD	5 DUP(?) 
prompt			BYTE	"Enter an integer: ", 0
comma			BYTE	", ", 0
total			DWORD	?
totalPrompt		BYTE	"The total of the 5 numbers is: ", 0

.code
main PROC
	mov edx, OFFSET prompt	;Syso prompt				; put string called prompt into edx
	call WriteString									; print string that is in edx
	
	;readInt = signed value
	;readDec = unsigned value 

	call ReadInt										; read user input and put it into eax
	mov arr, ax			;array[0] = in.nextInt()		; arr is 2 bytes, eax is 4 bytes. So we only use ax, because it is 2 bytes

	call WriteString		;Syso prompt				; print the same string that is in edx

	call ReadInt										; store user input into eax
	mov arr[+2], ax		;array[1] = in.nextInt()		; move to arr[0 + 2] the value in ax (which is 2 bytes out of the eax)

	call WriteString		;Syso prompt				; print same string from edx

	call ReadInt					
	mov arr[+4], ax		;array[2] = in.nextInt()

	call WriteString		;Syso prompt

	call ReadInt			
	mov arr[+6], ax		;array[3] = in.nextInt()

	call WriteString		;Syso prompt

	call ReadInt			
	mov arr[+8], ax		;array[4] = in.nextInt()

	mov al, '{'										; edx = string, eax = integer, al = chars
	call WriteChar		; print {					;WriteChar will print anything in al
	
	movsx eax, arr	
	add total, eax
	call WriteInt		;print array[0]

	mov edx, OFFSET comma		
	call WriteString

	movsx eax, arr[+2]	;print array[1]
	add total, eax
	call WriteInt

	call WriteString

	movsx eax, arr[+4]	;print array[2]
	add total, eax
	call WriteInt

	call WriteString

	movsx eax, arr[+6]	;print array[3]
	add total, eax
	call WriteInt

	call WriteString

	movsx eax, arr[+8]	;print array[4]
	add total, eax
	call WriteInt
	
	mov al, '}'		
	call WriteChar		; print }
	call Crlf

	mov edx, offset totalPrompt
	call WriteString
	mov eax, total
	call WriteInt

	exit
main ENDP
END main