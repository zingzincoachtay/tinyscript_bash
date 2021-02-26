#!/bin/sh

sudo systemctl stop mysqld

echo DELETE FROM mysql.user WHERE User = \'root\' \; > $0.sql
echo INSERT INTO mysql.user \(Host,User,Password\) VALUES \( \'%\',\'root\',password\(\'$1\'\) \) \; >> $0.sql
echo GRANT ALL ON \*.\* TO \'root\'@\'%\' WITH GRANT OPTION \; >> $0.sql
echo DELETE FROM mysql.user WHERE User = \'pi\' \; > $0.sql
echo INSERT INTO mysql.user \(Host,User,Password\) VALUES \( \'%\',\'pi\',\'$1\' \) \; >> $0.sql
echo GRANT ALL ON \*.\* TO \'root\'@\'%\' WITH GRANT OPTION \; >> $0.sql
echo GRANT ALL ON \*.\* TO   \'pi\'@\'%\' WITH GRANT OPTION \; >> $0.sql
echo FLUSH PRIVILEGES \; >> $0.sql

# https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html
#echo This is the query executed \(minus the user input\)
#echo ALTER USER \'root\'@\'localhost\' IDENTIFIED BY \'_input_\' \;
#echo ALTER USER \'root\'@\'localhost\' IDENTIFIED BY      \'$1\' \; > $0.sql

 sudo mysqld  --init-file=$0.sql &

# rm $0.sql

sudo systemctl start mysqld

