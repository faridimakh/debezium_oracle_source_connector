------------------------------------------------------------------------------------------
--test connection to ORCLPDB1:
--sqlplus Debezium/dbz@localhost:1521/ORCLPDB1
-------------------------------------------
--SE tables
select * from Debezium.customers;
select * from Debezium.orders;
select * from Debezium.products;
select * from Debezium.products_on_hand;

-------------------------------------------
--activate AUTOCOMMIT
SET AUTOCOMMIT ON;
--insert some tows
INSERT INTO CUSTOMERS VALUES (NULL, 'Peter', 'Parker', 'peter.parker@marvel.com');
INSERT INTO CUSTOMERS VALUES (NULL, 'Peter1', 'Parker1', 'peter.parker@marvel.com1');
INSERT INTO CUSTOMERS VALUES (NULL, 'Peter2', 'Parker2', 'peter.parker@marvel.com2');
INSERT INTO CUSTOMERS VALUES (NULL, 'Peter3', 'Parker3', 'peter.parker@marvel.com3');
------------------------------------------------------------------------------------------
--update rows
UPDATE CUSTOMERS SET email = 'new_email@gmail.com' WHERE id = 1041;
DELETE FROM CUSTOMERS WHERE id = 1023;
------------------------------------------------------------------------------------------
SELECT name, open_mode FROM v$pdbs;
--SHOW CON_NAME;
ALTER SESSION SET CONTAINER=ORCLPDB1;
ALTER PLUGGABLE DATABASE RCLPDB1 OPEN;
--current db:
SHOW CON_NAME;
--SEE THE TABLE AND THE OWNER:
--sqlplus sys/top_secret@localhost:1521/ORCLPDB1 as sysdba


--------------
--docker exec -it oracle bash -c 'sleep 1; sqlplus Debezium/dbz@localhost:1521/orclpdb1'
--docker exec -it oracle bash -c 'sleep 1; sqlplus sys/top_secret@//localhost:1521/ORCLPDB1'
--db running in: (localhost:1521)
--username :Debezium
--password :dbz)
--attempting to connect to: orclpdb1
--------------

