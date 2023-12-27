DESCRIBE wfp_food_prices_pakistan;
SELECT *
FROM wfp_food_prices_pakistan;
SELECT 'Date', cmname AS commodities
FROM wfp_food_prices_pakistan
WHERE mktname IN ('Quetta' ,'Karachi', 'Peshawar') AND price<=50;
SELECT mktname AS City,
COUNT(*) as Observations
FROM wfp_food_prices_pakistan
GROUP BY 1;
SELECT COUNT( DISTINCT mktname) AS Cities
FROM wfp_food_prices_pakistan;
SELECT DISTINCT mktname AS Cities
FROM wfp_food_prices_pakistan;
SELECT DISTINCT cmname AS Commodities
FROM wfp_food_prices_pakistan;
SELECT mktname AS City, AVG(price) AS avg_price
FROM wfp_food_prices_pakistan
GROUP BY 1;
SELECT mktname AS City,
AVG(price),
MAX(price),
STDDEV(price),
SUM(price)
FROM wfp_food_prices_pakistan
GROUP BY 1;
SELECT 'Total Price' AS 'Description',
AVG(price),
MAX(price),
STDDEV(price),
SUM(price)
FROM wfp_food_prices_pakistan;
SELECT mktname AS City,
ROUND(AVG(price),1),
ROUND(MAX(price),1),
ROUND(STDDEV(price),1),
ROUND(SUM(price),1)
FROM wfp_food_prices_pakistan
GROUP BY 1
ORDER BY 1 DESC;
SELECT *
FROM wfp_food_prices_pakistan
WHERE mktname LIKE 'Q%';
SELECT `date`, ROUND(AVG(price),1) AS avg_price, ROUND(MAX(price),1) AS max_price
FROM wfp_food_prices_pakistan
WHERE cmname LIKE '%wheat%' AND mktname IN ('Quetta', 'Lahore', 'Multan')
GROUP BY 1
ORDER BY `date`;
SELECT mktname AS City, cmname AS Commodity, AVG(price) AS avg_price, MAX(price) AS max_price
FROM wfp_food_prices_pakistan
WHERE cmname LIKE '%Wheat%'
GROUP BY mktname, cmname
Order BY mktname, cmname;
SELECT `date`, ROUND(AVG(price),1) AS avg_price, ROUND(MAX(price),1) AS max_price
FROM wfp_food_prices_pakistan
WHERE cmname LIKE '%wheat%' AND mktname NOT IN ('Karachi')
GROUP BY 1
ORDER BY `date`;
SELECT `date`, ROUND(AVG(price),1) AS avg_price, ROUND(MAX(price),1) AS max_price
FROM wfp_food_prices_pakistan
WHERE cmname LIKE '%wheat%' AND mktname != 'Karachi'
GROUP BY 1
ORDER BY `date`;
SELECT mktname AS City, ROUND(AVG(price),1) AS avg_price
FROM wfp_food_prices_pakistan
WHERE cmname = 'Wheat - Retail'
GROUP BY mktname
HAVING ROUND(AVG(price),1) < 30;
#-- case Statement
Describe wfp_food_prices_pakistan;
SELECT 'aggregate' , AVG(price), STDDEV(price)
From wfp_food_prices_pakistan;
SELECT 'date', cmname AS Commodity, mktname AS City,
CASE WHEN price<30 THEN 'LOW'
	WHEN price > 250 THEN 'HIGH'
    ELSE 'FAIR' END AS price_category
FROM wfp_food_prices_pakistan;
SELECT `date`, cmname AS Commodity, mktname AS City,
CASE WHEN mktname = 'Karachi' THEN 'Sindh'
WHEN mktname = 'Multan' THEN 'Punjab'
WHEN mktname = 'Quetta' THEN 'Balochistan'
WHEN mktname = 'Peshawar' THEN 'KPK'
ELSE 'NULL' END AS Province 
FROM wfp_food_prices_pakistan;
SELECT `date`, cmname AS Commodity, mktname AS City,
CASE WHEN mktname = 'KARACHI' THEN 'Sindh'
WHEN mktname IN ('MULTAN','LAHORE') THEN 'Punjab'
WHEN mktname = 'QUETTA' THEN 'Balochistan'
WHEN mktname LIKE 'PE%' THEN 'KPK'
ELSE 'NULL' END AS Province 
FROM wfp_food_prices_pakistan;
SELECT `Date`, cmname AS Commodity, category, price, mktname AS City,
CASE WHEN mktname IN ('KARACHI','LAHORE') THEN 'Big Cities'
WHEN mktname IN ('MULTAN' ,'PESHAWAR') THEN 'Medium_Sized Cities'
ELSE 'Small City' END AS City_category
FROM wfp_food_prices_pakistan
ORDER By mktname;
SELECT `Date`, cmname AS Commodity, category, price, mktname AS City,
CASE WHEN price<100 THEN 'FAIR'
WHEN price BETWEEN 100 AND 350 THEN 'UNFAIR'
WHEN price>350 THEN 'SPECULATIVE'
ELSE 'NULL' END AS price_state
FROM wfp_food_prices_pakistan;
SELECT `Date`, cmname AS Commodity, category, price, mktname AS City,
CASE WHEN price<100 THEN 'FAIR'
WHEN price >= 100 AND price <=350 THEN 'UNFAIR'
WHEN price>350 THEN 'SPECULATIVE'
ELSE 'NULL' END AS price_state
FROM wfp_food_prices_pakistan;