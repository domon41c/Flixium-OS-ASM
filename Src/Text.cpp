#pragma once
#include "IO.cpp"
#include "Typedefs.cpp"
#define VGA_MEMORY (unsigned char*)0xb8000
#define VGA_WIDTH 80

uint_16 CursorPosition;

void SetCursorPosition(uint_16 position){
    outb(0x3D4, 0x0F);
    outb(0x3D5, (uint_8)(position & 0xFF));
    outb(0x3D4, 0x0E);
    outb(0x3D5, (uint_8)((position >> 8) & 0xFF));

    CursorPosition = position;
}

unsigned short PositionFromCoords(uint_8 x, uint_8 y){
    return y * VGA_WIDTH + x;
}