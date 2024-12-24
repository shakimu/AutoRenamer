@echo off
setlocal enabledelayedexpansion

set "folder=C:\Users\[UserName]\Documents\Paradox Interactive\Europa Universalis IV\save games"
set "file=autosave.eu4"
set "lastModified="

:loop
for %%F in ("%folder%\%file%") do (
    set "currentModified=%%~tF"
    if not "!currentModified!"=="!lastModified!" (
        set "lastModified=!currentModified!"

        rem 現在の日時を yyyyMMdd_HHmmss 形式で取得
        for /f "tokens=1-3 delims=/ " %%a in ("%date%") do set "today=%%a%%b%%c"
        for /f "tokens=1-3 delims=:." %%a in ("%time%") do set "now=%%a%%b%%c"

        set "timestamp=!today!_!now!"

        rem リネーム処理
        ren "%folder%\%file%" "autosave_!timestamp!.eu4"
        echo File renamed to autosave_!timestamp!.eu4
    )
)
timeout /t 60 >nul
goto :loop
