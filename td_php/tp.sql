CREATE DATABASE tp_sql
CREATE TABLE garages(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(64),
creation DATETIME,
city VARCHAR(64),
turnover INT);

CREATE TABLE cars(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
garage_id INT,
model VARCHAR(64),
color VARCHAR(64),
price INT);

ALTER TABLE `cars` ADD FOREIGN KEY (garage_id) REFERENCES `garages`(id);

INSERT INTO `garages` (name,creation,city,turnover)
 VALUES
 ('LuxuryLyon','2010-06-24','Lyon',10256000),
 ('MegeveSportsCar','2006-03-14','Megève',8567000),
 ('LyonAuto','2017-01-13','Lyon',867000),
 ('SquidGameAuto','2020-08-27','Séoul',1545000),
 ('LSCustom','2013-08-13','Los Santos',13567000),
 ('LyonGitan','2015-03-20','Lyon',54000),
 ('NWAuto','2011-04-30','New York',12876000),
 ('JapanCars','2008-09-02','Tokyo',4768000),
 ('GermanTrucks','2016-05-11','Berlin',14520000),
 ('DirtyCars','2015-03-06','Sallanches',1200);

 INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (1,'BMW X5','Blanche',64000),
 (1,'C45 AMG','Noir',115000),
 (1,'E45 AMG','Noir',125000),
 (1,'Tesla Model S','Blanche',84000),
 (1,'Ferrari Italia','Rouge',245000);

  INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (2,'Lamborghini Urus','Maron',340000),
 (2,'Renault Megan Sport','Noir',56000),
 (2,'CLASS G AMG','Noir',225000),
 (2,'Tesla Model X','Blanche',102000),
 (2,'C45 AMG','Bleu',115000);

  INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (3,'Renault Megan','Bleu',34000),
 (3,'BMW X1','Blanche',56000),
 (3,'Mercedes A45','Blanche',42000),
 (3,'Jeep Renegade','Noir',34000),
 (3,'Fiat Multiplat','Rose',5600);

  INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (4,'Subaru Impreza','Bleu',54000),
 (4,'Subaru Impreza','Blanche',54000),
 (4,'Subaru Impreza','Noir',54000),
 (4,'Subaru Impreza','Bleu',54000),
 (4,'Subaru Impreza','Grise',54000);

  INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (5,'Elegy RH8','Noir',0),
 (5,'T20','Chrome',1250000),
 (5,'Trufade Adder','Orange',3000000),
 (5,'Zentorno','Bleu',900000),
 (5,'Faggio mod','Rose',30000);

  INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (6,'Caravane','Rouillé',4500),
 (6,'Caravane','Rouillé',4500),
 (6,'Caravane','Rouillé',4500),
 (6,'Caravane','Rouillé',4500),
 (6,'Caravane','Rouillé',4500);

 INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (7,'Lamborghini Urus','Noir',340000),
 (7,'C63 AMG','Blanche',123000),
 (7,'E63 AMG','Noir',119000),
 (7,'Chevrelot Tahoe','Noir',80000),
 (7,'BMW X5','Grise',64000);


 INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (8,'Subaru wrx','Bleu',45000),
 (8,'Mitsubishi EK','Jaune',32000),
 (8,'Mitsubishi ASX','Noir',67000),
 (8,'Toyota RAF4','Noir',67000),
 (8,'Toyota Prius','Grise',44000);

  INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (9,'Scania','Bleu',234000),
 (9,'Renault','Jaune',178000),
 (9,'Mercedes','Noir',320000),
 (9,'Lancia','Noir',123000),
 (9,'Man','Grise',15400);

  INSERT INTO `cars` (garage_id,model,color,price)
 VALUES
 (10,'Twingo','Verte',3400),
 (10,'Fiat Qubo','Bleu',5600),
 (10,'Multipla','Rouge',2400),
 (10,'Peugeot 207','Noir',1000),
 (10,'Ford Ka I','Grise',800);




SELECT * FROM `cars`;

SELECT * FROM `garages` 
WHERE name LIKE '%l%';

SELECT * FROM `cars` 
ORDER BY price desc;

SELECT garage_id, count(*)
FROM `cars`
GROUP BY garage_id
HAVING count(*);

SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT garage_id, SUM(price) 
FROM `cars` 
JOIN `garages`
GROUP BY garage_id 
ORDER BY SUM(price) DESC
LIMIT 1;

DELETE FROM `cars` 
WHERE model LIKE 'E%';

DELETE FROM `garages` 
WHERE city = 'Lyon';

UPDATE `cars` 
SET color = 'vert' 
WHERE price > 200000;

UPDATE `cars` 
SET price = 35000
WHERE garage_id = 2;
