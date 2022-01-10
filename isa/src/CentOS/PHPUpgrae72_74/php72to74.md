# How to Install PHP 7.x on CentOS 8

1. Open the terminal app and log in to the remote CentOS 8 server
2. Update CentOS 8 box, run `sudo yum update`
3. Search for PHP version, run `sudo yum search php`
4. Install and enable Remi’s repo for PHP 7.4, `run sudo yum install yum-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm`
5. Install PHP 7.2.11 or 7.4 and FastCGI module for Nginx on CentOS 8, execute: `sudo yum install php php-fpm`
6. Search and install additional PHP modules for graphics and database support using `sudo yum search php-`
7. Enable and restart both PHP and Nginx server
8. Test and verify both PHP installation
9. Let us see all commands in details.

## Step 1 – Updating the CentOS 8 box.

```shell
sudo yum update
sudo reboot
```

## Step 2 – Searching for PHP version on CentOS 8

>Let us find out PHP version on CentOS Enterprise Linux 8 server, execute:

```shell
sudo yum search php-
```

You may have multiple versions of PHP installed on your systems. One can verify it by merely running the following command:

```shell
sudo yum module list php
```

The following example, indicates that PHP version 7.2, 7.3 and 7.4 available for installation:

```shell
sudo yum module list php
```

By default, PHP version 7.2 would install as indicated by the [d] flag.

### A note about enabling different versions of PHP such as 7.3 and 7.4 on CentOS 8

I strongly suggest using default PHP version 7.2 for production web apps. However, if you need PHP version 7.3 or 7.4, type the following commands to enable Remi’s repo:

```shell
sudo yum install yum-utils http://rpms.remirepo.net/enterprise/remi-release-8.rp
```

Enable default version

he default PHP version locked to PHP 7.2. It would be best if you ran enable command to set the desired PHP version. In other words, to enable PHP version 7.4, run:

```shell
sudo yum module list php
sudo yum module reset php
sudo yum module enable php:remi-7.4
## verify it php set to 7.4 ##
sudo yum module list php
```

For PHP version 7.3, execute:

```shell
sudo yum module list php
sudo yum module reset php
sudo yum module enable php:remi-7.3
## verify it php set to 7.3 ##
sudo yum module list php
```

## Step 3 – Installing PHP on CentOS 8

>Now that PHP version set, it is time to install PHP 7.x on your CentOS 8 cloud server by typing the following command:

```shell
sudo yum install php php-fpm
```

It is time to verify and check PHP version, type:

```shell
php -v
php --version
```

### Enable php-fpm service

```shell
sudo systemctl enable php-fpm.service
```

Start the php-fpm service, run:

```powershell
sudo systemctl start php-fpm.service
sudo systemctl status php-fpm.service
```

See how to reload/start/restart PHP-fpm service for more info:

```shell
sudo systemctl stop php-fpm.service
sudo systemctl restart php-fpm.service
```
