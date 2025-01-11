#!/bin/bash

$PASSWORD = q1w2e3r4t5y6
$MYSQL_PASSWORD = root
$IP = icanhazip=`wget -q -4 -O- http://icanhazip.com`

sudo apt update -y
sleep 3
sudo apt install lamp-server^ -y
sleep 3
sudo mysql -u root -p 
$MYSQL_PASSWORD 
sleep 3
create database wp_db default character set utf 8 ;
sleep 3
create user 'wp_user'@'localhost' identified by '$PASSWORD'
sleep 3
grant all on wp_db.* to 'wp_user'@'localhost';
sleep 3
flush privileges;
exit
sleep 5
sudo apt install php-curl php-gd php-intl php-mbstring php-soap php-xml php-zip php-xmlrpc php-mysql php-cli -y 
sleep 3
sudo wget -c http://wordpress.org/latest.tar.gz
sleep 3
sudo tar -xzvf latest.tar.gz 
sleep 3
sudo rsinc -av wordpress/* var/www/html
sudo chown -R www-data:www:data /var/www/html
sudo chmod -R 755 /var/www/html
sudo rm /var/www/html/index.html