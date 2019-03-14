[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_api_putchar
[FILE "hello3.c"]
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	104
	CALL	_api_putchar
	PUSH	101
	CALL	_api_putchar
	PUSH	108
	CALL	_api_putchar
	PUSH	108
	CALL	_api_putchar
	PUSH	111
	CALL	_api_putchar
	LEAVE
	RET
