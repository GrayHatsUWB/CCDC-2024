#install chainsaw from github
bitsadmin /transfer chainsawgh /DOWNLOAD /PRIORITY high /DYNAMIC https://github.com/WithSecureLabs/chainsaw/archive/refs/heads/master.zip %USERPROFILE%\chainsaw.zip
tar -xf %USERPROFILE%\chainsaw.zip -C %USERPROFILE%
del %USERPROFILE%\chainsaw.zip

#install chainsaw binary from github
bitsadmin /transfer chainsawgh /DOWNLOAD /PRIORITY high /DYNAMIC https://github.com/WithSecureLabs/chainsaw/releases/download/v2.8.0/chainsaw_x86_64-pc-windows-msvc.zip %USERPROFILE%\chainsawexe.zip
tar -xf %USERPROFILE%\chainsawexe.zip -C %USERPROFILE%
del %USERPROFILE%\chainsawexe.zip
move %USERPROFILE%\chainsaw\chainsaw.exe %USERPROFILE\chainsaw-master

#install sigma from github
bitsadmin /transfer chainsawgh /DOWNLOAD /PRIORITY high /DYNAMIC https://github.com/SigmaHQ/sigma/archive/refs/heads/master.zip %USERPROFILE%\sigma.zip
tar -xf %USERPROFILE%\sigma.zip -C %USERPROFILE%
del %USERPROFILE%\sigma.zip
rename %USERPROFILE%\sigma-master %USERPROFILE%\sigma
move %USERPROFILE%\sigma %USERPROFILE\chainsaw-master

#run it straight from memory-command courtesy of DFIR-Jesse
powershell -nop -exec bypass -c "IEX (New-Object Net.WebClient).DownloadString('https://gist.githubusercontent.com/jessefmoore/d0a6325b4133b05a9a18096fdc8a8c78/raw/fd489ab49506409faf8c75bd3dc975a0b5b20f91/installSysmon.ps1');"

#clean up and exclusions
rmdir %USERPROFILE%\chainsaw /s /q
del installSysmon.ps1
rename chainsaw-master chainsaw

powershell Add-MpPreference -ExclusionPath "%USERPROFILE%\chainsaw" 
powershell Add-MpPreference -ExclusionPath "%USERPROFILE%\chainsaw\chainsaw.exe" 