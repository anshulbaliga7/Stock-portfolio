-- JOINS
-- 1 Get technical report for companies
select A.symbol, sector, LTP, volume, RSI, ADX, MACD from technical_signals A
left join company_profile B
on A.symbol = B.symbol
order by (A.symbol);

-- 2 Get fundamental report of company
select F.symbol, report_as_of, LTP, eps, roe, book_value, round(LTP/eps, 2) as pe_ratio
from fundamental_report F
inner join company_price C
on F.symbol = C.symbol
where F.symbol = 'INFY';

-- 3 Get users watchlist
select symbol, LTP, PC, round((LTP-PC), 2) AS CH, round(((LTP-PC)/PC)*100, 2) AS CH_percent from watchlist
natural join company_price
where username = 'anshul'
order by (symbol);

-- 4 Get user's portfolio which is technically strong
SELECT * FROM TECHNICAL_SIGNALS T INNER JOIN TRANSACTION_HISTORY H
WHERE T.symbol = H.symbol AND T.macd = "bull";


-- AGGREGATE OPERATIONS
-- 1 Get max LTP of a company
select symbol, ltp
from company_price
where ltp = (select max(ltp)
from company_price);

-- 2 Count all stocks less than 1000
SELECT COUNT(*)
FROM company_price
WHERE ltp < 1000;

-- 3 Average roe by company
SELECT DISTINCT symbol, AVG(roe)
FROM fundamental_report
GROUP BY symbol;

-- 4 Maximum transaction by which user
SELECT username, rate
FROM transaction_history
WHERE rate = (SELECT max(rate)
FROM transaction_history);

-- SET OPERATIONS
-- 1 Stocks with ltp less than 500 or greater than 2000
SELECT symbol, ltp
FROM company_price
WHERE ltp < 500
UNION
SELECT symbol, ltp
FROM company_price
WHERE ltp > 2000;

-- 2 Stocks which are technically strong in either RSI or MACD
SELECT symbol
FROM technical_signals
WHERE macd="bull"
UNION
SELECT symbol
FROM technical_signals
WHERE rsi < 30;

-- 3 Stocks which are technically strong in both RSI and MACD

SELECT symbol
FROM technical_signals
WHERE macd="bull"
IN
(SELECT symbol
FROM technical_signals
WHERE rsi > 30);

-- 4 Stocks which are in energy sector or oil&gas
SELECT company_name
FROM company_profile
WHERE sector="Energy"
UNION
SELECT company_name
FROM company_profile
WHERE sector="Oil and Gas";


