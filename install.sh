#!/bin/bash
apt-get update -y
apt-get install apache2 mysql-server php5-mysql php5 libapache2-mod-php5 php5-mcrypt -y
apt-get install unzip wget -y

cd /var/www/html
rm -rf index.html
wget http://www.mediafire.com/file/gb8553mtmvpwef1/webroot.zip/file
unzip webroot.zip
rm -rf webroot.zip
cd .. 
chmod -R 777 html

mysql -uroot -p$spass -e "CREATE DATABASE gcpstory; CREATE USER 'gcpstory'@localhost IDENTIFIED BY 'gcpstory22'; GRANT ALL PRIVILEGES ON gcpstory.* TO 'gcpstory'@localhost; use gcpstory;"


/etc/init.d/apache2 restart
/etc/init.d/mysql restart

clear

echo "."
echo "."
echo "Completed"
echo "DB User: gcpstory"
echo "DB Name: gcpstory"
echo "DB Pass: gcpstory22"
echo "After installation, remove folder /installer/ manually"
