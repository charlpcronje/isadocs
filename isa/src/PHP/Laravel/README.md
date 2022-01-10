# LARAVEL

- [Installation](Installation.md)
  - [Via Laravel Installer](Installation.md#via-laravel-installer)
  - [Via Composer](Installation.md#via-composer)
    - [Permissions](permissions.md)
    - [Serving Laravel](servingLaravel.md)
    - [Directory Structure](directoryStructure.md)
  - [Routing](Routing.md)
  - [Creating A View](Views.md)
  - [Creating A Migration](Migrations.md)
  - [Eloquent ORM](Eloquent.md)
  - [Displaying Data](DisplayData.md)
  - [Deploying Your Application](Deploy.md)

## Getting Started On Linux

If you're developing on Linux and Docker is already installed, you can use a simple terminal command to create a new Laravel project. For example, to create a new Laravel application in a directory named "example-app", you may run the following command in your terminal:

```Shell
curl -s https://laravel.build/example-app | bash
```

Of course, you can change "example-app" in this URL to anything you like. The Laravel application's directory will be created within the directory you execute the command from.

After the project has been created, you can navigate to the application directory and start Laravel Sail. Laravel Sail provides a simple command-line interface for interacting with Laravel's default Docker configuration:

```Shell
cd example-app

./vendor/bin/sail up
```

The first time you run the Sail up command, Sail's application containers will be built on your machine. This could take several minutes. Don't worry, subsequent attempts to start Sail will be much faster.

Once the application's Docker containers have been started, you can access the application in your web browser at: http://localhost.

To continue learning more about Laravel Sail, review its complete documentation.

## Choosing Your Sail Services

When creating a new Laravel application via Sail, you may use the with query string variable to choose which services should be configured in your new application's docker-compose.yml file. Available services include mysql, pgsql, mariadb, redis, memcached, meilisearch, selenium, and mailhog:

```Shell
curl -s "https://laravel.build/example-app?with=mysql,redis" | bash
```

If you do not specify which services you would like configured, a default stack of mysql, redis, meilisearch, mailhog, and selenium will be configured.

## Installation Via Composer

If your computer already has PHP and Composer installed, you may create a new Laravel project by using Composer directly. After the application has been created, you may start Laravel's local development server using the Artisan CLI's serve command:

```Shell
composer create-project laravel/laravel example-app
cd example-app
php artisan serve
```

## The Laravel Installer

Or, you may install the Laravel Installer as a global Composer dependency:

```Shell
composer global require laravel/installer
```

### laravel new example-app

```Shell
cd example-app
php artisan serve
```

> Make sure to place Composer's system-wide vendor bin directory in your $PATH so the laravel executable can be located by your system. This directory exists in different locations based on your operating system; however, some common locations include:

```CMD
macOS: $HOME/.composer/vendor/bin
Windows: %USERPROFILE%\AppData\Roaming\Composer\vendor\bin
GNU / Linux Distributions: $HOME/.config/composer/vendor/bin or $HOME/.composer/vendor/bin
```

For convenience, the Laravel installer can also create a Git repository for your new project. To indicate that you want a Git repository to be created, pass the `--git flag` when creating a new project:

`laravel new example-app --git`

This command will initialize a new Git repository for your project and automatically commit the base Laravel skeleton. The git flag assumes you have properly installed and configured Git. You can also use the --branch flag to set the initial branch name:

`laravel new example-app --git --branch="main"`

Instead of using the `--git flag`, you may also use the --github flag to create a Git repository and also create a corresponding private repository on GitHub:

`laravel new example-app --github`

The created repository will then be available at `https://github.com/<your-account>/my-app.com`. The github flag assumes you have properly installed the GitHub CLI and are authenticated with GitHub. Additionally, you should have git installed and properly configured. If needed, you can pass additional flags that supported by the GitHub CLI:

`laravel new example-app --github="--public"`
You may use the `--organization flag` to create the repository under a specific GitHub organization:

laravel new example-app `--github="--public" --organization="laravel"`

## Initial Configuration

All the configuration files for the Laravel framework are stored in the config directory. Each option is documented, so feel free to look through the files and get familiar with the options available to you.

Laravel needs almost no additional configuration out of the box. You are free to get started developing! However, you may wish to review the `config/app.php` file and its documentation. It contains several options such as timezone and locale that you may wish to change according to your application.

## environment Based Configuration

Since many of Laravel configuration option values may vary depending on whether your application is running on your local computer or on a production web server, many important configuration values are defined using the .env file that exists at the root of your application.

Your `.env` file should not be committed to your application's source control, since each developer / server using your application could require a different environment configuration. Furthermore, this would be a security risk in the event an intruder gains access to your source control repository, since any sensitive credentials would get exposed.

For more information about the .env file and environment based configuration, check out the full configuration documentation.

### Directory Configuration

Laravel should always be served out of the root of the "web directory" configured for your web server. You should not attempt to serve a Laravel application out of a subdirectory of the "web directory". Attempting to do so could expose sensitive files that exist within your application.

**Next Steps**
Now that you have created your Laravel project, you may be wondering what to learn next. First, we strongly recommend becoming familiar with how Laravel works by reading the following documentation:
