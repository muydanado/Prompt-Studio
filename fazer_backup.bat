@echo off
set "BACKUP_DIR=backup"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

:: Obter data e hora no formato AAMMDDhhmm usando PowerShell
for /f %%i in ('powershell -command "Get-Date -Format 'yyMMddHHmm'"') do set DATETIME_STR=%%i

set "FILENAME=backup%DATETIME_STR%.zip"
set "DESTINATION=%BACKUP_DIR%\%FILENAME%"

echo ==================================================
echo Iniciando backup das paginas do sistema (*.html)
echo Data: %DATE_STR%
echo Destino: %DESTINATION%
echo ==================================================

:: Compactar arquivos HTML
powershell -Command "Compress-Archive -Path *.html -DestinationPath '%DESTINATION%' -Force"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [SUCESSO] Backup realizado com sucesso!
) else (
    echo.
    echo [ERRO] Falha ao realizar o backup.
)

pause
