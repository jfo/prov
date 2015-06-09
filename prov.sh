#! /bin/bash

apt-get update
# install packages
apt-get -y install nginx-extras php5-fpm git
sudo apt-get -y install php5-common php5-cli mysql-server php5-mysql

rm -rf /home/ubuntu/wp
su - ubuntu -c git clone http://github.com/wordpress/wordpress /home/ubuntu/wp

cp ./wp /etc/nginx/sites-enabled/default
service nginx restart

# don't forget to create a database as root called "wordpress" in the mysql bits
