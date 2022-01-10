# SERVER SETUP

> Nice SSH client:"

[MonaXterm](https://mobaxterm.mobatek.net)

## Lamp Stack

### 1. Update System Software Packages
Open a terminal window and update the package repository before installing new software:

```Shell
sudo yum updateW
```

### 2. Install Apache

2.1. Install Apache Web Services with the command:

```Shell
sudo yum -y install httpd
```

Apache successfully installed on CentOS 8 server

### 3. Then, start the Apache service by running:

```Shell
sudo systemctl start httpd.service
```

> To verify Apache is running, open a web browser and navigate to the server’s public IP address. It should display the Apache Test Page, as in the image below.

`apache` is running on centos 8

_Note:_ For additional details, refer to our article on how to install Apache on CentOS 8.

### 4. Install MySQL

> The third layer of the LAMP stack is MySQL or MariaDB. Both are open-source database management systems used for storing and managing data on your website.

In this example, the tutorial includes a MySQL installation. Alternatively, you can install MariaDB.

#### 4.1 Start by adding the MySQL repository:

```Shell
rpm -ivh https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
```

#### 4.2 Check the repository by typing:

```Shell
sudo yum repolist all |grep mysql | grep enabled
```

The output should display a list of the different MySQL options available.
output of a list of MySQL repositories

### 5. Now, install MySQL

```Shell
sudo yum --disablerepo=AppStream install -y mysql-community-server
```

#### 5.1 Then, enable the MySQL service and set it to start on boot:

```Shell
sudo systemctl start mysqld
sudo systemctl enable mysqld
```

Check whether the service is running properly with the command:

```Shell
sudo systemctl status mysql
```

The output should display the service is active (running).

> Checking the MySQL status
_Note:_ To easily manage MySQL databases, admins often opt to install PHPMyAdmin.

### 6. Configure MySQL Security

The next step is to configure the basic MySQL security settings.

**6.1 Start by displaying the temporary MySQL root password:**

```Shell
cat /var/log/mysqld.log | grep -i 'temporary password'
```

The system displays the temporary MySQL password.
Prompt MySQL for temporary password to configure security.

**6.2 Next, run the command:**

```Shell
sudo mysql_secure_installation
```

Provide the MySQL root password received in the previous step.

**6.3 Then, enter and re-enter a new password, making sure it meets the standards for password strength.**

- After updating the password, you are prompted again to change the root password. To do so, type y and hit Enter.
- The output displays the estimated strength of the password. Press y to continue with the password provided.

Answer the rest of the questions with `y` and Enter:

Remove anonymous users? *(y)*
Disallow root login remotely? *(y)*
Remove test database and access to it? *(y)*
Reload privilege tables now? *(y)*
With this, `MySQL` is secured.

Output displaying you have successfully secured the MySQL database.
_Note:_ For an in-depth guide and additional instructions, please refer to How to Install MySQL on CentOS 8.

_Step 5:_ Install PHP and Supporting Modules
Set up the final layer by installing the PHP programming language and the supporting modules for phpMyAdmin:

```Shell
sudo yum -y install php php-pdo php-pecl-zip php-json php-common php-fpm php-mbstring php-cli php-mysqlnd wget upzip
```

PHP installed on `CentOS 8` as part of the lamp stack
Then, enable the `PHP` module to work with Apache by restarting the webserver:

```Shell
sudo systemctl restart httpd.service
```

### 6: Adjust the Firewall

If you have firewalld set up on CentOS, you need to adjust the configuration to allow Apache connections.

6.1 Open the firewall for HTTP traffic with the command:

```Shell
sudo firewall-cmd --permanent --zone=public --add-service=http
```

6.2. Next, adjust it to allow HTTPS traffic as well:

```Shell
sudo firewall-cmd --permanent --zone=public --add-service=https
```

6.3. Restart the firewall for the changes to take place:

```Shell 
sudo firewall-cmd --reload
```

6.4 Check to verify HTTP and HTTPS routes are now permanently open by running:

```Shell
sudo firewall-cmd --permanent --list-all
```

The output should display http and https in the list of services.
List open firewall routes

### 7. Test PHP with Apache

Apache creates a web root file in the default website directory `/var/www/html/`. To check whether PHP is set up properly by running a test from this directory.

7.1. Create a info.php file inside the directory:

```Shell
sudo vim /var/www/html/info.php
```

7.2 Then, add the following content:

```php
<?php
phpinfo ();
?>
```

7.3 Save and exit the file.

7.4 Now, verify if PHP is working correctly. Open a web browser and navigate to the URL (replacing ip_address with the public IP of the server):

```URL
http://ip_address/info.php
```

The browser should display the content, as in the image below.

Verification of PHP installation on centos 8

_Note:_ Want more details about this open-source software bundle? Refer to What is a `LAMP` stack?

**Conclusion**
You should now have a working installation of LAMP Stack on your CentOS 8 system.

__Next__, explore other stack alternatives such as the XAMPP stack or the MEAN stack.
