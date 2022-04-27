create database PRUEBA
USE PRUEBA
CREATE TABLE categoria
(
id INT,
categoria VARCHAR(200)
)
 
CREATE TABLE subcategoria
(
id INT,
categoria INT,
subcategoria VARCHAR(200)
)
 
INSERT INTO categoria VALUES (1,'categoria1')
INSERT INTO categoria VALUES (2,'categoria2')
INSERT INTO categoria VALUES (3,'categoria3')
 
DELETE FROM categoria
 
INSERT INTO subcategoria VALUES (1,1,'subcategoria11')
INSERT INTO subcategoria VALUES (2,1,'subcategoria12')
INSERT INTO subcategoria VALUES (3,2,'subcategoria21')
INSERT INTO subcategoria VALUES (4,2,'subcategoria22')
INSERT INTO subcategoria VALUES (5,2,'subcategoria23')
INSERT INTO subcategoria VALUES (6,3,'subcategoria31')
 
 
CREATE TABLE resultado
(
categorias VARCHAR(200)
)
 
SELECT id,categoria,IDENTITY(INT,1,1) rn INTO temp FROM categoria
 
DECLARE @x INT
DECLARE @id INT
SET @x=1
 
while @x<=(SELECT COUNT(*) FROM temp)
BEGIN
    SELECT @id=id FROM temp WHERE rn=@x
    INSERT INTO resultado  SELECT categoria FROM categoria WHERE id=@id
    INSERT INTO resultado SELECT subcategoria FROM subcategoria WHERE categoria=@id
    SET @x=@x+1 
 
END
 
 
SELECT * FROM resultado