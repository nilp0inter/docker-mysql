#!/usr/bin/env sh

# Start MySQL
/usr/bin/mysqld_safe > /dev/null 2>&1 &

# Create Database
mysql -uroot -proot -e "CREATE DATABASE develop"

# Create (unsafe) HelpSpot user, who can connect remotely
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* to 'develop'@'%' IDENTIFIED BY 'develop';"

# Shutdown MySQL
mysqladmin -uroot -proot shutdown
