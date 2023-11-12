-- FUNCTION
-- get buy or sell signals for a stock

DELIMITER $$
CREATE FUNCTION TECHNICAL_STRENGTH(stock VARCHAR(4))
RETURNS VARCHAR(4)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(4);
    DECLARE indi VARCHAR(4);
    SELECT macd INTO indi
    FROM technical_signals WHERE symbol=stock;
    IF indi = "bull" THEN
    set result="Buy";
    ELSEIF indi="side" THEN
    set result="Wait";
    ELSE
    set result="Sell";
    END IF;
    RETURN result;
END; $$
DELIMITER ;

SELECT symbol, TECHNICAL_STRENGTH(symbol) AS TECHNICAL_INDICATOR
FROM company_price;

-- PROCEDURE
-- Procedure to get details of required stock

DELIMITER $$
CREATE PROCEDURE GET_COMPANY_INFO (IN symbol varchar(5))
DETERMINISTIC
BEGIN
	SELECT symbol, company_name, sector, market_cap, paidup_capital, ltp
    FROM company_profile NATURAL JOIN company_price
    WHERE company_profile.symbol = symbol;
END
$$
DELIMITER ;

CALL GET_COMPANY_INFO("RLC");







