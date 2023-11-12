 -- Triggers

DELIMITER $$
CREATE TRIGGER PRICE_CHECK
     BEFORE INSERT ON TRANSACTION_HISTORY
     FOR EACH ROW
     BEGIN
     IF NEW.RATE < 10 THEN
     SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Please invest a higher amount';
     ELSEIF NEW.RATE > 1000000 THEN
     SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Bandwidth to support this investment does not exist';
     END IF;
END $$
DELIMITER ;

insert into transaction_history(username, symbol, transaction_date, quantity, rate) values
('anshul', 'NST', '2022-11-21', 100, 1234567890);



