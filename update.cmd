@echo off
setlocal enabledelayedexpansion

for /f %%a in ('chdir') do set CurrDirPath=%%a
for %%I in (.) do set CurrDirName=%%~nxI

del /F /S /Q "%CurrDirPath%\release\*"
mkdir release
mkdir "release\%CurrDirName%"

xcopy "%CurrDirPath%\content.xml" "%CurrDirPath%\release\%CurrDirName%"

for /D %%d IN ("%CurrDirPath%\*") DO (
    set CurrSubDir=%%~nd
    IF NOT "!CurrSubDir!"=="release" (
        xcopy "%CurrDirPath%\!CurrSubDir!" "%CurrDirPath%\release\%CurrDirName%\!CurrSubDir!\" /E
    )
)

"C:\Program Files (x86)\Steam\steamapps\common\X Tools\WorkshopTool.exe" update -path "%CurrDirPath%\release\%CurrDirName%" -buildcat -changenote %1