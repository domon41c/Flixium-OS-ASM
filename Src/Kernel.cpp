#include "Text.cpp"
#include "IDT.cpp"

extern "C" void _start() {
    SetCursorPosition(PositionFromCoords(0, 0));
    InitializeIDT();
    return;
}