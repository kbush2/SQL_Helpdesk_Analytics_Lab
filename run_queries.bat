\
@echo off
setlocal
pushd %~dp0
if not exist helpdesk.db (
  echo [!] helpdesk.db not found. Run setup_lab.bat first.
  pause
  exit /b 1
)
sqlite3 helpdesk.db ".read queries.sql"
pause
