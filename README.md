cc2540kbd
=========

[![World's smallest keyboard](http://img.youtube.com/vi/zbrPOiaEOTg/0.jpg)](https://www.youtube.com/watch?v=zbrPOiaEOTg)

This keyboard uses modified HIDEmuKbd sample from the CC2540 SDK.

Download precompiled firmware from the repository (HIDEmuKbd.hex), use [CCLoader](https://github.com/RedBearLab/CCLoader) and Arduino Nano to flash it.

Button sends WinKey keycode, you may modify the code to send any key or a key sequence of your choice.

The button is attached to CC2540 pins P0_1 and GND.

Hardware
========

* $2.65 CC2540 module (RF-BM-S02) from Aliexpress (11.2 x 15.1 x 1.74 mm, onboard USB support): https://www.aliexpress.com/item/MK00283-Bluetooth-4-BLE-from-the-module-serial-communication-direct-drive-mode-RF-BM-S02-CC2540/32658399946.html
* $1.83 Arduino Nano (to program the chip) https://www.aliexpress.com/item/Freeshipping-Nano-3-0-controller-compatible-for-arduino-nano-CH340-USB-driver-NO-CABLE/32341832857.html
* $0.92 Panasonic CR1216 lithium 3v battery (12.5 × 1.6 mm), 34 mAh
* $0.00 Cherry MX Blue keychain (20 x 11 mm) from http://www.geekkeys.com/keychain (actually $3.50 but I got it for free)

Software
========

* IAR Embedded Workbench for 8051 8.30.2: http://iar.com
* BLE-stack 1.4.0: http://www.ti.com/tool/BLE-STACK-ARCHIVE
* CCLoader: https://github.com/RedBearLab/CCLoader
* Hex to bin converter: http://hex2bin.sourceforge.net


Build
=====
Copy provided files to the corresponding BLE-CC254x-1.4.0 SDK folders.

Run IAR, open .eww, hit Make. You may also try precompiled firmware from the repository.

Compilation Errors
------------------

* Error[e16]: Segment ISTACK (size: 0xc0 align: 0) is too long for segment definition. At least 0xe more bytes needed. The problem occurred while processing the segment

Just set number of virtual registers to 8 (in Project - Options - General Options).


USB mode
========

CC2540 supports hardware USB (CC2541 doesn't), and can be used as USB-HID, USB Serial or USB Mass Storage Device.

* HIDAdvRemoteDongle sample for the USB HID device.

* HostTestApp sample for the BTool-compatible serial device.

* util/UBL sample for the USB Mass Storage device

**To run USB firmware and to detect USB on this module, U+ needs to be pulled to +3.3v via 1.5k resistor.**

Sadly, USB Mass Storage doesn't work (yet) on this RF-BM-S02 module. It sometimes shows removable drive and even shows DEFAULT.CFG file but never opens it.
Not sure if it is software or hardware problem (looks like it opens slightly faster on a low speed USB 2.0).
Maybe it's somehow related to the fact that [the UBL is only support with the CC2540F256 and not with the CC2540F128](https://e2e.ti.com/support/wireless_connectivity/bluetooth_low_energy/f/538/t/181578),
but RF-BM-S02 appears to be CC254XF256 according to the pics. Probably software problem, because USB HID works just fine.

Pinout
======

CC2540 pinout for CCLoader (Arduino Nano):

| Signal      | CC254x | CCLoader | Color  |
|:------------|:------:|:--------:|:------:|
| DEBUG_CLOCK | P2_1   | D6       | Yellow |
| DEBUG_DATA  | P2_2   | D5       | Orange |
| RESET       | RES    | D4       | Blue   |

CC2540 buttons and LEDs for Keyfob and Dongle development kits (defined in hal_board_cfg.h):

|Define      |Keyfob|Dongle|
|:-----------|:----:|:----:|
|HAL_KEY_SW_1| P0_0 | P1_2 |
|HAL_KEY_SW_2| P0_1 | P1_3 |
|HAL_LED_1   | P1_0 | P0_0 |
|HAL_LED_2   | P1_1 | P1_1 |

(P0_0 pin is not available on RF-BM-S02)


Pictures
========

(See full album here: https://imgur.com/a/OkwEb)

![RF-BM-S02](https://i.imgur.com/Ch9nKii.jpg)

![RF-BM-S02 Pinout](https://i.imgur.com/NLrpZvw.png)

![CC2540 Keyfob](https://i.imgur.com/HDq4U84.png)

![CC2540 Keyfob Pinout](https://i.imgur.com/SVT2FJk.png)

![CC2540 USB Dongle](https://i.imgur.com/7rDH41f.jpg)

![CC2540 USB Dongle Pinout](https://i.imgur.com/Eji2RxW.png)


Press
=====

* https://hackaday.com/2017/05/20/the-tiniest-mechanical-keyboard-ever/

