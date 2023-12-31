#ASM=

all:
	@nasm boot.asm -o boot.bin
	@dd if=boot.bin of=devfd0 bs=512 count=1
	@echo '1\nfd\n\n' | bximage
	@dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc

clean:
	-@rm boot.bin devfd0 a.img bochsout.txt
