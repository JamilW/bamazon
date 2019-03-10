-- Drops the bamazon_db if it exists currently --
DROP DATABASE IF EXISTS bamazon_db;
-- Creates the "bamazon_db" database --
CREATE DATABASE bamazon_db;

-- Makes it so all of the following code will affect bamazon_db --
USE bamazon_db;

-- Creates the table "people" within animals_db --
CREATE TABLE products (
  id INTEGER(10) NOT NULL AUTO_INCREMENT,
  -- Makes a string column called "item_id" which cannot contain null --
  item_id VARCHAR(30) NOT NULL,
  -- Makes a string column called "product_name" which cannot contain null --
  product_name VARCHAR(50) NOT NULL,
  -- Makes a string column called "department_name" --
  department_name VARCHAR(30),
  -- Makes an numeric column called "price" --
  price DECIMAL(10,2) NULL,
  -- Makes a string column called "department_name" --
  stock_quantity VARCHAR(30), 
  PRIMARY KEY (id)
);

-- Creates new rows containing data in all named columns --
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (238355, "Bose Headphones", "Electronics", 100.00, 25);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (465635, "Adidas Trefoil Hoodie", "Men's Fashion", 63.99, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (658463, "Stainless Steel Dinner Forks Set", "Kitchen", 11.99, 85);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (955644, "Samsung Fitness Tracker", "Sports", 29.99, 25);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (564332, "Star Wars Blu-Ray", "Movies", 25.00, 10);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (884573, "Dog Travel Carrier", "Pets", 33.98, 66);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (363373, "Spider-Man - Playstation 4", "Gamming", 59.99, 43);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (625622, "Bosch Rear Window Wipers", "Automotive", 13.30, 14);  

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (773552, "Vanity Make-Up Mirror", "Beauty", 25.95, 3);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (147485, "Fisher-Price Jumperoo", "Baby", 97.99, 24);  

SELECT * FROM products
