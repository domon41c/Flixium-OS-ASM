#include "Text.cpp"

extern const char Test[];
extern const char Test2[];

extern "C" void _start() {
    SetCursorPosition(PositionFromCoords(0, 0));
    PrintString(Test2);
    return;
}