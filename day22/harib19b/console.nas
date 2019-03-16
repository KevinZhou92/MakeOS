[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_task_now
	EXTERN	_memman_alloc_4k
	EXTERN	_fifo32_init
	EXTERN	_timer_alloc
	EXTERN	_timer_init
	EXTERN	_timer_settime
	EXTERN	_file_readfat
	EXTERN	_io_cli
	EXTERN	_fifo32_status
	EXTERN	_fifo32_get
	EXTERN	_io_sti
	EXTERN	_boxfill8
	EXTERN	_sheet_refresh
	EXTERN	_task_sleep
	EXTERN	_putfonts8_asc_sht
	EXTERN	_memman_total
	EXTERN	_sprintf
	EXTERN	_file_search
	EXTERN	_file_loadfile
	EXTERN	_memman_free_4k
	EXTERN	_set_segmdesc
	EXTERN	_start_app
[FILE "console.c"]
[SECTION .text]
	GLOBAL	_console_task
_console_task:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	LEA	EBX,DWORD [-540+EBP]
	SUB	ESP,572
	CALL	_task_now
	PUSH	11520
	PUSH	3932160
	MOV	DWORD [-576+EBP],EAX
	CALL	_memman_alloc_4k
	MOV	ESI,DWORD [-576+EBP]
	MOV	DWORD [-536+EBP],8
	MOV	DWORD [-580+EBP],EAX
	ADD	ESI,16
	MOV	EAX,DWORD [8+EBP]
	MOV	DWORD [-540+EBP],EAX
	LEA	EAX,DWORD [-524+EBP]
	MOV	DWORD [-532+EBP],28
	MOV	DWORD [-528+EBP],-1
	MOV	DWORD [4076],EBX
	PUSH	DWORD [-576+EBP]
	PUSH	EAX
	PUSH	128
	PUSH	ESI
	CALL	_fifo32_init
	CALL	_timer_alloc
	PUSH	1
	PUSH	ESI
	MOV	EDI,EAX
	PUSH	EAX
	CALL	_timer_init
	ADD	ESP,36
	PUSH	50
	PUSH	EDI
	CALL	_timer_settime
	PUSH	1049088
	PUSH	DWORD [-580+EBP]
	CALL	_file_readfat
	PUSH	1
	PUSH	62
	PUSH	EBX
	CALL	_cons_putchar
	ADD	ESP,28
L2:
	CALL	_io_cli
	MOV	EBX,DWORD [-576+EBP]
	ADD	EBX,16
	PUSH	EBX
	CALL	_fifo32_status
	POP	ESI
	TEST	EAX,EAX
	JE	L24
	PUSH	EBX
	CALL	_fifo32_get
	MOV	ESI,EAX
	CALL	_io_sti
	POP	ECX
	CMP	ESI,1
	JLE	L25
L7:
	CMP	ESI,2
	JE	L26
L12:
	CMP	ESI,3
	JE	L27
L13:
	LEA	EBX,DWORD [-256+ESI]
	MOV	DWORD [-584+EBP],EBX
	CMP	EBX,255
	JA	L14
	CMP	ESI,264
	JE	L28
	CMP	ESI,266
	JE	L29
	MOV	ECX,DWORD [-536+EBP]
	CMP	ECX,239
	JG	L14
	MOV	EAX,ECX
	MOV	EDX,8
	MOV	EBX,EDX
	PUSH	1
	CDQ
	IDIV	EBX
	MOV	ECX,EAX
	MOV	EAX,ESI
	MOV	BYTE [-574+EBP+ECX*1],AL
	LEA	EAX,DWORD [-540+EBP]
	PUSH	DWORD [-584+EBP]
	PUSH	EAX
L22:
	CALL	_cons_putchar
L23:
	ADD	ESP,12
L14:
	CMP	DWORD [-528+EBP],0
	JS	L21
	MOV	ECX,DWORD [-532+EBP]
	MOV	EDX,DWORD [-536+EBP]
	LEA	EAX,DWORD [15+ECX]
	PUSH	EAX
	LEA	EAX,DWORD [7+EDX]
	PUSH	EAX
	PUSH	ECX
	MOV	ECX,DWORD [8+EBP]
	PUSH	EDX
	MOVZX	EAX,BYTE [-528+EBP]
	PUSH	EAX
	PUSH	DWORD [4+ECX]
	PUSH	DWORD [ECX]
	CALL	_boxfill8
	ADD	ESP,28
L21:
	MOV	ECX,DWORD [-532+EBP]
	MOV	EDX,DWORD [-536+EBP]
	LEA	EAX,DWORD [16+ECX]
	PUSH	EAX
	LEA	EAX,DWORD [8+EDX]
	PUSH	EAX
	PUSH	ECX
	PUSH	EDX
	PUSH	DWORD [8+EBP]
	CALL	_sheet_refresh
	ADD	ESP,20
	JMP	L2
L29:
	PUSH	0
	LEA	EBX,DWORD [-540+EBP]
	PUSH	32
	PUSH	EBX
	CALL	_cons_putchar
	PUSH	EBX
	MOV	EAX,DWORD [-536+EBP]
	MOV	EDX,8
	MOV	ECX,EDX
	CDQ
	IDIV	ECX
	MOV	BYTE [-574+EBP+EAX*1],0
	CALL	_cons_newline
	LEA	EAX,DWORD [-572+EBP]
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [-580+EBP]
	PUSH	EBX
	PUSH	EAX
	CALL	_cons_runcmd
	ADD	ESP,32
	PUSH	1
	PUSH	62
	PUSH	EBX
	JMP	L22
L28:
	CMP	DWORD [-536+EBP],16
	JLE	L14
	PUSH	0
	LEA	EAX,DWORD [-540+EBP]
	PUSH	32
	PUSH	EAX
	CALL	_cons_putchar
	SUB	DWORD [-536+EBP],8
	JMP	L23
L27:
	MOV	ECX,DWORD [-532+EBP]
	MOV	EDX,DWORD [-536+EBP]
	LEA	EAX,DWORD [15+ECX]
	PUSH	EAX
	LEA	EAX,DWORD [7+EDX]
	PUSH	EAX
	PUSH	ECX
	MOV	ECX,DWORD [8+EBP]
	PUSH	EDX
	PUSH	0
	PUSH	DWORD [4+ECX]
	PUSH	DWORD [ECX]
	CALL	_boxfill8
	ADD	ESP,28
	MOV	DWORD [-528+EBP],-1
	JMP	L13
L26:
	MOV	DWORD [-528+EBP],7
	JMP	L12
L25:
	TEST	ESI,ESI
	JE	L8
	PUSH	0
	PUSH	EBX
	PUSH	EDI
	CALL	_timer_init
	ADD	ESP,12
	CMP	DWORD [-528+EBP],0
	JS	L10
	MOV	DWORD [-528+EBP],7
L10:
	PUSH	50
	PUSH	EDI
	CALL	_timer_settime
	POP	EAX
	POP	EDX
	JMP	L7
L8:
	PUSH	1
	PUSH	EBX
	PUSH	EDI
	CALL	_timer_init
	ADD	ESP,12
	CMP	DWORD [-528+EBP],0
	JS	L10
	MOV	DWORD [-528+EBP],0
	JMP	L10
L24:
	PUSH	DWORD [-576+EBP]
	CALL	_task_sleep
	CALL	_io_sti
	POP	EBX
	JMP	L2
[SECTION .data]
LC0:
	DB	" ",0x00
[SECTION .text]
	GLOBAL	_cons_putchar
_cons_putchar:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EBX
	PUSH	EAX
	MOV	EAX,DWORD [12+EBP]
	MOV	DL,BYTE [16+EBP]
	MOV	EBX,DWORD [8+EBP]
	MOV	BYTE [-7+EBP],DL
	MOV	BYTE [-6+EBP],AL
	CMP	AL,9
	MOV	BYTE [-5+EBP],0
	JE	L32
	CMP	AL,10
	JE	L44
	CMP	AL,13
	JE	L30
	PUSH	1
	LEA	EAX,DWORD [-6+EBP]
	PUSH	EAX
	PUSH	0
	PUSH	7
	PUSH	DWORD [8+EBX]
	PUSH	DWORD [4+EBX]
	PUSH	DWORD [EBX]
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	CMP	BYTE [-7+EBP],0
	JE	L30
	MOV	EAX,DWORD [4+EBX]
	ADD	EAX,8
	MOV	DWORD [4+EBX],EAX
	CMP	EAX,248
	JE	L44
L30:
	MOV	EBX,DWORD [-4+EBP]
	LEAVE
	RET
L44:
	PUSH	EBX
	CALL	_cons_newline
	POP	EAX
	JMP	L30
L32:
	PUSH	1
	PUSH	LC0
	PUSH	0
	PUSH	7
	PUSH	DWORD [8+EBX]
	PUSH	DWORD [4+EBX]
	PUSH	DWORD [EBX]
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	MOV	EAX,DWORD [4+EBX]
	ADD	EAX,8
	MOV	DWORD [4+EBX],EAX
	CMP	EAX,248
	JE	L45
L35:
	MOV	EAX,DWORD [4+EBX]
	SUB	EAX,8
	AND	EAX,31
	JNE	L32
	JMP	L30
L45:
	PUSH	EBX
	CALL	_cons_newline
	POP	EAX
	JMP	L35
	GLOBAL	_cons_newline
_cons_newline:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	PUSH	EAX
	MOV	EAX,DWORD [8+EBP]
	MOV	EDX,DWORD [8+EBP]
	MOV	EAX,DWORD [EAX]
	MOV	DWORD [-16+EBP],EAX
	MOV	EAX,DWORD [8+EDX]
	CMP	EAX,139
	JG	L47
	ADD	EAX,16
	MOV	DWORD [8+EDX],EAX
L48:
	MOV	EAX,DWORD [8+EBP]
	MOV	DWORD [4+EAX],8
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L47:
	MOV	EDI,28
L58:
	MOV	ESI,8
L57:
	MOV	EAX,DWORD [-16+EBP]
	MOV	EDX,EDI
	MOV	ECX,DWORD [4+EAX]
	MOV	EBX,DWORD [EAX]
	LEA	EAX,DWORD [16+EDI]
	IMUL	EAX,ECX
	IMUL	EDX,ECX
	LEA	EAX,DWORD [EAX+ESI*1]
	LEA	EDX,DWORD [EDX+ESI*1]
	INC	ESI
	MOV	AL,BYTE [EAX+EBX*1]
	CMP	ESI,247
	MOV	BYTE [EDX+EBX*1],AL
	JLE	L57
	INC	EDI
	CMP	EDI,139
	JLE	L58
	MOV	EDI,140
L68:
	MOV	ESI,8
L67:
	MOV	EDX,DWORD [-16+EBP]
	MOV	EAX,EDI
	MOV	ECX,EDX
	IMUL	EAX,DWORD [4+EDX]
	MOV	EDX,DWORD [EDX]
	LEA	EAX,DWORD [EAX+ESI*1]
	INC	ESI
	CMP	ESI,247
	MOV	BYTE [EAX+EDX*1],0
	JLE	L67
	INC	EDI
	CMP	EDI,155
	JLE	L68
	PUSH	156
	PUSH	248
	PUSH	28
	PUSH	8
	PUSH	ECX
	CALL	_sheet_refresh
	ADD	ESP,20
	JMP	L48
	GLOBAL	_cons_putstr0
_cons_putstr0:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	ESI
	PUSH	EBX
	MOV	EBX,DWORD [12+EBP]
	MOV	ESI,DWORD [8+EBP]
	CMP	BYTE [EBX],0
	JNE	L82
L84:
	LEA	ESP,DWORD [-8+EBP]
	POP	EBX
	POP	ESI
	POP	EBP
	RET
L82:
	PUSH	1
	MOVSX	EAX,BYTE [EBX]
	PUSH	EAX
	INC	EBX
	PUSH	ESI
	CALL	_cons_putchar
	ADD	ESP,12
	CMP	BYTE [EBX],0
	JNE	L82
	JMP	L84
	GLOBAL	_cons_putstr1
_cons_putstr1:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	MOV	ESI,DWORD [16+EBP]
	XOR	EBX,EBX
	MOV	EDI,DWORD [12+EBP]
	CMP	EBX,ESI
	JL	L90
L92:
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L90:
	PUSH	1
	MOVSX	EAX,BYTE [EBX+EDI*1]
	PUSH	EAX
	INC	EBX
	PUSH	DWORD [8+EBP]
	CALL	_cons_putchar
	ADD	ESP,12
	CMP	EBX,ESI
	JL	L90
	JMP	L92
[SECTION .data]
LC1:
	DB	"mem",0x00
LC2:
	DB	"cls",0x00
LC3:
	DB	"dir",0x00
LC4:
	DB	"type ",0x00
LC5:
	DB	"Bad command.",0x0A,0x0A,0x00
[SECTION .text]
	GLOBAL	_cons_runcmd
_cons_runcmd:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	MOV	EDI,LC1
	PUSH	EBX
	SUB	ESP,12
	MOV	EAX,DWORD [8+EBP]
	MOV	ECX,DWORD [16+EBP]
	MOV	DWORD [-24+EBP],EAX
	MOV	DWORD [-16+EBP],ECX
	MOV	EAX,DWORD [20+EBP]
	MOV	ESI,DWORD [-24+EBP]
	MOV	DWORD [-20+EBP],EAX
	MOV	EBX,DWORD [12+EBP]
	MOV	EAX,4
	CLD
	MOV	ECX,EAX
	REPE
	CMPSB
	JE	L104
	MOV	EAX,4
	MOV	ESI,DWORD [-24+EBP]
	CLD
	MOV	EDI,LC2
	MOV	ECX,EAX
	REPE
	CMPSB
	JE	L105
	MOV	EAX,4
	MOV	ESI,DWORD [-24+EBP]
	CLD
	MOV	EDI,LC3
	MOV	ECX,EAX
	REPE
	CMPSB
	JE	L106
	MOV	EAX,5
	MOV	ESI,DWORD [-24+EBP]
	CLD
	MOV	EDI,LC4
	MOV	ECX,EAX
	REPE
	CMPSB
	JE	L107
	MOV	EAX,DWORD [-24+EBP]
	CMP	BYTE [EAX],0
	JNE	L108
L93:
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L108:
	PUSH	EAX
	PUSH	DWORD [-16+EBP]
	PUSH	EBX
	CALL	_cmd_app
	ADD	ESP,12
	TEST	EAX,EAX
	JNE	L93
	MOV	DWORD [12+EBP],LC5
	MOV	DWORD [8+EBP],EBX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_cons_putstr0
L107:
	MOV	EAX,DWORD [-24+EBP]
	MOV	ECX,DWORD [-16+EBP]
	MOV	DWORD [16+EBP],EAX
	MOV	DWORD [12+EBP],ECX
	MOV	DWORD [8+EBP],EBX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_cmd_type
L106:
	MOV	DWORD [8+EBP],EBX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_cmd_dir
L105:
	MOV	DWORD [8+EBP],EBX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_cmd_cls
L104:
	MOV	EAX,DWORD [-20+EBP]
	MOV	DWORD [8+EBP],EBX
	MOV	DWORD [12+EBP],EAX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_cmd_mem
[SECTION .data]
LC6:
	DB	"total   %dMB",0x0A,"free %dKB",0x0A,0x0A,0x00
[SECTION .text]
	GLOBAL	_cmd_mem
_cmd_mem:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EBX
	SUB	ESP,64
	MOV	EBX,DWORD [12+EBP]
	SHR	EBX,20
	PUSH	3932160
	CALL	_memman_total
	SHR	EAX,10
	MOV	DWORD [ESP],EAX
	PUSH	EBX
	PUSH	LC6
	LEA	EBX,DWORD [-68+EBP]
	PUSH	EBX
	CALL	_sprintf
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_cons_putstr0
	MOV	EBX,DWORD [-4+EBP]
	LEAVE
	RET
	GLOBAL	_cmd_cls
_cmd_cls:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	MOV	ESI,28
	MOV	EDI,DWORD [8+EBP]
	PUSH	EBX
	MOV	EBX,DWORD [EDI]
L120:
	MOV	ECX,8
L119:
	MOV	EAX,ESI
	MOV	EDX,DWORD [EBX]
	IMUL	EAX,DWORD [4+EBX]
	LEA	EAX,DWORD [EAX+ECX*1]
	INC	ECX
	CMP	ECX,247
	MOV	BYTE [EAX+EDX*1],0
	JLE	L119
	INC	ESI
	CMP	ESI,155
	JLE	L120
	PUSH	156
	PUSH	248
	PUSH	28
	PUSH	8
	PUSH	EBX
	CALL	_sheet_refresh
	MOV	DWORD [8+EDI],28
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
[SECTION .data]
LC7:
	DB	"filename.ext   %7d",0x0A,0x00
[SECTION .text]
	GLOBAL	_cmd_dir
_cmd_dir:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	XOR	ESI,ESI
	PUSH	EBX
	XOR	EBX,EBX
	SUB	ESP,32
	MOV	EDI,DWORD [8+EBP]
L138:
	MOV	AL,BYTE [1058304+EBX]
	TEST	AL,AL
	JE	L127
	CMP	AL,-27
	JE	L128
	TEST	BYTE [1058315+EBX],24
	JE	L142
L128:
	INC	ESI
	ADD	EBX,32
	CMP	ESI,223
	JLE	L138
L127:
	PUSH	EDI
	CALL	_cons_newline
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L142:
	PUSH	DWORD [1058332+EBX]
	PUSH	LC7
	LEA	EAX,DWORD [-44+EBP]
	PUSH	EAX
	CALL	_sprintf
	LEA	EDX,DWORD [1058304+EBX]
	XOR	ECX,ECX
	ADD	ESP,12
L137:
	MOV	AL,BYTE [EDX]
	INC	EDX
	MOV	BYTE [-44+EBP+ECX*1],AL
	INC	ECX
	CMP	ECX,7
	JLE	L137
	MOV	AL,BYTE [1058312+EBX]
	MOV	BYTE [-35+EBP],AL
	MOV	AL,BYTE [1058313+EBX]
	MOV	BYTE [-34+EBP],AL
	MOV	AL,BYTE [1058314+EBX]
	MOV	BYTE [-33+EBP],AL
	LEA	EAX,DWORD [-44+EBP]
	PUSH	EAX
	PUSH	EDI
	CALL	_cons_putstr0
	POP	EAX
	POP	EDX
	JMP	L128
[SECTION .data]
LC8:
	DB	"File not found.",0x0A,0x00
[SECTION .text]
	GLOBAL	_cmd_type
_cmd_type:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	PUSH	ESI
	MOV	EAX,DWORD [12+EBP]
	MOV	EDI,DWORD [8+EBP]
	MOV	DWORD [-16+EBP],EAX
	PUSH	224
	PUSH	1058304
	MOV	EAX,DWORD [16+EBP]
	ADD	EAX,5
	PUSH	EAX
	CALL	_file_search
	ADD	ESP,12
	MOV	ESI,EAX
	TEST	EAX,EAX
	JE	L144
	PUSH	DWORD [28+EAX]
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	1064448
	PUSH	DWORD [-16+EBP]
	PUSH	EAX
	MOV	EBX,EAX
	PUSH	DWORD [28+ESI]
	MOVZX	EAX,WORD [26+ESI]
	PUSH	EAX
	CALL	_file_loadfile
	PUSH	DWORD [28+ESI]
	PUSH	EBX
	PUSH	EDI
	CALL	_cons_putstr1
	ADD	ESP,40
	PUSH	DWORD [28+ESI]
	PUSH	EBX
	PUSH	3932160
	CALL	_memman_free_4k
	ADD	ESP,12
L145:
	MOV	DWORD [8+EBP],EDI
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_cons_newline
L144:
	PUSH	LC8
	PUSH	EDI
	CALL	_cons_putstr0
	POP	ECX
	POP	EBX
	JMP	L145
[SECTION .data]
LC9:
	DB	"Hari",0x00
[SECTION .text]
	GLOBAL	_cmd_app
_cmd_app:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	XOR	EBX,EBX
	SUB	ESP,44
	MOV	ESI,DWORD [16+EBP]
	CALL	_task_now
	MOV	DWORD [-52+EBP],EAX
L152:
	MOV	AL,BYTE [EBX+ESI*1]
	CMP	AL,32
	JLE	L148
	MOV	BYTE [-44+EBP+EBX*1],AL
	INC	EBX
	CMP	EBX,12
	JLE	L152
L148:
	PUSH	224
	LEA	ESI,DWORD [-44+EBP]
	PUSH	1058304
	PUSH	ESI
	MOV	BYTE [-44+EBP+EBX*1],0
	CALL	_file_search
	ADD	ESP,12
	TEST	EAX,EAX
	MOV	DWORD [-56+EBP],EAX
	JE	L158
L157:
	MOV	EAX,DWORD [-56+EBP]
	PUSH	DWORD [28+EAX]
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	65536
	PUSH	3932160
	MOV	EBX,EAX
	CALL	_memman_alloc_4k
	MOV	EDX,DWORD [-56+EBP]
	MOV	DWORD [4072],EBX
	PUSH	1064448
	PUSH	DWORD [12+EBP]
	PUSH	EBX
	MOV	DWORD [-48+EBP],EAX
	PUSH	DWORD [28+EDX]
	MOVZX	EAX,WORD [26+EDX]
	PUSH	EAX
	CALL	_file_loadfile
	MOV	EDI,DWORD [-56+EBP]
	ADD	ESP,36
	PUSH	16634
	PUSH	EBX
	MOV	EAX,DWORD [28+EDI]
	DEC	EAX
	PUSH	EAX
	PUSH	2563928
	CALL	_set_segmdesc
	PUSH	16626
	PUSH	DWORD [-48+EBP]
	PUSH	65535
	PUSH	2563936
	CALL	_set_segmdesc
	ADD	ESP,32
	CMP	DWORD [28+EDI],7
	JBE	L155
	MOV	EAX,LC9
	LEA	ESI,DWORD [4+EBX]
	CLD
	MOV	ECX,4
	MOV	EDI,EAX
	REPE
	CMPSB
	JNE	L155
	MOV	BYTE [EBX],-24
	MOV	BYTE [1+EBX],22
	MOV	BYTE [2+EBX],0
	MOV	BYTE [3+EBX],0
	MOV	BYTE [4+EBX],0
	MOV	BYTE [5+EBX],-53
L155:
	MOV	EAX,DWORD [-52+EBP]
	ADD	EAX,48
	PUSH	EAX
	PUSH	8032
	PUSH	65536
	PUSH	8024
	PUSH	0
	CALL	_start_app
	MOV	EAX,DWORD [-56+EBP]
	PUSH	DWORD [28+EAX]
	PUSH	EBX
	PUSH	3932160
	CALL	_memman_free_4k
	ADD	ESP,32
	PUSH	65536
	PUSH	DWORD [-48+EBP]
	PUSH	3932160
	CALL	_memman_free_4k
	PUSH	DWORD [8+EBP]
	CALL	_cons_newline
	MOV	EAX,1
L146:
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L158:
	CMP	BYTE [-45+EBP+EBX*1],46
	JE	L153
	PUSH	224
	PUSH	1058304
	PUSH	ESI
	MOV	BYTE [-44+EBP+EBX*1],46
	MOV	BYTE [-43+EBP+EBX*1],72
	MOV	BYTE [-42+EBP+EBX*1],82
	MOV	BYTE [-41+EBP+EBX*1],66
	MOV	BYTE [-40+EBP+EBX*1],0
	CALL	_file_search
	ADD	ESP,12
	MOV	DWORD [-56+EBP],EAX
L153:
	CMP	DWORD [-56+EBP],0
	JNE	L157
	XOR	EAX,EAX
	JMP	L146
	GLOBAL	_hrb_api
_hrb_api:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	MOV	EDI,DWORD [24+EBP]
	MOV	EBX,DWORD [28+EBP]
	MOV	ESI,DWORD [4072]
	CALL	_task_now
	CMP	EBX,1
	MOV	EDX,DWORD [4076]
	JE	L168
	CMP	EBX,2
	JE	L169
	CMP	EBX,3
	JE	L170
	CMP	EBX,4
	JE	L171
L161:
	XOR	EAX,EAX
L159:
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L171:
	ADD	EAX,48
	JMP	L159
L170:
	PUSH	DWORD [32+EBP]
	LEA	EAX,DWORD [ESI+EDI*1]
	PUSH	EAX
	PUSH	EDX
	CALL	_cons_putstr1
L167:
	ADD	ESP,12
	JMP	L161
L169:
	LEA	EAX,DWORD [ESI+EDI*1]
	PUSH	EAX
	PUSH	EDX
	CALL	_cons_putstr0
	POP	EDI
	POP	EAX
	JMP	L161
L168:
	PUSH	1
	MOVZX	EAX,BYTE [36+EBP]
	PUSH	EAX
	PUSH	EDX
	CALL	_cons_putchar
	JMP	L167
[SECTION .data]
LC10:
	DB	0x0A,"INT 0C :",0x0A," Stack Exception.",0x0A,0x00
LC11:
	DB	"EIP = %08X",0x0A,0x00
LC12:
	DB	"EFLAGS = %08X",0x0A,0x00
[SECTION .text]
	GLOBAL	_inthandler0c
_inthandler0c:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	LEA	EBX,DWORD [-44+EBP]
	SUB	ESP,32
	MOV	ESI,DWORD [4076]
	CALL	_task_now
	PUSH	LC10
	MOV	EDI,EAX
	PUSH	ESI
	ADD	EDI,48
	CALL	_cons_putstr0
	MOV	EAX,DWORD [8+EBP]
	PUSH	DWORD [44+EAX]
	PUSH	LC11
	PUSH	EBX
	CALL	_sprintf
	PUSH	EBX
	PUSH	ESI
	CALL	_cons_putstr0
	MOV	EAX,DWORD [8+EBP]
	PUSH	DWORD [52+EAX]
	PUSH	LC12
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,40
	PUSH	EBX
	PUSH	ESI
	CALL	_cons_putstr0
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	MOV	EAX,EDI
	POP	ESI
	POP	EDI
	POP	EBP
	RET
[SECTION .data]
LC13:
	DB	0x0A,"INT 0D :",0x0A," General Protected Exception.",0x0A,0x00
[SECTION .text]
	GLOBAL	_inthandler0d
_inthandler0d:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	LEA	EBX,DWORD [-44+EBP]
	SUB	ESP,32
	MOV	EDI,DWORD [4076]
	CALL	_task_now
	PUSH	LC13
	MOV	ESI,EAX
	PUSH	EDI
	ADD	ESI,48
	CALL	_cons_putstr0
	MOV	EAX,DWORD [8+EBP]
	PUSH	DWORD [44+EAX]
	PUSH	LC11
	PUSH	EBX
	CALL	_sprintf
	PUSH	EBX
	PUSH	EDI
	CALL	_cons_putstr0
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	MOV	EAX,ESI
	POP	ESI
	POP	EDI
	POP	EBP
	RET
