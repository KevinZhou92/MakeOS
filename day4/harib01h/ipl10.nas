; haribote-ipl
; TAB=4

CYLS	EQU		10				; ‚Ç‚±‚Ü‚Å“Ç‚Ýž‚Þ‚©

		ORG		0x7c00			; ‚±‚ÌƒvƒƒOƒ‰ƒ€‚ª‚Ç‚±‚É“Ç‚Ýž‚Ü‚ê‚é‚Ì‚©

; ˆÈ‰º‚Í•W€“I‚ÈFAT12ƒtƒH[ƒ}ƒbƒgƒtƒƒbƒs[ƒfƒBƒXƒN‚Ì‚½‚ß‚Ì‹Lq

		JMP		entry
		DB		0x90
		DB		"HARIBOTE"		; 启动区的名称可以时任意的字符串(8字节)
		DW 512 				; 每个扇区(sector)的大小(必须是512字节)
		DB 1				; 簇(cluster）的大小（必须是一个扇区)
		DW 1				; FAT的起始位置(一般从第一个扇区开始)
		DB 2				; FAT的个数(必须是2)
		DW 224				; 根目录的大小(一般设成224项)
		DW 2880				; 该磁盘的大小(必须是2880扇区)
		DB 0xf0				; 磁盘的种类(必须是0xf0)
		DW 9				; FAT的长度(必须是9扇区)
		DW 18				; 1个磁道(track)有几个扇区(必须是18)
		DW 2				; 磁头数(必须是2)
		DD 0				; 不使用分区，必须是0
		DD 2880				; 重写一次磁盘大小
		DB 0,0,0x29			; 意义不明，固定
		DD 0xffffffff		; (可能是)卷标号码
		DB "HELLO-OS   "	; 磁盘的名称(11字节)
		DB "FAT12   "		; 磁盘格式名称(8字节)
		RESB 18				; 先空出18字节

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
		MOV		AX,ES			; 地址偏移512字节
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
		JMP		0xc200

error:
		MOV		SI,msg
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
		JMP		fin				; –³ŒÀƒ‹[ƒv
msg:
		DB		0x0a, 0x0a		; ‰üs‚ð2‚Â
		DB		"load error"
		DB		0x0a			; ‰üs
		DB		0

		RESB	0x7dfe-$		; 0x7dfe‚Ü‚Å‚ð0x00‚Å–„‚ß‚é–½—ß

		DB		0x55, 0xaa
