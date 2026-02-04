CREATE DATABASE task9_star;

USE task9_star;

CREATE TABLE dim_product (
         product_id INT AUTO_INCREMENT PRIMARY KEY,
         product_name VARCHAR(100),
         category VARCHAR(50)
    );

CREATE TABLE dim_product (
         product_id INT AUTO_INCREMENT PRIMARY KEY,
         product_name VARCHAR(100),
         category VARCHAR(50)
     );

CREATE TABLE dim_region (
         region_id INT AUTO_INCREMENT PRIMARY KEY,
         region_name VARCHAR(50)
     );

CREATE TABLE dim_date (
         date_id INT AUTO_INCREMENT PRIMARY KEY,
         order_date DATE,
         year INT,
         month INT,
         day INT
     );

CREATE TABLE fact_sales (
         sales_id INT AUTO_INCREMENT PRIMARY KEY,
         customer_id INT,
         product_id INT,
         date_id INT,
         region_id INT,
         quantity INT,
         sales_amount DECIMAL(10,2),
    
         FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
         FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
         FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
         FOREIGN KEY (region_id) REFERENCES dim_region(region_id)
     );

INSERT INTO dim_customer (customer_name, city, country) VALUES
('Aarav Sharma','Mumbai','India'),
('Neha Verma','Delhi','India'),
('Rahul Singh','Bangalore','India'),
('John Smith','New York','USA'),
('Emma Brown','London','UK');

INSERT INTO dim_product (product_name, category) VALUES
('Laptop','Electronics'),
('Phone','Electronics'),
('Chair','Furniture'),
('Tablet','Electronics'),
('Desk','Furniture');

INSERT INTO dim_region (region_name) VALUES
('Asia'),
('North America'),
('Europe');

INSERT INTO dim_date (order_date, year, month, day) VALUES
('2024-01-10',2024,1,10),
('2024-01-11',2024,1,11),
('2024-01-12',2024,1,12),
('2024-01-13',2024,1,13),
('2024-01-14',2024,1,14);

INSERT INTO fact_sales (customer_id, product_id, date_id, region_id, quantity, sales_amount) VALUES
(1,1,1,1,2,50000),
(2,2,2,1,1,20000),
(3,3,3,1,3,9000),
(4,4,4,2,2,30000),
(5,5,5,3,1,15000);

CREATE INDEX idx_customer ON fact_sales(customer_id);

CREATE INDEX idx_product ON fact_sales(product_id);

CREATE INDEX idx_date ON fact_sales(date_id);

CREATE INDEX idx_region ON fact_sales(region_id);

SELECT c.customer_name, p.product_name, f.sales_amount
     FROM fact_sales f
     JOIN dim_customer c ON f.customer_id = c.customer_id
     JOIN dim_product p ON f.product_id = p.product_id;

SELECT COUNT(*) FROM fact_sales;

 SHOW TABLES;

 SELECT * FROM fact_sales;

SELECT * FROM fact_sales
     INTO OUTFILE 'C:/analysis_outputs.csv'
     FIELDS TERMINATED BY ','
     LINES TERMINATED BY '\n';
