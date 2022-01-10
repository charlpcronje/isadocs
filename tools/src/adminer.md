# 7. Adminer SQL Client

Adminer is a tool for managing content in MySQL databases. Adminer is distributed under Apache license in a form of a single PHP file. Its author is Jakub Vrána who started to develop this tool as a light-weight alternative to phpMyAdmin, in July 2007. Wikipedia

## 7.1 Installation

Just download the one PHP file, put it in a Virtual host and done

## 7.2 Downloads

Adminer 4.8.1 (.php, 465 kB), [English only](https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php) (.php, 310 kB)

## 7.3 Plugins - I'm running one plugin

- This plugin is for when you DB User has no password, then Adminer can't actually log in, this plugin creates an Auth and not using the DB for that Auth
- [login-password-less](https://raw.githubusercontent.com/vrana/adminer/master/plugins/login-password-less.php): Enable login without password - [example](https://github.com/vrana/adminer/blob/master/adminer/sqlite.php)
