# 使用說明

將 ddns.exe 及 server.bat 放在 Minecraft Server 執行目錄

依照批次檔內說明替換相關文字即可於開啟伺服器時自動更新 DDNS

```batch
:: 自行替換網址
sc start DDNS "DDNS更新網址1" "DDNS更新網址2" > nul

echo 正在開啟 Minecraft Server

:: 可自行替換伺服器啟動指令指令
"C:\Program Files (x86)\Minecraft Launcher\runtime\java-runtime-alpha\windows-x64\java-runtime-alpha\bin\java.exe" -Xmx2048M -Xms1024M -jar "server.jar" > nul
```
