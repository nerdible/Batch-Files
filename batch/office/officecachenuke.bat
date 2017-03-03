:: Office Cache Nuke v1.4
:: github.com/nerdible

:: Set window title, echo off, and start
@echo off
title Office Cache Nuke

:: Set up some variables to reuse
set banner========================== Office Cache Nuke ==========================
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "BS=%%A"

:: Start displaying data
goto start

:start
cls
echo.
echo   %banner%
echo.
echo                      **** DO NOT RUN AS ADMIN ****
echo.
echo   WARNING! PROGRAMS WILL TERMINATE!
echo.
echo   Including Skype, IE, and all of Office...
echo.
echo   ======================================================================
echo.
SET /P ANSWER=- Continue? (Y/N)? 
if /i {%ANSWER%}=={Y} (goto :killprograms) 
if /i {%ANSWER%}=={y} (goto :killprograms) 
if /i {%ANSWER%}=={Yes} (goto :killprograms) 
if /i {%ANSWER%}=={yes} (goto :killprograms) 

:no
echo.
echo   Aborting...
goto end

:killprograms
echo.
echo   Closing Programs...
taskkill /im "outlook.exe" /f >nul 2>&1
taskkill /im "word.exe" /f >nul 2>&1
taskkill /im "excel.exe" /f >nul 2>&1
taskkill /im "infopath.exe" /f >nul 2>&1
taskkill /im "groove.exe" /f >nul 2>&1
taskkill /im "onedrive.exe" /f >nul 2>&1
taskkill /im "onenotem.exe" /f >nul 2>&1
taskkill /im "onenote.exe" /f >nul 2>&1
taskkill /im "msouc.exe" /f >nul 2>&1
taskkill /im "msosync.exe" /f >nul 2>&1
taskkill /im "csisyn~1.exe" /f >nul 2>&1
taskkill /im "ucmapi.exe" /f >nul 2>&1
taskkill /im "iexplore.exe" /f >nul 2>&1
taskkill /im "chrome.exe" /f >nul 2>&1
taskkill /im "lync.exe" /f >nul 2>&1
taskkill /im "communicator.exe" /f >nul 2>&1
taskkill /im "spdesign.exe" /f >nul 2>&1
echo.
goto deleteexceptions

:deleteexceptions
echo   Deleting Word and Excel caches...
powershell -executionpolicy RemoteSigned -file "\\network\location\exceptions.ps1"
title Office Cache Nuke
echo.
goto delete

:delete
echo   Deleting Local Temp...
del /f /s /q  "%userprofile%\AppData\Local\Temp\*.*" >nul 2>&1
echo.
echo   Deleting Office Temp Files...
del /F /Q "%userprofile%\AppData\Roaming\Microsoft\Office\*.tmp" >nul 2>&1
echo.
echo   Deleting Office TeleData Files...
del /F /Q "%userprofile%\AppData\Local\Microsoft\Office\*TeleData*.*" >nul 2>&1
echo.
echo   Deleting Temporary Internet Files...
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*" >nul 2>&1
echo.
echo   Deleting Temporary IE Files...
del /F /S /Q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\*.*" >nul 2>&1
echo.
echo   Deleting Temporary Outlook Files...
del /F /S /Q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Outlook\*.*" >nul 2>&1
echo.
echo   Deleting Temporary Word Files...
del /F /S /Q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.Word\*.*" >nul 2>&1
echo.
echo   Deleting Outlook cache...
del /f /s /q  "%userprofile%\AppData\Local\Microsoft\Outlook\RoamCache\*.*" >nul 2>&1
echo.
echo   Deleting Powerpoint cache...
del /F /S /Q "%userprofile%\Appdata\Roaming\Microsoft\Excel\*.*" >nul 2>&1
echo.
echo   Deleting SharePoint Workspace (SPW) Cache...
del /f /s /q  "%userprofile%\AppData\Local\Microsoft\Office\Spw\*.*" >nul 2>&1
echo.
echo   Deleting SharePoint Designer Profile Cache...
del /f /s /q  "%userprofile%\AppData\Local\Microsoft\websitecache\*.*" >nul 2>&1
echo.
echo   Deleting SharePoint Designer Appdata Cache...
del /f /s /q  "%appdata%\Microsoft\Web Server Extensions\Cache\*.*" >nul 2>&1
echo.
if exist "%userprofile%\AppData\Local\Microsoft\Infopath" (
		echo   Deleting Infopath cache... 
		rd /S /Q "%userprofile%\AppData\Local\Microsoft\Infopath"
	) else (
		echo   No Infopath cache detected. Skipping...
	)
echo.
if exist "%userprofile%\AppData\Local\Microsoft\Office\14.0\OfficeFileCache" (
		echo   Deleting Office 2010 Upload Center cache... 
		rd /S /Q "%userprofile%\AppData\Local\Microsoft\Office\14.0\OfficeFileCache"
	) else (
		echo   No Office 2010 Upload Center cache detected. Skipping...
	)
echo.	
if exist "%userprofile%\AppData\Local\Microsoft\Office\15.0\OfficeFileCache" (
		echo   Deleting Office 2013 Upload Center cache... 
		rd /S /Q "%userprofile%\AppData\Local\Microsoft\Office\15.0\OfficeFileCache"
	) else (
		echo   No Office 2013 Upload Center cache detected. Skipping...
	)
echo.
if exist "%userprofile%\AppData\Local\Microsoft\Office\16.0\OfficeFileCache" (
		echo   Deleting Office 2016 Upload Center cache
		rd /S /Q "%userprofile%\AppData\Local\Microsoft\Office\16.0\OfficeFileCache"
	) else (
		echo   No Office 2016 Upload Center cache detected. Skipping...
	)
echo.	
echo   ======================================================================
echo.        
echo                                    ____
echo                            __,-~~/~    `---.
echo                          _/_,---(      ,    )
echo                      __ /        (    /   )  \___
echo        - ------- -;;;'-------------------------;;;-------- -  -
echo                         \/  ~"~"~"~"~"~\~"~)~"/
echo                         (_ (   \  (     )    \)
echo                          \_( _ (         )_)'
echo                             ~ `-i' ::):--"
echo                                 I;:.:.:
echo                                  I: :I
echo                                   I:I
echo                                   I:I
echo                                (:i:::i:`.
echo                               (` ^'"`-' ")
echo.
echo                       Office cache has been nuked!
echo.
echo.
goto end



:: Set end and pause
:end
pause
exit
