#!/bin/bash

# Update package list
sudo apt-get update -y

# Install Nginx
sudo apt-get install nginx -y

# Create directories
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

# Create an HTML page
echo "<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

# Create a symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

# Change ownership
sudo chown -R ubuntu:ubuntu /data/

# Configure Nginx
sudo bash -c 'cat << EOF > /etc/nginx/sites-available/default
server {
    listen 80;
    server_name _;
    location /hbnb_static {
        alias /data/web_static/current;
    }
}
EOF'

# Restart Nginx
sudo service nginx restart

