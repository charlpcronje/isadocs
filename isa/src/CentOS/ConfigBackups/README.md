# Linux Config and other backups

> he following is a list of directories that you must regularly back up and one that you should never back up. These directories are in no particular order.

## Backup with GIT

[Backup with GIT](https://ius.io/setup)
RHEL/CentOS 7

```shell
yum install \
https://repo.ius.io/ius-release-el7.rpm \
https://dl.fedoraproject.org/pub/epel/epel-relase-latest-7.noarch.rpm
```

## `/etc`

The /etc directory contains a system's configuration files. It includes the user file, the group file, the password file, networking information, most application configurations, startup files, filesystem information, mount points, and other system-wide configuration files. Without this directory, it will take you a very long time to put the system back to where it was before the outage or failure. Without a good backup of /etc, you will likely have to reinstall your system from media, reinstall all of your applications, and basically start fresh as you would with a new system.

## `/home`

All user `data`, `downloads`, `documents`, pictures, and miscellaneous files are kept in the `/home` directory under the user's name. For example, my home directory is `/home/khess`. For a user, there's no more important directory to back up on a system. Users assume that you'll include their personal files in your daily backups. You should do so. Trust my experience on this one. It's been said that good judgment comes from experience, and experience comes from poor judgment. This is true, and I have stories to prove it.

## `/root`

The root user's home directory is an important one to include in a backup. This directory is where you, the system administrator, keep downloads, configurations, scripts, notes, and other essential information that is often unique and irreplaceable.

## `/var`

The `/var` directory holds `databases`, `web` pages, `crontabs`, log files, and DNS zone files. Files in the` /var (variable) directory change and grow on a daily basis. Because of the data it holds, the /var directory will often have its own mount point on its own filesystem and its own disk or disk array.

## `/usr/local/bin`

The `/usr/local/bin` directory can be empty, or it can contain root-owned scripts or application executables that aren't part of the standard system executables list located in `/usr/bin` or `/usr/sbin`. If the directory is empty, I always create a `/usr/local/bin/`empty file to let me know that it has no files in it rather than thinking that my backup missed an entire directory's files. Yes, I'm OCD. Don't judge me.

## `/usr/local/sbin`

The `/usr/local/sbin` directory is important for the same reasons as `/usr/local/bin`. It too is often empty, and I also place a `/usr/local/sbin/empty` file in it to let me know its status.

## `srv`

The /srv directory is somewhat of an anomaly. It's used optionally for internet-related services files such as WWW uploads, FTP files, CVS, and so on. I always back it up, but I also place my standard `/srv/empty` file in it because it may be empty for the entire life of the system. Some sysadmins use it as a file `upload/download` directory for the aforementioned services, but its use is random and somewhat rare.

## `/opt`

The /opt directory is often used for third-party software or software that a sysadmin wants to keep separate from standard directories. I always install document management systems, `Webmin`, and other applications to it that I don't want occupying locations such as `/usr/local`. That's just a personal preference and you not required to do so. I find `/opt` is a good location to install software that I want to test, such as a new document management system or other application. If it's empty, I create my `/opt/empty file there.

## `Shared directories`

A shared directory might belong to a particular group, such as finance or human resources, that has special permissions. You definitely want to back up /finance, /data, or /hr if your system has such directories. Don't create these types of directories until you have a need. Shared directories are important to include in a backup because users store corporate data in them, and there may be no other copies.

## `NFS-mounted directories`

NFS-mounted directories should generally be excluded from your backup scheme. Why? Because these directories are mounted from remote systems. They can be in the same data center, or they could be from a system very far away. Over-the-network backups can be fine if you have a very fast network or a small volume of files. It's my recommendation that you do not back up over the network unless it's necessary. Back up this data from the local system that houses it. You don't want a network glitch to corrupt your backups and render your data useless

