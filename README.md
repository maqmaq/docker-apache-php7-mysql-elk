# Symfony3 PHP7 Apache Mysql WebApp skeleton

Includes:
* Apache
* PHP 7.1
* MariaDB
* ELK

# How to run it:

- Clone repository
```
git clone git@github.com:maqmaq/docker-apache-php7-mysql-elk-symfony.git
```
- Put your Symfony 3 application into symfony/www directory

- Build docker containers (assumed, that phing is installed)
```
phing docker:local:build
```
- Run docker containers
```
phing docker:local:up
```

# How to test it:

- Application is available at
```
http://localhost:8080
```

- ELK is available at
```
http://localhost:8080
```
