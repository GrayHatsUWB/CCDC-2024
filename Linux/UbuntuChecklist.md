1. Check bashrc for any aliases
2. Check file permissions (for example, /home should by owned by root:root)
3. Find any scripts/executables out of the ordinary in /usr/sbin (file *, look for python or bash?)
4. Look for prohibited software (sudo apt list --manual-installed)
5. Reset source list before updating (in /etc/apt, wipe sources.list and reset from GUI)
6. Audit
  -You can add rules to block groups by doing 
