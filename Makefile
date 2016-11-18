#!make
AUTHOR=ingimar.erlingsson-at-nrm.se
LIQUIBASE_HOME=http://www.liquibase.org/
LIQUIBASE=liquibase-3.5.3-bin.zip

MYSQL=mysql-connector-java-6.0.5.jar
MYSQL_DB=liquibase_tutorial
MYSQL_USER=xxx
MYSQL_PASSWORD=yyy

all: pre_info install_liquibase install_jdbc_mysql post_info

pre_info:
	@echo "Installation of liquibase, (home ${LIQUIBASE_HOME})"

install_liquibase:
	test -f liquibase.jar || \
	(wget https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.5.3/${LIQUIBASE} && \
	unzip ${LIQUIBASE} && rm liquibase-3.5.3-bin.zip )


install_jdbc_mysql:
	test -f lib/${MYSQL} || \
	(wget http://central.maven.org/maven2/mysql/mysql-connector-java/6.0.5/${MYSQL} && \
	mv ${MYSQL} lib)

install_liquibase_prop:
	mv liquibase.mysql.properties sdk/workspace

database_mysql_create:
	mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -e "create database ${MYSQL_DB};"

database_mysql_drop:
	mysql -u root -pingimar -e "drop database ${MYSQL_DB};"

post_info:
	@echo "... "
	./liquibase --version
