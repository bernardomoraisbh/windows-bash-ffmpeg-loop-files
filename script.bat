@ECHO OFF
setlocal enabledelayedexpansion
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
for %%f in (C:\Users\berna\Downloads\CONVERTER\*.mkv) do (
	set var=%%f
	del input.mkv
	mklink input.mkv "%%f"
	@ECHO !var!
	call ffmpeg -i input.mkv -vf subtitles=input.mkv -crf 18 -c:a copy "C:\Users\berna\Downloads\CONVERTER\out\%%~nf OUT.mkv"
)
PAUSE
