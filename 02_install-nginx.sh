#!/bin/bash
# Add keys
wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
add-apt-repository ppa:certbot/certbot -y

# Install
apt update
apt install -y nginx software-properties-common python-certbot-nginx

# start service
systemctl start nginx
systemctl enable nginx

# ufw allow ports
ufw allow 80
ufw allow 443
ufw allow 5432