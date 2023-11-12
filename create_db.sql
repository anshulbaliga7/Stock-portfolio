CREATE DATABASE portfolio;
USE portfolio;

CREATE TABLE company_profile
  (
     symbol         VARCHAR(6),
     company_name   VARCHAR(100) NOT NULL,
     sector         VARCHAR(20) NOT NULL,
     market_cap     BIGINT NOT NULL,
     paidup_capital BIGINT NOT NULL,
     PRIMARY KEY(symbol)
  );

CREATE TABLE company_price
  (
     symbol VARCHAR(6),
     ltp    FLOAT NOT NULL,
     pc     FLOAT NOT NULL,
     PRIMARY KEY(symbol),
     FOREIGN KEY(symbol) REFERENCES company_profile(symbol)
  );

CREATE TABLE fundamental_report
  (
     symbol       VARCHAR(6),
     report_as_of VARCHAR(10),
     eps          FLOAT NOT NULL,
     roe          FLOAT NOT NULL,
     book_value   FLOAT NOT NULL,
     PRIMARY KEY (symbol, report_as_of),
     FOREIGN KEY (symbol) REFERENCES company_profile(symbol)
  );

CREATE TABLE technical_signals
  (
     symbol VARCHAR(6),
     ltp    FLOAT,
     rsi    FLOAT NOT NULL,
     volume FLOAT NOT NULL,
     adx    FLOAT NOT NULL,
     macd   VARCHAR(4) NOT NULL,
     PRIMARY KEY (symbol),
     FOREIGN KEY (symbol) REFERENCES company_profile(symbol)
  );

CREATE TABLE dividend_history
  (
     symbol         VARCHAR(6),
     fiscal_year    VARCHAR(6),
     bonus_dividend FLOAT,
     cash_dividend  FLOAT,
     PRIMARY KEY(symbol, fiscal_year),
     FOREIGN KEY(symbol) REFERENCES company_profile(symbol)
  );

CREATE TABLE news
  (
     news_id         INT auto_increment,
     title           VARCHAR(200) NOT NULL,
     date_of_news    VARCHAR(12),
     related_company VARCHAR(6),
     sources         VARCHAR(20),
     PRIMARY KEY(news_id, sources),
     FOREIGN KEY(related_company) REFERENCES company_profile(symbol)
  );

CREATE TABLE user_profile
  (
     username      VARCHAR(30),
     email         VARCHAR(60) UNIQUE NOT NULL,
     phone         BIGINT UNIQUE NOT NULL,
     user_password VARCHAR(224),
     PRIMARY KEY(username)
  );

CREATE TABLE watchlist
  (
     username VARCHAR(30),
     symbol   VARCHAR(6),
     PRIMARY KEY(username, symbol),
     FOREIGN KEY(username) REFERENCES user_profile(username),
     FOREIGN KEY(symbol) REFERENCES company_profile(symbol)
  );

CREATE TABLE transaction_history
  (
     transaction_id   INT auto_increment,
     username         VARCHAR(30) NOT NULL,
     symbol           VARCHAR(6) NOT NULL,
     transaction_date DATETIME NOT NULL,
     quantity         INT NOT NULL,
     rate             FLOAT NOT NULL,
     PRIMARY KEY(transaction_id),
     FOREIGN KEY(symbol) REFERENCES company_profile(symbol),
     FOREIGN KEY(username) REFERENCES user_profile(username)
  ); 