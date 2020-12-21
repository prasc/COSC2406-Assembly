INCLUDE Irvine32.inc

.data
comma	BYTE	", ", 0


.code


main PROC


	
main ENDP

PrintByteArray PROC
	; esi = offset of sbyte array
	; ecx = loop counter
	pushfd		; save flags
	pushad		; save registers

	dec ecx		; so that we don't print last num in array

	mov al, '['
	call WriteChar				; print opening bracket

L1:
	movsx eax, BYTE PTR [esi]	; sign extend a byte from address esi is pointing at into eax
	call WriteInt				; print it
	mov edx, OFFSET comma		; move comma + space into edx
	call WriteString			; print comma + space
	inc esi						; tell esi to point to next byte in the array
	loop L1						; loop until ecx = 0
		
	movsx eax, BYTE PTR [esi]	; esi is pointing to last byte in array
	call WriteInt				; print it
	mov al, ']'					; print closing bracket
	call WriteChar

	popad		; restore regs
	popfd		; restore flags
	ret
PrinateByteArray ENDP

END main