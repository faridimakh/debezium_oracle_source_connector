#bin/bash
# shellcheck disable=SC2046

#----------------------------
#list topics
kafka-topics --bootstrap-server localhost:9092 --list
#----------------------------
#create topic
kafka-topics --create --bootstrap-server localhost:9092 --topic history --partitions 1 --replication-factor 1
#----------------------------
#alter retention time before deletion
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name prefix_topic --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name prefix_topic.DEBEZIUM.CUSTOMERS --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name prefix_topic.DEBEZIUM.ORDERS --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name prefix_topic.DEBEZIUM.PRODUCTS --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name prefix_topic.DEBEZIUM.PRODUCTS_ON_HAND --alter --add-config retention.ms=1
#deletion
kafka-topics --bootstrap-server localhost:9092 --delete --topic prefix_topic
kafka-topics --bootstrap-server localhost:9092 --delete --topic prefix_topic.DEBEZIUM.CUSTOMERS
kafka-topics --bootstrap-server localhost:9092 --delete --topic prefix_topic.DEBEZIUM.ORDERS
kafka-topics --bootstrap-server localhost:9092 --delete --topic prefix_topic.DEBEZIUM.PRODUCTS
kafka-topics --bootstrap-server localhost:9092 --delete --topic prefix_topic.DEBEZIUM.PRODUCTS_ON_HAND



