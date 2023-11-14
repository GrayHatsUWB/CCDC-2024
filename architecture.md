Architecture
![image](https://github.com/GrayHatsUWB/CCDC-2024/assets/6413570/4e9f3f2c-5fca-44fb-a72f-9be2f4b9d1e4)

| BoxName         | IP     | PORT       | Service  |  Assigned  | Comments                            |
|--------------|-----------|------------|------------|----------|-------------------------------------|
| ProxMox      | 192.168.1.7 | 8006     | Hypervisor |          | This is the DELL R710 in the rack
| Ansible    | 192.168.1.27 | 22   | Ansible    | serveradmin    | Automation |
| Nessus    | 192.168.1.39 | 8834  | HTTPS   | serveradmin    | CVE/Network Scanner |
| WordPress3    | 192.168.1.220 | 8000   | Web     | grayhats    | http://192.168.1.220/wp-admin/ username:admin  https://192.168.1.220:12322 (Database Interface) username:adminer|
| MariaDB    | 192.168.1.31 | 3306   | SQL    | serveradmin    | MariaDB |
| Mysql    | 192.168.1.x | 3306  | MySQL   | serveradmin    | Mysql services |
| Ubuntu Desktop    | 192.168.1.9 | 22   | SSH     | desktopadmin    | BlueTeam workstation |
| AD    | 192.168.1.21 | 80   | Cedential Mgmt    | Administrator    | Active Directory, NTP |
| Kali    | 192.168.1.30 | ssh  | CyberOffense   | kali    | Attacker OS |
| Score Engine    | 192.168.1.36 | 443   | Score Engine | root | https://192.168.1.36/admin/status login whiteteamuser testpass |
| WAZUH    | 192.168.1.205 | 443   | HTTPS    | admin  | Central Logging |
| Security Onion    | 192.168.1.211 | 443  | HTTPS   | uwbgrayhatpres@gmail.com  | Security Monitor |
| Box3    | 192.168.1.x | 22   | SSH     | User3    | Example comment 3 |


# Verification Checklist
- [ ] Static Address for box
- [ ] All services start on reboot
- [ ] The RAM, CPU, and disk utilization is kept to a low
- [ ] You can log in with an AD user account
- [ ] You can log in with the root/Serveradmin/Desktopadmin for Linux account
- [ ] Snapshot between changes
- [ ] On Windows make the AD (192.168.1.21) the NTP server
      <code>w32tm /config /manualpeerlist:192.168.1.21,0x8 /syncfromflags:MANUAL /update</code>

