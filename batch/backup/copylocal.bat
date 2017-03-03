:: Copy Local Backup - 2/8/2017
:: github.com\nerdible

:: Set window title, echo off, and start
@echo off
title Copy Local Backup

:: Set up some variables to reuse
set banner========================== Copy Local Backup =========================
set endbar======================================================================

for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "BS=%%A"

:: Start displaying data
goto start

:start
cls
echo.
echo   %banner%
echo.
echo                   **** ESTIMATED TIME: ~10 minutes ****
echo.
echo   - Copies the folder backup to the desktop
echo.
echo   %endbar%
echo.
SET /P ANSWER=- Begin copying backup? (Y/N)? 
if /i {%ANSWER%}=={Y} (goto :startcopy) 
if /i {%ANSWER%}=={y} (goto :startcopy) 
if /i {%ANSWER%}=={Yes} (goto :startcopy) 
if /i {%ANSWER%}=={yes} (goto :startcopy) 

:no
echo.
echo   Aborting...
goto end

:startcopy

md "%USERPROFILE%\Desktop\DocsBackup"

set SOURCE=\\network\location\backup\
set BACKUP=%USERPROFILE%\Desktop\DocsBackup

:: Copy Backup to Desktop
xcopy "%SOURCE%*" "%BACKUP%" /s /c /y /r /j /z /i

pause
