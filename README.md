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


Pinout
======

CC2540 pinout for CCLoader (Arduino Nano):

* P2_1 - DEBUG_CLOCK - D6
* P2_2 - DEBUG_DATA - D5
* RES - RESET - D4

CC2540 buttons and LEDs for KeyFob and Dongle development kits:

* HAL_KEY_SW_2 is P0_1 on the KeyFob (P1_3 on the Dongle)
* HAL_LED_2 is P1_1 both on the KeyFob and the Dongle


Build
=====
Copy provided files to the corresponding SDK folders:

* hidemukbd.c to BLE-CC254x-1.4.0\Projects\ble\HIDEmuKbd
* hidapp.c to BLE-CC254x-1.4.0\Projects\ble\HIDEmuKbdProjects\ble\HIDAdvRemoteDongle

Run IAR, open .eww, hit Make. You may also try precompiled firmware from the repository.


USB mode
========

CC2540 supports hardware USB (CC2541 doesn't), and can be used as USB-HID, USB Serial or USB Mass Storage Device.

**To run USB firmware and to detect USB on this module, U+ needs to be pulled to +3.3v via 1.5k resistor.**

See HIDAdvRemoteDongle sample for the USB peripheral device.

See HostTestApp sample from the CC2540 SDK for the USB Mass Storage device.


