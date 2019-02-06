[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_init_gdtidt
	EXTERN	_init_pic
	EXTERN	_io_sti
	EXTERN	_keyfifo
	EXTERN	_fifo8_init
	EXTERN	_mousefifo
	EXTERN	_init_pit
	EXTERN	_io_out8
	EXTERN	_timer_alloc
	EXTERN	_timer_init
	EXTERN	_timer_settime
	EXTERN	_init_keyboard
	EXTERN	_enable_mouse
	EXTERN	_memtest
	EXTERN	_memman_init
	EXTERN	_memman_free
	EXTERN	_init_palette
	EXTERN	_shtctl_init
	EXTERN	_sheet_alloc
	EXTERN	_memman_alloc_4k
	EXTERN	_sheet_setbuf
	EXTERN	_init_screen8
	EXTERN	_init_mouse_cursor8
	EXTERN	_sheet_slide
	EXTERN	_sheet_updown
	EXTERN	_sprintf
	EXTERN	_memman_total
	EXTERN	_io_cli
	EXTERN	_fifo8_status
	EXTERN	_fifo8_get
	EXTERN	_boxfill8
	EXTERN	_sheet_refresh
	EXTERN	_mouse_decode
	EXTERN	_putfonts8_asc
[FILE "bootpack.c"]
[SECTION .data]
LC0:
	DB	"counter",0x00
LC1:
	DB	"(%3d, %3d)",0x00
LC2:
	DB	"memory %dMB   free : %dKB",0x00
LC7:
	DB	"3[sec]",0x00
LC5:
	DB	"10[sec]",0x00
LC6:
	DB	"%010d",0x00
LC4:
	DB	"[lcr %4d %4d]",0x00
LC3:
	DB	"%02X",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	LEA	ESI,DWORD [-44+EBP]
	SUB	ESP,560
	MOV	DWORD [-544+EBP],0
	CALL	_init_gdtidt
	CALL	_init_pic
	CALL	_io_sti
	LEA	EAX,DWORD [-124+EBP]
	PUSH	EAX
	PUSH	32
	PUSH	_keyfifo
	CALL	_fifo8_init
	LEA	EAX,DWORD [-252+EBP]
	PUSH	EAX
	PUSH	128
	PUSH	_mousefifo
	CALL	_fifo8_init
	CALL	_init_pit
	PUSH	248
	PUSH	33
	CALL	_io_out8
	ADD	ESP,32
	PUSH	239
	PUSH	161
	CALL	_io_out8
	LEA	EAX,DWORD [-532+EBP]
	PUSH	EAX
	PUSH	8
	PUSH	ESI
	CALL	_fifo8_init
	CALL	_timer_alloc
	PUSH	10
	PUSH	ESI
	MOV	EBX,EAX
	PUSH	EAX
	CALL	_timer_init
	ADD	ESP,32
	PUSH	1000
	PUSH	EBX
	CALL	_timer_settime
	CALL	_timer_alloc
	PUSH	3
	PUSH	ESI
	MOV	EBX,EAX
	PUSH	EAX
	CALL	_timer_init
	PUSH	300
	PUSH	EBX
	CALL	_timer_settime
	CALL	_timer_alloc
	PUSH	1
	PUSH	ESI
	PUSH	EAX
	MOV	DWORD [-536+EBP],EAX
	CALL	_timer_init
	ADD	ESP,40
	PUSH	50
	PUSH	DWORD [-536+EBP]
	CALL	_timer_settime
	CALL	_init_keyboard
	LEA	EAX,DWORD [-268+EBP]
	PUSH	EAX
	CALL	_enable_mouse
	PUSH	-1073741825
	PUSH	4194304
	CALL	_memtest
	PUSH	3932160
	MOV	DWORD [-548+EBP],EAX
	CALL	_memman_init
	PUSH	647168
	PUSH	4096
	PUSH	3932160
	CALL	_memman_free
	MOV	EAX,DWORD [-548+EBP]
	ADD	ESP,36
	SUB	EAX,4194304
	PUSH	EAX
	PUSH	4194304
	PUSH	3932160
	CALL	_memman_free
	CALL	_init_palette
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [4088]
	PUSH	3932160
	CALL	_shtctl_init
	MOV	EBX,EAX
	PUSH	EAX
	CALL	_sheet_alloc
	ADD	ESP,32
	PUSH	EBX
	MOV	DWORD [-552+EBP],EAX
	CALL	_sheet_alloc
	PUSH	EBX
	LEA	EBX,DWORD [-524+EBP]
	MOV	DWORD [-556+EBP],EAX
	CALL	_sheet_alloc
	MOVSX	EDX,WORD [4086]
	MOV	DWORD [-560+EBP],EAX
	MOVSX	EAX,WORD [4084]
	IMUL	EAX,EDX
	PUSH	EAX
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	8320
	PUSH	3932160
	MOV	DWORD [-564+EBP],EAX
	CALL	_memman_alloc_4k
	PUSH	-1
	MOV	ESI,EAX
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-564+EBP]
	PUSH	DWORD [-552+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,44
	PUSH	99
	PUSH	16
	PUSH	16
	PUSH	EBX
	PUSH	DWORD [-556+EBP]
	CALL	_sheet_setbuf
	PUSH	-1
	PUSH	52
	PUSH	160
	PUSH	ESI
	PUSH	DWORD [-560+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,40
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-564+EBP]
	CALL	_init_screen8
	PUSH	99
	PUSH	EBX
	MOV	EBX,2
	CALL	_init_mouse_cursor8
	PUSH	LC0
	PUSH	52
	PUSH	160
	PUSH	ESI
	CALL	_make_window8
	ADD	ESP,36
	PUSH	0
	PUSH	0
	PUSH	DWORD [-552+EBP]
	CALL	_sheet_slide
	MOVSX	EAX,WORD [4084]
	LEA	ECX,DWORD [-16+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	MOV	DWORD [-540+EBP],EAX
	MOVSX	EAX,WORD [4086]
	LEA	ECX,DWORD [-44+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	PUSH	EAX
	MOV	EDI,EAX
	PUSH	DWORD [-540+EBP]
	PUSH	DWORD [-556+EBP]
	LEA	EBX,DWORD [-92+EBP]
	CALL	_sheet_slide
	PUSH	72
	PUSH	80
	PUSH	DWORD [-560+EBP]
	CALL	_sheet_slide
	ADD	ESP,36
	PUSH	0
	PUSH	DWORD [-552+EBP]
	CALL	_sheet_updown
	PUSH	1
	PUSH	DWORD [-560+EBP]
	CALL	_sheet_updown
	PUSH	2
	PUSH	DWORD [-556+EBP]
	CALL	_sheet_updown
	PUSH	EDI
	PUSH	DWORD [-540+EBP]
	PUSH	LC1
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,40
	PUSH	10
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	0
	PUSH	0
	PUSH	DWORD [-552+EBP]
	CALL	_putfonts8_asc_sht
	PUSH	3932160
	CALL	_memman_total
	SHR	DWORD [-548+EBP],20
	SHR	EAX,10
	MOV	DWORD [ESP],EAX
	PUSH	DWORD [-548+EBP]
	PUSH	LC2
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,44
	PUSH	40
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	32
	PUSH	0
	PUSH	DWORD [-552+EBP]
L27:
	CALL	_putfonts8_asc_sht
L26:
	ADD	ESP,28
L2:
	INC	DWORD [-544+EBP]
	LEA	ESI,DWORD [-44+EBP]
	CALL	_io_cli
	PUSH	_keyfifo
	CALL	_fifo8_status
	PUSH	_mousefifo
	MOV	EBX,EAX
	CALL	_fifo8_status
	PUSH	ESI
	ADD	EBX,EAX
	CALL	_fifo8_status
	ADD	ESP,12
	LEA	EAX,DWORD [EAX+EBX*1]
	TEST	EAX,EAX
	JE	L29
	PUSH	_keyfifo
	CALL	_fifo8_status
	POP	EBX
	TEST	EAX,EAX
	JNE	L30
	PUSH	_mousefifo
	CALL	_fifo8_status
	POP	ECX
	TEST	EAX,EAX
	JNE	L31
	PUSH	ESI
	CALL	_fifo8_status
	POP	EDX
	TEST	EAX,EAX
	JE	L2
	PUSH	ESI
	CALL	_fifo8_get
	MOV	EBX,EAX
	CALL	_io_sti
	POP	EAX
	CMP	EBX,10
	JE	L32
	CMP	EBX,3
	JE	L33
	TEST	EBX,EBX
	JE	L24
	PUSH	0
	PUSH	ESI
	PUSH	DWORD [-536+EBP]
	CALL	_timer_init
	PUSH	111
	PUSH	15
	PUSH	96
	PUSH	8
	PUSH	7
L28:
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-564+EBP]
	CALL	_boxfill8
	ADD	ESP,40
	PUSH	50
	PUSH	DWORD [-536+EBP]
	CALL	_timer_settime
	PUSH	112
	PUSH	16
	PUSH	96
	PUSH	8
	PUSH	DWORD [-552+EBP]
	CALL	_sheet_refresh
	JMP	L26
L24:
	PUSH	1
	PUSH	ESI
	PUSH	DWORD [-536+EBP]
	CALL	_timer_init
	PUSH	111
	PUSH	15
	PUSH	96
	PUSH	8
	PUSH	14
	JMP	L28
L33:
	PUSH	6
	PUSH	LC7
	PUSH	14
	PUSH	7
	PUSH	80
	PUSH	0
	PUSH	DWORD [-552+EBP]
	CALL	_putfonts8_asc_sht
	MOV	DWORD [-544+EBP],0
	JMP	L26
L32:
	PUSH	7
	LEA	EBX,DWORD [-92+EBP]
	PUSH	LC5
	PUSH	14
	PUSH	7
	PUSH	64
	PUSH	0
	PUSH	DWORD [-552+EBP]
	CALL	_putfonts8_asc_sht
	PUSH	DWORD [-544+EBP]
	PUSH	LC6
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,40
	PUSH	10
	PUSH	EBX
	PUSH	8
	PUSH	0
	PUSH	28
	PUSH	40
	PUSH	DWORD [-560+EBP]
	JMP	L27
L31:
	PUSH	_mousefifo
	CALL	_fifo8_get
	MOV	EBX,EAX
	CALL	_io_sti
	MOVZX	EAX,BL
	PUSH	EAX
	LEA	EAX,DWORD [-268+EBP]
	PUSH	EAX
	CALL	_mouse_decode
	ADD	ESP,12
	TEST	EAX,EAX
	JE	L2
	PUSH	DWORD [-260+EBP]
	PUSH	DWORD [-264+EBP]
	PUSH	LC4
	LEA	EBX,DWORD [-92+EBP]
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,16
	MOV	EAX,DWORD [-256+EBP]
	TEST	EAX,1
	JE	L11
	MOV	BYTE [-91+EBP],76
L11:
	TEST	EAX,2
	JE	L12
	MOV	BYTE [-89+EBP],82
L12:
	AND	EAX,4
	JE	L13
	MOV	BYTE [-90+EBP],67
L13:
	PUSH	15
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	16
	PUSH	32
	PUSH	DWORD [-552+EBP]
	CALL	_putfonts8_asc_sht
	MOV	EAX,DWORD [-264+EBP]
	ADD	EDI,DWORD [-260+EBP]
	ADD	ESP,28
	ADD	DWORD [-540+EBP],EAX
	JS	L34
L14:
	TEST	EDI,EDI
	JS	L35
L15:
	MOVSX	EAX,WORD [4084]
	DEC	EAX
	CMP	DWORD [-540+EBP],EAX
	JLE	L16
	MOV	DWORD [-540+EBP],EAX
L16:
	MOVSX	EAX,WORD [4086]
	DEC	EAX
	CMP	EDI,EAX
	JLE	L17
	MOV	EDI,EAX
L17:
	PUSH	EDI
	PUSH	DWORD [-540+EBP]
	PUSH	LC1
	PUSH	EBX
	CALL	_sprintf
	PUSH	10
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	0
	PUSH	0
	PUSH	DWORD [-552+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,44
	PUSH	EDI
	PUSH	DWORD [-540+EBP]
	PUSH	DWORD [-556+EBP]
	CALL	_sheet_slide
	ADD	ESP,12
	JMP	L2
L35:
	XOR	EDI,EDI
	JMP	L15
L34:
	MOV	DWORD [-540+EBP],0
	JMP	L14
L30:
	PUSH	_keyfifo
	CALL	_fifo8_get
	MOV	EBX,EAX
	CALL	_io_sti
	PUSH	EBX
	LEA	EBX,DWORD [-92+EBP]
	PUSH	LC3
	PUSH	EBX
	CALL	_sprintf
	PUSH	2
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	16
	PUSH	0
	PUSH	DWORD [-552+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,44
	JMP	L2
L29:
	CALL	_io_sti
	JMP	L2
[SECTION .data]
_closebtn.0:
	DB	"OOOOOOOOOOOOOOO@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQ@@QQQQ@@QQ$@"
	DB	"OQQQQ@@QQ@@QQQ$@"
	DB	"OQQQQQ@@@@QQQQ$@"
	DB	"OQQQQQQ@@QQQQQ$@"
	DB	"OQQQQQ@@@@QQQQ$@"
	DB	"OQQQQ@@QQ@@QQQ$@"
	DB	"OQQQ@@QQQQ@@QQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"O$$$$$$$$$$$$$$@"
	DB	"@@@@@@@@@@@@@@@@"
[SECTION .text]
	GLOBAL	_make_window8
_make_window8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,20
	MOV	EBX,DWORD [12+EBP]
	PUSH	0
	LEA	EAX,DWORD [-1+EBX]
	LEA	EDI,DWORD [-2+EBX]
	PUSH	EAX
	MOV	DWORD [-20+EBP],EAX
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	1
	PUSH	EDI
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EDX,DWORD [16+EBP]
	ADD	ESP,56
	DEC	EDX
	MOV	DWORD [-24+EBP],EDX
	PUSH	EDX
	PUSH	0
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	ESI,DWORD [16+EBP]
	SUB	ESI,2
	PUSH	ESI
	PUSH	1
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	ESI
	PUSH	EDI
	PUSH	1
	PUSH	EDI
	PUSH	15
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	DWORD [-24+EBP]
	PUSH	DWORD [-20+EBP]
	PUSH	0
	PUSH	DWORD [-20+EBP]
	PUSH	0
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EAX,DWORD [16+EBP]
	ADD	ESP,56
	SUB	EAX,3
	PUSH	EAX
	LEA	EAX,DWORD [-3+EBX]
	PUSH	EAX
	PUSH	2
	PUSH	2
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-4+EBX]
	PUSH	20
	PUSH	EAX
	PUSH	3
	PUSH	3
	PUSH	12
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	ESI
	PUSH	EDI
	PUSH	ESI
	PUSH	1
	PUSH	15
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	DWORD [-24+EBP]
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-24+EBP]
	PUSH	0
	PUSH	0
	IMUL	ESI,EBX,5
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	DWORD [20+EBP]
	PUSH	7
	PUSH	4
	PUSH	24
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc
	ADD	ESP,24
	MOV	DWORD [-16+EBP],0
	MOV	DWORD [-32+EBP],0
L52:
	LEA	EAX,DWORD [ESI+EBX*1]
	MOV	EDX,DWORD [8+EBP]
	XOR	EDI,EDI
	LEA	ECX,DWORD [-21+EDX+EAX*1]
L51:
	MOV	EAX,DWORD [-32+EBP]
	MOV	DL,BYTE [_closebtn.0+EDI+EAX*1]
	CMP	DL,64
	JE	L57
	CMP	DL,36
	JE	L58
	CMP	DL,81
	MOV	DL,8
	SETNE	AL
	SUB	DL,AL
L46:
	INC	EDI
	MOV	BYTE [ECX],DL
	INC	ECX
	CMP	EDI,15
	JLE	L51
	INC	DWORD [-16+EBP]
	ADD	ESI,EBX
	ADD	DWORD [-32+EBP],16
	CMP	DWORD [-16+EBP],13
	JLE	L52
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L58:
	MOV	DL,15
	JMP	L46
L57:
	XOR	EDX,EDX
	JMP	L46
	GLOBAL	_putfonts8_asc_sht
_putfonts8_asc_sht:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,12
	MOV	EAX,DWORD [8+EBP]
	MOV	EDI,DWORD [16+EBP]
	MOV	DWORD [-16+EBP],EAX
	MOV	EBX,DWORD [20+EBP]
	MOV	EAX,DWORD [12+EBP]
	MOV	DWORD [-20+EBP],EAX
	MOV	EAX,DWORD [28+EBP]
	MOV	DWORD [-24+EBP],EAX
	LEA	EAX,DWORD [15+EDI]
	PUSH	EAX
	MOV	EAX,DWORD [-20+EBP]
	MOV	ESI,DWORD [32+EBP]
	MOVSX	EBX,BL
	LEA	ESI,DWORD [EAX+ESI*8]
	LEA	EAX,DWORD [-1+ESI]
	PUSH	EAX
	PUSH	EDI
	PUSH	DWORD [-20+EBP]
	MOVZX	EAX,BYTE [24+EBP]
	PUSH	EAX
	MOV	EAX,DWORD [-16+EBP]
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	PUSH	DWORD [-24+EBP]
	PUSH	EBX
	PUSH	EDI
	PUSH	DWORD [-20+EBP]
	MOV	EAX,DWORD [-16+EBP]
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_putfonts8_asc
	MOV	DWORD [16+EBP],EDI
	LEA	EAX,DWORD [16+EDI]
	MOV	DWORD [20+EBP],ESI
	MOV	DWORD [24+EBP],EAX
	ADD	ESP,52
	MOV	EAX,DWORD [-20+EBP]
	MOV	DWORD [12+EBP],EAX
	MOV	EAX,DWORD [-16+EBP]
	MOV	DWORD [8+EBP],EAX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_sheet_refresh
