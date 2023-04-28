nasm boot.asm -f bin -o boot.bin

nasm partition.asm -f elf64 -o partition.o

wsl $WSLENV/x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"

wsl $WSLENV/x86_64-elf-ld -o kernel.tmp -Ttext 0x7e00 partition.o Kernel.o

objcopy -O binary kernel.tmp kernel.bin

copy /b boot.bin+kernel.bin boot.flp

pause