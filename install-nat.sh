#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi

# ssh
aa="https://raw.githubusercontent.com/ozipoetra/sshws-nginx/main/ssh/ssh-vpn.sh"
# ohp
# bb="https://raw.githubusercontent.com/ozipoetra/sshws-nginx/main/ohp/ohp.sh"
# ws
cc="https://raw.githubusercontent.com/ozipoetra/sshws-nginx/main/websocket/edu.sh"

#installing script
wget ${aa} && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
# wget ${bb} && chmod +x ohp.sh && ./ohp.sh
wget ${cc} && chmod +x edu.sh && ./edu.sh

echo "SSH Websocket service done..."
sleep 3
reboot

# clear installation files (soon)
# rm -r *.sh
