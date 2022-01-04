# Install Node.js Locally with Node Version Manager (nvm)

Using `nvm` (Node.js Version Manager) makes it easier to install and manage multiple versions of Node.js on a single local environment. Even if you only need a single version of Node.js right now, we still recommend using nvm because it allows you to switch between different versions of Node (depending on the requirements of your project) with minimal hassle.

In this tutorial, we'll walk through:

- How to download and install the Node Node Version Manager (`nvm`) shell script
- Using `nvm` to install the latest LTS version of Node.js
- Switching to a different Node.js version with `nvm`

## 1. Goal

Install and manage a local installation of node using `nvm`

## Prerequisites

- [*Overview*: Manage Node.js Locally](https://heynode.com/tutorial/overview-how-manage-nodejs-locally)

## 2. Watch

<iframe referrerpolicy="no-referrer-when-downgrade" class="sproutvideo-player" src="https://videos.sproutvideo.com/embed/709fdebe1710e2caf8/e4ed87bc0fb702ce" width="630" height="354" frameborder="0" allowfullscreen=""></iframe>

## 3. Install nvm

`NVM` stands for Node.js Version Manager. The `nvm` command is a  `POSIX`-compliant bash script that makes it easier to manage multiple Node.js versions on a single environment. To use it, you need to first install the bash script, and add it to your shell's `$PATH`.

Learn more about why we recommend using `NVM` in Overview: Manage `Node.js` Locally.

*Note:* We do not recommend using `nvm` to install Node.js for production environments. If you're installing Node.js on your production environment you should consider using your OS's package manager, or your server tooling of choice, to install and lock the environment to a specific version of Node.js.

The official documentation for how to install `nvm`, and some common trouble shooting tips, is in the `project's README`

*Windows users:* The process for installing `nvm` on Windows is different than what's shown below. If you're using Windows check out this `Windows-specific version of nvm.`

The basic process is as follows:

## 4. Download the install script

Using curl, or wget, download the installation script. In the URL below make sure you replace `v0.35.0` with the latest version of `nvm`.

```shell
curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh
```

It's not a bad idea to open the install script and inspect its contents given that you just downloaded it from the Internet.

##5.  Run the install script

Run the install script with `bash`.

```shell
bash install_nvm.sh
```

This script clones the `nvm` repository `into ~/.nvm.` Then it updates your profile (`~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc`) to source the `nvm`.sh it contains.

You can confirm that your profile is updated by looking at the install script's output to determine which file it used. Look for something like the following in that file:

```shell
export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

## 6. Restart your terminal

In order to pick up the changes to your profile either close and reopen the terminal, or manually source your respective `~/.profile.`

*Example:*

```shell
source ~/.bash_profile
```

## 7. Verify it worked

Finally, you can verify that it's installed with the `command` command:

```shell
command -v nvm
```

Should return `nvm`. Note: You can't use the which command with `nvm` since it's a shell function and not an actual application.

## 8. See what it does

Finally, run the `nvm` command to get a list of all the available sub-commands and to further verify that installation worked.

## 9. Use nvm to install the latest LTS release of Node.js

Now that you've got `nvm` installed let's use it to install, and use, the current `LTS` version of `Node.js`.

```shell
nvm install --lts

# Output
Installing latest LTS version.
Downloading and installing node v10.16.3...
Downloading https://nodejs.org/dist/v10.16.3/node-v10.16.3-darwin-x64.tar.xz...
######################################################################## 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v10.16.3 (npm v6.9.0)
Creating default alias: default -> lts/* (-> v10.16.3)
```

## 10. Verify it worked, and that the version is correct:

```shell
node --version
# => v10.16.3
which node
# => /Users/joe/.nvm/versions/node/v10.16.3/bin/node
```

Note this line Creating default alias: `default -> lts/* (-> v10.16.3).` This indicates that `nvm` has set `lts`/* as the default alias. Practically this means that anytime you start a new shell, and the `nvm`.sh script is sourced, it will default that shell to using the installed lts release. You can change this behavior using the `nvm alias` command.

Example to set the `default version` of node to use when starting a new shell to `10.0.0:`

```shell
nvm alias default 10.0.0
```

## 11. Use nvm to install other versions of Node.js

The real benefit of `nvm` comes when you install different versions of `Node.js`. You can then switch between them depending on which project you're working on.

### 12. List available versions

To see the entire list of `Node.js` versions available to install, enter the following:

```shell
nvm ls-remote
```

## 13. Install a specific version

```shell
nvm install 8.16.2
```

## 14. Install the latest release:

```shell
nvm install node
```

## 15. Install an older LTS release by codename:

```shell
nvm install carbon
# => Installs v8.16.2 the latest release of the Carbon LTS line
```

## 16. List installed versions

You can see which versions of Node.js you have installed already, and therefore which ones you can use with the `nvm` ls command:

```shell
nvm ls
```

This will output a list of installed versions, as well as indicate which version is currently being used by the active shell.

## 17. Switch to another version

To switch to another version for the active shell use `nvm` use.

For a specific version provide a version number:

```shell
nvm use 10.16.3
# => Now using node v10.16.3 (npm v6.9.0)
```

## 18. Switch to the latest installed version:

```shell
nvm use node
```

## 19. Use the latest LTS version:

```shell
nvm use --lts
```

*Tip:* Use `nvm` alias default `{VERSION}` to switch the version of `Node.js` used by `default` when starting a new shell.

## 19. Recap

In this tutorial we walked through installing the `nvm` bash script and making sure it works. Then we used `nvm` to install the latest LTS release of `Node.js` and set it as our environment's default `Node.js` version. Then we looked at how you can use `nvm` to install any number of `Node.js` versions and switch between them as needed.

You should now be all set to execute and work on your your `Node.js` project(s) no matter which version of `Node.js` they are written for.

## 20. Further your understanding

Run the `nvm` command with no arguments and read through the list of sub-commands that we didn't cover in this tutorial. What did you find? What might they be useful for?
Can you figure out how to switch to the version of `Node.js` that your `OS` came with?
Why would you want to change to a different version of `Node.js` while doing development?
What happens when you install an npm package globally (`e.g. npm install -g express`) while using `NVM` to manage `Node.js` versions?

## 21 Additional resources

Official `NVM` repository and documentation [GitHub.com](https://gitHub.com)
