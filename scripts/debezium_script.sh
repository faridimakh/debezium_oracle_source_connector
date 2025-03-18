#!/bin/bash
cd /kafka/libs/
curl https://maven.xwiki.org/externals/com/oracle/jdbc/ojdbc8/12.2.0.1/ojdbc8-12.2.0.1.jar -o ojdbc8-12.2.0.1.jar
curl https://repo1.maven.org/maven2/com/thoughtworks/xstream/xstream/1.3.1/xstream-1.3.1.jar -o xstream-1.3.1.jar
curl https://repo1.maven.org/maven2/com/oracle/database/xml/xdb/21.6.0.0/xdb-21.6.0.0.jar -o xdb-21.6.0.0.jar

ls /kafka/libs/ | grep ojdbc8-12.2.0.1.jar

cd /kafka/external_libs
curl -O "https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-basiclite-linux.x64-19.6.0.0.0dbru.zip"
unzip instantclient-basiclite-linux.x64-19.6.0.0.0dbru.zip
rm instantclient-basiclite-linux.x64-19.6.0.0.0dbru.zip
ls /kafka/external_libsls

cd /kafka/connect/
curl -O "https://repo1.maven.org/maven2/io/debezium/debezium-connector-jdbc/2.5.0.Final/debezium-connector-jdbc-2.5.0.Final-plugin.tar.gz"
tar xvfz  debezium-connector-jdbc-2.5.0.Final-plugin.tar.gz
rm debezium-connector-jdbc-2.5.0.Final-plugin.tar.gz
ls /kafka/connect/ | grep debezium-connector-jdbc
