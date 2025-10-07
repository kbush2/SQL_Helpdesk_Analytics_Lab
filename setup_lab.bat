\
@echo off
setlocal
pushd %~dp0
echo Creating helpdesk.db and importing CSVs...
sqlite3 helpdesk.db ".read setup.sql"
if %ERRORLEVEL% NEQ 0 (
  echo.
  echo [!] There was an error running setup.sql. Make sure sqlite3 is on your PATH.
  pause
  exit /b 1
)
echo Done. Database: helpdesk.db
pause
