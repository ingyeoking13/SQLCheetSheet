-- create table
CREATE TABLE celebs ( id INTEGER, name TEXT, age INTEGER);

-- add data 
INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 22);
INSERT INTO celebs (id, name, age) VALUES (2, 'Beyonce Knowles', 33); 
INSERT INTO celebs (id, name, age) VALUES (3, 'Jeremy Lin', 26); 
INSERT INTO celebs (id, name, age) VALUES (4, 'Taylor Swift', 26); 

-- see all
SELECT * From celebs;

-- add new column 
ALTER TABLE celebs ADD twitter_handle TEXT;

UPDATE celebs SET twitter_handle = '@taylorswift13' WHERE id = 4;
SELECT * FROM celebs where id=4;

-- delete data
DELETE FROM celebs WHERE twitter_handle IS NULL;

SELECT * FROM celebs; 

--constraint 
CREATE TABLE awards (
   id INTEGER PRIMARY KEY,
   recipient TEXT NOT NULL,
   award_name TEXT DEFAULT 'Grammy'
);
INSERT INTO awards (id, recipient) VALUES(1, 'kimchi');
SELECT * FROM awards;


