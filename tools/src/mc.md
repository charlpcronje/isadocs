# 6. Midnight Commander

GNU Midnight Commander is a free cross-platform orthodox file manager. It was started by Miguel de Icaza in 1994 as a clone of the then-popular Norton Commander. GNU Midnight Commander is part of the GNU project and is licensed under the terms of the GN

## 6.1 Install

```shell
sudo yum install mc 
```

## 6.2 Run Midnight Commander

```shell
mc
```

## Basic Instructions

- There are two columns, whatever command you run on the left will be done towards the the right
- At the bottom of the screen there are functions specified and they are numbered, 5 for example is copy
- If you are on a file and you press F5 it will copy the file to the other side, so with F6 Move, F8 Delete so it goes nowhere
- F4 Edit file
- F3 View file
- F10 Quit

And you can use you mouse!!

## 6.3 Source code

A list of the latest releases is available ​here. If you are interested in helping with the development please also have a look at our Git repository. In order to check out the repository tree use the following commands:

```shell
git clone git://github.com/MidnightCommander/mc.git
git clone https://github.com/MidnightCommander/mc.git (for those who are behind a firewall)
```

We also have an autosyncing Git mirror at ​repo.or.cz. It uses gitweb as the web-interface to Git and can therefore provide some information normally unavailable via Trac Git browser plug-in:

```shell
git clone git://repo.or.cz/midnight-commander.git
git clone http://repo.or.cz/r/midnight-commander.git (for those who are behind a firewall)
```

Download statistics are here: ​https://awstats.osuosl.org/list/ftp.midnight-commander.org

Documentation
At the moment, unfortunately, Midnight Commander lacks a comprehensive set of documentation covering its common features and various best practices. A project is under way to create such a documentation. Currently we are gathering various bits of information which would be later converted to a more suitable format (DocBook, ...?) in the wiki. Any help would be gladly appreciated.

Please check out the drafts of the documentation project.