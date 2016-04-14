#!/bin/bash

cd ~/workspace
composer create-project october/october cms dev-master
mv cms/* ./
chmod -R 0777 ./storage
mv ./env.laravel/october.htaccess ./.htaccess
mv ./env.laravel/laravel.env ./.env
mv ./env.laravel/october.mysql.config ./config/dev/database.php
mysql -uroot -proot -e"create database october;" 
php artisan october:up
php artisan october:util compile assets

sudo rm /var/www/html
sudo ln -s -b  ~/workspace /var/www/html

sudo php5enmod mcrypt
sudo service apache2 restart
