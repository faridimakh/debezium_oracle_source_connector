#bin/bash
# shellcheck disable=SC2046
docker-compose down
docker rm -f $(docker ps -a -q)
docker rmi $(docker images -a -q)
docker volume rm $(docker volume ls -q)




#kafka commandes------------------------------------------------------------
#kafka-topics --bootstrap-server localhost:9092 --list
#----------------------------
#kafka-topics --create --bootstrap-server localhost:9092 --topic history --partitions 1 --replication-factor 1
#----------------------------
#kafka-topics --bootstrap-server localhost:9092 --delete --topic  test1.DEBEZIUM.CUSTOMERS
#kafka-topics --bootstrap-server localhost:9092 --delete --topic  test1.DEBEZIUM.ORDERS
#kafka-topics --bootstrap-server localhost:9092 --delete --topic  test1
#read events------------------------------------------------------------
#kafka-console-consumer --bootstrap-server localhost:9092 --topic schema-changes.inventory --from-beginning
#docker run --tty --network oracle_cdc_test_default confluentinc/cp-kafkacat kafkacat -b kafka:9092 -C -s key=s -s value=avro -r http:/schema-registry:8081 -t DEBEZIUM.DEBEZIUM.CUSTOMERS
#docker run --tty --network oracle_cdc_test_default confluentinc/cp-kafkacat kafkacat -b kafka:9092 -C -s key=s -s value=avro -r http:/schema-registry:8081 -t test.DEBEZIUM.ORDERS
#docker run --tty --network oracle_cdc_test_default confluentinc/cp-kafkacat kafkacat -b kafka:9092 -C -s key=s -s value=avro -r http:/schema-registry:8081 -t test.DEBEZIUM.PRODUCTS
#docker run --tty --network oracle_cdc_test_default confluentinc/cp-kafkacat kafkacat -b kafka:9092 -C -s key=s -s value=avro -r http:/schema-registry:8081 -t test.DEBEZIUM.PRODUCTS_ON_HAND
#----------------------------

#curl -L -o 01_logminer-setup.sh "https://raw.githubusercontent.com/royalihasan/dockerized-setup-kafka-connect-oracle-debezium-stack/master/src/main/resources/01_db_setup_scripts/01_logminer-setup.sh"
#curl -L -o setup-logminer.sh "https://raw.githubusercontent.com/debezium/oracle-vagrant-box/refs/heads/main/setup-logminer.sh"
#curl -L -o invent.sql "https://raw.githubusercontent.com/debezium/debezium-examples/refs/heads/main/tutorial/debezium-with-oracle-jdbc/init/inventory.sql"

#-------------------

#kafka recreate containers------------------------------------------------------------
#docker-compose down && docker-compose up -p


#------------------------------------------------------------------------------------------------------------------------
#cd /usr/share/confluent-hub-components/
#rm -rf debezium-connector-oracle/
#curl -O "https://repo1.maven.org/maven2/io/debezium/debezium-connector-oracle/1.9.8.Final/debezium-connector-oracle-1.9.8.Final-plugin.tar.gz"
#tar xvfz debezium-connector-oracle-1.
#rm debezium-connector-oracle-1.
#curl -O https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/21.1.0.0/ojdbc8-21.1.0.0.jar
#wget "https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-basiclite-linux.x64-19.6.0.0.0dbru.zip" -O /tmp/ic.zip
#unzip /tmp/ic.zip -d /usr/share/confluent-hub-components/debezium-connector-oracle
#------------------------------------------------------------------------------------------------------------------------

      CONNECT_KEY_CONVERTER: io.confluent.connect.avro.AvroConverter
      CONNECT_VALUE_CONVERTER: io.confluent.connect.avro.AvroConverter
      CONNECT_VALUE_CONVERTER_SCHEMA_REGISTRY_URL: 'http://schema-registry:8081'
      CONNECT_KEY_CONVERTER_SCHEMA_REGISTRY_URL: 'http://schema-registry:8081'
#      CONNECT_KEY_CONVERTER: org.apache.kafka.connect.storage.StringConverter
#      CONNECT_VALUE_CONVERTER: io.confluent.connect.avro.AvroConverter
#      CONNECT_VALUE_CONVERTER_SCHEMA_REGISTRY_URL: http://schema-registry:8081
      CONNECT_PLUGIN_PATH: "/usr/share/java,/usr/share/confluent-hub-components"