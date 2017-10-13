@echo off

set ble=%~dp0\..\BLE-CC254x-1.4.0\Projects\ble

::Bluetooth Keyboard
::set p=%ble%\HIDEmuKbd\CC2540DB\CC2540DK-MINI Keyfob Slave\Exe\HidEmuKbd.hex

::USB Keyboard
::set p=%ble%\HIDAdvRemoteDongle\CC2540\CC2540USB AdvRemoteDongle\Exe\HIDAdvRemoteDongle.hex

::Serial Device
::set p=%ble%\HostTestApp\CC2540\hex\HostTestReleaseCC2540Usb.hex

::Mass Storage Device
::set p=%ble%\util\UBL\soc_8051\usb_msd\iar\CC2540-DK\Exe\ubl_usb_msd_8051-DK.hex
set p=%ble%\util\UBL\soc_8051\usb_msd\iar\CC2540-Nano\Exe\ubl_usb_msd_8051-Nano.hex

cd /d %~dp0

for %%A in ("%p%") do (
    set f=%%~dpA
    set n=%%~nA
)

echo Copying "%f%%n%.hex"

mkdir temp
copy "%f%%n%.hex" temp\%n%.hex
hex2bin.exe temp\%n%.hex
CCLoader.exe 6 temp\%n%.bin 0

