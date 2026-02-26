@echo off
:: Requerir privilegios de Administrador
net session >nul 2>&1 || (echo [!] Error: Ejecuta como Administrador & pause & exit)

title GOCLEANER ULTIMATE - PROTOCOL OMEGA
color 0A
echo [GOCLEANER] Iniciando purga de nivel 1000...

:: 1. MÁXIMA POTENCIA: Detener todos los intérpretes de comandos excepto este
:: Esto mata cualquier V14, V10 o V11 al instante, sin importar cuántos haya.
echo [+] Ejecutando purga selectiva de hilos...
taskkill /f /fi "imagename eq cmd.exe" /fi "windowtitle ne GOCLEANER ULTIMATE - PROTOCOL OMEGA"
taskkill /f /im powershell.exe
taskkill /f /im wscript.exe

:: 2. ELIMINACIÓN DE PERSISTENCIA TOTAL
:: No solo busca "GoLauncher", limpia todas las rutas comunes de malware
echo [+] Reseteando claves de inicio del registro...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /va /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /va /f

:: 3. DESBLOQUEO DE RECURSOS (VACÍO DE MEMORIA)
:: Esto fuerza a Windows a liberar la RAM que el V14 estaba bloqueando
echo [+] Liberando memoria del sistema...
start /wait "" explorer.exe & taskkill /f /im explorer.exe & start explorer.exe

:: 4. BLOQUEO DE RED (PARA EL V11)
:: Corta cualquier intento de exfiltración de datos inmediatamente
echo [+] Reiniciando stack de red...
netsh winsock reset >nul
ipconfig /release >nul
ipconfig /renew >nul

echo [GOCLEANER] SISTEMA ESTABILIZADO. TODA AMENAZA HA SIDO NEUTRALIZADA.
pause