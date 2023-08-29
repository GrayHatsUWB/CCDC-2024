# 2023 -dfir-jesseee
# Looks for when Windows Defender is off and turns it on

# Check if Windows Defender services are running
$defenderServices = Get-Service Windefend, SecurityHealthService, wscsvc | Select Name, DisplayName, Status

$defenderRunning = $defenderServices | Where-Object { $_.Status -eq 'Running' }

if ($defenderRunning) {
    Write-Host "Windows Defender is already running."
} else {
    Write-Host "Windows Defender is currently not running."

    # Start the Windows Defender services
    Write-Host "Starting Windows Defender services..."
    $defenderServices | ForEach-Object {
        if ($_.Status -ne 'Running') {
            Start-Service $_.Name
        }
    }

    # Check the new status of Windows Defender services
    $defenderServices = Get-Service Windefend, SecurityHealthService, wscsvc | Select Name, DisplayName, Status
    $defenderRunning = $defenderServices | Where-Object { $_.Status -eq 'Running' }

    # Verify if Windows Defender has been started
    if ($defenderRunning) {
        Write-Host "Windows Defender has been successfully started."
    } else {
        Write-Host "Failed to start Windows Defender."
    }
}
