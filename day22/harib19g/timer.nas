[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_io_out8
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
	MOV	EDX,_timerctl+10000
	MOV	DWORD [_timerctl],0
	ADD	ESP,24
	MOV	EAX,_timerctl+20
L6:
	MOV	DWORD [EAX],0
	ADD	EAX,20
	CMP	EAX,EDX
	JLE	L6
	CALL	_timer_alloc
	MOV	DWORD [4+EAX],-1
	MOV	DWORD [8+EAX],2
	MOV	DWORD [EAX],0
	MOV	DWORD [_timerctl+8],EAX
	MOV	DWORD [_timerctl+4],-1
	LEAVE
	RET
	GLOBAL	_timer_alloc
_timer_alloc:
	PUSH	EBP
	XOR	EDX,EDX
	MOV	EBP,ESP
	MOV	EAX,_timerctl+12
L15:
	CMP	DWORD [8+EAX],0
	JE	L18
	INC	EDX
	ADD	EAX,20
	CMP	EDX,499
	JLE	L15
	XOR	EAX,EAX
L9:
	POP	EBP
	RET
L18:
	MOV	DWORD [8+EAX],1
	JMP	L9
	GLOBAL	_timer_free
_timer_free:
	PUSH	EBP
	MOV	EBP,ESP
	MOV	EAX,DWORD [8+EBP]
	MOV	DWORD [8+EAX],0
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
	MOV	DWORD [8+EBX],2
	MOV	DWORD [4+EBX],EAX
	CALL	_io_load_eflags
	MOV	ESI,EAX
	CALL	_io_cli
	MOV	EAX,DWORD [_timerctl+8]
	MOV	EDX,DWORD [4+EBX]
	CMP	EDX,DWORD [4+EAX]
	JBE	L28
L23:
	MOV	ECX,EAX
	MOV	EAX,DWORD [EAX]
	CMP	EDX,DWORD [4+EAX]
	JA	L23
	MOV	DWORD [ECX],EBX
	MOV	DWORD [EBX],EAX
L27:
	MOV	DWORD [8+EBP],ESI
	POP	EBX
	POP	ESI
	POP	EBP
	JMP	_io_store_eflags
L28:
	MOV	DWORD [_timerctl+8],EBX
	MOV	DWORD [_timerctl+4],EDX
	MOV	DWORD [EBX],EAX
	JMP	L27
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
	JA	L29
	MOV	EBX,DWORD [_timerctl+8]
L31:
	MOV	EAX,DWORD [4+EBX]
	CMP	EAX,DWORD [_timerctl]
	JA	L32
	MOV	DWORD [8+EBX],1
	CMP	EBX,DWORD [_task_timer]
	JE	L35
	PUSH	DWORD [16+EBX]
	PUSH	DWORD [12+EBX]
	CALL	_fifo32_put
	POP	EAX
	POP	EDX
L36:
	MOV	EBX,DWORD [EBX]
	JMP	L31
L35:
	MOV	ESI,1
	JMP	L36
L32:
	MOV	DWORD [_timerctl+4],EAX
	MOV	DWORD [_timerctl+8],EBX
	MOV	EAX,ESI
	TEST	AL,AL
	JNE	L38
L29:
	LEA	ESP,DWORD [-8+EBP]
	POP	EBX
	POP	ESI
	POP	EBP
	RET
L38:
	LEA	ESP,DWORD [-8+EBP]
	POP	EBX
	POP	ESI
	POP	EBP
	JMP	_task_switch
	GLOBAL	_timerctl
[SECTION .data]
	ALIGNB	16
_timerctl:
	RESB	10012
