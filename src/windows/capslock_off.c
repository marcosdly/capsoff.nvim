#include <Windows.h>
#include <winuser.h>

void capslock_off() {
  int isCapsLockOn = GetKeyState(VK_CAPITAL) & 1;
  if(isCapsLockOn) {
    keybd_event(VK_CAPITAL, 0x45, KEYEVENTF_EXTENDEDKEY | 0, 0);
    keybd_event(VK_CAPITAL, 0x45, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
  }
}

int main() {
  capslock_off();
  return 0;
}
