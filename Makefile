FASM=fasm

all: clean img kernel

img:
	@echo "Building minOS disk image..."
	@$(FASM) src/k_main/k_main.ASM k_main.BIN
	@$(FASM) src/boot.ASM boot.img
	@mv boot.img imgs/minOS.img
	@echo "Built imgs/minOS.img"

kernel:
	@echo "Building minOS multiboot kernel..."
	@$(FASM) src/mboot.ASM mboot.BIN
	@$(FASM) src/k_main/k_main.ASM k_main.BIN
	@$(FASM) src/build_m.ASM build_m.BIN
	@mv build_m.BIN grub/minOS
	@echo "Built grub/minOS"

clean:
	rm -rf imgs/*
	rm -rf grub/*
