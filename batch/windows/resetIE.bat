:: Reset Internet Explorer v1.2
:: github.com\nerdible

:: Set window title, echo off, setlocal for color, and start
@echo off

:: Set up some variables to reuse
set findlocal=%0%
set banner====================== Reset Internet Explorer =======================
set title Reset Internet Explorer
title %title%

:: Start displaying data

goto start

:start
cls
echo.
echo   %banner%
echo.
echo   THIS WILL TERMINATE INTERNET EXPLORER AND RESET THE CACHE!
echo. 
echo   There will be instructions on screen YOU MUST FOLLOW.
echo.
SET /P ANSWER=- Do you want to continue (Y/N)? 
if /i {%ANSWER%}=={Y} (goto :killprograms) 
if /i {%ANSWER%}=={y} (goto :killprograms) 
if /i {%ANSWER%}=={Yes} (goto :killprograms) 
if /i {%ANSWER%}=={yes} (goto :killprograms) 

:no
echo.
echo   Aborting... 
goto :aborted

:killprograms
echo.
echo   =====================================================================
echo.
echo   Closing Internet Explorer...
taskkill /im "iexplore.exe" /f >nul 2>&1

:resetie
echo.
echo   =====================================================================
echo.
echo   There will be a dialog box on-screen...
echo.
echo   - Check "Delete Personal Settings"
echo   - Click "Reset"
echo.
echo   There will be a processing screen...
echo.
echo   - Close the window to continue

RunDll32.exe InetCpl.cpl,ResetIEtoDefaults

:misc
echo.
echo   =====================================================================
echo.
:: echo   Re-enabling proxy....
:: reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f >nul 2>&1
:: echo.
echo   Re-enabling favorites bar....
reg add "HKCU\Software\Microsoft\Internet Explorer\MINIE" /v LinksBandEnabled /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo   Re-enabling Skype Addons....
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Ext\Settings\{31D09BA0-12F5-4CCE-BE8A-2923E76605DA}" /v Flags /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   Re-enabling 'Send to OneNote' Addon....
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Ext\Settings\{2670000A-7350-4F3C-8081-5663EE0C6C49}" /v Flags /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   Re-enabling 'OneNote Linked Notes' Addon....
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Ext\Settings\{789FE86F-6FC4-46A1-9849-EDE0DB0C95CA}" /v Flags /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   Re-enabling Office Cache Handler Addon....
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Ext\Settings\{B4F3A835-0E21-4959-BA22-42B3008E02FF}" /v Flags /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo   Setting homepage...
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /d "http://www.google.com" /f >nul 2>&1
echo.
echo   Deleting temporary internet files...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo.
echo   Deleting cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
echo.
echo   Deleting history...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
goto :success

:success
echo.
echo   =====================================================================
echo.
echo   Reset complete! 
echo   You may close this window and restart Internet Explorer.
echo.
pause
goto :end

:aborted
echo.
echo   =====================================================================
echo.
echo   Reset aborted! 
echo   You may close this window.
echo.
pause
goto :end

:end
echo.%findlocal%|findstr /C:"ntserver01" >nul 2>&1
if errorlevel 1 (goto :self-destruct) ELSE (exit)

:self-destruct
(goto) 2>nul & del "%~f0"
