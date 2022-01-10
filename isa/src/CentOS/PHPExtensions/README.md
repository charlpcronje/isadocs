# Extensions

## PHP-mbstring [Website](https://linuxconfig.org/install-php-mbstring-on-redhat-8)

### How to Install PHP-mbstring on RHEL 8 / CentOS 8

PHP-mbstring is used by a ton of popular applications, including WordPress. Installing it on RHEL 8 / CentOS 8 isn’t as straightforward is it probably should be, but it’s definitely not difficult.

The easiest and recommended way to install PHP-mbstring on RHEL 8 / CentoOS 8 is to dnf command and perform the php-mbstring package installation from a standard RHEL 8 / CentoOS repository. You can also install it directly from the Remi repository, which provides tons of other great PHP packages.

- How to Install PHP-mbstring from the RHEL 8 / CentOS 8 Repository
- How to Install PHP-mbstring from the Remi Repository
  
![Install PHP mbstring on RHEL 8 / CentOS 8](https://linuxconfig.org/wp-content/uploads/2019/04/rhel8-mbstring-feat.jpg)
  
### How to Install PHP-mbstring from the RHEL 8 Repository

The simplest and perhaps the recommended way to install PHP-mbstring on RHEL 8 is to install it from a standard RHEL repository:

```Shell
 # dnf install php-mbstring
```

### How to Install PHP-mbstring from the Remi Repository

#### Install the Remi Repository

While mbstring is available in the main RHEL repositories as php-mbstring the most flexible way to get mbstring on RHEL 8 that affords you the most choice, is to use the Remi repo. If you aren’t already familiar, Remi has been around for a long time, providing up-to-date PHP packages for RHEL and CentOS. As such, it’s earned a solid reputation and the trust of the community.

![iMAGE](https://linuxconfig.org/wp-content/uploads/2019/04/rhel8-add-remi.jpg)
The repository is provided in the form of a convenient RPM. You can install it directly from the Remi website with DNF. Go ahead and install it.

```Shell
# dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm   
```

Confirm the install when you’re asked.

#### Install PHP-mbstring

![Image](https://linuxconfig.org/wp-content/uploads/2019/04/rhel8-install-mbstring.jpg)

Now that you have the Remi repository, you can go ahead and install PHP-mbstring. You do have one choice to make; which version of PHP do you want? Remi has all current versions of PHP. You can pick any one of them. This guide is going to use PHP 7.2, but substitute whichever number you’d prefer.

```Shell
# dnf install php72-php-mbstring
```

## PHP DOM Extension [Website](http://smartwebdeveloper.com/centos/install-the-php-dom-extension-on-centos)

Here we cover the fastest, most effective way to get the PHP DOM extension installed on CentOS. If you’ve just found out you need to install this extension, but don’t really know what it is, we’ve included some background first.

_What is DOM?_
“The Document Object Model (DOM) is a cross-platform and language-independent convention for representing and interacting with objects in HTML, XHTML and XML documents.” (Source: DOM in Wikipedia.)

_What is PHP DOM extension?_
“The DOM extension allows you to operate on XML documents through the DOM API with PHP 5.” (Source: Introduction to the PHP DOM Extension on php.net.)

_How to install the PHP DOM Extension on CentOS_
You will need superuser privileges. Run the following command:

```Shell
sudo yum install php-xml
```

> Don’t forget to restart Apache so PHP picks up the new extension:

```Shell
sudo service httpd restart
```

How to Check PHP DOM is Installed

> You can see PHP DOM is installed by creating a simple web page that calls the phpinfo() function:

```PHP
<?php phpinfo(); ?>
```

> When you go to this webpage in a browser, you should see this output for the dom extension if it’s installed: