include irvine32.inc

.data
msg byte "hello", 0

.code
main proc
	mov edx, offset msg
	call writestring
	call crlf

	exit
main endp

end main