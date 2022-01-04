# Show All PHP Errors

The quickest way to display all php errors and warnings is to add these lines to your PHP code file:

```php
ini_set('display_errors', 1); 
ini_set('display_startup_errors', 1); 
error_reporting(E_ALL);
```

## What Do These Lines of Code Do Exactly?

The `ini_set` function will try to override the configuration found in your PHP ini file.

The display_errors and display_startup_errors are just two of the directives that are available. The display_errors directive will determine if the errors will be displayed or hidden to the user. Usually, the `display_errors` directive should be turned off after development.

The `display_startup_errors`, however, is a separate directive because the display_errors doesn’t handle the errors that will be encountered during PHP’s startup sequence. The list of the directives that can be overridden by the `ini_set` function is found in the [official documentation](https://php.net/manual/en/ini.list.php).

Unfortunately, **these two directives won’t be able to display parse errors** such as missing semicolons or missing curly braces. In this case, the PHP ini configuration must be modified.

## Configure PHP.ini to Display All Errors

If adding some of the PHP code errors doesn’t show in the browser during testing, then the PHP ini configuration has some additional directives to handle this.

`display_errors = on`

The display_errors directive must be set to “on” in the PHP ini file. This will display all the errors including syntax or parse errors that cannot be displayed by just calling the ini_set function in the PHP code. The PHP ini file can be found in the displayed output of `phpinfo()` function and is labeled loaded configuration file. This directive in the ini configuration must be set to off, if the web application is in production.

## Display PHP Errors via `.htaccess` Configuration

Developers usually have access to the directory files. The directive for showing PHP errors can also be enabled or disabled using the .htaccess file located in the root or public directory of the project.

```conf
php_flag display_startup_errors on
php_flag display_errors on
```

Similar to what will be added to the PHP code to show PHP errors, .htaccess also has directives for display_startup_errors and display_errors. The advantage of showing or disabling error messages in this manner is that development and production can have different .htaccess files, where the production suppresses the displaying of errors.

Depending on which files you have access to and how you do deployments and server configurations, you may want to configure display_errors in .htaccess or your PHP.ini file. Many hosting providers will not allow you to modify your PHP.ini file to enable display_errors.

In the .htaccess file, a custom error log can also be enabled as long as the log folder or the log file is writable by the web server. The log file can be a relative path to where the .htaccess is located, or it can be an absolute path such as /var/www/html/website/public/logs.

```conf
php_value error_log logs/all_errors.log
```

## Enable Detailed Warnings and Notices

Sometimes, the warnings that seem not to affect the application at the start will cause some fatal errors in certain conditions. These warnings must be fixed because this means that the application won’t run normally under certain scenarios. In case these warnings cause a lot of errors, then it would be more practical to hide the errors and just show what the warning messages are.

```conf
error_reporting(E_WARNING);
```

For a developer, showing warnings and hiding errors is just as simple as adding a single line of code. To show warnings and notices, the parameter for the error reporting function will be “`E_WARNING` | `E_NOTICE`”. The error_reporting function can accept `E_ERROR`, `E_WARNING`, `E_PARSE`, and `E_NOTICE` parameters as bitwise operators. To report all errors except for notices, then the parameter is “E_ALL & ~E_NOTICE” where E_ALL stands for all the possible parameters of the error_reporting function.

## In-depth With the error_reporting() function

The error reporting function is a built-in PHP function that allows developers to control which and how many errors will be shown in the application. Remember, the PHP ini configuration has an error_reporting directive that will be set by this function during runtime.

`error_reporting(0);`

To remove all errors, warnings, parse messages, and notices, the parameter that should be passed to the error_reporting function is zero. It would be not practical to have this line of code in each of the PHP files. It would be better to turn off report messages in the PHP ini file or in the .htaccess.

`error_reporting(E_NOTICE);`

PHP allows variables to be used even when not declared. This is not a standard practice because undeclared variables will cause issues for the application once it is used in loops and conditions. Sometimes, this also happens because the declared variable has a different spelling than the variable being used for conditions or loops. When E_NOTICE is passed in the error_reporting function, then these undeclared variables will be displayed in the web application.

`error_reporting(E_ALL & ~E_NOTICE);`

The error reporting function allows you to filter which errors can be shown. The “~” character means “not” or “no” so the parameter ~E_NOTICE means not to show notices. Notice the “&” and “|” characters in between the possible parameters. The “&” character is for “true for all”, while the “|” character represents either one as long as it is true. These two characters have the same meaning in PHP conditions OR and AND.

```php
error_reporting(E_ALL); 
error_reporting(-1); 
ini_set('error_reporting', E_ALL);
```

These three lines of codes do exactly the same thing, it will show all PHP errors. The error_reporting(E_ALL) is the most widely used among developers to show error messages because it is more readable and understandable.

## Log PHP errors to a file using the error_log() function

During production, error messages must not be shown to the end users, but this information must still be recorded for tracing purposes. The best way to record these error messages on a production web application is to store it in log files.

One easy way to use log files is to use the error_log function, which accepts four parameters. The only required parameter is the first parameter, which contains the details about the error or what’s to be logged. The type, destination, and header are all optional parameters for this function.

`error_log("There is something wrong!", 0);`

The type parameter, if not defined, will be 0 by default, which means this log information will be appended to whatever log file is defined in the web server.

error_log("Email this error to someone!", 1, "someone@mydomain.com");

The type 1 parameter will email an error log specified in the third parameter. To make this feature work, the PHP ini must have a proper SMTP configuration to be able to send out emails. These SMTP ini directives include host, encryption type, username, password, and port. This kind of error reporting is advisable to logging or notifying errors that need to be fixed as soon as found.

`error_log("Write this error down to a file!", 3, "logs/my-errors.log");`

To log messages in a separate file defined by the configuration of the web server, then type 3 must be used. The third parameter will serve as the location of the log file and must be writable by the web server. The location of the log file can be a relative path to where this code is called or an absolute path.

## Log PHP Errors Through the Web Server Configuration

To avoid changing parameters in the .htaccess or adding some lines in the PHP code to show errors, then the best way to log errors is defining it in the web server configuration file.

`ErrorLog "/var/log/apache2/my-website-error.log"`

For Apache, these files must be added to the virtual host of the specific website or application, usually located inside the sites-available folder for Ubuntu or `httpd-vhosts` file in Windows.

`error_log /var/log/nginx/my-website-error.log;`

For nginx, similar to Apache, the directive is just called error_log. For both Apache and nginx web servers, the log files must be writable by the web server. Luckily, upon installation, the folders for the log files of these two web servers are already writable
