@echo off

:: BatchGotAdmin
:: https://sites.google.com/site/eneerge/scripts/batchgotadmin
:: https://stackoverflow.com/questions/1894967
::-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B
    del "%temp%\getadmin.vbs"

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

@echo off
echo 正在建立 DDNS 服務
sc delete DDNS > nul
sc create DDNS binPath="%~dp0ddns.exe" > nul

:: 自行替換網址
sc start DDNS "DDNS更新網址1" "DDNS更新網址2" > nul

echo 正在開啟 Minecraft Server

:: 可自行替換伺服器啟動指令指令
"C:\Program Files (x86)\Minecraft Launcher\runtime\java-runtime-alpha\windows-x64\java-runtime-alpha\bin\java.exe" -Xmx2048M -Xms1024M -jar "server.jar" > nul

echo 正在關閉 Minecraft Server
echo 正在刪除 DDNS 服務
sc stop DDNS > nul
pause