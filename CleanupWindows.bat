@echo off
echo Starting Windows cleanup...
echo.

:: Remove temporary files
echo Removing temporary and junk files...
del /f /s /q %temp%\*.*
del /f /s /q %prefetch%\*.*
del /f /s /q %recentplaces%\*.*
echo.

:: Efficient Junk Removal 
echo clear the Browser Cache and Old Log Files:
del /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*"
del /s /q "C:\Windows\Logs\*.*"
echo 

:: Registry Cleanup:
echo 
reg check "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
echo

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

:: RAM Optimization:
echo
net stop Superfetch
net start Superfetch
echo

:: Clear up your RAM Cache
echo Cleaning up RAM Cache...
ipconfig /FlushDNS
echo.
:: Privacy Protection
echo Clear browser history (for Google Chrome)..
del /s /q "%LocalAppData%\Google\Chrome\User Data\Default\History"
Remove cookies (for Internet Explorer):
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
echo
:: Defragment hard drive
echo Defragmenting hard drive...
defrag C: /U /V
echo.

echo Windows cleanup complete!
pause
