CREATE DATABASE house_price_db;
USE house_price_db;

CREATE TABLE house_prices (
    Id INT PRIMARY KEY,
    MSSubClass INT,
    MSZoning VARCHAR(10),
    LotArea INT,
    LotConfig VARCHAR(20),
    BldgType VARCHAR(20),
    OverallCond INT,
    YearBuilt INT,
    YearRemodAdd INT,
    Exterior1st VARCHAR(20),
    BsmtFinSF2 FLOAT,
    TotalBsmtSF FLOAT,
    SalePrice FLOAT
);
select * from house_prices;
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 
'D:/Study2/Python/NEW CLASS/PYTHON JIGAR SIR CLASS/Machine Learning/Housepriceprediction.csv'
INTO TABLE house_prices
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM house_prices;
-- Average House Price
SELECT AVG(SalePrice) AS avg_price FROM house_prices;

-- Price by Zoning
SELECT MSZoning, AVG(SalePrice) AS avg_price
FROM house_prices
GROUP BY MSZoning
ORDER BY avg_price DESC;

-- Old vs New Houses
SELECT 
    CASE 
        WHEN YearBuilt >= 2000 THEN 'New'
        ELSE 'Old'
    END AS house_type,
    AVG(SalePrice) AS avg_price
FROM house_prices
GROUP BY house_type;







