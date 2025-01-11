#!/bin/bash

PASSWORD="q1w2e3r4t5y6"
MYSQL_PASSWORD="root"
IP=$(wget -q -4 -O- http://icanhazip.com)

sudo apt update -y
sleep 3

sudo apt install lamp-server^ -y
sleep 3

sudo mysql -u root -p"$MYSQL_PASSWORD" -e "CREATE DATABASE wp_db DEFAULT CHARACTER SET utf8;"
sudo mysql -u root -p"$MYSQL_PASSWORD" -e "CREATE USER 'wp_user'@'localhost' IDENTIFIED BY '$PASSWORD';"
sudo mysql -u root -p"$MYSQL_PASSWORD" -e "GRANT ALL PRIVILEGES ON wp_db.* TO 'wp_user'@'localhost';"
sudo mysql -u root -p"$MYSQL_PASSWORD" -e "FLUSH PRIVILEGES;"

sleep 5

sudo apt install php-curl php-gd php-intl php-mbstring php-soap php-xml php-zip php-xmlrpc php-mysql php-cli -y 
sleep 3

sudo wget -c http://wordpress.org/latest.tar.gz
sleep 3
sudo tar -xzvf latest.tar.gz 
sleep 3
sudo rsync -av wordpress/* /var/www/html
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
sudo rm /var/www/html/index.html

sudo systemctl restart apache2
