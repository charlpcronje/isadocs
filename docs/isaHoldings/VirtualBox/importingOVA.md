# Importing OVA into Virtual Box

For communication between VirtualBox and Windows, set the network device to bridged mode in VirtualBox Settings.
This will cause the virtual machine to be seen as just another device on the network and the DHCP will assign it an IP Address

1. ## Networking

If you are working with a cloned device you will need to set the Device Mac (HWADDR) address to the address of the device as it is specified in VirtualBox

```shell
nano /etc/sysconfig/network-scripts/ifcfg-eth0
HWADDR=08:00:27:1e:30:2d
```

Then you can set the rest in the GUI

```shell
su -
Password: Aki7lol
system-config-network
set to DHCP
service network restart
ifconfig
```

After running ifconfig you will receive the IP address assigned to the VM

1. ## To be able to access the db from your PC

Run Command:

```shell
mysql -uroot
```

```mysql
grant all on *.* to 'root'@'192.168.50.49';
```
