# Database Backup and Restore on Pulse

By: Lebohang Mokoena <lebohang@isa.co.za>

The aim of this script is to restore the database backup generated by the backup script.

The script can be found here: [svn://source.dev.isa.co.za/scripts/backupSchemes/pulse/scripts](svn://source.dev.isa.co.za/scripts/backupSchemes/pulse/scripts)

For now we the script is available only on the repo and hopefully later will be available as part of the build.

To run the restore script you need to follow this simple steps

1. Copy the restore script from the repo to `/var/backup/scripts/`
2. You can either cd to the directory or call the script from anywhere: `/var/backup/scripts/restore.sh`
3. The script takes one parameter(full path to the backup file: `/var/backup/scripts/restore.sh /var/backup/pulse/database/db_2021-11-08.tar`)
4. Follow the prompts till you restore is successful