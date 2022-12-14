#!/bin/bash
# Proxy For Edukasi & Imclass
# SL
# ==========================================

# Link Hosting Kalian
akbarvpn="raw.githubusercontent.com/ozipoetra/sshws-nginx/main/websocket"

# Getting Proxy Template
wget -q -O /usr/local/bin/wss https://${akbarvpn}/wss
chmod +x /usr/local/bin/wss

# Installing Service
cat > /etc/systemd/system/wss.service << END
[Unit]
Description=Python Proxy Mod By Akbar Maulana
Documentation=https://nekopi.care
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/wss 8880
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable wss
systemctl restart wss
