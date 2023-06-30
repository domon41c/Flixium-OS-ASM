#include "Text.cpp"

extern "C" void _start() {
    SetCursorPosition(PositionFromCoords(0, 0));
    PrintString("hello world\n\rBebraaaaaa\n\r");
    PrintString(HexToString(0x1234abcd));
    return;
}