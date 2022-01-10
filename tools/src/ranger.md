# 5. Ranger File Manager

## 5.1 Installation

Ranger is a lightweight and powerful file manager that works in a terminal window. It comes with the Vi key bindings. It offers a smooth way to move into directories, view files and content, or open an editor to make changes to files.

Ranger has a minimalist interface that shows the directory hierarchy and allows you to explore the file system, search for specific files, switch directories, etc. It consists of a three-column layout. The left column lists the content of parent directory, middle column lists the contents of the current directory. The right column shows the preview of the selected file or folder. Its is available in the package repositories of nearly all main Linux distributions.
In this article, we will learn how to install Ranger Terminal File Manager on Linux. Before moving towards installation, let's take a look at some features of Ranger.

## 5.2 Features of Ranger

- Multi-column display
- Common file operations (`create/chmod/copy/delete`)
- Preview of the selected `file/directory`
- `VIM-like` console and hotkeys
- A quick way to switch `directories` and browse the file system
- `Tabs`, `Bookmarks`, `Mouse support`
- Video thumbnails previews

## 5.3 Installation of Ranger File Manager

##  Step 1: Installing Pre-requisites

Before proceeding towards installing Ranger, we will first install make, git, and vim. Make and git will be required for installation, while vim is required for Ranger to open as a text editor.

Press `Ctrl+Alt+T` to launch the Terminal and then run the following command to update the repositories and install pre-requisites.

```shell
sudo apt-get update -y
sudo apt-get install make git vim -y
```

All the pre-requisites have completed and now we are prepared for installing Ranger file terminal.

## Step 2: Downloading Ranger repository

For installing Ranger, we will download the latest Ranger repository from the Github. To do so, run the following command in Terminal:

```shell
$ git clone https://github.com/hut/ranger.git
Clone Ranger GIT repo
```

## Step 3: Installing Ranger

After downloading the Ranger repository, navigate to the downloaded folder using the following command.

```shell
cd ranger
```

Then run the following command to install Ranger.

```shell
sudo make install
Build and install Ranger
```

Wait for a while until the installation is completed.

## Step 4: Configuring Ranger

After installation, we will do some configuration. To do so, launch Ranger for a moment and then exit it. By doing so, it will enable the Ranger to create the directory structure for its configuration files:

```shell
ranger
```

After the configuration directory has been created by the Ranger, you can now copy its configuration files by running the following commands in terminal:

```shell
ranger --copy-config=all
```

The output will look similar to this:

### Configure Ranger

To modify the Ranger configuration files later, you can find them at ~/.config/ranger. To navigate to the configuration files folder, use the 
following command:

```shell
cd ~/.config/ranger
```

## Step 5: Using Ranger

Now launch the Ranger using the Terminal or from the start menu. you will see the interface similar to below. In the following screenshot, you can see that the interface is divided into three columns. Middle column displays the current working directory, the left column displays the current directory's parent directory and the right column displays the preview of the file that we are currently interacting.

Along with the columns, you can see some information on the top and bottom of the window. On top, you can see the name and hostname of your system just like your terminal along with the current working directory. In the bottom, you can see the file or directory permission, ownership, size, date and time information along with the total size of the file and free disk space.

## 5.4 Use Ranger File manager

To change directories, you can use the arrow keys: Press Right to go into the currently selected directory, or Left to go into the parent directory. Similarly to select items in the middle panel, use the Up and Down arrow keys. There are number of commands you can use to perform different operations on the files but here are some of the most common commands.

## 5.5 For navigation

`<Ctrl>-f` = Page down
`<Ctrl>-b` = Page up
`gg` = Go to the top of the list
`G` = Go to the bottom of the list
`H` = Go back through navigation history
`h` = Move to parent directory
`J` = Page down 1/2 page
`J` = Move down
`K` = Page up 1/2 page
`k` = Move up
`L` = Go forward through navigation history
`Q` = Quit
Working with files

`i` … Display the file
`E|I` … Edit the file
`r` … Open file with the chosen program
`cw` … Rename file
`/` … Search for files (n|p jump to next/previous match)
`dd` .. Mark file for cut
`ud` … Uncut
`p` … Paste file
`yy` .. Copy/yank file
`zh` … Show hidden files
`<space>` = Select current file
`:delete` = Delete selected file
`:mkdir` … Create a directory
` :touch` … Create a file
` :rename` … Rename file
