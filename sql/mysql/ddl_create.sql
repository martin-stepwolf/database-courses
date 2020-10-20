CREATE DATABASE IF NOT EXISTS platziblog;
-- SHOW DATABASES;

USE platziblog;

CREATE TABLE IF NOT EXISTS people (
person_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
last_name VARCHAR(255) NULL,
first_name VARCHAR(255) NULL,
address VARCHAR(255) NULL, 
city VARCHAR(255) NULL
);

INSERT INTO `platziblog`.`people` (`person_id`, `last_name`, `first_name`, `address`, `city`) 
VALUES ('1', 'Vásquez', 'Israel', 'Calle Famosa Num 1', 'México'),
	       ('2', 'Hernández', 'Mónica', 'Reforma 222', 'México'),
	       ('3', 'Alanis', 'Edgar', 'Central 1', 'Monterrey');

-- SHOW TABLES ;
DESCRIBE people;

USE platziblog;

CREATE OR REPLACE VIEW platzi_people AS
SELECT * FROM people;

select * from platzi_people; -- watch data from the view

