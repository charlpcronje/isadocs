# Navicat Trail Reset

> Instructions to reset Navicat trail version
- https://www.fatalerrors.org/a/navicat12-unlimited-trial-windows64-linux-mac.html


## Navicat12 unlimited trial (Windows64, Linux, Mac)

In the past, I used to use Navicat to operate the database, which made me feel good
Windows directly Baidu cracked version with the very cool
However, it didn't last long. In May this year, I changed to Ubuntu as a developer
Although the Linux version is the Windows version of wine running, but because of going to work, they began to distrust the cracked version from unknown sources
Then he began to wrestle with cracking. Later, he found that it was still easier to reset the probation period, and then he tried it indefinitely
Until recently, I changed my Mac...

## Linux

Under Linux, Navicat is started through a script, so it is easy to insert a script before running, which can reset the trial period
Note that the script is Python 3, and each run will reset the trial period to 14 days, requiring 64 bit version of Navicat
Insert it before the Navicat startup script

```shell
#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import os
import re

# Try time reset regularization
ps = (
        re.compile(r'\[Software\\\\PremiumSoft\\\\Data\\\\\{[^\}]*\}\\\\Info\].*?\n[^\[]*'),
        re.compile(r'\[Software\\\\Classes\\\\CLSID\\\\\{[^\}]*\}\\\\Info\].*?\n[^\[]*')
    )

# user.reg  The path of
regfile = os.path.join(os.environ['HOME'], '.navicat64', 'user.reg')

# Regular substitution
with open(regfile, 'r+') as f:
    regstr = f.read()
    for p in ps:
        regstr = p.sub(lambda m: '', regstr)

    f.seek(0, 0)
    f.truncate()
    f.write(regstr)
```

## Mac

Mac cracking is a little more troublesome, you need to delete several files, and modify the contents of a plist file
The automation script is as follows:

```shell
#!/bin/bash
# -------------------------------
# Reset Navicat trial period
# Only applicable to 12.1. For other versions, please modify Part 121 of the bottom lines
# -------------------------------

# Navicat
echo "reset Navicat..."
rm -fv ~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat*/Navicat*/.etc* 2>/dev/null
rm -fv ~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat*/Navicat*/.tc* 2>/dev/null
rm -fv ~/Library/Caches/com.prect.Navicat*/.tc* 2>/dev/null
rm -fv ~/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat*/Navicat*/.afksopoorn* 2>/dev/null
plutil -replace ptc121 -string $(date -u +%Y%m%d) ~/Library/Preferences/com.prect.NavicatPremium*.plist
plutil -replace ptcl121 -string $(date -u +%Y%m%d) ~/Library/Preferences/com.prect.NavicatPremium*.plist
plutil -replace afksopoorn121 -string $(date -u +%Y%m%d) ~/Library/Preferences/com.prect.NavicatPremium*.plist
```

## Windows

Because of the registry used by Windows, I feel a little troublesome. In addition, I don't use Windows myself, so it's easy

```cmd
Navicat off
Win + R, enter regedit, enter
Delete HKEY_CURRENT_USER\Software\PremiumSoft\Data
Expand HKEY_CURRENT_USER\Software\Classes\CLSID
Expand each subfolder. If it contains only one folder named Info, delete it
```