ALTER TABLE platziblog.people 
add column date_of_birth datetime null after city;

ALTER TABLE platziblog.people 
CHANGE COLUMN date_of_birth date_of_birth VARCHAR(30) NULL DEFAULT NULL;

ALTER TABLE platziblog.people 
DROP COLUMN date_of_birth; 