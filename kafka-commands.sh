#bin/bash
# shellcheck disable=SC2046

#----------------------------

#----------------------------
kafka-topics --create --bootstrap-server localhost:9092 --topic history --partitions 1 --replication-factor 1
#----------------------------
#alter retention time before deletion
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name dita --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name dita.DEBEZIUM.CUSTOMERS --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name dita.DEBEZIUM.ORDERS --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name dita.DEBEZIUM.PRODUCTS --alter --add-config retention.ms=1
kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name dita.DEBEZIUM.PRODUCTS_ON_HAND --alter --add-config retention.ms=1
#deletion
kafka-topics --bootstrap-server localhost:9092 --delete --topic dita
kafka-topics --bootstrap-server localhost:9092 --delete --topic dita.DEBEZIUM.CUSTOMERS
kafka-topics --bootstrap-server localhost:9092 --delete --topic dita.DEBEZIUM.ORDERS
kafka-topics --bootstrap-server localhost:9092 --delete --topic dita.DEBEZIUM.PRODUCTS
kafka-topics --bootstrap-server localhost:9092 --delete --topic dita.DEBEZIUM.PRODUCTS_ON_HAND


