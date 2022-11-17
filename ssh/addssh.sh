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

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);

# systemctl stop client-sldns
# systemctl stop server-sldns
# pkill sldns-server
# pkill sldns-client
# systemctl enable client-sldns
# systemctl enable server-sldns
# systemctl start client-sldns
# systemctl start server-sldns
# systemctl restart client-sldns
# systemctl restart server-sldns
# systemctl restart ws-tls
systemctl restart ws-nontls
# systemctl restart ssh-ohp
# systemctl restart dropbear-ohp
# systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "Informasi SSH & OpenVPN"
echo -e "=============================="
echo -e "Username: $Login"
echo -e "Password: $Pass"
echo -e "Created: $hariini"
echo -e "Expired: $expi"
echo -e "===========HOST-SSH==========="
echo -e "IP/Host: $IP"
# echo -e "===========SLOWDNS==========="
# echo -e "Domain Name System(DNS): 8.8.8.8"
# echo -e "Name Server(NS): $sldomain"
# echo -e "DNS PUBLIC KEY: $slkey"
# echo -e "Domain SlowDNS: $sldomain"
echo -e "=========Service-Port========="
# echo -e "SlowDNS: 443,22,109,143"
# echo -e "OpenSSH: 22"
# echo -e "Dropbear: 443, 109, 143"
# echo -e "SSL/TLS: 443"
echo -e "SSH Websocket SSL/TLS: 443"
echo -e "SSH Websocket HTTP: 80"
echo -e "BadVPN UDPGW: 7200"
# echo -e "Proxy CloudFront: [OFF]"
# echo -e "Proxy Squid: [OFF]"
# echo -e "OHP SSH: 8181"
# echo -e "OHP Dropbear: 8282"
# echo -e "OHP OpenVPN: 8383"
# echo -e "OVPN Websocket: 2086"
# echo -e "OVPN Port TCP: $ovpn"
# echo -e "OVPN Port UDP: $ovpn2"
# echo -e "OVPN Port SSL: 990"
# echo -e "OVPN TCP: http://$IP:89/tcp.ovpn"
# echo -e "OVPN UDP: http://$IP:89/udp.ovpn"
# echo -e "OVPN SSL: http://$IP:89/ssl.ovpn"
echo -e "=============================="
# echo -e "SNI/Server Spoof: isi dengan bug"
echo -e "Payload Websocket SSL/TLS"
echo -e "=============================="
echo -e "GET wss://bug.com/ HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=============================="
echo -e "Payload Websocket HTTP"
echo -e "=============================="
echo -e "GET / HTTP/1.1[crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=============================="
echo -e ""
