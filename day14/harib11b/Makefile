OBJS_BOOTPACK = bootpack.obj naskfunc.obj hankaku.obj graphic.obj dsctbl.obj \
		int.obj fifo.obj keyboard.obj mouse.obj memory.obj sheet.obj timer.obj

TOOLPATH = ../../tolsetOSX/z_tools
INCPATH  = ../../tolsetOSX/z_tools/haribote

MAKE     = make -r
NASK     = $(TOOLPATH)/nask
CC1      = $(TOOLPATH)/gocc1 -I$(INCPATH)/ -Os -Wall -quiet
GAS2NASK = $(TOOLPATH)/gas2nask -a
MAKEFONT = $(TOOLPATH)/makefont
OBJ2BIM  = $(TOOLPATH)/obj2bim
BIN2OBJ  = $(TOOLPATH)/bin2obj
BIM2HRB  = $(TOOLPATH)/bim2hrb
RULEFILE = $(TOOLPATH)/haribote/haribote.rul
EDIMG    = $(TOOLPATH)/edimg
IMGTOL   = $(TOOLPATH)/imgtol
COPY     = cp
DEL      = rm 

default :
	$(MAKE) img

# �t�@�C�������K��

ipl10.bin : ipl10.nas Makefile
	$(NASK) ipl10.nas ipl10.bin ipl10.lst

asmhead.bin : asmhead.nas Makefile
	$(NASK) asmhead.nas asmhead.bin asmhead.lst

hankaku.bin : hankaku.txt Makefile
	$(MAKEFONT) hankaku.txt hankaku.bin

hankaku.obj : hankaku.bin Makefile
	$(BIN2OBJ) hankaku.bin hankaku.obj _hankaku

bootpack.bim : $(OBJS_BOOTPACK) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:bootpack.bim stack:3136k map:bootpack.map \
		$(OBJS_BOOTPACK)
# 3MB+64KB=3136KB

bootpack.hrb : bootpack.bim Makefile
	$(BIM2HRB) bootpack.bim bootpack.hrb 0

haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

haribote.img : ipl10.bin haribote.sys Makefile
	$(EDIMG)   imgin:$(TOOLPATH)/fdimg0at.tek \
		wbinimg src:ipl10.bin len:512 from:0 to:0 \
		copy from:haribote.sys to:@: \
		imgout:haribote.img

# ��ʋK��

%.gas : %.c bootpack.h Makefile
	$(CC1) -o $*.gas $*.c

%.nas : %.gas Makefile
	$(GAS2NASK) $*.gas $*.nas

%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

# �R�}���h

img :
	$(MAKE) haribote.img

run :
	$(MAKE) img
	$(COPY) haribote.img $(TOOLPATH)/qemu/
	$(MAKE) -C $(TOOLPATH)/qemu IMG=haribote.img

install :
	$(MAKE) img
	$(IMGTOL) w a: haribote.img

clean :
	-$(DEL) *.bin
	-$(DEL) *.lst
	-$(DEL) *.obj
	-$(DEL) bootpack.map
	-$(DEL) bootpack.bim
	-$(DEL) bootpack.hrb
	-$(DEL) haribote.sys

src_only :
	$(MAKE) clean
	-$(DEL) haribote.img
