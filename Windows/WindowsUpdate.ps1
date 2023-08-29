if (Get-Module -ListAvailable -Name PSWindowsUpdate)
{
    Add-WUServiceManager -MicrosoftUpdate
    Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot | Out-File "C:\($env.computername-Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force
} else {
    Install-Module PSWindowsUpdate
    Add-WUServiceManager -MicrosoftUpdate
    Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot | Out-File "C:\($env.computername-Get-Date -f yyyy-MM-dd)-MSUpdates.log" -Force
}
