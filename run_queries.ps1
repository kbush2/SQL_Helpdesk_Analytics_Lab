Param()
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)
if (-not (Test-Path helpdesk.db)) {
  Write-Host "[!] helpdesk.db not found. Run setup_lab.ps1 first."
  exit 1
}
sqlite3 helpdesk.db ".read queries.sql"
