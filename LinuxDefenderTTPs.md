1. Login with default creds
2. Change default creds
3. Check crontab for any scripts that may provide backdoor access
4. Check process list for 
5. Ensure valid sources list before updating (on Ubuntu, /etc/apt/sources.list) 
6. sudo apt update -y ; sudo apt upgrade -y 
7. Linux Firewalls (ufw, fail2ban)
8. Install sysmon (Script)
9. ADD CanaryToken, Windows share, SQL, LLMNR, DNS, Word, Excel
10. turn on AppLocker audit mode (aaronlocker review)
11. Baseline with tcpview, processExplorer, and procmon, Adfind ADExplorer Sysinternals Suite - Sysinternals | Microsoft Learn
12. Add EDR, like trails of ElasticEDR, or Sophos OR AURORA Agent - Nextron Systems (nextron-systems.com)
13. Review Eventwr sysmon logs with Chainsaw and sigma rules: WithSecureLabs/chainsaw: Rapidly Search and Hunt through Windows Forensic Artefacts (github.com)
14. Opensnitch for Linux
15. Run THOR (temp license needed) on windows and Linux: THOR APT Scanner - Nextron Systems (nextron-systems.com)
16. LinPEAS for PrivEsc
17. Velociraptor
18. Stop Deletion of shadow copy files: Neo23x0/Raccine: A Simple Ransomware Vaccine (github.com)
