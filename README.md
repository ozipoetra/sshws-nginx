# SSH Websocket over Nginx
<img src="./6a90875cf3b1a90126ebd4814e9b53ab-modified.webp" width="100%" height="auto" alt="SSH Websocket">
<hr>
SSH over websocket through Nginx reverse proxy

* support path and wss
* support multiport 80/443 


### Installation
```
wget https://raw.githubusercontent.com/ozipoetra/sshws-nginx/main/install-nat.sh && chmod +x install-nat.sh && ./install-nat.sh
```


NGINX Reverse Proxy: point to http://127.0.0.1:8880/
```
#PROXY-START/api/

location ^~ /path/
{     
    if ($http_upgrade != "websocket") {
    return 404;
    }
    proxy_pass http://127.0.0.1:8880/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header REMOTE-HOST $remote_addr;
}

#PROXY-END/api/
```

### Credit
* Sulaiman SL
