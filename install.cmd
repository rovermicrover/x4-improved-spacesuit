@echo off
setlocal enabledelayedexpansion

for /f %%a in ('chdir') do set CurrDirPath=%%a
for %%I in (.) do set CurrDirName=%%~nxI

del /F /S /Q "C:\Program Files (x86)\Steam\steamapps\common\X4 Foundations\extensions\%CurrDirName%"
mkdir "C:\Program Files (x86)\Steam\steamapps\common\X4 Foundations\extensions\%CurrDirName%"

xcopy "%CurrDirPath%\content.xml" "C:\Program Files (x86)\Steam\steamapps\common\X4 Foundations\extensions\%CurrDirName%\"

for /D %%d IN ("%CurrDirPath%\*") DO (
    set CurrSubDir=%%~nd
    IF NOT "!CurrSubDir!"=="release" (
        xcopy %%d "C:\Program Files (x86)\Steam\steamapps\common\X4 Foundations\extensions\%CurrDirName%\!CurrSubDir!\" /E
    )
)