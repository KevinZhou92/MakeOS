TOOLPATH = ../../tolsetOSX/z_tools
MAKE     = make -r
NASK     = $(TOOLPATH)/nask
EDIMG    = $(TOOLPATH)/edimg
IMGTOL   = $(TOOLPATH)/imgtol
COPY     = cp
DEL      = rm 

# �f�t�H���g����

default :
	$(MAKE) img

# �t�@�C�������K��

ipl.bin : ipl.nas Makefile
	$(NASK) ipl.nas ipl.bin ipl.lst

haribote.sys : haribote.nas Makefile
	$(NASK) haribote.nas haribote.sys haribote.lst

haribote.img : ipl.bin haribote.sys Makefile
	$(EDIMG)   imgin:$(TOOLPATH)/fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0 \
		copy from:haribote.sys to:@: \
		imgout:haribote.img

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
	-$(DEL) ipl.bin
	-$(DEL) ipl.lst
	-$(DEL) haribote.sys
	-$(DEL) haribote.lst
	-$(DEL) haribote.img
	-$(DEL) *.bat 

src_only :
	$(MAKE) clean
	-$(DEL) haribote.img