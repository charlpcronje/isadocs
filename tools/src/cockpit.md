# 1. Cockpit Server Control

Cockpit is a Web based server management tool available for CentOS and RHEL systems, recently CentOS 8 and RHEL 8 are released where cockpit is kept as default server management tool. Its package is available in the default CentOS 8 and RHEL 8 package repositories. Cockpit is a useful Web based GUI tool through which sysadmins can monitor and manage their Linux servers, it can also used to manage networking and storage on servers, containers, virtual machines and inspections of system and application's logs.

## 1.1 Installation

Execute the following dnf command

```shell
dnf install cockpit -y
```

Run the following command to enable and start cockpit service,

```shell
systemctl start cockpit.socket
systemctl enable cockpit.socket
```

Allow Cockpit ports in OS firewall using following command,

```shell
firewall-cmd --permanent --add-service=cockpit
firewall-cmd --reload
```

Verify whether cockpit service is up and running or not, execute the following commands,

```shell
systemctl status cockpit.socket
 -tunlp | grep cockpit
ps auxf|grep cockpit
```

cockpit-status-centos8-rhel8

## 1.1 Accessing Cockpit

As we can see in above command's output that cockpit is listening on tcp port 9090

[https://191.168.9.55:9090](https://192.168.9.55:9090)

## 1.3 Cockpit Login

Use the user name which has admin rights, or we can also use the root user's credentials to login. In case you want to assign admin rights to any local user, execute the following command,

```shell
usermod -G wheel cp
```

here `cp` is my local user,

Once you enter the user's credentials, choose `Reuse my password for privileged tasks` and then click on `Log In` option after that we will get following screen

## 1.4 Cockpit Dashboard

On the Left-hand side bar, we can see what things can be monitored and configured via cockpit GUI,

Let's assume if you wish to check whether there are any updates available for your CentOS 8 / RHEL 8 system, click on `System Updates` option,

## 1.5 Software Updates

To Install all updates, click on `Install All Updates`

If wish to modify networking and want to add Bond interface and Bridge, then click on `Networking`

## 1.6 Networking Dashboard

As we can in above window, we have the options to create Bond interface, Bridge and VLAN tagged interface.

Let's assume we want to create a bridge as `br0` and want to add enp0s3 as port to it, click on `Add Bridge` option,

Specify the bridge name as `br0` and port as `enp0s3` and then click on apply

## 1.7 Add Bridge

In the next screen we will see that our bridge is active and got the same IP as of enp0s3 interface,

## 1.8 Bridge Details

If you wish to inspect system logs then click on `Logs` options, there we can view logs based on their severity
