1. Check bashrc for any aliases
2. Check file permissions (for example, /home should by owned by root:root)
3. Find any scripts/executables out of the ordinary in /usr/sbin (file *, look for python or bash?)
4. Look for prohibited software (sudo apt list --manual-installed)
5. Reset source list before updating (in /etc/apt, wipe sources.list and reset from GUI)
6. Audit SSH server config - typically disable root login, check out keyed vs. password login (in /etc/ssh/sshd_config)
   - You can also block/allow certain groups by adding rules at the bottom of the file (for example, DenyGroups <group_name>)
7. Use gsettings
8. Find suspiciously large files (sudo find / -xdev -type f -size +100M)
