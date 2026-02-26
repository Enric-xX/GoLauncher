# 🚀 Project GoLauncher: Evolution of a Payload

Bienvenido al repositorio de la familia **GoLauncher**. Este proyecto documenta mi aprendizaje en ciberseguridad y automatización mediante scripts de Batch (.bat), desde bucles simples hasta técnicas avanzadas de evasión.

> ⚠️ **ADVERTENCIA:** Este código tiene fines educativos y de análisis en entornos controlados (Sandboxes). No ejecutar en máquinas reales.

## 📈 Árbol de Evolución

### 🟢 Fase Inicial (Scripts de Estrés)
* **GoLauncher (v1):** Bucle infinito de procesos `cmd.exe`. [cite_start]El origen del caos. [cite: 1, 2]
* [cite_start]**GoLauncherV1 & V3:** Introducción de **Evasión** (timeout) y **Persistencia** en la carpeta Startup. [cite: 7, 13, 14, 15]

### 🟡 Fase Intermedia (Técnicas de Malware)
* [cite_start]**GoLauncherUltimate:** Evasión extendida (90s) y recolección de datos (`systeminfo`, `netstat`). [cite: 3, 4, 6]
* **GoLauncherV10:** La versión más agresiva. [cite_start]Incluye **Anti-VM** (hostname check) y cifrado simulado de archivos. [cite: 29, 30, 34, 35]

### 🔴 Fase Avanzada (Lógica y Evasión Humana)
* [cite_start]**GoLauncherV10.2:** Sistema de **Ruleta Rusa** con llave aleatoria (1/9) para evadir análisis automáticos. [cite: 19, 21, 22]
* **GoLauncherV10.3:** Evolución con **Bomba de Tiempo** (30s). [cite_start]Si no hay interacción humana, el payload se dispara solo. [cite: 24, 25, 26, 28]
* **GoLauncherV11 (Elite):** Mi versión más técnica. [cite_start]Incluye exfiltración de datos en Base64 y cierre forzado de procesos del sistema. [cite: 36, 37, 38]

## 🛠️ Tecnologías Utilizadas
* [cite_start]**Batch / CMD:** Lógica principal y manipulación de archivos. [cite: 1, 19, 29]
* [cite_start]**PowerShell:** Exfiltración de red e interacción avanzada con el sistema. [cite: 3, 33, 36, 38]
* [cite_start]**Registro de Windows:** Persistencia mediante claves `HKCU\Run`. [cite: 5, 23, 31, 36]

## 🧪 Resultados en Triage
[cite_start]La mayoría de las versiones alcanzan un score de **8/10** o superior, logrando en varios casos el colapso del servidor de análisis (Error 500/502). [cite: 19, 23, 29, 34]
