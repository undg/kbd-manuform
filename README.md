# Instruction notes

## 1. Layout editor
https://config.qmk.fm/#/handwired/dactyl_manuform/5x7/LAYOUT_5x7

Save it to root directory as `./handwired_dactyl_manuform_5x7_layout_5x7_mine (n).json` where `n` is an version of layout. Keep it for history and to load it back to layout editor.

Override `./b.json` with current layout that was imported from [layout editor](https://config.qmk.fm/#/handwired/dactyl_manuform/5x7/LAYOUT_5x7)

## 2. Get qmk/qmk_firmware repo (not this one)
Clone [github.com/qmk/qmk_firmware](https://github.com/qmk/qmk_firmware) to your home directory (IMPORTANT `~/qmk_firmware`)

Apply this patch:

```diff
commit eb6584e570ea71da6fef13f4cb2da8d215d2a16d
Author: undg <und3rdg@gmail.com>
Date:   Thu Mar 6 18:12:37 2025 +0000

    save old changes before pull master
    
    (cherry picked from commit 98dff973941c7b76d59f6855493deaf0c5cb34bd)

diff --git a/keyboards/halfcliff/matrix.c b/keyboards/halfcliff/matrix.c
index 790f8c41bb..8ec365fbd5 100644
--- a/keyboards/halfcliff/matrix.c
+++ b/keyboards/halfcliff/matrix.c
@@ -21,7 +21,7 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #include "debounce.h"
 #include "wait.h"
 
-#define ERROR_DISCONNECT_COUNT 5
+#define ERROR_DISCONNECT_COUNT 15
 
 #define ROWS_PER_HAND (MATRIX_ROWS / 2)
 
diff --git a/keyboards/handwired/dactyl_manuform/4x6_5/keymaps/default/config.h b/keyboards/handwired/dactyl_manuform/4x6_5/keymaps/default/config.h
index 38dfa5cb39..b4683eea16 100644
--- a/keyboards/handwired/dactyl_manuform/4x6_5/keymaps/default/config.h
+++ b/keyboards/handwired/dactyl_manuform/4x6_5/keymaps/default/config.h
@@ -21,4 +21,9 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #pragma once
 
 
+#define USE_SERIAL
+
+//#define MASTER_LEFT
+//#define MASTER_RIGHT
 #define EE_HANDS
+// Rows are doubled-up
diff --git a/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/config.h b/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/config.h
new file mode 100644
index 0000000000..9db14e9f81
--- /dev/null
+++ b/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/config.h
@@ -0,0 +1,10 @@
+#define USE_SERIAL
+//#pragma once
+
+//#define MASTER_RIGHT
+
+
+//#define SPLIT_USB_DETECT
+//#define SPLIT_USB_TIMEOUT 2000
+
+#define EE_HANDS
diff --git a/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/keymap.c b/keyboards/handwired/dactyl_manuform/5x7/keymaps/undg/keymap.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/keyboards/handwired/dactyl_manuform/config.h b/keyboards/handwired/dactyl_manuform/config.h
index a3b5aabcf1..8a9858b7d7 100644
--- a/keyboards/handwired/dactyl_manuform/config.h
+++ b/keyboards/handwired/dactyl_manuform/config.h
@@ -26,5 +26,17 @@ along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #define MOUSEKEY_MAX_SPEED   7
 #define MOUSEKEY_WHEEL_DELAY 0
 
+/* Set 0 if debouncing isn't needed */
+#define DEBOUNCE 5
+
+/* serial.c configuration for split keyboard */
+#define SOFT_SERIAL_PIN D2
+
+/* Mechanical locking support. Use KC_LCAP, KC_LNUM or KC_LSCR instead in keymap */
+#define LOCKING_SUPPORT_ENABLE
+/* Locking resynchronize hack */
+#define LOCKING_RESYNC_ENABLE
+
+
 /* Enables This makes it easier for fast typists to use dual-function keys */
 #define PERMISSIVE_HOLD
```

## 3. Install qmk from distro repo:

```bash
sudo pacman -Suy qmk --no-confirm
```

## 4. Flashing

Use `flash.sh`, `./flash-left.sh` or `./flash-right.sh` scripts to flash the qmk_firmware. For old keyboards you need to flash only left shell.

This will move files between repositories (this one and `~/qmk_firmware`), and wait for you to enter the bootloader mode. To enter bootloader mode, press reset button, or short with tweezers `gnd` and `reset` pin.


## 4. Troubleshooting

You can reflash only left side, however if firmware on both shells are compiled from different version of `qmk/qmk_firmware` you may want to flash both sides.


