# ISA Dev Tools - Getting Started

> *The Dev Helpers can be remotely included from the dev-tools server on 192.168.9.101 or dev-tools.isa.co.za (Pending Approval and DNS Entry) by adding the following to the file*
The above is no longer the best way. A way to get the devTools included but without touching the code:

```shell
    nano /etc/httpd/conf/httpd.conf
```

Where is says `AllowOverride none`, change that so that it says `AllowOverride All`, save (CTRL O) and exit (CTRL X)
Copy .htaccess file that is located in the `tools/system` folder to the root of the project you are editing. Now all traffic will be routed to `/tool/system/prepend.php`
This will add the dev-tools to the execution of the code, them the prepend script will include the file that was supposed to opened in the first place.

/** THE REST IF THE FILE NEED TO BE REVISED **/

```php
    include('https://192.168.9.101/init.php');
```

The following needs to be set to 'On' in the `php.ini` file.

```conf
`allow_url_include = On`
```

If you do not have access to the php.ini you can simply upload the tools folder to the public_html folder, then the following to the file.

```php
    include('include('tools/init.php');
```

Thats it, just include and use
