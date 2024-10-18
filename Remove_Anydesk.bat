@echo off
setlocal


echo Attempting to uninstall AnyDesk...
wmic product where "name like 'AnyDesk%%'" call uninstall /nointeractive >nul 2>&1


echo Deleting residual files and folders...

rd /s /q "C:\Program Files\AnyDesk" 2>nul
rd /s /q "C:\Program Files (x86)\AnyDesk" 2>nul
rd /s /q "%appdata%\AnyDesk" 2>nul
rd /s /q "%localappdata%\AnyDesk" 2>nul
rd /s /q "%programdata%\AnyDesk" 2>nul


echo Removing registry entries...

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\AnyDesk" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\SOFTWARE\AnyDesk" /f >nul 2>&1
reg delete "HKEY_USERS\.DEFAULT\Software\AnyDesk" /f >nul 2>&1


echo AnyDesk removal completed.
pause
endlocal