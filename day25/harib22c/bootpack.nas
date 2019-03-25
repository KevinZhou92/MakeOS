[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_init_gdtidt
	EXTERN	_init_pic
	EXTERN	_io_sti
	EXTERN	_fifo32_init
	EXTERN	_init_pit
	EXTERN	_init_keyboard
	EXTERN	_enable_mouse
	EXTERN	_io_out8
	EXTERN	_memtest
	EXTERN	_memman_init
	EXTERN	_memman_free
	EXTERN	_init_palette
	EXTERN	_shtctl_init
	EXTERN	_task_init
	EXTERN	_task_run
	EXTERN	_sheet_alloc
	EXTERN	_memman_alloc_4k
	EXTERN	_sheet_setbuf
	EXTERN	_init_screen8
	EXTERN	_make_window8
	EXTERN	_make_textbox8
	EXTERN	_task_alloc
	EXTERN	_console_task
	EXTERN	_timer_alloc
	EXTERN	_timer_init
	EXTERN	_timer_settime
	EXTERN	_init_mouse_cursor8
	EXTERN	_sheet_slide
	EXTERN	_sheet_updown
	EXTERN	_fifo32_put
	EXTERN	_fifo32_status
	EXTERN	_io_cli
	EXTERN	_fifo32_get
	EXTERN	_boxfill8
	EXTERN	_sheet_refresh
	EXTERN	_mouse_decode
	EXTERN	_cons_putstr0
	EXTERN	_asm_end_app
	EXTERN	_keytable0.0
	EXTERN	_wait_KBC_sendready
	EXTERN	_putfonts8_asc_sht
	EXTERN	_keytable1.1
	EXTERN	_task_sleep
	EXTERN	_change_wtitle8
[FILE "bootpack.c"]
[SECTION .data]
_keytable0.0:
	DB	0
	DB	0
	DB	49
	DB	50
	DB	51
	DB	52
	DB	53
	DB	54
	DB	55
	DB	56
	DB	57
	DB	48
	DB	45
	DB	94
	DB	0
	DB	0
	DB	81
	DB	87
	DB	69
	DB	82
	DB	84
	DB	89
	DB	85
	DB	73
	DB	79
	DB	80
	DB	64
	DB	91
	DB	0
	DB	0
	DB	65
	DB	83
	DB	68
	DB	70
	DB	71
	DB	72
	DB	74
	DB	75
	DB	76
	DB	59
	DB	58
	DB	0
	DB	0
	DB	93
	DB	90
	DB	88
	DB	67
	DB	86
	DB	66
	DB	78
	DB	77
	DB	44
	DB	46
	DB	47
	DB	0
	DB	42
	DB	0
	DB	32
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	55
	DB	56
	DB	57
	DB	45
	DB	52
	DB	53
	DB	54
	DB	43
	DB	49
	DB	50
	DB	51
	DB	48
	DB	46
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	92
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	92
	DB	0
	DB	0
_keytable1.1:
	DB	0
	DB	0
	DB	33
	DB	34
	DB	35
	DB	36
	DB	37
	DB	38
	DB	39
	DB	40
	DB	41
	DB	126
	DB	61
	DB	126
	DB	0
	DB	0
	DB	81
	DB	87
	DB	69
	DB	82
	DB	84
	DB	89
	DB	85
	DB	73
	DB	79
	DB	80
	DB	96
	DB	123
	DB	0
	DB	0
	DB	65
	DB	83
	DB	68
	DB	70
	DB	71
	DB	72
	DB	74
	DB	75
	DB	76
	DB	43
	DB	42
	DB	0
	DB	0
	DB	125
	DB	90
	DB	88
	DB	67
	DB	86
	DB	66
	DB	78
	DB	77
	DB	60
	DB	62
	DB	63
	DB	0
	DB	42
	DB	0
	DB	32
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	55
	DB	56
	DB	57
	DB	45
	DB	52
	DB	53
	DB	54
	DB	43
	DB	49
	DB	50
	DB	51
	DB	48
	DB	46
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	95
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	124
	DB	0
	DB	0
LC0:
	DB	"console",0x00
LC1:
	DB	"task_a",0x00
LC4:
	DB	0x0A,"Break(mouse) :",0x0A,0x00
LC3:
	DB	0x0A,"Break(key) :",0x0A,0x00
LC2:
	DB	" ",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,1108
	MOV	DWORD [-1084+EBP],0
	MOV	AL,BYTE [4081]
	SAR	AL,4
	MOV	EDX,EAX
	AND	EDX,7
	MOV	DWORD [-1088+EBP],EDX
	MOV	DWORD [-1092+EBP],-1
	MOV	DWORD [-1096+EBP],-1
	MOV	DWORD [-1100+EBP],-1
	MOV	DWORD [-1104+EBP],0
	CALL	_init_gdtidt
	CALL	_init_pic
	CALL	_io_sti
	LEA	EAX,DWORD [-636+EBP]
	PUSH	0
	PUSH	EAX
	LEA	EAX,DWORD [-92+EBP]
	PUSH	128
	PUSH	EAX
	CALL	_fifo32_init
	CALL	_init_pit
	LEA	EDX,DWORD [-92+EBP]
	PUSH	256
	PUSH	EDX
	CALL	_init_keyboard
	LEA	EAX,DWORD [-780+EBP]
	PUSH	EAX
	LEA	EAX,DWORD [-92+EBP]
	PUSH	512
	PUSH	EAX
	CALL	_enable_mouse
	ADD	ESP,36
	PUSH	248
	PUSH	33
	CALL	_io_out8
	PUSH	239
	PUSH	161
	CALL	_io_out8
	LEA	EDX,DWORD [-124+EBP]
	PUSH	0
	LEA	EAX,DWORD [-764+EBP]
	PUSH	EAX
	PUSH	32
	PUSH	EDX
	CALL	_fifo32_init
	ADD	ESP,32
	PUSH	-1073741825
	PUSH	4194304
	CALL	_memtest
	PUSH	3932160
	MOV	DWORD [-1060+EBP],EAX
	CALL	_memman_init
	PUSH	647168
	PUSH	4096
	PUSH	3932160
	CALL	_memman_free
	MOV	EAX,DWORD [-1060+EBP]
	SUB	EAX,4194304
	PUSH	EAX
	PUSH	4194304
	PUSH	3932160
	CALL	_memman_free
	ADD	ESP,36
	CALL	_init_palette
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [4088]
	PUSH	3932160
	CALL	_shtctl_init
	PUSH	3932160
	MOV	DWORD [-1040+EBP],EAX
	CALL	_task_init
	PUSH	2
	PUSH	1
	MOV	DWORD [-1072+EBP],EAX
	PUSH	EAX
	MOV	DWORD [-68+EBP],EAX
	CALL	_task_run
	ADD	ESP,32
	MOV	EAX,DWORD [-1040+EBP]
	MOV	DWORD [4068],EAX
	PUSH	EAX
	CALL	_sheet_alloc
	MOVSX	EDX,WORD [4086]
	MOV	DWORD [-1064+EBP],EAX
	MOVSX	EAX,WORD [4084]
	IMUL	EAX,EDX
	PUSH	EAX
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	-1
	MOV	EBX,EAX
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	EBX
	PUSH	DWORD [-1064+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,32
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	EBX
	CALL	_init_screen8
	PUSH	DWORD [-1040+EBP]
	CALL	_sheet_alloc
	PUSH	42240
	PUSH	3932160
	MOV	ESI,EAX
	CALL	_memman_alloc_4k
	PUSH	-1
	PUSH	165
	MOV	EBX,EAX
	PUSH	256
	PUSH	EAX
	PUSH	ESI
	CALL	_sheet_setbuf
	ADD	ESP,44
	PUSH	0
	PUSH	LC0
	PUSH	165
	PUSH	256
	PUSH	EBX
	CALL	_make_window8
	PUSH	0
	PUSH	128
	PUSH	240
	PUSH	28
	PUSH	8
	PUSH	ESI
	CALL	_make_textbox8
	ADD	ESP,44
	CALL	_task_alloc
	PUSH	65536
	PUSH	3932160
	MOV	DWORD [-1076+EBP],EAX
	CALL	_memman_alloc_4k
	MOV	EDX,DWORD [-1076+EBP]
	ADD	EAX,65524
	MOV	DWORD [100+EDX],EAX
	MOV	DWORD [76+EDX],_console_task
	MOV	DWORD [116+EDX],8
	MOV	DWORD [120+EDX],16
	MOV	DWORD [124+EDX],8
	MOV	DWORD [128+EDX],8
	MOV	DWORD [132+EDX],8
	MOV	DWORD [136+EDX],8
	MOV	DWORD [4+EAX],ESI
	MOV	EAX,DWORD [100+EDX]
	MOV	EDX,DWORD [-1060+EBP]
	MOV	DWORD [8+EAX],EDX
	PUSH	2
	PUSH	2
	PUSH	DWORD [-1076+EBP]
	CALL	_task_run
	PUSH	DWORD [-1040+EBP]
	CALL	_sheet_alloc
	PUSH	8320
	PUSH	3932160
	MOV	EDI,EAX
	CALL	_memman_alloc_4k
	ADD	ESP,32
	MOV	EBX,EAX
	PUSH	-1
	PUSH	52
	PUSH	144
	PUSH	EAX
	PUSH	EDI
	CALL	_sheet_setbuf
	PUSH	1
	PUSH	LC1
	PUSH	52
	PUSH	144
	PUSH	EBX
	LEA	EBX,DWORD [-1036+EBP]
	CALL	_make_window8
	ADD	ESP,40
	PUSH	7
	PUSH	16
	PUSH	128
	PUSH	28
	PUSH	8
	PUSH	EDI
	CALL	_make_textbox8
	MOV	DWORD [-1052+EBP],8
	MOV	DWORD [-1056+EBP],7
	CALL	_timer_alloc
	PUSH	1
	MOV	DWORD [-1080+EBP],EAX
	LEA	EAX,DWORD [-92+EBP]
	PUSH	EAX
	PUSH	DWORD [-1080+EBP]
	CALL	_timer_init
	ADD	ESP,36
	PUSH	50
	PUSH	DWORD [-1080+EBP]
	CALL	_timer_settime
	PUSH	DWORD [-1040+EBP]
	CALL	_sheet_alloc
	PUSH	99
	PUSH	16
	PUSH	16
	MOV	DWORD [-1068+EBP],EAX
	PUSH	EBX
	PUSH	EAX
	CALL	_sheet_setbuf
	ADD	ESP,32
	PUSH	99
	PUSH	EBX
	MOV	EBX,2
	CALL	_init_mouse_cursor8
	MOVSX	EAX,WORD [4084]
	LEA	ECX,DWORD [-16+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	MOV	DWORD [-1044+EBP],EAX
	MOVSX	EAX,WORD [4086]
	PUSH	0
	LEA	ECX,DWORD [-44+EAX]
	PUSH	0
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	PUSH	DWORD [-1064+EBP]
	MOV	DWORD [-1048+EBP],EAX
	CALL	_sheet_slide
	PUSH	4
	PUSH	32
	PUSH	ESI
	CALL	_sheet_slide
	ADD	ESP,32
	PUSH	56
	PUSH	64
	PUSH	EDI
	CALL	_sheet_slide
	PUSH	DWORD [-1048+EBP]
	PUSH	DWORD [-1044+EBP]
	PUSH	DWORD [-1068+EBP]
	CALL	_sheet_slide
	PUSH	0
	PUSH	DWORD [-1064+EBP]
	CALL	_sheet_updown
	ADD	ESP,32
	PUSH	1
	PUSH	ESI
	CALL	_sheet_updown
	PUSH	2
	PUSH	EDI
	CALL	_sheet_updown
	PUSH	3
	PUSH	DWORD [-1068+EBP]
	CALL	_sheet_updown
	LEA	EAX,DWORD [-124+EBP]
	MOV	EDX,DWORD [-1076+EBP]
	MOV	DWORD [-1108+EBP],EDI
	OR	DWORD [28+ESI],32
	MOV	DWORD [36+ESI],EDX
	PUSH	237
	PUSH	EAX
	CALL	_fifo32_put
	LEA	EDX,DWORD [-124+EBP]
	ADD	ESP,32
	PUSH	DWORD [-1088+EBP]
	PUSH	EDX
	CALL	_fifo32_put
L73:
	POP	ECX
	POP	EBX
L2:
	LEA	EBX,DWORD [-124+EBP]
	PUSH	EBX
	CALL	_fifo32_status
	POP	EDX
	TEST	EAX,EAX
	JLE	L5
	CMP	DWORD [-1092+EBP],0
	JS	L76
L5:
	LEA	EBX,DWORD [-92+EBP]
	CALL	_io_cli
	PUSH	EBX
	CALL	_fifo32_status
	POP	ESI
	TEST	EAX,EAX
	JE	L77
	PUSH	EBX
	CALL	_fifo32_get
	MOV	ESI,EAX
	CALL	_io_sti
	MOV	EAX,DWORD [-1108+EBP]
	POP	ECX
	CMP	DWORD [28+EAX],0
	JNE	L8
	MOV	EDX,DWORD [-1040+EBP]
	MOV	EAX,DWORD [16+EDX]
	MOV	EAX,DWORD [16+EDX+EAX*4]
	PUSH	DWORD [-1056+EBP]
	PUSH	EDI
	MOV	DWORD [-1108+EBP],EAX
	PUSH	EAX
	CALL	_keywin_on
	ADD	ESP,12
	MOV	DWORD [-1056+EBP],EAX
L8:
	LEA	EAX,DWORD [-256+ESI]
	CMP	EAX,255
	JBE	L78
	LEA	EAX,DWORD [-512+ESI]
	CMP	EAX,255
	JBE	L79
	CMP	ESI,1
	JG	L2
	TEST	ESI,ESI
	JE	L66
	PUSH	0
	PUSH	EBX
	PUSH	DWORD [-1080+EBP]
	CALL	_timer_init
	ADD	ESP,12
	CMP	DWORD [-1056+EBP],0
	JS	L68
	MOV	DWORD [-1056+EBP],0
L68:
	PUSH	50
	PUSH	DWORD [-1080+EBP]
	CALL	_timer_settime
	POP	EAX
	POP	EDX
	CMP	DWORD [-1056+EBP],0
	JS	L2
	MOV	EAX,DWORD [-1052+EBP]
	PUSH	43
	ADD	EAX,7
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	MOVZX	EAX,BYTE [-1056+EBP]
	PUSH	EAX
	PUSH	DWORD [4+EDI]
	PUSH	DWORD [EDI]
	CALL	_boxfill8
	MOV	EAX,DWORD [-1052+EBP]
	PUSH	44
	ADD	EAX,8
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	EDI
	CALL	_sheet_refresh
	ADD	ESP,48
	JMP	L2
L66:
	PUSH	1
	PUSH	EBX
	PUSH	DWORD [-1080+EBP]
	CALL	_timer_init
	ADD	ESP,12
	CMP	DWORD [-1056+EBP],0
	JS	L68
	MOV	DWORD [-1056+EBP],7
	JMP	L68
L79:
	MOV	EDX,ESI
	MOVZX	EAX,DL
	PUSH	EAX
	LEA	EAX,DWORD [-780+EBP]
	PUSH	EAX
	CALL	_mouse_decode
	POP	EDX
	POP	ECX
	TEST	EAX,EAX
	JE	L2
	MOV	EAX,DWORD [-772+EBP]
	MOV	EDX,DWORD [-776+EBP]
	ADD	DWORD [-1048+EBP],EAX
	ADD	DWORD [-1044+EBP],EDX
	JS	L80
L45:
	CMP	DWORD [-1048+EBP],0
	JS	L81
L46:
	MOVSX	EAX,WORD [4084]
	DEC	EAX
	CMP	DWORD [-1044+EBP],EAX
	JLE	L47
	MOV	DWORD [-1044+EBP],EAX
L47:
	MOVSX	EAX,WORD [4086]
	DEC	EAX
	CMP	DWORD [-1048+EBP],EAX
	JLE	L48
	MOV	DWORD [-1048+EBP],EAX
L48:
	PUSH	DWORD [-1048+EBP]
	PUSH	DWORD [-1044+EBP]
	PUSH	DWORD [-1068+EBP]
	CALL	_sheet_slide
	ADD	ESP,12
	TEST	DWORD [-768+EBP],1
	JNE	L82
	MOV	DWORD [-1096+EBP],-1
	JMP	L2
L82:
	CMP	DWORD [-1096+EBP],0
	JS	L83
	MOV	EBX,DWORD [-1048+EBP]
	MOV	EAX,DWORD [-1104+EBP]
	SUB	EBX,DWORD [-1100+EBP]
	MOV	ESI,DWORD [-1044+EBP]
	SUB	ESI,DWORD [-1096+EBP]
	ADD	EBX,DWORD [16+EAX]
	PUSH	EBX
	ADD	ESI,DWORD [12+EAX]
	PUSH	ESI
	PUSH	EAX
	CALL	_sheet_slide
	ADD	ESP,12
	MOV	EDX,DWORD [-1044+EBP]
	MOV	EAX,DWORD [-1048+EBP]
	MOV	DWORD [-1096+EBP],EDX
	MOV	DWORD [-1100+EBP],EAX
	JMP	L2
L83:
	MOV	EAX,DWORD [-1040+EBP]
	MOV	EAX,DWORD [16+EAX]
	MOV	DWORD [-1116+EBP],EAX
	MOV	ECX,EAX
L75:
	DEC	ECX
	TEST	ECX,ECX
	JLE	L2
	MOV	EDX,DWORD [-1040+EBP]
	MOV	EBX,DWORD [-1048+EBP]
	MOV	ESI,DWORD [-1044+EBP]
	MOV	EDX,DWORD [20+EDX+ECX*4]
	MOV	DWORD [-1104+EBP],EDX
	SUB	EBX,DWORD [16+EDX]
	SUB	ESI,DWORD [12+EDX]
	JS	L75
	MOV	EAX,DWORD [4+EDX]
	CMP	ESI,EAX
	JGE	L75
	TEST	EBX,EBX
	JS	L75
	CMP	EBX,DWORD [8+EDX]
	JGE	L75
	IMUL	EAX,EBX
	MOV	DWORD [-1120+EBP],EAX
	MOV	EDX,DWORD [EDX]
	MOV	EAX,DWORD [-1120+EBP]
	ADD	EAX,ESI
	MOVZX	EAX,BYTE [EAX+EDX*1]
	MOV	EDX,DWORD [-1104+EBP]
	CMP	EAX,DWORD [20+EDX]
	JE	L75
	MOV	EAX,DWORD [-1116+EBP]
	DEC	EAX
	PUSH	EAX
	PUSH	EDX
	CALL	_sheet_updown
	POP	ECX
	POP	EAX
	MOV	EAX,DWORD [-1108+EBP]
	CMP	DWORD [-1104+EBP],EAX
	JE	L57
	PUSH	DWORD [-1052+EBP]
	PUSH	DWORD [-1056+EBP]
	PUSH	EDI
	PUSH	EAX
	CALL	_keywin_off
	MOV	EDX,DWORD [-1104+EBP]
	MOV	DWORD [-1108+EBP],EDX
	PUSH	EAX
	PUSH	EDI
	PUSH	EDX
	CALL	_keywin_on
	ADD	ESP,28
	MOV	DWORD [-1056+EBP],EAX
L57:
	CMP	ESI,2
	JLE	L58
	MOV	EDX,DWORD [-1104+EBP]
	MOV	EAX,DWORD [4+EDX]
	SUB	EAX,3
	CMP	ESI,EAX
	JGE	L58
	CMP	EBX,2
	JLE	L58
	CMP	EBX,20
	JG	L58
	MOV	EAX,DWORD [-1044+EBP]
	MOV	EDX,DWORD [-1048+EBP]
	MOV	DWORD [-1096+EBP],EAX
	MOV	DWORD [-1100+EBP],EDX
L58:
	MOV	EAX,DWORD [-1104+EBP]
	MOV	EDX,DWORD [4+EAX]
	LEA	EAX,DWORD [-21+EDX]
	CMP	EAX,ESI
	JG	L2
	LEA	EAX,DWORD [-5+EDX]
	CMP	ESI,EAX
	JGE	L2
	CMP	EBX,4
	JLE	L2
	CMP	EBX,18
	JG	L2
	MOV	EDX,DWORD [-1104+EBP]
	TEST	BYTE [28+EDX],16
	JE	L2
	PUSH	LC4
	PUSH	DWORD [4076]
	CALL	_cons_putstr0
	CALL	_io_cli
	MOV	EDX,DWORD [-1076+EBP]
	MOV	EAX,DWORD [-1076+EBP]
	ADD	EAX,48
	MOV	DWORD [84+EDX],EAX
	MOV	DWORD [76+EDX],_asm_end_app
	CALL	_io_sti
	JMP	L73
L81:
	MOV	DWORD [-1048+EBP],0
	JMP	L46
L80:
	MOV	DWORD [-1044+EBP],0
	JMP	L45
L78:
	CMP	ESI,383
	JG	L10
	CMP	DWORD [-1084+EBP],0
	JNE	L11
	MOV	AL,BYTE [_keytable0.0-256+ESI]
L74:
	MOV	BYTE [-60+EBP],AL
L13:
	MOV	DL,BYTE [-60+EBP]
	LEA	EAX,DWORD [-65+EDX]
	CMP	AL,25
	JA	L14
	TEST	DWORD [-1088+EBP],4
	JNE	L72
	CMP	DWORD [-1084+EBP],0
	JE	L16
L14:
	MOV	AL,BYTE [-60+EBP]
	TEST	AL,AL
	JE	L18
	CMP	DWORD [-1108+EBP],EDI
	JE	L84
	MOVSX	EAX,AL
	MOV	EDX,DWORD [-1108+EBP]
	ADD	EAX,256
	PUSH	EAX
	MOV	EAX,DWORD [36+EDX]
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	EAX
	POP	EDX
L18:
	CMP	ESI,270
	JE	L85
L22:
	CMP	ESI,284
	JE	L86
L26:
	CMP	ESI,271
	JE	L87
L28:
	CMP	ESI,298
	JE	L88
L30:
	CMP	ESI,310
	JE	L89
L31:
	CMP	ESI,426
	JE	L90
L32:
	CMP	ESI,438
	JE	L91
L33:
	CMP	ESI,314
	JE	L92
L34:
	CMP	ESI,325
	JE	L93
L35:
	CMP	ESI,326
	JE	L94
L36:
	CMP	ESI,315
	JE	L95
L37:
	CMP	ESI,343
	JE	L96
L38:
	CMP	ESI,506
	JE	L97
L39:
	CMP	ESI,510
	JE	L98
L40:
	CMP	DWORD [-1056+EBP],0
	JS	L41
	MOV	EAX,DWORD [-1052+EBP]
	PUSH	43
	ADD	EAX,7
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	MOVZX	EAX,BYTE [-1056+EBP]
	PUSH	EAX
	PUSH	DWORD [4+EDI]
	PUSH	DWORD [EDI]
	CALL	_boxfill8
	ADD	ESP,28
L41:
	MOV	EAX,DWORD [-1052+EBP]
	PUSH	44
	ADD	EAX,8
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	EDI
	CALL	_sheet_refresh
	ADD	ESP,20
	JMP	L2
L98:
	CALL	_wait_KBC_sendready
	PUSH	DWORD [-1092+EBP]
	PUSH	96
	CALL	_io_out8
	POP	EBX
	POP	ESI
	JMP	L40
L97:
	MOV	DWORD [-1092+EBP],-1
	JMP	L39
L96:
	MOV	EDX,DWORD [-1040+EBP]
	MOV	EAX,DWORD [16+EDX]
	CMP	EAX,2
	JLE	L38
	DEC	EAX
	PUSH	EAX
	PUSH	DWORD [24+EDX]
	CALL	_sheet_updown
	POP	EAX
	POP	EDX
	JMP	L38
L95:
	CMP	DWORD [-1084+EBP],0
	JE	L37
	MOV	EDX,DWORD [-1076+EBP]
	CMP	DWORD [52+EDX],0
	JE	L37
	PUSH	LC3
	PUSH	DWORD [4076]
	CALL	_cons_putstr0
	CALL	_io_cli
	MOV	EDX,DWORD [-1076+EBP]
	MOV	EAX,DWORD [-1076+EBP]
	ADD	EAX,48
	MOV	DWORD [84+EDX],EAX
	MOV	DWORD [76+EDX],_asm_end_app
	CALL	_io_sti
	POP	ECX
	POP	EBX
	JMP	L37
L94:
	PUSH	237
	LEA	EBX,DWORD [-124+EBP]
	PUSH	EBX
	XOR	DWORD [-1088+EBP],1
	CALL	_fifo32_put
	PUSH	DWORD [-1088+EBP]
	PUSH	EBX
	CALL	_fifo32_put
	ADD	ESP,16
	JMP	L36
L93:
	PUSH	237
	LEA	EBX,DWORD [-124+EBP]
	PUSH	EBX
	XOR	DWORD [-1088+EBP],2
	CALL	_fifo32_put
	PUSH	DWORD [-1088+EBP]
	PUSH	EBX
	CALL	_fifo32_put
	ADD	ESP,16
	JMP	L35
L92:
	PUSH	237
	LEA	EBX,DWORD [-124+EBP]
	PUSH	EBX
	XOR	DWORD [-1088+EBP],4
	CALL	_fifo32_put
	PUSH	DWORD [-1088+EBP]
	PUSH	EBX
	CALL	_fifo32_put
	ADD	ESP,16
	JMP	L34
L91:
	AND	DWORD [-1084+EBP],-3
	JMP	L33
L90:
	AND	DWORD [-1084+EBP],-2
	JMP	L32
L89:
	OR	DWORD [-1084+EBP],2
	JMP	L31
L88:
	OR	DWORD [-1084+EBP],1
	JMP	L30
L87:
	PUSH	DWORD [-1052+EBP]
	PUSH	DWORD [-1056+EBP]
	PUSH	EDI
	PUSH	DWORD [-1108+EBP]
	CALL	_keywin_off
	ADD	ESP,16
	MOV	DWORD [-1056+EBP],EAX
	MOV	EAX,DWORD [-1108+EBP]
	MOV	ECX,DWORD [24+EAX]
	DEC	ECX
	JNE	L29
	MOV	EDX,DWORD [-1040+EBP]
	MOV	ECX,DWORD [16+EDX]
	DEC	ECX
L29:
	MOV	EAX,DWORD [-1040+EBP]
	MOV	ECX,DWORD [20+EAX+ECX*4]
	PUSH	DWORD [-1056+EBP]
	PUSH	EDI
	MOV	DWORD [-1108+EBP],ECX
	PUSH	ECX
	CALL	_keywin_on
	ADD	ESP,12
	MOV	DWORD [-1056+EBP],EAX
	JMP	L28
L86:
	CMP	DWORD [-1108+EBP],EDI
	JE	L26
	MOV	EDX,DWORD [-1108+EBP]
	PUSH	266
	MOV	EAX,DWORD [36+EDX]
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	EAX
	POP	EDX
	JMP	L26
L85:
	CMP	DWORD [-1108+EBP],EDI
	JE	L99
	MOV	EDX,DWORD [-1108+EBP]
	PUSH	264
	MOV	EAX,DWORD [36+EDX]
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	ECX
	POP	EBX
	JMP	L22
L99:
	CMP	DWORD [-1052+EBP],8
	JLE	L22
	PUSH	1
	PUSH	LC2
	PUSH	7
	PUSH	0
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	EDI
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	SUB	DWORD [-1052+EBP],8
	JMP	L22
L84:
	CMP	DWORD [-1052+EBP],127
	JG	L18
	PUSH	1
	LEA	EAX,DWORD [-60+EBP]
	PUSH	EAX
	PUSH	7
	PUSH	0
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	EDI
	MOV	BYTE [-59+EBP],0
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	ADD	DWORD [-1052+EBP],8
	JMP	L18
L16:
	LEA	EAX,DWORD [32+EDX]
	MOV	BYTE [-60+EBP],AL
	JMP	L14
L72:
	CMP	DWORD [-1084+EBP],0
	JE	L14
	JMP	L16
L11:
	MOV	AL,BYTE [_keytable1.1-256+ESI]
	JMP	L74
L10:
	MOV	BYTE [-60+EBP],0
	JMP	L13
L77:
	PUSH	DWORD [-1072+EBP]
	CALL	_task_sleep
	CALL	_io_sti
	POP	EBX
	JMP	L2
L76:
	PUSH	EBX
	CALL	_fifo32_get
	MOV	DWORD [-1092+EBP],EAX
	CALL	_wait_KBC_sendready
	PUSH	DWORD [-1092+EBP]
	PUSH	96
	CALL	_io_out8
	ADD	ESP,12
	JMP	L5
	GLOBAL	_keywin_off
_keywin_off:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	MOV	EDI,DWORD [16+EBP]
	MOV	EBX,DWORD [8+EBP]
	PUSH	0
	PUSH	EBX
	MOV	ESI,DWORD [20+EBP]
	CALL	_change_wtitle8
	CMP	EBX,DWORD [12+EBP]
	POP	EAX
	POP	EDX
	JE	L104
	TEST	BYTE [28+EBX],32
	JNE	L105
L102:
	LEA	ESP,DWORD [-12+EBP]
	MOV	EAX,EDI
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L105:
	PUSH	3
	MOV	EAX,DWORD [36+EBX]
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	ESI
	POP	EAX
	JMP	L102
L104:
	PUSH	43
	LEA	EAX,DWORD [7+ESI]
	PUSH	EAX
	OR	EDI,-1
	PUSH	28
	PUSH	ESI
	PUSH	7
	PUSH	DWORD [4+EBX]
	PUSH	DWORD [EBX]
	CALL	_boxfill8
	ADD	ESP,28
	JMP	L102
	GLOBAL	_keywin_on
_keywin_on:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	ESI
	PUSH	EBX
	PUSH	1
	MOV	EBX,DWORD [8+EBP]
	PUSH	EBX
	MOV	ESI,DWORD [16+EBP]
	CALL	_change_wtitle8
	CMP	EBX,DWORD [12+EBP]
	POP	EAX
	POP	EDX
	JE	L110
	TEST	BYTE [28+EBX],32
	JNE	L111
L108:
	LEA	ESP,DWORD [-8+EBP]
	MOV	EAX,ESI
	POP	EBX
	POP	ESI
	POP	EBP
	RET
L111:
	PUSH	2
	MOV	EAX,DWORD [36+EBX]
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	ECX
	POP	EBX
	JMP	L108
L110:
	XOR	ESI,ESI
	JMP	L108
