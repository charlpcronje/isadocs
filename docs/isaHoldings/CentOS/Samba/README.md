# How to Install and Configure Samba on CentOS 8

## 1. Install samba and necessary packages

> Log into your server and run the command below to install Samba and its dependencies.

```shell  
    sudo dnf install samba samba-common samba-client
```

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/install-samba-using-dnf.png?ezimgfmt=ng%3Awebp%2Fngcb22%2Frs%3Adevice%2Frscb22-1)

We must also ensure that the Windows and Linux system are in the same workgroup. So, go to your Windows PC and launch command prompt. Type the command:

From the output, we can clearly see that the workstation domain points to ‘WORKGROUP’.This will also be configured later on the Linux machine.

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/net-config-windows-system.png?ezimgfmt=ng:webp/ngcb22)

## 2. Configuring Samba

> Having installed Samba, it’s time to make a few configurations. But before we do that, we need to back up the samba config file. So, run the command below:

```shell
sudo mv /etc/samba/smb.conf /etc/samba/smb.con.bak
```

Next, we are going to create a shared folder called shared and assign the necessary permissions and ownership as shown.

```shell
 sudo mkdir -p /srv/samba/shared
 sudo chmod -R 0755 /srv/samba/shared
 sudo chown -R nobody:nobody /srv/samba/shared
 sudo chcon -t samba_share_t /srv/samba/shared
```

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/samba-folder-selinux-rules-768x311.png?ezimgfmt=ng:webp/ngcb22)

Now create a new samba configuration file

```Shell
 sudo vim /etc/samba/smb.conf
```

Append the configuration below:

```Conf
[global]
workgroup = WORKGROUP
server string = Samba Server %v
netbios name = centos-8
security = user
map to guest = bad user
dns proxy = no

[Anonymous]
path = /srv/samba/shared
browsable =yes
writable = yes
guest ok = yes
read only = no
```

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/anonymous-samba-share-centos8-768x328.png?ezimgfmt=ng:webp/ngcb22)

Save and close the configuration file. To verify that the configuration is sound, run __testparm__ command

```Shell
testparm
```

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/testparm-samba-centos8-768x473.png?ezimgfmt=ng:webp/ngcb22)

## 3. Allow samba service on the firewall

> Next, allow Samba across the firewall so that outside users can access samba shares.

```Shell
sudo firewall-cmd --add-service=samba --zone=public --permanent
sudo firewall-cmd --reload
```

## 4. Start and enable Samba services

```Shell
sudo systemctl start smb
sudo systemctl enable smb
```

> Then confirm if smb service is running:

```Shell
sudo systemctl status smb
```

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/nmb-service-status-centos8-768x315.png?ezimgfmt=ng:webp/ngcb22)

## 5. Accessing Samba share from windows machine

> From your Windows PC, press Windows Key + R to launch the Run dialog and type

`\\hostname-of-samba server`

OR

`\\IP-address-of-samba-server`

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/run-samba-share-windows.png?ezimgfmt=ng:webp/ngcb22)

This opens a window below with an ‘Anonymous’ folder.

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/anonymous-samba-share-windows.png)

You can create files either from Samba server or from the client and share it with other users

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/create-folder-files-samba-share-768x153.png?ezimgfmt=ng:webp/ngcb22)

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/Files-anonymous-samba-share.png)

## Creating secure shares in Samba

```Shell
sudo groupadd secure_group
```

Then we shall add a new user to the newly created group

```Shell
sudo useradd -g secure_group linuxuser
```

Next, we are going to create a new secure folder and later assign the necessary permissions and file ownership as shown below .

```Shell
sudo mkdir -p /srv/samba/secure_share
sudo chmod -R 0770 /srv/samba/secure_share
sudo chcon -t samba_share -p /srv/samba/secure_share
sudo chown -R root:secure_group /srv/samba/secure_share
```

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/Secure-Samba-permissions-selinux-768x207.png?ezimgfmt=ng:webp/ngcb22)

Next, we will assign the samba user a password that will be used when accessing the secured file share. This will prompt you to provide a SMP password and later confirm it.

```Shell
sudo smbpasswd -a linuxuser
```

![shell]((https://www.linuxtechi.com/wp-content/uploads/2020/02/smbpasswd-user-centos8.png?ezimgfmt=ng:webp/ngcb22)


Now let’s head back to Samba’s configuration file

```Shell
sudo vim /etc/samba/smb.conf
```

Append the config lines shown below:

```Conf
[secured]
path = /srv/samba/secure_share
valid users = @secure_group
guest ok = no
writable = yes
browsable = yes
```

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/secure-samba-share-smb-conf-centos8.png?ezimgfmt=ng:webp/ngcb22)

Save & exit and then restart Samba service

```Shell
sudo systemctl restart samba
```

### Accessing the Samba secure folder from a Windows System

Again, to access Samba share from your windows system hit **Windows Key + R** to launch the **Run** dialogue. Type `\\hostname` or `\\ samba-IP` and hit **ENTER**.

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/run-secure-samba-share-windows.png?ezimgfmt=ng:webp/ngcb22)

You’ll now notice that we have another folder called secured.

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/Secure-Samba-Share-Windows-768x501.png?ezimgfmt=ng:webp/ngcb22)

To access it, double click on it and a login pop-up will prompt you for your username and password credentials.

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/Credentials-Secure-Samba-Windows-768x452.png?ezimgfmt=ng:webp/ngcb22)

Once done, click on the **OK** button or simply hit ENTER to access the contents of the folder

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/Files-Secure-Samba-Share-Windows-768x501.png?ezimgfmt=ng:webp/ngcb22)

## Accessing the Samba secure folder from a Linux machine

To access the shared directories from a Linux system, simply run the command:

```Shell
smbclient --user=linuxuser -L //192.168.43.13
```

Provide the password when prompted and hit ENTER

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/Smbclient-samba-share-list-linux.png?ezimgfmt=ng:webp/ngcb22)

To access the secure share run

```Shell
smbclient //192.168.43.13/secured -U linuxuser
```

![shell](https://www.linuxtechi.com/wp-content/uploads/2020/02/smbclient-access-secure-samba-share-linux-768x338.png?ezimgfmt=ng:webp/ngcb22)

Feel free to create files and directories to share with other samba users.