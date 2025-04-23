use salesdb;
-- Question 1: Achieving 1NF
-- Creating a new table for the normalized structure
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insertion of normalized data
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');


--  Question 2: Achieving 2NF
-- Creating Orders table (for customer info)
CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Creating OrderItems table (for product info)
CREATE TABLE OrderItems_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);

-- Insertion of data into Orders
INSERT INTO Orders_2NF VALUES (101, 'John Doe');
INSERT INTO Orders_2NF VALUES (102, 'Jane Smith');
INSERT INTO Orders_2NF VALUES (103, 'Emily Clark');

-- Insertion of data into OrderItems
INSERT INTO OrderItems_2NF VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems_2NF VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems_2NF VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems_2NF VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems_2NF VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems_2NF VALUES (103, 'Phone', 1);
select* from OrderItems_2NF;
select* from Orders_2NF ;
select* from ProductDetail_1NF;
