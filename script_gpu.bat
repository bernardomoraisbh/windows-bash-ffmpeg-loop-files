@ECHO OFF
setlocal enabledelayedexpansion
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
for %%f in (C:\Users\berna\Downloads\MadokaGaiden\*.mkv) do (
	set var=%%f
	del input.mkv
	mklink input.mkv "%%f"
	@ECHO !var!
	call ffmpeg -hwaccel cuda -i input.mkv -vf "subtitles=input.mkv,hwupload_cuda" -c:v hevc_nvenc -preset slow -rc vbr -cq 19 -b:v 5M -maxrate:v 10M -bufsize:v 20M -c:a copy "C:\Users\berna\Downloads\MadokaGaiden\out\%%~nf.mp4"
)
PAUSE