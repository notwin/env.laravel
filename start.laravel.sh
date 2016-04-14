#!/bin/bash

cd ~/workspace
composer create-project laravel/laravel la dev-master
mv la/* ./
chmod -R 0777 ./storage
mv ./env.laravel/laravel.env ./.env
php artisan key:generate
ln -s -b  ~/workspace/public /var/www/html

sed -i "s/www-data/$(whoami)/g" /etc/apache2/envvars
chown $(whoami):$(whoami) /home/$(whoami)/workspace -R
a2enmod rewrite
source /etc/apache2/envvars
tail -F /var/log/apache2/* &
service apache2 start


