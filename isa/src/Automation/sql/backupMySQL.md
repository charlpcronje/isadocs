# Backup MySQL DB Daily

## Step 1: Folder and File Creat`ion
`
Create a folder anywhere, let’s say: `/var/backup/`, preferably outside the web root to avoid accidental access by anyone besides you.

Now, create a file with executable permission with the name `script.sh` in the folder created earlier.

You need to create another folder, let’s say `db,where you will be storing your database backups using the following command:

```shell
sudo mkdir /var/backup/db
sudo mkdir /var/automation
```

## Step 2: Contents of the File

Edit the file `script.sh` that you created in step 1, using `vi script.sh` or `nano script.sh` commands (_you might need to place sudo in the beginning of the syntax_) and place the following content in it:

```shell
nano /var/automation/mysqlBackup.sh
```


```sql
/* 1. set up all the mysqldump variables  */
DATE=`date +"%d_%b_%Y_%H%M"` 
SQLFILE=/var/backup/db/db_backup_${DATE}.sql 
DATABASE=<database_name> 
USER=<db_user> PASSWORD=<db_user_password> 

/* 2. in case you run this more than once a day, 
remove the previous version of the file */
unalias rm 2> /dev/null 
rm ${SQLFILE} 2> /dev/null 
rm ${SQLFILE}.gz 2> /dev/null 

/* 3. do the mysql database backup (dump) */
sudo mysqldump -u ${USER} -p${PASSWORD} ${DATABASE}|gzip > ${SQLFILE}.gz
```

### Section 1

The first section allows you to set specific values, which suit your environment into variables that are later used in the other two sections of the same file.

### DATE

To append the current date & time to the name of the backup file in order to facilitate you in identifying any required file later by just having a look at its name.

### SQLFILE

To let you set the path and file name of the backup file, appending the current date & time (_calculated by previous variable_) for your ease.

### DATABASE

To specify which database is to be backed up. This is used in the MySQL script for taking database dump/backup.

### USER

To let you set the database username that has access to take a dump of the previous mentioned database.

### PASSWORD

To mention the password of the database user that you chose to provide in the previous variable.

### Section 2

The second section helps you remove any database with the same name. You won’t really need this section when you are appending the date and time parameters to your file’s name, but if you are using a general name for the file and you wish your script to override the previous file, then you may include this section to your script.

The third section uses the variables of the first section and executes the `mysqldump` command to create an exported gzip file. Please note that you need to place the database password in this file that you might not want in some cases, however there exists an alternate method to dump the database without providing the password in the script. To do so, you need to edit the `my.cnf` file of your mysql configuration. The file might be in 5 or more locations, all are valid because they all load cascading.

- `/etc/my.cnf`
- `/etc/mysql/my.cnf`
- `$MYSQL_HOME/my.cnf`
- `[datadir]/my.cnf`
- `~/.my.cnf`

Edit the file and locate the `[mysqldump]` section in it.

Now, place the password in this file section just below the user, like the one displayed below:

```ini
[mysqldump] 
quick 
quote-names max_allowed_packet = 16M 
user=root 
password=complexPassword
```

Save this file and restart the mysql service using the following command:

```shell
sudo service mysql restart
```

You won’t need to mention the password in the shell script now.

## Step 3: Test to Verify if the Script is Working Correctly

Traverse to the script’s folder:

```shell
cd /var/automation/
```

And execute the following command:

```shell
sudo sh ./var/automation/mysqlBackup.sh
```

If your script is working correctly, you should have a backup file created in your `/var/backup/db/` folder. If there is no such file, it is likely that you have missed something in the aforementioned commands or you have some user permission restrictions that might require you to use sudo with each command.

## Step 4: Scheduling Execution with Cron

Edit the server’s cron with the undermentioned command:

```shell
nano /etc/cron.d/pulse
```

_Please note:_ _you can exclude the ‘sudo’ command if you are logged in with **root** itself or the user you are logged in with has enough permissions to execute cron and create backup._

Enter the following line at the bottom of this file:

```cron
0 1 * * * /var/automation/mysqlBackup.sh
```

The above line in cron will run at 1:00a.m server time every day. If you want to schedule it differently, you may modify it as per your need.

## Step 5: Remove Old Backups to Limit Space Usage on Server

Since the hosting servers provide limited space, we usually prefer to limit logs and backups stored on the server. Therefore, you need to remove older backups that you won’t need in the future.

At the bottom of your backup file, add the following command:

```shell
sudo find /var/backup/db/. -mtime +365 -exec rm {} \;
```

This will delete backups older than 365 days. You can, however, modify the `-mtime` parameter’s value to make it as per your desired time.
