SRC:=pmtest2.asm
IMG:=a.img
BIN:=$(subst .asm,.com,$(SRC))

.PHONY : all clean

$(BIN) : $(SRC)
	@nasm $< -o $@
	@echo [nasm] $<

all: $(BIN)
ifeq ($(wildcard a.img),)
	@echo '1\nfd\n\n' | bximage
endif
# note: a.img need to be formated before the mount
# and that could be done in freedos
	@sudo mount -o loop $(IMG) /mnt/floppy
	@sudo cp $(BIN) /mnt/floppy -v
	@sudo umount /mnt/floppy

clean:
	-@rm $(BIN) $(IMG) bochsout.txt
