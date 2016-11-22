#!make
AUTHOR=ingimar.erlingsson-at-nrm.se
LIQUIBASE_HOME=http://www.liquibase.org/

TS := $(shell date '+%Y_%m_%d_%H_%M')

LIQ_VER=3.5.3
LIQUIBASE=liquibase-${LIQ_VER}-bin.zip

# NB: think twice before using mysql-connector-java version 6.x
MYSQL_VER=5.1.40
MYSQL=mysql-connector-java-${MYSQL_VER}.jar
MYSQL_DB=liquibase_tutorial
MYSQL_USER=xxx
MYSQL_PASSWORD=yyy

all: pre_info install_liquibase install_jdbc_mysql cp_liquibase_prop run_liquibase db_mysql_dump post_info

pre_info:
	@echo "Installation of liquibase, (home ${LIQUIBASE_HOME})"

install_liquibase:
	test -f liquibase.jar || \
	(wget https://github.com/liquibase/liquibase/releases/download/liquibase-parent-${LIQ_VER}/${LIQUIBASE} && \
	unzip ${LIQUIBASE} && rm ${LIQUIBASE} )


install_jdbc_mysql:
	test -f lib/${MYSQL} || \
	(wget http://central.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_VER}/${MYSQL} && \
	mv ${MYSQL} lib)

cp_liquibase_prop:
	@echo "remember to update credentials for database"
	cp liquibase.inki.properties sdk/workspace 
	cp changelog-example.xml sdk/workspace/changelog/com/example/

run_liquibase:
	cd sdk/workspace && ../../liquibase --defaultsFile=liquibase.inki.properties update

run_x:
	cd sdk/workspace && ../../liquibase --defaultsFile=liquibase.inki.properties migrate

db_mysql_create:
	mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -e "create database IF NOT EXISTS ${MYSQL_DB};"

db_mysql_drop:
	mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -e "drop database IF EXISTS ${MYSQL_DB};"

db_mysql_dump:
	mysqldump -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DB} > backup/${MYSQL_DB}-dump-$(TS).sql


post_info:
	@echo "... "
	./liquibase --version
