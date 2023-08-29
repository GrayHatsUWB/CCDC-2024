# 2023 -dfir-jesseee
# Looks to see if firewall is off and turns on

# Run 'netsh advfirewall show all state' command
$firewallState = netsh advfirewall show all state

# Check if firewall is OFF
if ($firewallState -match "State\s+OFF") {
    Write-Host "Firewall is currently OFF."

    # Turn on the firewall
    Write-Host "Turning on the firewall..."
    netsh advfirewall set allprofile state on

    # Check the new firewall state
    $newFirewallState = netsh advfirewall show all state

    # Verify if the firewall has been turned on
    if ($newFirewallState -match "State\s+ON") {
        Write-Host "Firewall has been successfully turned on."
    } else {
        Write-Host "Failed to turn on the firewall."
    }
} else {
    Write-Host "Firewall is already ON."
}
