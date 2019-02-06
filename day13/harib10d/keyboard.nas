[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_io_out8
	EXTERN	_io_in8
	EXTERN	_fifo8_put
[FILE "keyboard.c"]
[SECTION .text]
	GLOBAL	_inthandler21
_inthandler21:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	97
	PUSH	32
	CALL	_io_out8
	PUSH	96
	CALL	_io_in8
	MOVZX	EAX,AL
	PUSH	EAX
	PUSH	_keyfifo
	CALL	_fifo8_put
	LEAVE
	RET
	GLOBAL	_wait_KBC_sendready
_wait_KBC_sendready:
	PUSH	EBP
	MOV	EBP,ESP
L3:
	PUSH	100
	CALL	_io_in8
	POP	EDX
	AND	EAX,2
	JNE	L3
	LEAVE
	RET
	GLOBAL	_init_keyboard
_init_keyboard:
	PUSH	EBP
	MOV	EBP,ESP
	CALL	_wait_KBC_sendready
	PUSH	96
	PUSH	100
	CALL	_io_out8
	CALL	_wait_KBC_sendready
	PUSH	71
	PUSH	96
	CALL	_io_out8
	LEAVE
	RET
	GLOBAL	_keyfifo
[SECTION .data]
	ALIGNB	16
_keyfifo:
	RESB	24
