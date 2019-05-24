# SQL cheet sheet

# First 

CREATE INSERT SELECT ALTER UPDATE DELETE CONSTRAINT  

## 1 CREATE A TABLE

````sql
CREATE TABLE [tableName] ( id INTEGER, name TEXT, age INTEGER);
````

## 2 INSERT

````sql
-- add data 
INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 22);
INSERT INTO celebs (id, name, age) VALUES (2, 'Beyonce Knowles', 33); 
INSERT INTO celebs (id, name, age) VALUES (3, 'Jeremy Lin', 26); 
INSERT INTO celebs (id, name, age) VALUES (4, 'Taylor Swift', 26); 
````

## 3 SELECT 

````sql
SELECT * FROM [tableName];
````

| id| name | age | 
|==|==|==|==|
|1|	Justin Bieber	|22|
|2|	Beyonce Knowles	|33|
|3|	Jeremy Lin	|26|
|4|	Taylor Swift	|26|

````sql
SELECT name FROM [tableName];
````

|name|
|===|
|Justin Bieber|
|Beyonce Knowles|
|Jeremy Lin|
|Taylor Swift|

## 4 add Column 

````sql
ALTER TABLE celebs ADD twitter_handle TEXT;
````

## 5 update 

````sql
UPDATE celebs SET twitter_handle = '@taylorswift13' WHERE id =4;
SELECT * FROM celebs WHERE id =4;
````
|id|name|age|twitter_handle|
|==|==|==|==|
| 4|Taylor Swift|26|@taylorswift13|

## 6 delete

````sql
DELETE FROM celebs WHERE twitter_handle IS NULL;
SELECT * FROM celebs; 
````


|id|name|age|twitter_handle|
|==|==|==|==|
|4|	Taylor Swift|26|@taylorswift13|


## 7 constraint

````sql
CREATE TABLE awards (
   id INTEGER PRIMARY KEY,
   recipient TEXT NOT NULL,
   award_name TEXT DEFAULT 'Grammy'
);

INSERT INTO awards (id, recipient) VALUES(1, 'kimchi');
SELECT * FROM awards;
````

PRIMARY KEY : key  
NOT NULL : does not allow null  
DEFAULT : default value  



|id|name|award_name|
|==|==|==|
|1|	kimchi	|Grammy|

# SECOND

SELECT AS DISTINCT WHERE LIKE AND/OR ORDER BY LIMIT CASE   

## 1 SELECT with multiple column

````sql
SELECT [column1], [column2] FROM [tableName];
SELECT [column1], [column2], ... FROM [tableName];
````

## 2 AS

````sql
SELECT [column1] As [alterName1] FROM [tableName];
SELECT [column1] As [alterName1], [column2] AS [alterName2] FROM [tableName];
````

change resulat table's column name.  

## 3 Distinct  

````sql
SELECT DISTINCT [column1] FROM [tableName];
````

select unique column from table.  

````sql
SELECT DISTINCT [column1], [column2] FROM [tableName];
````

select unique (column1*column2)cartesian from table.   


## 4 WHERE 

````sql
SELECT * FROM [tableName] WEHRE [column1] (operator) [value];
````

(operator) : `<=`, `<`, `=`, `!=`, `>=`, `>`   

## 5 LIKE  

````sql
SELECT * FROM [tableName] WHERE [colum1] LIKE 'Pattern'; 
````

Pattern '_' character represent any one character.  
Pattern can be used any data type, but should be used with ''(quotation).  

Pattern '%' character represent wildcard character.  
eg) Pattern '%man%' represent any strings include substring `man`.


BETWEEN [value1] AND [value2] 
````sql
--TEXT BEGIN WITH a character, 'A' <= character < 'F' (half inclusive)
BETWEEN * FROM [tableName] WHERE [cokumnTEXT] BETWEEN 'A' AND 'F';

--INTEGER, 10 <= INTEGER <= 20 (inclusive)
BETWEEN * FROM [tableName] WHERE [cokumnINTEGER] BETWEEN 10 AND 20;
````

## 6 AND / OR
````sql
SELECT * FROM [tableName] WHERE [conditionalStatement1] AND [conditionalStatement2];
SELECT * FROM [tableName] WHERE [conditionalStatement1] OR [conditionalStatement2];
````

## 7 ORDER BY  


````sql
SELECT * FROM [tableName] ORDER BY [column1] [option] 
````

sorting by [column1] value.     
(option) : `DESC`, `ASC`. without it, default is `ASC`.   


## 8 LIMIT

````sql
SELECT * FROM [tableName] LIMIT [value];
````

Get less than [value] rows.  
(value) : `INTEGER`. 



## 9 CASE

````sql
SELECT
  CASE 
    WHEN [] THEN [replacedValue1]
    WHEN [] THEN [replacedValue2]
    ELSE [replacedValue3]
  END AS [columnTEXT]
FROM [tableName];
````

create new column with replaced value  


# THIRD 

COUNT SUM MIN/MAX AVG ROUND GROUP BY HAVING

## 1 COUNT 

````sql
SELECT COUNT(*) FROM [tableName];
SELECT COUNT(*) FROM [tableName] WHERE [conditionalStatement];
SELECT COUNT(DISTINCT [column]) FROM [tableName];
````

argument for COUNT can be column. * stands for all columns.  

## 2 SUM  

````sql
SELECT SUM([column]) FROM [tableName];
````

sum of value in that column.  

## 3 MIN/MAX

````sql
SELECT MIN([column]) FROM [tableName];
SELECT MAX([column]) FROM [tableName];
````

min max of value in that column.  

## 4 AVG  

````sql
SELECT AVG([column]) FROM [tableName];
````

average of value in that column.  

## 5 ROUND

````sql
SELECT ROUND([column], [value]) FROM [tableName];
````

round [value] decimal places in the output. (value : 0~).   


## 6 GROUP BY  

````sql
SELECT [column1] , COUNT(*)
FROM [tableName]
--WHERE
GROUP BY [column1];
--ORDER BY

SELECT [column1] , SUM([column2])
FROM [tableName]
--WHERE
GROUP BY [column1];
--ORDER BY
````
with the SELECT statement to arrange identical data into groups.  

## 7 HAVING

````sql
SELECT [column1], [column2] 
FROM [tableName] 
GROUP BY [column] 
HAVING [conditionalStatement];
````

HAVING is very similar to WHERE.  
but Having filters group, while WHERE filters row.  


# FOURTH 

## MULTIPLE TALBE

|customers| 10rows
|-|-
|customer_id| INT
|customer_name|	VARCHAR(256)
|address| VARCHAR(256)

|subscriptions|9 rows
|-|-
|subscription_id|INT
|description|VARCHAR(256)
|price_per_month|INT
|subscription_length|TEXT

|orders|20 rows
|-|-
|order_id|	INT
|customer_id| INT
|subscription_id| INT
|purchase_date|	DATE

## 1 JOIN ( = INNER JOIN )

joinining two table with conditional statement.  
selecting multiple column from each table is possible.  

````sql
SELECT * 
FROM orders JOIN customers
ON orders.customer_id = customers.customer_id;

SELECT orders.order_id, customers.customer_id 
FROM orders JOIN customers
ON orders.customer_id = customers.customer_id;
````



|table A
| -
| a
| b
| c 

|table B
|-
|a
|d
|c


|a ^ b
|-
|a
|c

## 2 LEFT, RIGHT JOIN


|table A
| -
| a
| b
| c 

|table B
|-
|a
|d
|c


|(LEFT) a ^ b
|-
|a
|b
|c

