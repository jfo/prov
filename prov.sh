#! /bin/bash

# retrieve passenger key and add https support for apt
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
apt-get install apt-transport-https ca-certificates

echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main" > /etc/apt/sources.list.d/passenger.list
chown root: /etc/apt/sources.list.d/passenger.list
chmod 600 /etc/apt/sources.list.d/passenger.list

apt-get update

# install packages
apt-get -y install nginx-extras passenger php5-fpm ruby git

sed -i s/#\ passenger/passenger/g /etc/nginx/nginx.conf

rm -rf /home/ubuntu/rubykssinatra
git clone http://github.com/urthbound/rubykssinatra /home/ubuntu/rubykssinatra

gem install bundle

cd /home/ubuntu/rubykssinatra 
bundle install
cd -

pwd

cp ./rubykssinatra /etc/nginx/sites-enabled/default
service nginx restart









apt-get update
# install packages
apt-get -y install nginx-extras php5-fpm git
sudo apt-get -y install php5-common php5-cli mysql-server php5-mysql

rm -rf /home/ubuntu/wp
su - ubuntu -c git clone http://github.com/wordpress/wordpress /home/ubuntu/wp

cp ./wp /etc/nginx/sites-enabled/default
service nginx restart

# don't forget to create a database as root called "wordpress" in the mysql bits
