SELECT VERSION();

SHOW PLUGINS;

CREATE DATABASE secure_db
ENCRYPTION='Y';
USE secure_db;

CREATE TABLE confidential_data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    salary DECIMAL(10,2)
) ENGINE=InnoDB
ENCRYPTION='Y';

INSERT INTO confidential_data (name, salary)
VALUES (NULL, NULL);

INSERT INTO confidential_data (name, salary)
VALUES ('', NULL);

INSERT INTO confidential_data (name, salary)
VALUES ('Rahul', NULL);

INSERT INTO confidential_data (name, salary)
VALUES (NULL, 0.00);

SELECT * FROM confidential_data;


SELECT NAME, ENCRYPTION
FROM INFORMATION_SCHEMA.INNODB_TABLES
WHERE NAME LIKE 'secure_db/%';

SHOW CREATE TABLE confidential_data;

SELECT SCHEMA_NAME, DEFAULT_ENCRYPTION
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME='secure_db';

SHOW VARIABLES LIKE 'have_ssl';

SHOW STATUS LIKE 'Ssl_cipher';


