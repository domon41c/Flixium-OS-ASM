nasm boot.asm -f bin -o boot.bin

nasm partition.asm -f bin -o partition.bin

cp /b boot.bin+partition.bin boot.flp

pause
