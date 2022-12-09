#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
# ==================================================
# Link Hosting Kalian
akbarvpn="raw.githubusercontent.com/ozipoetra/sshws-nginx/main/ssh"

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=root
organizationalunit=root
commonname=localhost
email=dev@ozip.my.id

# simple password minimal
wget -O /etc/pam.d/common-password "https://${akbarvpn}/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
# echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
# sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
# apt dist-upgrade -y
# apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

apt install -y libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev xl2tpd pptpd

# 
apt -y install bzip2
apt -y install gzip
apt -y install coreutils
apt -y install screen 
apt -y install curl
apt -y install unzip

# Install Requirements Tools
apt install ruby -y
apt install python -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y
apt install nano -y

#
# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

echo "clear" >> .profile
echo "neofetch" >> .profile

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://${akbarvpn}/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500


# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 2253' /etc/ssh/sshd_config
echo "Port 22" >> /etc/ssh/sshd_config
echo "Port 42" >> /etc/ssh/sshd_config
/etc/init.d/ssh restart


# install fail2ban

# banner /etc/issue.net
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config

# Ganti Banner
wget -O /etc/issue.net "https://${akbarvpn}/issue.net"

# download script
cd /usr/bin
wget -O menu "https://${akbarvpn}/menu.sh"
wget -O addssh "https://${akbarvpn}/addssh.sh"
wget -O trialssh "https://${akbarvpn}/trialssh.sh"
wget -O delssh "https://${akbarvpn}/delssh.sh"
wget -O member "https://${akbarvpn}/member.sh"
wget -O delexp "https://${akbarvpn}/delexp.sh"
wget -O cekssh "https://${akbarvpn}/cekssh.sh"
wget -O restart "https://${akbarvpn}/restart.sh"
wget -O speedtest "https://${akbarvpn}/speedtest_cli.py"
wget -O info "https://${akbarvpn}/info.sh"
wget -O ram "https://${akbarvpn}/ram.sh"
wget -O renewssh "https://${akbarvpn}/renewssh.sh"
wget -O autokill "https://${akbarvpn}/autokill.sh"
wget -O ceklim "https://${akbarvpn}/ceklim.sh"
wget -O tendang "https://${akbarvpn}/tendang.sh"
wget -O clearlog "https://${akbarvpn}/clearlog.sh"

wget -O xp "https://${akbarvpn}/xp.sh"

wget -O ipsaya "https://raw.githubusercontent.com/ozipoetra/sshws-nginx/main/update/ipsaya.sh"

wget -O setmenu "https://raw.githubusercontent.com/ozipoetra/sshws-nginx/main/update/setmenu.sh"
wget -O running "https://raw.githubusercontent.com/ozipoetra/sshws-nginx/main/update/running.sh"


chmod +x ipsaya

chmod +x setmenu
chmod +x running

chmod +x menu
chmod +x addssh
chmod +x trialssh
chmod +x delssh
chmod +x member
chmod +x delexp
chmod +x cekssh
chmod +x restart
chmod +x speedtest
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renewssh
chmod +x clearlog
chmod +x xp
chmod +x swapkvm
echo "0 5 * * * root clearlog && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
echo "0 1 * * * root delexp" >> /etc/crontab
# echo "10 4 * * * root clearlog && sslh-fix-reboot" >> /etc/crontab
# echo "0 0 * * * root clearlog && reboot" >> /etc/crontab
# echo "0 12 * * * root clearlog && reboot" >> /etc/crontab
# echo "0 18 * * * root clearlog && reboot" >> /etc/crontab


# remove unnecessary files
cd
apt autoclean -y
# apt -y remove --purge unscd
# apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
# apt-get -y --purge remove bind9*;
# apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
# chown -R www-data:www-data /home/vps/public_html
# /etc/init.d/nginx restart
# /etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
# /etc/init.d/dropbear restart
# /etc/init.d/fail2ban restart
# /etc/init.d/sslh restart
# /etc/init.d/stunnel5 restart
# /etc/init.d/vnstat restart
# /etc/init.d/fail2ban restart
# /etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
# rm -f /root/key.pem
# rm -f /root/cert.pem
# rm -f /root/ssh-vpn.sh

# finihsing
clear
