Param()
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)
Write-Host "Creating helpdesk.db and importing CSVs..."
sqlite3 helpdesk.db ".read setup.sql"
if ($LASTEXITCODE -ne 0) {
  Write-Host "[!] There was an error running setup.sql. Is sqlite3 on your PATH?"
  exit 1
}
Write-Host "Done. Database: helpdesk.db"
