#!/bin/bash

cd ~/workspace
composer create-project laravel/laravel la dev-master
mv la/* ./
chmod -R 0777 ./storage
mv ./env.laravel/laravel.env ./.env
mysql -uroot -proot -e"create database laravel_db;" 
php artisan key:generate
ln -s -b  ~/workspace/public /var/www/html

sudo php5enmod mcrypt
sudo service apache2 restart

