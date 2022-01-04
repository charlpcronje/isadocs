# Network Config

The easiest way is to use the GUI Aki7lol

```shell
system-config-network

service network restart
```

For communication between VirtualBox and Windows, set the network device to bridged mode in VirtualBox Settings.
This will cause the virtual machine to be seen as just another device on the network and the DHCP will assign it an IP Address

If you are working with a cloned device you will need to set the Device Mac address to the address of the device as it is specified in VirtualBox
