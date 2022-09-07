@echo off
chcp 65001
set a=%1
if %a:~-1%%a:~-1%=="" (
	set b=%a:~0,-4%mp4"
) else (
	set b="%a:~0,-3%mp4"
)
SET batchpath="%~dp0"
SET ffmpegpath="%~dp0ffmpeg.exe"
setlocal enabledelayedexpansion

if exist %ffmpegpath% (
	@echo on
	%ffmpegpath% -i %a% -threads 0 %b%
) else (
	where ffmpeg.exe  >nul 2>nul
	@echo on
	if !ERRORLEVEL! == 0 (
		ffmpeg.exe -i %a% -threads 0 %b%
	) else (
		echo 找不到 ffmpeg.exe
		pause
	)
)