DROP TABLE IF EXISTS online_sales;
use sales_db;
CREATE TABLE online_sales (
    `Transaction ID` INT,
    `Date` DATE,
    `Product Category` VARCHAR(50),
    `Product Name` VARCHAR(100),
    `Units Sold` INT,
    `Unit Price` DECIMAL(10, 2),
    `Revenue` DECIMAL(10, 2),
    `Region` VARCHAR(50),
    `Payment Method` VARCHAR(50)
);
DESCRIBE online_sales;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Online Sales Data.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM online_sales;
SELECT * FROM online_sales LIMIT 5;
SELECT 
    YEAR(`Date`) AS year,
    MONTH(`Date`) AS month,
    ROUND(SUM(`Revenue`), 2) AS total_revenue,
    COUNT(DISTINCT `Transaction ID`) AS order_volume
FROM online_sales
GROUP BY YEAR(`Date`), MONTH(`Date`)
ORDER BY year, month;