#!/bin/bash
# shellcheck disable=SC2164
mkdir -p /opt/oracle/oradata/recovery_area
chgrp 54321 /opt/oracle/oradata
chown 54321 /opt/oracle/oradata
chgrp 54321 /opt/oracle/oradata/recovery_area
chown 54321 /opt/oracle/oradata/recovery_area

curl https://raw.githubusercontent.com/faridimakh/debezium_oracle_source_connector/refs/heads/master/resources/setup-logminer.sh | sh

curl https://raw.githubusercontent.com/faridimakh/debezium_oracle_source_connector/refs/heads/master/resources/inventory.sql | sqlplus debezium/dbz@//localhost:1521/orclpdb1

#SELECT * FROM CUSTOMERS;

