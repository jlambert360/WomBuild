@echo off
MODE 30,2
Title Quick 2GB SD

:confirm
color 5d
echo.
echo  Creating a 2GB SD card. . .
"%~dp0mksdcard.exe" 2048M "sd.raw"
move "sd.raw" "D:\a\WomBuild\WomBuild\Dolphin\User\Wii\"
color 3b
echo.
echo  Created.

exit