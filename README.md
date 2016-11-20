[![AGPLv3 License](http://img.shields.io/badge/license-AGPLv3-blue.svg) ](https://github.com/Inkimar/liquibase-tutorial/blob/master/LICENSE)

# Liquibase standalone
This is a minor tutorial on Liquibase.<br>
Using a Makefile, Tested on GNU/Linux <br>
Tested on MySQL ver 5.5 & ver 5.7 <br>

## before you start.
Set credentials for your database in the following 2 files <br>
The mysql-user must be able to create a database <br>
The name of the example database is 'liquibase-tutorial' <br>

1. Makefile
2. liquibase.inki.properties

create the database <br>
$make db_mysql_create <br>


Run the 'all'-recipe
$make [all]

1. fetches liquibase and unzips
2. fetches the mysql-jdbc-jar
3. copies liquibase.inki.properties and changelog-example.xml to the liquibase 'sdk'-directory
4. runs liquibase (creates 1 table in the 'liquibase-tutorial'-database )
5. makes a database-dump (mysqldump) to the 'backup'-directory.