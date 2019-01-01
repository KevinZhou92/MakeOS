; hello-os
; TAB=4

; ˆÈ‰º‚Í•W€“I‚ÈFAT12ƒtƒH[ƒ}ƒbƒgƒtƒƒbƒs[ƒfƒBƒXƒN‚Ì‚½‚ß‚Ì‹Lq

		DB		0xeb, 0x4e, 0x90; 这里是0x43因为这是一个短跳转指令,采用的是相对位移,偏移量为下一条命令的绝对地址减去这条跳转指令结束的地址的差值
		DB		"HELLOZPC"		; ƒu[ƒgƒZƒNƒ^‚Ì–¼‘O‚ðŽ©—R‚É‘‚¢‚Ä‚æ‚¢i8ƒoƒCƒgj
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
		DB		"HELLO-OS   "	; ƒfƒBƒXƒN‚Ì–¼‘Oi11ƒoƒCƒgj
		DB		"FAT12   "		; ƒtƒH[ƒ}ƒbƒg‚Ì–¼‘Oi8ƒoƒCƒgj
		RESB	18				; ‚Æ‚è‚ ‚¦‚¸18ƒoƒCƒg‚ ‚¯‚Ä‚¨‚­

; ƒvƒƒOƒ‰ƒ€–{‘Ì

		DB		0xb8, 0x00, 0x00, 0x8e, 0xd0, 0xbc, 0x00, 0x7c
		DB		0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x74, 0x7c, 0x8a
		DB		0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
		DB		0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 0x10, 0xeb
		DB		0xee, 0xf4, 0xeb, 0xfd

; ƒƒbƒZ[ƒW•”•ª

		DB		0x0a, 0x0a		; ‰üs‚ð2‚Â
		DB		"Hello World! Pengcheng Zhou"
		DB		0x0a			; ‰üs
		DB		0

		RESB	0x1fe-$			; 0x001fe‚Ü‚Å‚ð0x00‚Å–„‚ß‚é–½—ß

		DB		0x55, 0xaa

; ˆÈ‰º‚Íƒu[ƒgƒZƒNƒ^ˆÈŠO‚Ì•”•ª‚Ì‹Lq

		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	4600
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	1469432
