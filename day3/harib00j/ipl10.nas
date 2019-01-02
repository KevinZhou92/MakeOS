; haribote-ipl
; TAB=4

CYLS	EQU		10				; ‚Ç‚±‚Ü‚Å“Ç‚Ýž‚Þ‚©

		ORG		0x7c00			; ‚±‚ÌƒvƒƒOƒ‰ƒ€‚ª‚Ç‚±‚É“Ç‚Ýž‚Ü‚ê‚é‚Ì‚©

; ˆÈ‰º‚Í•W€“I‚ÈFAT12ƒtƒH[ƒ}ƒbƒgƒtƒƒbƒs[ƒfƒBƒXƒN‚Ì‚½‚ß‚Ì‹Lq

		JMP		entry
		DB		0x90
		DB		"HARIBOTE"		; ƒu[ƒgƒZƒNƒ^‚Ì–¼‘O‚ðŽ©—R‚É‘‚¢‚Ä‚æ‚¢i8ƒoƒCƒgj
		DW		512				; 1ƒZƒNƒ^‚Ì‘å‚«‚³i512‚É‚µ‚È‚¯‚ê‚Î‚¢‚¯‚È‚¢j
		DB		1				; ƒNƒ‰ƒXƒ^‚Ì‘å‚«‚³i1ƒZƒNƒ^‚É‚µ‚È‚¯‚ê‚Î‚¢‚¯‚È‚¢j
		DW		1				; FAT‚ª‚Ç‚±‚©‚çŽn‚Ü‚é‚©i•’Ê‚Í1ƒZƒNƒ^–Ú‚©‚ç‚É‚·‚éj
		DB		2				; FAT‚ÌŒÂ”i2‚É‚µ‚È‚¯‚ê‚Î‚¢‚¯‚È‚¢j
		DW		224				; ƒ‹[ƒgƒfƒBƒŒƒNƒgƒŠ—Ìˆæ‚Ì‘å‚«‚³i•’Ê‚Í224ƒGƒ“ƒgƒŠ‚É‚·‚éj
		DW		2880			; ‚±‚Ìƒhƒ‰ƒCƒu‚Ì‘å‚«‚³i2880ƒZƒNƒ^‚É‚µ‚È‚¯‚ê‚Î‚¢‚¯‚È‚¢j
		DB		0xf0			; ƒƒfƒBƒA‚Ìƒ^ƒCƒvi0xf0‚É‚µ‚È‚¯‚ê‚Î‚¢‚¯‚È‚¢j
		DW		9				; FAT—Ìˆæ‚Ì’·‚³i9ƒZƒNƒ^‚É‚µ‚È‚¯‚ê‚Î‚¢‚¯‚È‚¢j
		DW		18				; 1ƒgƒ‰ƒbƒN‚É‚¢‚­‚Â‚ÌƒZƒNƒ^‚ª‚ ‚é‚©i18‚É‚µ‚È‚¯‚ê‚Î‚¢‚¯‚È‚¢j
		DW		2				; ƒwƒbƒh‚Ì”i2‚É‚µ‚È‚¯‚ê‚Î‚¢‚¯‚È‚¢j
		DD		0				; ƒp[ƒeƒBƒVƒ‡ƒ“‚ðŽg‚Á‚Ä‚È‚¢‚Ì‚Å‚±‚±‚Í•K‚¸0
		DD		2880			; ‚±‚Ìƒhƒ‰ƒCƒu‘å‚«‚³‚ð‚à‚¤ˆê“x‘‚­
		DB		0,0,0x29		; ‚æ‚­‚í‚©‚ç‚È‚¢‚¯‚Ç‚±‚Ì’l‚É‚µ‚Ä‚¨‚­‚Æ‚¢‚¢‚ç‚µ‚¢
		DD		0xffffffff		; ‚½‚Ô‚ñƒ{ƒŠƒ…[ƒ€ƒVƒŠƒAƒ‹”Ô†
		DB		"HARIBOTEOS "	; ƒfƒBƒXƒN‚Ì–¼‘Oi11ƒoƒCƒgj
		DB		"FAT12   "		; ƒtƒH[ƒ}ƒbƒg‚Ì–¼‘Oi8ƒoƒCƒgj
		RESB	18				; ‚Æ‚è‚ ‚¦‚¸18ƒoƒCƒg‚ ‚¯‚Ä‚¨‚­

; ƒvƒƒOƒ‰ƒ€–{‘Ì

entry:
		MOV		AX,0			; ƒŒƒWƒXƒ^‰Šú‰»
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX

; ƒfƒBƒXƒN‚ð“Ç‚Þ

		MOV		AX,0x0820
		MOV		ES,AX
		MOV		CH,0			; ƒVƒŠƒ“ƒ_0
		MOV		DH,0			; ƒwƒbƒh0
		MOV		CL,2			; ƒZƒNƒ^2
readloop:
		MOV		SI,0			; Ž¸”s‰ñ”‚ð”‚¦‚éƒŒƒWƒXƒ^
retry:
		MOV		AH,0x02			; AH=0x02 : ƒfƒBƒXƒN“Ç‚Ýž‚Ý
		MOV		AL,1			; 1ƒZƒNƒ^
		MOV		BX,0
		MOV		DL,0x00			; Aƒhƒ‰ƒCƒu
		INT		0x13			; ƒfƒBƒXƒNBIOSŒÄ‚Ño‚µ
		JNC		next			; ƒGƒ‰[‚ª‚¨‚«‚È‚¯‚ê‚Înext‚Ö
		ADD		SI,1			; SI‚É1‚ð‘«‚·
		CMP		SI,5			; SI‚Æ5‚ð”äŠr
		JAE		error			; SI >= 5 ‚¾‚Á‚½‚çerror‚Ö
		MOV		AH,0x00
		MOV		DL,0x00			; Aƒhƒ‰ƒCƒu
		INT		0x13			; ƒhƒ‰ƒCƒu‚ÌƒŠƒZƒbƒg
		JMP		retry
next:
		MOV		AX,ES			; ƒAƒhƒŒƒX‚ð0x200i‚ß‚é
		ADD		AX,0x0020
		MOV		ES,AX			; ADD ES,0x020 ‚Æ‚¢‚¤–½—ß‚ª‚È‚¢‚Ì‚Å‚±‚¤‚µ‚Ä‚¢‚é
		ADD		CL,1			; CL‚É1‚ð‘«‚·
		CMP		CL,18			; CL‚Æ18‚ð”äŠr
		JBE		readloop		; CL <= 18 ‚¾‚Á‚½‚çreadloop‚Ö
		MOV		CL,1
		ADD		DH,1
		CMP		DH,2
		JB		readloop		; DH < 2 ‚¾‚Á‚½‚çreadloop‚Ö
		MOV		DH,0
		ADD		CH,1
		CMP		CH,CYLS
		JB		readloop		; CH < CYLS ‚¾‚Á‚½‚çreadloop‚Ö

; “Ç‚ÝI‚í‚Á‚½‚Ì‚Åharibote.sys‚ðŽÀs‚¾I

		MOV		[0x0ff0],CH		; IPL‚ª‚Ç‚±‚Ü‚Å“Ç‚ñ‚¾‚Ì‚©‚ðƒƒ‚
		

		MOV SI, msg

display:
		MOV AL,[SI]
		ADD SI,1
		CMP AL, 0
		JE fin
		MOV AH, 0x0e
		MOV BX, 15
		INT 0x10
		JMP display


error:
		MOV		SI,error_msg
		JMP 	putloop
putloop:
		MOV		AL,[SI]
		ADD		SI,1			; SI‚É1‚ð‘«‚·
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			; ˆê•¶Žš•\Ž¦ƒtƒ@ƒ“ƒNƒVƒ‡ƒ“
		MOV		BX,15			; ƒJƒ‰[ƒR[ƒh
		INT		0x10			; ƒrƒfƒIBIOSŒÄ‚Ño‚µ
		JMP		putloop
fin:
		HLT						; ‰½‚©‚ ‚é‚Ü‚ÅCPU‚ð’âŽ~‚³‚¹‚é
		JMP		0xc201			;当需要显示的信息都显示完毕，那么进入死循环


msg:	
			;设定需要显示的字符
		DB 0x0a, 0x0a
		DB "============="
		DB 0x0a
		DB 0x0d
		DB "Welcome to my OS!"
		DB 0x0a
		DB 0x0d
		DB "ONE 0S"
		DB 0x0a
		DB 0x0d
		DB "Author: Pengcheng Zhou"
		DB 0x0a
		DB 0x0d
		DB 0

error_msg:
		DB		0x0a, 0x0a		; ‰üs‚ð2‚Â
		DB		"load error"
		DB		0x0a			; ‰üs
		DB		0

		TIMES	510 - ($ - $$)	DB 0	; 0x7dfe‚Ü‚Å‚ð0x00‚Å–„‚ß‚é–½—ß

		DB		0x55, 0xaa
