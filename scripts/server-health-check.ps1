scripts = folder
server-health-check.ps1 = PowerShell script
# Windows Server Health Check
# Author: Megala

Write-Host "====================================="
Write-Host "     WINDOWS SERVER HEALTH CHECK"
Write-Host "====================================="

# Computer Information
$ComputerName = $env:COMPUTERNAME
$OS = Get-CimInstance Win32_OperatingSystem

Write-Host "`nComputer Name : $ComputerName"
Write-Host "Operating System : $($OS.Caption)"
Write-Host "Last Boot Time : $($OS.LastBootUpTime)"

# Disk Space Check
Write-Host "`n--- Disk Space ---"

Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" |
Select-Object DeviceID,
    @{Name="Size(GB)";Expression={[math]::Round($_.Size/1GB,2)}},
    @{Name="Free(GB)";Expression={[math]::Round($_.FreeSpace/1GB,2)}}

# Memory Check
Write-Host "`n--- Memory ---"

$TotalMemory = [math]::Round($OS.TotalVisibleMemorySize / 1MB, 2)
$FreeMemory = [math]::Round($OS.FreePhysicalMemory / 1MB, 2)

Write-Host "Total Memory : $TotalMemory GB"
Write-Host "Free Memory  : $FreeMemory GB"

# Running Services
Write-Host "`n--- Important Services ---"

$Services = @(
    "wuauserv",
    "BITS",
    "Winmgmt",
    "EventLog"
)

foreach ($Service in $Services) {

    $Status = Get-Service -Name $Service -ErrorAction SilentlyContinue

    if ($Status) {
        Write-Host "$Service : $($Status.Status)"
    }
    else {
        Write-Host "$Service : Not Found"
    }
}

Write-Host "`nHealth check completed."
