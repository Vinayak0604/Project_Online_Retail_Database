-- SELECT * FROM COMMAND

-- query the address, starttime and endtime of the servicepoints in the same city as userid 5   
SELECT streetaddr,starttime,endtime
FROM ServicePoint
WHERE ServicePoint.city IN (SELECT Address.city FROM Address WHERE userid=5);


-- query the information of laptops
SELECT *
FROM Product
WHERE type='laptop';

-- query the total quantity of products from store with storeid 8 in the shopping cart
SELECT SUM(quantity) AS totalQuantity
FROM Save_to_Shopping_Cart
WHERE Save_to_Shopping_Cart.pid IN (SELECT Product.pid FROM Product WHERE sid=8);

SELECT name, streetaddr, city
FROM Address
WHERE addrid IN (SELECT addrid FROM Deliver_To WHERE TimeDelivered = '2023-01-01');


 -- query the comments of product 12345678 
 SELECT *
 FROM Comments
 WHERE pid = 12345678; 

-- ------------------------------------------- --
-- Data Modification

-- Insert the user id of sellers whose name starts with A into buyer
INSERT INTO buyer
SELECT * FROM seller
WHERE userid IN (SELECT userid FROM users WHERE name LIKE 'A%');

-- Update the payment state of orders to unpaid which created after year 2017 and with total amount greater than 50.

UPDATE Orders
SET paymentState = 'Unpaid'
WHERE creationTime > '2023-01-01' AND totalAmount > 50;

-- Update the name and contact phone number of address where the provice is Quebec and city is montreal.

UPDATE address
SET name = 'Vinayak', contactPhoneNumber ='1234567'
WHERE province = 'Maharashtra' AND city = 'Mumbai';

-- Delete the store which opened before year 2017
DELETE FROM save_to_shopping_cart
WHERE addTime < '2023-01-01';

-- ------------------------------------------- --
-- Views 
-- Create view of all products whose price above average price.

CREATE VIEW Products_Above_Average_Price AS
SELECT pid, name, price 
FROM Product
WHERE price > (SELECT AVG(price) FROM Product);

select * from products_above_average_price;

-- Update the view
UPDATE Products_Above_Average_Price
SET price = 1
WHERE name = 'Candy';

-- Create view of all products sales in 2016.
CREATE VIEW Product_Sales_For_2016 AS
SELECT pid, name, price
FROM Product
WHERE pid IN (SELECT pid FROM OrderItem WHERE itemid IN 
              (SELECT itemid FROM Contain WHERE orderNumber IN
               (SELECT orderNumber FROM Payment WHERE payTime > '2023-01-01' AND payTime < '2023-12-31')
              )
             );

SELECT * FROM product_sales_for_2023;

-- Update the view
UPDATE product_sales_for_2023
SET price = 2
WHERE name = 'Candy';

-- ------------------------------------------- --
-- Check Constraints

-- Check whether the products saved to the shopping cart after the year 2017 has quantities of smaller than 10.

DROP TABLE Save_to_Shopping_Cart;
CREATE TABLE Save_to_Shopping_Cart
(
    userid INT NOT NULL
    ,pid INT NOT NULL
    ,addTime DATE
    ,quantity INT
    ,PRIMARY KEY (userid,pid)
    ,FOREIGN KEY(userid) REFERENCES Buyer(userid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
    ,CHECK (quantity <= 10 OR addTime > '2024-01-01')
);

INSERT INTO Save_to_Shopping_Cart VALUES(18,67890123,'2022-11-23',9);
INSERT INTO Save_to_Shopping_Cart VALUES(24,67890123,'2023-02-22',8);
INSERT INTO Save_to_Shopping_Cart VALUES(5,56789012,'2022-10-17',11); -- error

-- Check whether the ordered item has 0 to 10 quantities

DROP VIEW Product_Sales_For_2016; -- If create this view before we need to drop it first
DROP TABLE Contain;
CREATE TABLE Contain
(
    orderNumber INT NOT NULL
    ,itemid INT NOT NULL
    ,quantity INT CHECK(quantity > 0 AND quantity <= 10)
    ,PRIMARY KEY (orderNumber,itemid)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
    ,FOREIGN KEY(itemid) REFERENCES OrderItem(itemid)
);

INSERT INTO Contain VALUES (76023921,23543245,11);
INSERT INTO Contain VALUES (23924831,65738929,8);
