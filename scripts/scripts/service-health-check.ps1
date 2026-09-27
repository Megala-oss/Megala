# Windows Service Health Check
# Author: Megala

Write-Host "====================================="
Write-Host "       WINDOWS SERVICE CHECK"
Write-Host "====================================="

$Services = @(
    "wuauserv",
    "BITS",
    "Winmgmt",
    "EventLog",
    "Spooler"
)

foreach ($ServiceName in $Services) {

    $Service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

    if ($null -eq $Service) {
        Write-Host "$ServiceName : Service Not Found"
    }
    elseif ($Service.Status -eq "Running") {
        Write-Host "$ServiceName : Running"
    }
    else {
        Write-Host "$ServiceName : $($Service.Status)"
    }
}

Write-Host "`nService check completed."
