#Assuming Administrator shell
#Assuming this is ran from ~\Downloads\InstallSysmonAndWinlogbeat\
#Assuming winlogbeat-8.9.1-windows-x86_64.zip is in ~\Downloads\

Expand-Archive -LiteralPath .\winlogbeat-8.9.1-windows-x86_64.zip -DestinationPath "C:\Program Files\"
Rename-Item -Path 'C:\Program Files\winlogbeat-8.9.1-windows-x86_64' -NewName Winlogbeat
Copy-Item -Path .\winlogbeat.yml -Destination "C:\Program Files\Winlogbeat\" -Force
cd "C:\Program Files\Winlogbeat\"
.\install-service-winlogbeat.ps1 -c .\winlogbeat.yml
Start-Service winlogbeat
Set-Service -Name winlogbeat -StartupType Automatic
