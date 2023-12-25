1. Login with default creds
2. Change default creds
3. Check crontab for any scripts that may provide backdoor access
4. Check process list for any obvious listeners or backdoors
5. Ensure valid sources list before updating (on Ubuntu, /etc/apt/sources.list) 
6. sudo apt update -y ; sudo apt upgrade -y
7. Install ufw to ALLOWLIST valid ports and BLOCKLIST valid IPs (MAKE SURE TO NOTIFY LEADERSHIP (Marko)) (sudo apt install ufw, sudo systemctl enable ufw, sudo systemctl start ufw)
8. Install fail2ban to block IP addresses that attempt to brute force (sudo apt install fail2ban)
9. Install sysmon (Script)
10. ADD CanaryToken, Windows share, SQL, LLMNR, DNS, Word, Excel
11. turn on AppLocker audit mode (aaronlocker review)
12. Baseline with tcpview, processExplorer, and procmon, Adfind ADExplorer Sysinternals Suite - Sysinternals | Microsoft Learn
13. Add EDR, like trails of ElasticEDR, or Sophos OR AURORA Agent - Nextron Systems (nextron-systems.com)
14. Review Eventwr sysmon logs with Chainsaw and sigma rules: WithSecureLabs/chainsaw: Rapidly Search and Hunt through Windows Forensic Artefacts (github.com)
15. Opensnitch for Linux
16. Run THOR (temp license needed) on windows and Linux: THOR APT Scanner - Nextron Systems (nextron-systems.com)
17. LinPEAS for PrivEsc
18. Velociraptor
19. Stop Deletion of shadow copy files: Neo23x0/Raccine: A Simple Ransomware Vaccine (github.com)
