# 1.1 Setup pulse dev server

- [Creating pulse dev environment](#creating-pulse-dev-environment)
  - [1. Creating pulse server](#1-creating-pulse-server)
  - [2. Server Configuration](#2-server-configuration)
  - [2. Installing pulse with ISO image](#2-installing-pulse-with-iso-image)
    - [2.1 Device configuration - Networking](#21-device-configuration---networking)
    - [2.2 Device configuration - IP Settings](#22-device-configuration---ip-settings)
    - [2.3 Device configuration - DNS configuration](#23-device-configuration---dns-configuration)
    - [2.4 Device configuration - TP configuration](#24-device-configuration---tp-configuration)
  - [3. Server Authentication](#3-server-authentication)
    - [3.1 Add User](#31-add-user)
  - [4. Shared Folders](#4-shared-folders)
    - [4.1 Setup Samba Access](#41-setup-samba-access)
  - [5. Database](#5-database)
    - [5.1 Remove local database access only](#51-remove-local-database-access-only)
    - [5.2 Add Remote Access to Database](#52-add-remote-access-to-database)
  - [6. Initiate Pulse Server](#6-initiate-pulse-server)
    - [6.1 Update Samba Config](#61-update-samba-config)
  - [6.2 Get copy of code](#62-get-copy-of-code)

## 1. Creating pulse server

- Configuration: `Typical`
- Name and Location: `pulsedev-charl`
- Storage: N/A
- Guest Operating System: 
  - Linux
  - CentOS 6 (64 bit)
- Network: N/A
- Create a Disk
  - Datastore: datastore1
  - Virtual disk size: 50GB
  - Thin Provision

## 2. Server Configuration

> Click on edit virtual machine settings before completion

- Memory: 4GB
- CPUs (adding)
- Number of virtual sockets: 2
- Datastore ISO file (Choose pulse ISO image from datastore)

> Settings complete

- Click on connect at power
- Click on finish and power your new box
- Click on the checkbox and click “Yes discard any data”

## 2. Installing pulse with ISO image

- Install or upgrade an existing system.
- Network configuration.

### 2.1 Device configuration - Networking

> eth0 (eth0) Change only the following

### 2.2 Device configuration - IP Settings

- Static IP: `192.168.9.27`
- Netmask: `255.255.255.0`
- Default gateway IP: `192.168.9.1` (Current firewall IP)
- Primary DNS server: `192.168.88.10`

### 2.3 Device configuration - DNS configuration

- Hostname: `pulsedev-charl.dev.isa.co.za`
- Primary DNS: `192.168.88.10`
- DNS search path: `isa.co.za`

### 2.4 Device configuration - TP configuration

- Primary server: `192.168.88.10`
- SMTP configuration: `lancelot.isa.co.za`

## 3. Server Authentication

### 3.1 Add User

> Add a new user account and group
Run the following commands

```shell
& Add a "dev" group 
$ groupadd dev
& Add a user, adding to dev group 
$ useradd -G dev charl
& Change password 
passwd charl
```

> You should now be able to SSH to the machine

## 4. Shared Folders

### 4.1 Setup Samba Access

Run the following commands

```shell
& Check that samba is installed
$ rpm -qa | grep samba
& Add samba user and configure password
$ smbpasswd -a charl
& Start samba 
$ service smb start
& Ensure samba is started automatically
$ chkconfig smb on
```

> You should now be able to samba to the machine

## 5. Database

> make Database accessible  from windows

### 5.1 Remove local database access only

Comment out bind-address config in `/etc/my.cnf`
Restart MySQL `service mysqld restart`

### 5.2 Add Remote Access to Database

Allow access from remote PC, run the following commands

```shell
$ `mysql`
grant all on *.* to 'charl'@'192.168.2.145'; // Your windows pc IP;
grant all on *.* to 'charl'@'192.168.9.23'; // Your Server IP;
```

## 6. Initiate Pulse Server

- Install Pulse by running `/var/local/mss/install/pulse_init.sh`
- Rename old code base `Pulse: mv /opt/pulse /opt/pulse_enc`
- Create a new code base dir Pulse: `cd /opt`; `mkdir pulse`; `chown charl:dev pulse`; `chmod 775 pulse`;)
- Create a symlink in home dir to the new code base directory (Pulse: `ln -s /opt/pulse/` `/home/jason/code`
- Modify samba configuration `/etc/samba/smb.conf` (add the following in `['global']`):

### 6.1 Update Samba Config

nano /etc/samba/smb.conf

```conf
follow symlinks = yes
wide links = yes
unix extensions = no
```

## 6.2 Get copy of code

- Open Samba share on Windows `\\192.168.8.23\code\public_html` and check out the trunk
- Create directories `srv/www/public_html` in `/opt/pulse/`
- Move contents from legacy `public_html` to new `public_html` 

```Shell
$ mv /opt/pulse/public_html/* /opt/pulse/srv/www/public_html/
& Done
$ rmdir /opt/pulse/public_html
& Folder not empty Error
```

> I got an error stating the folder's not empty. When I checked it did seem empty but the hidden .svn folder still existed

```Shell
$ rm -R -f /opt/pulse/public_html 
& Now the folder is gone
```

> Run the following commands

```Shell
$ rmdir /opt/pulse/backups
& Folder not found
$ rmdir /opt/pulse/server/data
& Folder not found
$ cp -p /opt/pulse_enc/server/sitename /opt/pulse/server/sitename
& Folder not found
```

Symbolic links need to be re-created. This can be done by running the following command in `/opt/pulse_enc:` 

```shell
$ find . -type l -exec cp -d '{}' ../pulse/'{}' \;

& cp: cannot overwrite directory `../pulse/./public_html/public_html` with non-directory
& cp: cannot create symbolic link `../pulse/./server/reports/backup`: No such file or directory
& cp: cannot create symbolic link `../pulse/./server/reports/libraries`: No such file or directory
& cp: cannot create symbolic link `../pulse/./server/reports/images`: No such file or directory
& cp: cannot create symbolic link `../pulse/./server/reports/temp`: No such file or directory
& cp: cannot create symbolic link `../pulse/./server/data`: No such file or directory
& cp: cannot create symbolic link `../pulse/./srv/www/public_html/reports/images`: No such file or directory
& cp: cannot create symbolic link `../pulse/./srv/www/public_html/reports/temp`: No such file or directory
& cp: cannot create symbolic link `../pulse/./srv/www/public_html/libraries/MPDF45`: No such file or directory
& cp: cannot create symbolic link `../pulse/./log/log`: No such file or directory
```
