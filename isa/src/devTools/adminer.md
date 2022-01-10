# ISA Dev Tools - SQL Client Adminer

You can think of Adminer as a light weight PHPMyAdmin that runs from a single PHP file and is very customizable.

One small issue I had with this as a tool even though it is only for the developers is that out databases don't have any password on them.
This never used to be a problem because the DB's could not be accessed from anywhere accept for the localhost. To to get past this problem I added authentication to Adminer itself. So you can not simply log into the DB by typing root in the username field, you have to also add you user password in the password field.

This SQL client can be access if the Dev Tools have been installed by going to the following URL:

`http://[IP OF DEV SERVER]/admin/tools/sql/adminer/`

OR

`http://[IP OF DEV SERVER]/admin/tools/` and then clicking on Adminer from the Dev Tools Index
