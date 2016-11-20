[![AGPLv3 License](http://img.shields.io/badge/license-AGPLv3-blue.svg) ](https://github.com/Inkimar/liquibase-tutorial/blob/master/LICENSE)

# This project is a Liquibase-tutorial.
http://www.liquibase.org/ <br>
Runs through the changelog-example.xml-file (only 1 changeSet to begin with) <br>

## Liquibase standalone
This project has only been tested on GNU/Linux <br>
Using a Makefile (GNU Make 3.81 and GNU make 4.1 ) <br>
Tested on MySQL ver 5.5 & ver 5.7 <br>


### before you start.
Look through the Makefile ( update software-versons if you'd like to) <br>
Set credentials for your database in the following 2 files <br>

1. Makefile
2. liquibase.inki.properties

The mysql-user must be able to create a database <br>
The name of the example database is 'liquibase-tutorial' <br>

### run the recipes in the Makefile

create the database <br>
$make db_mysql_create <br>


Run the 'all'-recipe<br>
$make [all]

1. fetches liquibase and unzips
2. fetches the mysql-jdbc-jar
3. copies liquibase.inki.properties and changelog-example.xml to the liquibase 'sdk'-directory
4. runs liquibase (creates 1 table in the 'liquibase-tutorial'-database )
5. makes a database-dump (mysqldump) to the 'backup'-directory.