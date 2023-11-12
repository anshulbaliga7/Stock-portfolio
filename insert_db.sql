insert into user_profile values
('anshul', 'anshulbaliga@gmail.com', 9320394903, sha2('anshul123', 224)),
('ramesh', 'ramesh@gmail.com', 9800000002, sha2('ramesh123', 224)),
('suresh', 'suresh@gmail.com', 9800000003, sha2('suresh123', 224)),
('anirudh', 'anirudh@gmail.com', 9800000004, sha2('anirudh123', 224)),
('rajesh', 'rajesh@gmail.com', 9800000005, sha2('rajesh123', 224)),
('rakesh', 'rakesh@gmail.com', 9800000006, sha2('rakesh123', 224)),
('mukesh', 'mukesh@gmail.com', 9800000007, sha2('mukesh123', 224)),
('neelesh', 'neelesh@gmail.com', 9800000008, sha2('neelesh123', 224)),
('tina', 'tina@gmail.com', 9800000009, sha2('tina123', 224)),
('rina', 'rina123@gmail.com', 9811111111, sha2('rina123', 224)),
('gita', 'gita@gmail.com', 9800000010, sha2('gita123', 224)),
('sita', 'sita@gmail.com', 9800000011, sha2('sita', 224)),
('rita', 'rita@gmail.com', 9860000014, sha2('rita123', 224)),
('lita', 'lita@gmail.com', 9860000013, sha2('lita123', 224)),
('ananya', 'ananya@gmail.com', 9860000012, sha2('ananya123', 224));

insert into company_profile values
('INFY', 'Infosys', 'IT', 1000000000, 21212121221),
('ITC', 'ITC Ltd.', 'FMCG', 123232332, 131321321),
('RLC', 'Reliance Ind.', 'Oil and Gas', 63233232, 61321321),
('TSL', 'Tata Steel', 'Manufacturing', 32323233232, 323321321321),
('ADP', 'Adani Power', 'Energy', 102323233232, 10323321321321),
('TCS', 'Tata Consultancy Services', 'IT', 23233232, 21321321),
('HCL', 'HCL Limited', 'IT', 532323233232, 5323321321321),
('TPW', 'Tata Power', 'Energy', 82323233232, 823321321321),
('SUZ', 'Suzlon Energy', 'Energy', 12323233232, 123321321321),
('NST', 'Nestle India', 'FMCG', 62323233232, 623321321321);

insert into company_price (symbol, LTP, PC) values
('INFY', 500, 470),
('ITC', 5800, 6000),
('RLC', 400, 410),
('TSL', 1010, 1000),
('ADP', 500, 480),
('TCS', 1000, 1040),
('HCL', 600, 580.5),
('TPW', 1222.3, 1220),
('SUZ', 1500.5, 1499.4),
('NST', 788, 777);

insert into fundamental_report(symbol, report_as_of, EPS, ROE, book_value) values
('INFY', '77/78_q3', 20.5, 11.97, 120),
('INFY', '77/78_q2', 19.5, 10, 110),
('ITC', '77/78_q3', 205, 50, 300),
('ITC', '77/78_q2', 211, 55, 310),
('RLC', '77/78_q3', 8, 4, 90),
('RLC', '77/78_q2', 7.5, 3.5, 88),
('TSL', '77/78_q3', 34, 15, 180),
('TSL', '77/78_q2', 31, 13, 178),
('ADP', '77/78_q3', 21, 12, 119),
('ADP', '77/78_q2', 20, 11, 118),
('TCS', '77/78_q3', 30, 12, 170),
('TCS', '77/78_q2', 35.4, 13, 180.5),
('HCL', '77/78_q3', 22, 13, 120),
('HCL', '77/78_q2', 21, 12, 117),
('TPW', '77/78_q3', 50, 15, 200),
('TPW', '77/78_q2', 48, 14, 199),
('SUZ', '77/78_q3', 60, 20, 220),
('SUZ', '77/78_q2', 55, 18, 200),
('NST', '77/78_q3', 36, 20, 220),
('NST', '77/78_q2', 35, 21, 200);

insert into technical_signals(symbol, RSI, volume, ADX, MACD) values
('INFY', 65.1, 451000, 33.3, 'bull'),
('ITC', 50.5, 100000, 40, 'bull'),
('RLC', 20, 12344, 15, 'bear'),
('TSL', 70, 1200000, 30, 'bull'),
('ADP', 45, 212000, 16.5, 'bull'),
('TCS', 53.4, 15312, 25.29, 'bull'),
('HCL', 66.41, 406121, 34.66, 'bull'),
('TPW', 40.2, 34000, 40, 'side'),
('SUZ', 35, 120000, 30, 'side'),
('NST', 75, 335000, 44, 'bull');

insert into dividend_history values
('INFY', '76/77', 5, 10),
('INFY', '75/76', 4, 11),
('ITC', '76/77', 10, 15),
('ITC', '75/76', 10, 13),
('RLC', '76/77', 0, 0),
('RLC', '75/76', 0, 0),
('TSL', '76/77', 20, 10),
('TSL', '75/76', 14, 10),
('ADP', '76/77', 0, 0),
('ADP', '75/76', 0, 0),
('TCS', '76/77', 5, 10),
('TCS', '75/76', 5, 10),
('HCL', '76/77', 11, 5),
('HCL', '75/76', 11, 0),
('TPW', '76/77', 0, 0),
('TPW', '75/76', 0, 0),
('SUZ', '76/77', 0, 0),
('SUZ', '75/76', 0, 0),
('NST', '76/77', 20, 25),
('NST', '75/76', 15, 20);

insert into watchlist values
('anshul', 'INFY'),
('anshul', 'RLC'),
('anshul', 'TCS'),
('anshul', 'SUZ'),
('anirudh', 'TCS'),
('anirudh', 'NST'),
('anirudh', 'ADP'),
('rita', 'TSL'),
('rita', 'SUZ'),
('lita', 'ITC'),
('lita', 'HCL'),
('lita', 'NST'),
('mukesh', 'INFY'),
('mukesh', 'ADP'),
('mukesh','TPW');

insert into news(news_id, title, sources, date_of_news, related_company) values
(1, 'Reliance Industries announces stock split of ', 'Times Now', '2022-11-01', 'RLC'),
(2, 'Suzlon CEO Dies', 'RepublicTV', '2022-11-04', 'SUZ'),
(3, "TCS lays off 20% of it's workforce", 'News Now', '2022-11-05', 'TCS'),
(4, "Nestle finds itself in the midst of MSG controversy", 'WION', '2022-11-10', 'NST');

insert into transaction_history(username, symbol, transaction_date, quantity, rate) values
('anshul', 'ITC', '2022-11-01', 100, 5900),
('anshul', 'RLC', '2022-11-02', 400, 405),
('anshul', 'RLC', '2022-11-06', -20, 500),
('anshul', 'SUZ', '2022-11-10', 10, 1500),
('anshul', 'ADP', '2022-11-15', 100, 250),
('anshul', 'TCS', '2022-11-20', 150, 800),
('anshul', 'ADP', '2022-11-20', -25, 300);
