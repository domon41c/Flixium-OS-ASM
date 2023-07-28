nasm boot.asm -f bin -o boot.bin

nasm partition.asm -f elf64 -o partition.o

nasm bin.asm -f elf64 -o bin.o

wsl $WSLENV/x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"

wsl $WSLENV/x86_64-elf-ld -T"link.ld"

copy /b boot.bin+kernel.bin boot.flp

pause