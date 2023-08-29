Step 1: Download this folder and extract it to the Downloads folder

Step 2. Execute the Sysmon PowerShell script from a PowerShell administrator shell. If you already have Sysmon or don't want to install it, ignore this step. 

*After this point, Sysmon should be actively running. It will generate logs about your system*
> powershell -nop -exec bypass -c "IEX (New-Object Net.WebClient).DownloadString('https://gist.githubusercontent.com/jessefmoore/d0a6325b4133b05a9a18096fdc8a8c78/raw/fd489ab49506409faf8c75bd3dc975a0b5b20f91/installSysmon.ps1');"

Step 3. Execute the Winlogbeat PowerShell script from a powershell administrator shell using the following command
> powershell -ExecutionPolicy Bypass -File .\InstallWinlogbeat.ps1

*After this point, Winlogbeat will begin sending logs to Security Onion*

Step 4: Profit
