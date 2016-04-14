#!/bin/bash

cd ~/workspace
composer create-project october/october cms dev-master
mv cms/* ./
chmod -R 0777 ./storage
mv ./env.laravel/october.htaccess ./.htaccess
mv ./env.laravel/october.mysql.config ./config/dev/database.php
php artisan key:generate
php artisan october:up
php artisan october:util compile assets


sed -i "s/www-data/$(whoami)/g" /etc/apache2/envvars
chown $(whoami):$(whoami) /home/$(whoami)/workspace -R
a2enmod rewrite
source /etc/apache2/envvars
tail -F /var/log/apache2/* &
service apache2 start
