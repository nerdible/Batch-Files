:: Folder Backup - 2/8/2017
:: github.com\nerdible

:: Set window title, echo off, and start
@echo off
title Folder Backup

:: Set up some variables to reuse
set banner=========================== Folder Backup ============================
set endbar======================================================================

for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "BS=%%A"

:: Start displaying data
goto start

:start
cls
echo.
echo   %banner%
echo.
echo                 **** ESTIMATED TIME: 30-40 minutes ****
echo.
echo   - Backs up a folder to a network archive
echo.
echo   - Only copies files/directories that include:
echo     .htm .html .doc .docx .jpg .jpeg
echo.
echo   %endbar%
echo.
SET /P ANSWER=- Begin backup? (Y/N)? 
if /i {%ANSWER%}=={Y} (goto :startcopy) 
if /i {%ANSWER%}=={y} (goto :startcopy) 
if /i {%ANSWER%}=={Yes} (goto :startcopy) 
if /i {%ANSWER%}=={yes} (goto :startcopy) 

:no
echo.
echo   Aborting...
goto end

:startcopy

set SOURCE=\\network\location\folder\
set BACKUP=\\network\location\backup\

:: Wave 1 - HTML Files
xcopy "%SOURCE%*.htm*" "%BACKUP%" /m /s /c /y /r /j

:: Wave 2 - Word Files
xcopy "%SOURCE%*.doc*" "%BACKUP%" /m /s /c /y /r /j

:: Wave 3 - JPG Files
xcopy "%SOURCE%*.jp*g" "%BACKUP%" /m /s /c /y /r /j


pause
