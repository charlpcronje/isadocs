# CentOS 8

## 1. Install ISO on VM

> Some of the closest mirror
[http://ftp.is.co.za/mirror/centos/8.4.2105/isos/x86_64/](http://ftp.is.co.za/mirror/centos/8.4.2105/isos/x86_64/)
[http://mirror.hostafrica.co.za/centos/8.4.2105/isos/x86_64/](http://mirror.hostafrica.co.za/centos/8.4.2105/isos/x86_64/)
[http://www.ftp.saix.net/linux/distributions/centos/8.4.2105/isos/x86_64/](http://www.ftp.saix.net/linux/distributions/centos/8.4.2105/isos/x86_64/)
[http://mirror.wiru.co.za/centos/8.4.2105/isos/x86_64/](http://mirror.wiru.co.za/centos/8.4.2105/isos/x86_64/)
[http://centos-mirror.datakeepers.co.za/8.4.2105/isos/x86_64/](http://centos-mirror.datakeepers.co.za/8.4.2105/isos/x86_64/)
[http://mirror.ufs.ac.za/centos/8.4.2105/isos/x86_64/](http://mirror.ufs.ac.za/centos/8.4.2105/isos/x86_64/)

You only need the one ISO: `CentOS-8.4.2105-x86_64-dvd1.iso`

Set the Network to Bridged mode
> When network adaptor is set to bridged mode then the VM will join the main network and receive it's own IP Address

## 2. How To Enable Copy Paste (Shared Clipboad)

**2.1 Prerequisite.**

- First, you should start the virtual machine.
- Then click Devices —> Insert Guest Additions CD image… menu item to install the VirtualBox Guest Additions software in your virtual machine OS.
- If you meet an error during the above process, you can read the article How To Resolve VirtualBox Guest Additions: Kernel - Headers Not Found For Target Kernel Error to learn how to fix it.
**2.2 Enable Copy & Paste ( Share Clipboard ) Between Oracle VirtualBox Virtual Machine And Host Machine Steps.**

2.2.1 Right-click the virtual machine in VirtualBox.
2.2.2 Then click `Settings…` menu item in the popup list.
2.2.3 Then click the `Advanced` tab in the `General` settings window.
2.2.4 Select `Bidirectional` item in the `Shared Clipboard` drop-down list.
2.2.5 You can also select the Bidirectional item in the `Drag’n Drop` drop-down list.
2.2.6 You can also click `Devices —> Shared Clipboard —> Bidirectional` , `Devices —> Drag and Drop —> Bidirectional` menu item to configure above settings.

## 3. Configure SSH 

```shell
/etc/ssh/sshd_config
```

Uncomment the line, `# Port 22`

## 4. Configure Firewall

firewall-cmd --add-port=22/tcp --permanent
firewall-cmd --reload

## 5. Restart SSHD Deamon

```shell
systemctl restart sshd
```

## 6. Composer Install

```shell
sudo dnf install php-cli php-json php-zip wget unzip
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer -V
```

## 7. Setup Samba

```shell
nano /etc/samba/smb.conf
```

```conf
# See smb.conf.example for a more detailed config file or
# read the smb.conf manpage.
# Run 'testparm' to verify the config is correct after
# you modified it.

[global]
    workgroup = HOME
    security = user
    hosts allow = 127.192.0.0/24
    passdb backend = tdbsam

[Private]
    comment = needs username and password to access
    path = /var/www/
    browseable = yes
    guest ok = yes
    writable = yes
    # valid users = @samba
```

## 8. Disable SELinux

```shell
/etc/selinux/config
```

Locate the following line:

```conf
SELINUX=enforcing
```

Change the value to disabled:

```conf
SELINUX=disabled
```

Save your changes and close the file.
>On the next reboot, SELinux is permanently disabled. To dynamically disable it before the reboot, run the following command:

```shell
setenforce 0
```

## 9. Open port 80 and 443

> CentOS 8 open HTTP port 80 and HTTPS port 443 step by step instructions
Check the status of your firewall.

```shell
firewall-cmd --state
```

> Retrieve your currently active zones. Take a note of the zone within which you wish to open ports 80 and 443:

```shell
firewall-cmd --get-active-zones
```

```shell
libvirt
  interfaces: virbr0 
public
  interfaces: enp0s3
```

>Open port 80 and port 443 port.
>The port 80 and port 443 ports are listed with Firewalled as http and https services. To temporarily open both ports execute:

```shell
firewall-cmd --zone=public --add-service=http
firewall-cmd --zone=public --add-service=https
```

Note, the above firewald commands will open HTTP and HTTPS port only temporarily.

Open port 80 and port 443 port permanently. Execute the below commands to open both ports permanently, hence, make the settings persistent after reboot:

```shell
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --reload
```

Check for open ports/services. The services with permanently open ports are listed on line starting with services::

```shell
firewall-cmd --list-all
```

```conf
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: enp0s3
  sources: 
  services: cockpit dhcpv6-client http https ssh
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules:
```

In case you need to close the previously open HTTP port 80 and HTTPS port 443 execute:

```shell
firewall-cmd --zone=public --permanent --remove-service=http
firewall-cmd --zone=public --permanent --remove-service=https
firewall-cmd --reload
```
