:: ============================================================================
:: Virtual SD card main script
:: ============================================================================
@echo off
cls

cd /d %~dp0

::set MIN_EXEC_TIME=3

call settings.bat

IF EXIST %SD_CARD_PATH% DEL %SD_CARD_PATH% /s

call MakeSD.bat

set PURGE_COMMAND=
if %PURGE%==1 (
    set PURGE_COMMAND=/PURGE
)

call mount.bat || goto error

ROBOCOPY "%BUILD_DIR:\=\\%Project+" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+." ^
    /E ^
    /NS ^
    /NP ^
    /NJH ^
    %PURGE_COMMAND%
IF %ERRORLEVEL% GEQ 8 goto error

call nonsecureSendKeys.bat "progfortr" "{Enter}"
"%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\GCTRealMate.exe" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\RSBE01.txt"
call nonsecureSendKeys.bat "progfortr" "{Enter}"
"%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\GCTRealMate.exe" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\BOOST.txt"
call nonsecureSendKeys.bat "progfortr" "{Enter}"
"%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\GCTRealMate.exe" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\NETPLAY.txt"
call nonsecureSendKeys.bat "progfortr" "{Enter}"
"%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\GCTRealMate.exe" "%SD_CARD_MOUNT_DRIVE_LETTER:\=\\%:\\Project+\NETBOOST.txt"
call nonsecureSendKeys.bat "progfortr" "{Enter}"

::timeout /t %MIN_EXEC_TIME% /nobreak > NUL

call unmount.bat || goto error

goto :eof

:error
color 0c
pause > NUL 2> NUL
color
goto :eof