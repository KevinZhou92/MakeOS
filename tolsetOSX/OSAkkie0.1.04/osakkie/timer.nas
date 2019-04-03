[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_io_out8
	EXTERN	_memman_alloc_4k
	EXTERN	_io_load_eflags
	EXTERN	_io_cli
	EXTERN	_io_store_eflags
	EXTERN	_task_timer
	EXTERN	_fifo32_put
	EXTERN	_task_switch
[FILE "timer.c"]
[SECTION .text]
	GLOBAL	_init_pit
_init_pit:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	52
	PUSH	67
	CALL	_io_out8
	PUSH	156
	PUSH	64
	CALL	_io_out8
	PUSH	46
	PUSH	64
	CALL	_io_out8
	MOV	DWORD [_timerctl],0
	MOV	DWORD [_timerctl+4],-1
	LEAVE
	RET
	GLOBAL	_init_timerctl
_init_timerctl:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	10000
	PUSH	3932160
	CALL	_memman_alloc_4k
	XOR	ECX,ECX
	MOV	DWORD [_timerctl+12],EAX
	POP	EAX
	POP	EDX
	MOV	EDX,499
L7:
	MOV	EAX,DWORD [_timerctl+12]
	MOV	BYTE [8+EAX+ECX*1],0
	ADD	ECX,20
	DEC	EDX
	JNS	L7
	CALL	_timer_alloc
	MOV	BYTE [8+EAX],2
	MOV	DWORD [EAX],0
	MOV	DWORD [_timerctl+8],EAX
	MOV	DWORD [4+EAX],-1
	LEAVE
	RET
	GLOBAL	_timer_alloc
_timer_alloc:
	PUSH	EBP
	XOR	ECX,ECX
	MOV	EBP,ESP
	XOR	EDX,EDX
L16:
	MOV	EAX,DWORD [_timerctl+12]
	CMP	BYTE [8+EAX+EDX*1],0
	JE	L19
	INC	ECX
	ADD	EDX,20
	CMP	ECX,499
	JLE	L16
	XOR	EAX,EAX
L10:
	POP	EBP
	RET
L19:
	MOV	BYTE [8+EAX+EDX*1],1
	MOV	EAX,DWORD [_timerctl+12]
	MOV	BYTE [9+EAX+EDX*1],0
	MOV	EAX,DWORD [_timerctl+12]
	ADD	EAX,EDX
	JMP	L10
	GLOBAL	_timer_free
_timer_free:
	PUSH	EBP
	MOV	EBP,ESP
	MOV	EAX,DWORD [8+EBP]
	MOV	BYTE [8+EAX],0
	POP	EBP
	RET
	GLOBAL	_timer_init
_timer_init:
	PUSH	EBP
	MOV	EBP,ESP
	MOV	EAX,DWORD [8+EBP]
	MOV	EDX,DWORD [12+EBP]
	MOV	DWORD [12+EAX],EDX
	MOV	EDX,DWORD [16+EBP]
	MOV	DWORD [16+EAX],EDX
	POP	EBP
	RET
	GLOBAL	_timer_settime
_timer_settime:
	PUSH	EBP
	MOV	EAX,DWORD [_timerctl]
	MOV	EBP,ESP
	PUSH	ESI
	PUSH	EBX
	MOV	EBX,DWORD [8+EBP]
	ADD	EAX,DWORD [12+EBP]
	MOV	BYTE [8+EBX],2
	MOV	DWORD [4+EBX],EAX
	CALL	_io_load_eflags
	MOV	ESI,EAX
	CALL	_io_cli
	MOV	EAX,DWORD [_timerctl+8]
	MOV	EDX,DWORD [4+EBX]
	CMP	EDX,DWORD [4+EAX]
	JA	L25
	MOV	DWORD [_timerctl+8],EBX
	MOV	DWORD [_timerctl+4],EDX
	MOV	DWORD [EBX],EAX
L24:
	MOV	DWORD [8+EBP],ESI
	POP	EBX
	POP	ESI
	POP	EBP
	JMP	_io_store_eflags
L25:
	MOV	ECX,EAX
	MOV	EAX,DWORD [EAX]
	CMP	EDX,DWORD [4+EAX]
	JA	L25
	MOV	DWORD [ECX],EBX
	MOV	DWORD [EBX],EAX
	JMP	L24
	GLOBAL	_timer_cancel
_timer_cancel:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	ESI
	PUSH	EBX
	MOV	EBX,DWORD [8+EBP]
	CALL	_io_load_eflags
	MOV	ESI,EAX
	CALL	_io_cli
	CMP	BYTE [8+EBX],2
	JE	L37
	PUSH	ESI
	CALL	_io_store_eflags
	XOR	EAX,EAX
L29:
	LEA	ESP,DWORD [-8+EBP]
	POP	EBX
	POP	ESI
	POP	EBP
	RET
L37:
	MOV	EAX,DWORD [_timerctl+8]
	CMP	EBX,EAX
	JE	L38
L31:
	MOV	EDX,EAX
	MOV	EAX,DWORD [EAX]
	CMP	EAX,EBX
	JNE	L31
	MOV	EAX,DWORD [EBX]
	MOV	DWORD [EDX],EAX
L32:
	MOV	BYTE [8+EBX],1
	PUSH	ESI
	CALL	_io_store_eflags
	MOV	EAX,1
	JMP	L29
L38:
	MOV	EDX,DWORD [EBX]
	MOV	DWORD [_timerctl+8],EDX
	MOV	EAX,DWORD [4+EDX]
	MOV	DWORD [_timerctl+4],EAX
	JMP	L32
	GLOBAL	_timer_cancelall
_timer_cancelall:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	XOR	EDI,EDI
	PUSH	EBX
	PUSH	ESI
	PUSH	ESI
	MOV	ESI,499
	MOV	EAX,DWORD [8+EBP]
	MOV	DWORD [-16+EBP],EAX
	CALL	_io_load_eflags
	MOV	DWORD [-20+EBP],EAX
	CALL	_io_cli
L45:
	MOV	EBX,DWORD [_timerctl+12]
	ADD	EBX,EDI
	CMP	BYTE [8+EBX],0
	JE	L42
	CMP	BYTE [9+EBX],0
	JE	L42
	MOV	EAX,DWORD [-16+EBP]
	CMP	DWORD [12+EBX],EAX
	JE	L48
L42:
	ADD	EDI,20
	DEC	ESI
	JNS	L45
	MOV	EAX,DWORD [-20+EBP]
	MOV	DWORD [8+EBP],EAX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_io_store_eflags
L48:
	PUSH	EBX
	CALL	_timer_cancel
	PUSH	EBX
	CALL	_timer_free
	POP	ECX
	POP	EBX
	JMP	L42
	GLOBAL	_inthandler20
_inthandler20:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	ESI
	PUSH	EBX
	XOR	ESI,ESI
	PUSH	96
	PUSH	32
	CALL	_io_out8
	MOV	EAX,DWORD [_timerctl]
	INC	EAX
	MOV	DWORD [_timerctl],EAX
	CMP	DWORD [_timerctl+4],EAX
	POP	ECX
	POP	EBX
	JA	L49
	MOV	EBX,DWORD [_timerctl+8]
L51:
	MOV	EAX,DWORD [4+EBX]
	CMP	EAX,DWORD [_timerctl]
	JA	L52
	MOV	BYTE [8+EBX],1
	CMP	EBX,DWORD [_task_timer]
	JE	L55
	PUSH	DWORD [16+EBX]
	PUSH	DWORD [12+EBX]
	CALL	_fifo32_put
	POP	EAX
	POP	EDX
L56:
	MOV	EBX,DWORD [EBX]
	JMP	L51
L55:
	MOV	ESI,1
	JMP	L56
L52:
	MOV	DWORD [_timerctl+4],EAX
	MOV	DWORD [_timerctl+8],EBX
	MOV	EAX,ESI
	TEST	AL,AL
	JNE	L58
L49:
	LEA	ESP,DWORD [-8+EBP]
	POP	EBX
	POP	ESI
	POP	EBP
	RET
L58:
	LEA	ESP,DWORD [-8+EBP]
	POP	EBX
	POP	ESI
	POP	EBP
	JMP	_task_switch
	GLOBAL	_timerctl
[SECTION .data]
	ALIGNB	16
_timerctl:
	RESB	16
