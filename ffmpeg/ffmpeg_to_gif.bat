@echo off
chcp 65001
set a=%1
if %a:~-1%%a:~-1%=="" (
	set b=%a:~0,-4%gif"
) else (
	set b="%a:~0,-3%gif"
)
SET batchpath="%~dp0"
SET ffmpegpath="%~dp0ffmpeg.exe"
setlocal enabledelayedexpansion

if exist %ffmpegpath% (
	@echo on
	%ffmpegpath% -i %a% -threads 0 -filter_complex "[0:v] split [a][b];[a] palettegen [p];[b][p] paletteuse" %b%
) else (
	where ffmpeg.exe  >nul 2>nul
	@echo on
	if !ERRORLEVEL! == 0 (
		ffmpeg.exe -i %a% -threads 0 -filter_complex "[0:v] split [a][b];[a] palettegen [p];[b][p] paletteuse" %b%
	) else (
		echo 找不到 ffmpeg.exe
		pause
	)
)