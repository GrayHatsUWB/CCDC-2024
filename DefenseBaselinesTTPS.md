# Defense Baselines and Techniques.

1. Login with default creds (CHANGE THEM FAST)
2. Windows Updates (FAST TO PATCH things like MS-010-70 (nsaEternalBlue)
3. Windows Firewall enabled

<code>
netsh firewall set opmode enable
</code>

4. Windows Defender turn On

5. Baseline GPO in AD Documenting all GPOs with PowerShell – SID-500.COM
<code>
Get-GPOReport -All -Domain "NULL404.local" -ReportType HTML -Path $home\allgporeports.html
</code>
<br>

6. Linux Update 

<code>sudo apt update -y & sudo apt upgrade -y </code>

7. Linux Firewalls (ufw, fail2ban)

8. Change Passwords (automate with lol.bat file)

9. Disable users not used for scoring

<code>
net user Administrator /active:no
</code>

10. ADD CanaryToken, Windows share, SQL, LLMNR, DNS, Word, Excel

11. Install Sysmon Sysmon - Sysinternals | Microsoft Learn
<code>
powershell -nop -exec bypass -c "IEX (New-Object Net.WebClient).DownloadString('https://gist.githubusercontent.com/jessefmoore/d0a6325b4133b05a9a18096fdc8a8c78/raw/fd489ab49506409faf8c75bd3dc975a0b5b20f91/installSysmon.ps1');
</code>


12. GPO for ScriptBlock Logging, audit process creation, cmd line auditing. REGKey wdigest off, smbv1 off,Guest disabled, administrator disabled and add another admin account that is not RID 500

<code>
Set-SmbServerConfiguration -EnableSMB1Protocol $false
</code>

13. Baseline with tcpview, processExplorer, and procmon, Adfind ADExplorer Sysinternals Suite - Sysinternals | Microsoft Learn

14. Create SACLS Detecting Windows Endpoint Compromise with SACLs | by Dane Stuckey | Medium 

15. turn on AppLocker audit mode (aaronlocker review)

16. DACL remove impersonate, and debugger aka mimikatz

17. captureCreds with Flammingo (Canary)

18. Install BlueSpawn for registry stuff: ION28/BLUESPAWN: An Active Defense and EDR software to empower Blue Teams (github.com)

19. Install ASR Rules via GPO

20. Add EDR, like trails of ElasticEDR, or Sophos OR AURORA Agent - Nextron Systems (nextron-systems.com)

21. Review Eventwr sysmon logs with Chainsaw and sigma rules: WithSecureLabs/chainsaw: Rapidly Search and Hunt through Windows Forensic Artefacts (github.com)

22. Opensnitch for Linux

23. Run THOR (temp license needed) on windows and Linux: THOR APT Scanner - Nextron Systems (nextron-systems.com)

 

24. PEASS-ng to find privesc for windows and linux: carlospolop/PEASS-ng: PEASS - Privilege Escalation Awesome Scripts SUITE (with colors) (github.com)

25. Install Incident Response and Forensic tool Velocidex/velociraptor: Digging Deeper.... (github.com)

26. Look for creds in shares with snaffler

27. Use crackmapexec to find various issues: Porchetta-Industries/CrackMapExec: A swiss army knife for pentesting networks (github.com)

28. Use Pingcastle to find AD issues

29. Central Logging (not edr) install Wazuh

 
# Ansible stuff

WRCCDC Ansible Training - HackMD

https://hackmd.io/X2UrjEx0QSqp6o-IWLkJyw?view

<code>
ansible-playbook snapshots.yml -K
ansible-playbook snapshots-complex.yml -K
</code>

  
##  Snapshot:
<code>
cat /etc/passwd >> baselinepasswd1.txt

cat ~/.ssh >> baselinesshPubKeys1.txt

cat /etc/passwd >> snapPass1pm.txt
diff snapPass12pm.txt snapPass1pm.txt

ls ~/.ssh/

net localgroup administrators >> baselinelocalgroupadmins

Get-Service >> WinServices1.txt

Get-Scheduletasks >> Tasks1.txt

#Check Firewall drops or additions.

Get-NetFirewallApplicationFilter -All | Select *| ? { $_.AppPath -like "*\users\*" } | Select AppPath

get-Service >> winservicesGood.txt
type .\winservicesGood.txt
#Find a way to compare your baselines


get-service wuauserv

get-service WinRM

Stop-Service TeamViewer

start-service WinDefend

winrm quickconfig
 Set-Item WSMan:localhost\client\trustedhosts -value * -Force
 </code>
 
 
30. Stop Deletion of shadow copy files: Neo23x0/Raccine: A Simple Ransomware Vaccine (github.com)

 

31. Reset Machine Password (STOP SILVER TICKETS)

32. Reset-ComputerMachinePassword (Microsoft.PowerShell.Management) - PowerShell | Microsoft Learn

33. STOP GOLDEN TICKETS:

34. AD Forest Recovery - Resetting the krbtgt password | Microsoft Learn

 

35. Remove session from Windows server:

Kill a terminal session on a server - Windows Server - Spiceworks

<code>
rwinsta /server:<YourServerName> SessionId
</code>

36. With PowerShell, you can modify the RDP listening port using:

<code>
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "PortNumber" -Value 21390

New-NetFirewallRule -DisplayName 'RDPPORTLatest' -Profile 'Public' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 21390
 </code>

 

37. AD GroupPolicy Admin group changes

Powershellisfun/Active Directory Admin Group Change Report at main · HarmVeenstra/Powershellisfun (github.com)

 

38. Check logs with Hayabusa:

[Find Threats in Event Logs with Hayabusa - by Eric Capuano (ecapuano.com)](https://blog.ecapuano.com/p/find-threats-in-event-logs-with-hayabusa)https://blog.ecapuano.com/p/find-threats-in-event-logs-with-hayabusa



