#include <X11/extensions/XTest.h>
#include <X11/keysym.h>
#include <stdio.h>
#include <stdlib.h>

void capslock_off() {
  Display *display = XOpenDisplay(NULL);
  XKeyboardState keyboardState;
  XGetKeyboardControl(display, &keyboardState);

  int isCapsLockOn = keyboardState.led_mask & 1;
  if (isCapsLockOn) {
    unsigned int keycode = XKeysymToKeycode(display, XK_Caps_Lock);
    XTestFakeKeyEvent(display, keycode, True, 0);
    XTestFakeKeyEvent(display, keycode, False, 0);
    XFlush(display);
  }
  XCloseDisplay(display);
}

int main() {
  capslock_off();
  return 0;
}
