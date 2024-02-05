@echo off
echo Starting Windows cleanup...
echo.

:: Remove temporary files
echo Removing temporary and junk files...
del /f /s /q %temp%\*.*
del /f /s /q %systemroot%\Temp\*.*
del /f /s /q %systemroot%\Prefetch\*.*
del /f /s /q %systemroot%\Recent Place\*.*

echo.

:: Clear Recycle Bin
echo Clearing Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin
echo.

:: Delete old backups
echo Deleting old backups...
forfiles /p "C:\backup" /s /m *.* /D -7 /C "cmd /c del /q @path"
echo.

:: Clean up system files
echo Cleaning up system files...
cleanmgr /sageset:1
cleanmgr /sagerun:1
echo.
:: Clear up your RAM Cache
echo Cleaning up RAM Cache...
ipconfig /FlushDNS
echo.
:: Defragment hard drive
echo Defragmenting hard drive...
defrag C: /U /V
echo.

echo Windows cleanup complete!
pause
