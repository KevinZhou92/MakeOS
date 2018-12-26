
# デフォルト動作

default :
	make img

# ファイル生成規則

ipl.bin : ipl.nas Makefile
	../../tolsetOSX/z_tools/nask ipl.nas ipl.bin ipl.lst

helloos.img : ipl.bin Makefile
	../../tolsetOSX/z_tools/edimg   imgin:../../tolsetOSX/z_tools/fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0   imgout:helloos.img

# コマンド

asm :
	make -r ipl.bin

img :
	make -r helloos.img

run :
	make img
	copy helloos.img ../../tolsetOSX/z_tools/qemu/fdimage0.bin
	make -C ../../tolsetOSX/z_toolss/qemu

install :
	make img
	../../tolsetOSX/z_tools/imgtol.com w a: helloos.img

clean :
	-del ipl.bin
	-del ipl.lst

src_only :
	make clean
	-del helloos.img
