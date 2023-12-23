sudo apt-get update 
sudo apt-get full-upgrade -y
mkdir sysmon_conf
cd ./sysmon_conf
wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y sysmonforlinux
wget https://raw.githubusercontent.com/microsoft/MSTIC-Sysmon/main/linux/configs/main.xml -O mstic_sysmon.conf
sudo sysmon -accepteula -i mstic_sysmon.conf 
sudo tail -f /var/log/syslog | sudo /opt/sysmon/sysmonLogView -e 1
