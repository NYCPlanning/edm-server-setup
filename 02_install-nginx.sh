# Add keys
wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
add-apt-repository ppa:certbot/certbot -y

# Install
apt update
apt upgrade
apt install -y\ 
    nginx\
    software-properties-common\
    python-certbot-nginx

# start service
systemctl start nginx
systemctl enable nginx

