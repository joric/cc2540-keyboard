cc2540kbd
=========

[![World's smallest keyboard](http://img.youtube.com/vi/zbrPOiaEOTg/0.jpg)](https://www.youtube.com/watch?v=zbrPOiaEOTg)

Hardware
========

* $3.10 CC2540 module (RF-BM-S02) from Aliexpress (11.2 x 15.1 x 1.74 mm, onboard USB support): https://www.aliexpress.com/item/MK00283-Bluetooth-4-BLE-from-the-module-serial-communication-direct-drive-mode-RF-BM-S02-CC2540/32658399946.html
* $0.92 Panasonic CR1216 lithium 3v battery (12.5 × 1.6 mm), 34 mAh
* $3.50 Cherry MX Blue keychain (20 x 11 mm) from http://www.geekkeys.com/keychain (got it for free)
* $1.93 Arduino Nano (to program the chip) https://www.aliexpress.com/item/Freeshipping-Nano-3-0-controller-compatible-for-arduino-nano-CH340-USB-driver-NO-CABLE/32341832857.html

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

CC2540 buttons and LEDs for KeyFOB and Dongle devices:

* HAL_KEY_SW_2 is P0_1 on the KeyFOB (P1_3 on the Dongle)
* HAL_LED_2 is P1_1 both on the KeyFOB and the Dongle


Build
=====
Copy provided files to the corresponding SDK folders:

* hidemukbd.c to BLE-CC254x-1.4.0\Projects\ble\HIDEmuKbd
* hidapp.c to BLE-CC254x-1.4.0\Projects\ble\HIDEmuKbdProjects\ble\HIDAdvRemoteDongle

Run IAR, open .eww, hit Make. You may also try precompiled firmware from the repository.


USB mode
========

CC2540 supports hardware USB as well, and can be used as USB-HID, USB Serial Device or USB Mass Storage Device.

To run USB firmware and to detect USB on this module, U+ needs to be pulled to +3.3v via 1.5k resistor.

See HIDAdvRemoteDongle sample for the USB peripheral device.

See HostTestApp sample from the CC2540 SDK for the USB Mass Storage device.


