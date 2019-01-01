; haribote-os
; TAB=4

		ORG		0xc200			; set the origin address in memory to 0Xc2000

		MOV		AL,0x13			; VGA graphic card, 320X200X8 colorful mode
		MOV		AH,0x00
		INT		0x10

		MOV SI, msg   			; load memory address of lable 'msg' into si

display:
		MOV AL, [SI]
		ADD SI, 1
		CMP AL, 0
		JE fin
		MOV AH, 0x0e
		MOV BX, 15
		INT		0x10
		JMP display
		

fin:
		HLT
		JMP		fin

msg:    DB 0X0A, 0X0A
		DB "Welcome to My OS. ONE OS"
		DB 0X0A
		DB "Author: Pengcheng Zhou"
		DB 0x0a
		Db 0
