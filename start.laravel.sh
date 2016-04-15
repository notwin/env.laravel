#!/bin/bash

cd ~/workspace
composer create-project laravel/laravel la dev-master
mv la/* ./
rm -rf la
chmod -R 0777 ./storage
mv ./env.laravel/laravel.env ./.env
mysql -uroot -proot -e"create database laravel_db;" 
php artisan key:generate
sudo rm /var/www/html
sudo ln -s ~/workspace/public /var/www/html

sudo php5enmod mcrypt
sudo service apache2 restart

git config --global user.email "$(whoami)@gmail.com"
git config user.name "$(whoami)" 

git init 
mv ./env.laravel/laravel.gitignore ./.gitignore
git add . 
git commit -a -m 'init'
