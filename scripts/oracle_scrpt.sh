#!/bin/bash
# shellcheck disable=SC2164
mkdir -p /opt/oracle/oradata/recovery_area
chgrp 54321 /opt/oracle/oradata
chown 54321 /opt/oracle/oradata
chgrp 54321 /opt/oracle/oradata/recovery_area
chown 54321 /opt/oracle/oradata/recovery_area

curl https://raw.githubusercontent.com/royalihasan/dockerized-setup-kafka-connect-oracle-debezium-stack/master/src/main/resources/01_db_setup_scripts/01_logminer-setup.sh | sh

curl https://raw.githubusercontent.com/debezium/debezium-examples/refs/heads/main/tutorial/debezium-with-oracle-jdbc/init/inventory.sql | sqlplus debezium/dbz@//localhost:1521/orclpdb1

#SELECT * FROM CUSTOMERS;

