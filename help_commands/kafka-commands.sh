#bin/bash
# shellcheck disable=SC2046

#----------------------------
#list topics
kafka-topics --bootstrap-server localhost:9092 --list
#----------------------------
#create topic
kafka-topics --create --bootstrap-server localhost:9092 --topic history --partitions 1 --replication-factor 1
#----------------------------
prefix_topic="prefix_topic"
#alter retention time before deletion
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name $prefix_topic --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name schema-changes.inventory --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name $prefix_topic+".DEBEZIUM.CUSTOMERS" --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name $prefix_topic+".DEBEZIUM.ORDERS" --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name $prefix_topic+".DEBEZIUM.PRODUCTS" --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name $prefix_topic+".DEBEZIUM.PRODUCTS_ON_HAN"D --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name $prefix_topic+".DEBEZIUM.PRODUCT888"D --alter --add-config retention.ms=1
#deletion
kafka-topics --bootstrap-server localhost:9092 --delete --topic $prefix_topic
kafka-topics --bootstrap-server localhost:9092 --delete --topic schema-changes.inventory
kafka-topics --bootstrap-server localhost:9092 --delete --topic $prefix_topic+".DEBEZIUM.CUSTOMERS"
kafka-topics --bootstrap-server localhost:9092 --delete --topic $prefix_topic+".DEBEZIUM.ORDERS"
kafka-topics --bootstrap-server localhost:9092 --delete --topic $prefix_topic+".DEBEZIUM.PRODUCTS"
kafka-topics --bootstrap-server localhost:9092 --delete --topic $prefix_topic+".DEBEZIUM.PRODUCTS_ON_HAND"
kafka-topics --bootstrap-server localhost:9092 --delete --topic $prefix_topic+".DEBEZIUM.PRODUCT888"

#------------------------------------------------------------------------------------------------------------
curl https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/21.6.0.0/ojdbc8-21.6.0.0.jar -o ojdbc8-21.6.0.0.jar
curl https://repo1.maven.org/maven2/com/thoughtworks/xstream/xstream/1.3.1/xstream-1.3.1.jar -o xstream-1.3.1.jar
curl https://repo1.maven.org/maven2/com/oracle/database/xml/xdb/21.6.0.0/xdb-21.6.0.0.jar -o xdb-21.6.0.0.jar

