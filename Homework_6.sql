-- Задача 1.
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

-- Сделала несколько вариантов и все равно не выходит 17 минут

-- 1 вариант

DROP PROCEDURE IF EXISTS seconds_to_DT;
DELIMITER //
CREATE PROCEDURE seconds_to_DT(seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    WHILE seconds >= 86400 DO
		SET days = seconds / 86400;
		SET seconds = seconds - (days) * 86400;
    END WHILE;
    
    WHILE seconds >= 3600 DO
		SET hours = seconds / 3600;
		SET seconds = seconds - hours * 3600;
    END WHILE;

    WHILE seconds >= 60 DO
		SET minutes = seconds / 60;
		SET seconds = seconds % 60;
    END WHILE;

SELECT CONCAT
(
  days, ' days ',
  hours, ' hours ',
  minutes, ' minutes ',
  seconds, ' seconds'
) AS date_time;
END //
DELIMITER ;

CALL seconds_to_DT(123456);

-- 2 вариант

 DROP PROCEDURE IF EXISTS seconds_to_DT;
DELIMITER //
CREATE PROCEDURE seconds_to_DT(seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    SET days = seconds / 86400;
    SET hours = (seconds % 86400) / 3600;
    SET minutes = ((seconds % 86400) %3600) / 60;
    SET seconds = ((seconds % 86400) % 3600) % 60;

SELECT CONCAT
(
  days, ' days ',
  hours, ' hours ',
  minutes, ' minutes ',
  seconds, ' seconds'
) AS date_time;
END //
DELIMITER ;

CALL seconds_to_DT(123456);


-- Задача 2.
-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS numbers;
DELIMITER //
CREATE PROCEDURE numbers()
BEGIN
     DECLARE n INT default 0;
     DROP TABLE IF EXISTS nums;
     CREATE TABLE nums (n INT);

     WHILE n < 10 DO
     SET n = n + 2;
     INSERT INTO nums VALUES(n);
     END WHILE;

 SELECT * FROM nums;
 END //
DELIMITER ;

CALL numbers();