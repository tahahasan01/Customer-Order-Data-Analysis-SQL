--TASK 2

drop table Sellers;
exec sp_fkeys 'Sellers'
DROP TABLE IF EXISTS Sellers,OrderItems, ShoppingCarts, CartItems, Payments, Reviews, Addresses, Inventory, Orders, Products, Customers;
CREATE TABLE Sellers (
    SellerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    SellerID INT,
    Name VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    FOREIGN KEY (SellerID) REFERENCES Sellers(SellerID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ShoppingCarts (
    CartID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE CartItems (
    CartItemID INT PRIMARY KEY,
    CartID INT,
    ProductID INT,
    FOREIGN KEY (CartID) REFERENCES ShoppingCarts(CartID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY,
    CustomerID INT,
    AddressLine1 VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(20),
    Country VARCHAR(100),
    IsBilling BIT,
    IsShipping BIT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    ReorderThreshold INT,
    UnitCost DECIMAL(10, 2),
    LastUpdated DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Sellers
INSERT INTO Sellers (SellerID, Name) VALUES (1, 'Seller A'), (2, 'Seller B'), (3, 'Seller C'),(4, 'Seller D'), (5, 'Seller E'), (6, 'Seller F'), (7, 'Seller G'), (8, 'Seller H'),
(9, 'Seller I'), (10, 'Seller J'),(11, 'Seller K'),
(12, 'Seller L'),
(13, 'Seller M'),
(14, 'Seller N'),
(15, 'Seller O'),
(16, 'Seller P'),
(17, 'Seller Q'),
(18, 'Seller R'),
(19, 'Seller S'),
(20, 'Seller T');

-- Insert Customers
INSERT INTO Customers (CustomerID, Name, Email) VALUES 
(1, 'Customer A', 'custA@example.com'),
(2, 'Customer B', 'custB@example.com'),
(3, 'Customer C', 'custC@example.com'),
(4, 'Customer D', 'custD@example.com'),
(5, 'Customer E', 'custE@example.com'),
(6, 'Customer F', 'custF@example.com'),
(7, 'Customer G', 'custG@example.com'),
(8, 'Customer H', 'custH@example.com'),
(9, 'Customer I', 'custI@example.com'),
(10, 'Customer J', 'custJ@example.com'),
(11, 'Customer K', 'custK@example.com'),
(12, 'Customer L', 'custL@example.com'),
(13, 'Customer M', 'custM@example.com'),
(14, 'Customer N', 'custN@example.com'),
(15, 'Customer O', 'custO@example.com'),
(16, 'Customer P', 'custP@example.com'),
(17, 'Customer Q', 'custQ@example.com'),
(18, 'Customer R', 'custR@example.com'),
(19, 'Customer S', 'custS@example.com'),
(20, 'Customer T', 'custT@example.com');

-- Insert Products
INSERT INTO Products (ProductID, SellerID, Name, Category, Price) VALUES 
(1, 1, 'Product 1', 'Electronics', 299.99),
(2, 1, 'Product 2', 'Electronics', 199.99),
(3, 2, 'Product 3', 'Books', 29.99),
(4, 2, 'Product 4', 'Books', 39.99),
(5, 3, 'Product 5', 'Home', 49.99),
(6, 3, 'Product 6', 'Home', 59.99),
(7, 4, 'Product 7', 'Furniture', 299.99),
(8, 5, 'Product 8', 'Clothing', 19.99),
(9, 5, 'Product 9', 'Clothing', 24.99),
(10, 6, 'Product 10', 'Garden', 89.99),
(11, 6, 'Product 11', 'Garden', 99.99),
(12, 7, 'Product 12', 'Electronics', 499.99),
(13, 8, 'Product 13', 'Furniture', 799.99),
(14, 9, 'Product 14', 'Home', 199.99),
(15, 10, 'Product 15', 'Books', 9.99),
(16, 11, 'Product 16', 'Electronics', 199.99),
(17, 12, 'Product 17', 'Books', 29.99),
(18, 13, 'Product 18', 'Home', 49.99),
(19, 14, 'Product 19', 'Furniture', 299.99),
(20, 15, 'Product 20', 'Clothing', 19.99),
(21, 16, 'Product 21', 'Garden', 89.99),
(22, 17, 'Product 22', 'Electronics', 499.99),
(23, 18, 'Product 23', 'Furniture', 799.99),
(24, 19, 'Product 24', 'Home', 199.99),
(25, 20, 'Product 25', 'Books', 9.99);


-- Insert Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES 
(1, 1, '2024-09-01', 299.99),  -- Electronics
(2, 2, '2024-09-10', 199.99),  -- Electronics
(3, 1, '2024-09-15', 29.99),   -- Books
(4, 2, '2024-09-20', 39.99),   -- Books
(5, 2, '2024-09-22', 59.99),   -- Home
(6, 2, '2024-09-25', 89.99),   -- Garden
(7, 6, '2024-09-26', 299.99),  -- Electronics
(8, 7, '2024-09-27', 199.99),  -- Electronics
(9, 2, '2024-09-28', 499.99),  -- Furniture
(10, 1, '2024-09-29', 799.99), -- Furniture
(11, 10, '2024-10-05', 19.99),  -- Clothing
(12, 11, '2024-10-05', 49.99),  -- Home
(13, 12, '2024-10-06', 9.99),   -- Books
(14, 1, '2024-10-07', 150.00),  -- Books
(15, 1, '2024-10-08', 250.00),  -- Home
(16, 2, '2024-10-09', 450.00),  -- Electronics
(17, 2, '2024-10-10', 150.00),  -- Books
(18, 3, '2024-10-11', 250.00),  -- Garden
(19, 4, '2024-10-12', 300.00),  -- Home
(20, 2, '2024-10-13', 150.00),  -- Clothing
(21, 6, '2024-10-14', 199.99),  -- Clothing
(22, 7, '2024-10-14', 250.00);  -- Garden



-- Insert OrderItems
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Price) VALUES 
(1, 1, 1, 1, 299.99),  -- Product 1 (Electronics)
(2, 2, 2, 1, 199.99),  -- Product 2 (Electronics)
(3, 3, 3, 1, 29.99),   -- Product 3 (Books)
(4, 4, 4, 1, 39.99),   -- Product 4 (Books)
(5, 5, 5, 1, 49.99),   -- Product 5 (Home)
(6, 6, 6, 1, 89.99),   -- Product 6 (Garden)
(7, 7, 1, 1, 299.99),  -- Product 1 (Electronics)
(8, 8, 7, 1, 499.99),  -- Product 7 (Furniture)
(9, 9, 8, 1, 799.99),  -- Product 8 (Furniture)
(10, 10, 9, 1, 19.99),  -- Product 9 (Clothing)
(11, 11, 5, 1, 49.99),  -- Product 5 (Home)
(12, 12, 3, 1, 29.99),  -- Product 3 (Books)
(13, 13, 4, 1, 39.99),  -- Product 4 (Books)
(14, 14, 6, 1, 59.99),  -- Product 6 (Home)
(15, 15, 10, 1, 89.99),  -- Product 10 (Garden)
(16, 16, 2, 1, 199.99),  -- Product 2 (Electronics)
(17, 17, 9, 1, 19.99),  -- Product 9 (Clothing)
(18, 18, 10, 1, 89.99),  -- Product 10 (Garden)
(19, 19, 7, 1, 499.99),  -- Product 7 (Furniture)
(20, 20, 8, 1, 19.99),   -- Product 8 (Furniture)
(21, 21, 9, 1, 19.99),   -- Product 9 (Clothing)
(22, 22, 6, 1, 59.99);    -- Product 6 (Home)



-- Insert ShoppingCarts
INSERT INTO ShoppingCarts (CartID, CustomerID) VALUES (1, 1), (2, 2), (3, 3),(4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10),(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- Insert CartItems
INSERT INTO CartItems (CartItemID, CartID, ProductID) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 16),
(12, 12, 17),
(13, 13, 18),
(14, 14, 19),
(15, 15, 20),
(16, 16, 21),
(17, 17, 22),
(18, 18, 23),
(19, 19, 24),
(20, 20, 25);

-- Insert Payments
INSERT INTO Payments (PaymentID, OrderID, Amount, PaymentMethod) VALUES 
(1, 1, 299.99, 'Credit Card'),
(2, 2, 199.99, 'Debit Card'),
(3, 3, 29.99, 'PayPal'),
(4, 4, 39.99, 'Credit Card'),
(5, 5, 59.99, 'Credit Card'),
(6, 6, 299.99, 'Debit Card'),
(7, 7, 19.99, 'Credit Card'),
(8, 8, 89.99, 'PayPal'),
(9, 9, 499.99, 'Credit Card'),
(10, 10, 799.99, 'Debit Card'),
(11, 13, 150.00, 'Credit Card'),
(12, 14, 250.00, 'Debit Card'),
(13, 15, 300.00, 'PayPal'),
(14, 16, 450.00, 'Credit Card'),
(15, 17, 150.00, 'Credit Card'),
(16, 18, 250.00, 'Debit Card'),
(17, 19, 300.00, 'PayPal'),
(18, 20, 450.00, 'Credit Card'),
(19, 21, 150.00, 'Debit Card'),
(20, 22, 250.00, 'PayPal');

-- Insert Reviews
INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment) VALUES 
(1, 1, 1, 5, 'Excellent product!'),
(2, 2, 1, 4, 'Very good!'),
(3, 3, 3, 3, 'Good but can be improved.'),
(4, 4, 4, 5, 'Loved it!'),
(5, 5, 5, 4, 'Very satisfied.'),
(6, 6, 6, 4, 'Nice quality product.'),
(7, 7, 7, 5, 'High quality and durable.'),
(8, 8, 8, 4, 'Comfortable and affordable.'),
(9, 9, 9, 5, 'Great for the price.'),
(10, 10, 10, 3, 'Could be better.'),
(11, 16, 11, 5, 'Fantastic product!'),
(12, 17, 12, 4, 'Very helpful!'),
(13, 18, 13, 3, 'It works fine.'),
(14, 19, 14, 5, 'Superb quality!'),
(15, 20, 15, 4, 'Pretty good.'),
(16, 21, 16, 4, 'Satisfactory experience.'),
(17, 22, 17, 5, 'Highly recommend!'),
(18, 23, 18, 4, 'Decent quality.'),
(19, 24, 19, 5, 'Absolutely love it!'),
(20, 25, 20, 3, 'Not as expected.');

-- Insert Addresses
INSERT INTO Addresses (AddressID, CustomerID, AddressLine1, City, State, ZipCode, Country, IsBilling, IsShipping) VALUES 
(1, 1, '123 Main St', 'City A', 'State A', '11111', 'Country A', 1, 1),
(2, 2, '456 Market St', 'City B', 'State B', '22222', 'Country B', 1,0),
(3, 3, '789 Broadway St', 'City C', 'State C', '33333', 'Country C', 1, 1),
(4, 4, '101 King St', 'City D', 'State D', '44444', 'Country D',1,0),
(5, 5, '202 Queen St', 'City E', 'State E', '55555', 'Country E', 0, 1),
(6, 6, '303 Prince St', 'City F', 'State F', '66666', 'Country F', 1, 0),
(7, 7, '404 Duke St', 'City G', 'State G', '77777', 'Country G', 1, 1),
(8, 8, '505 Duchess St', 'City H', 'State H', '88888', 'Country H', 0, 1),
(9, 9, '606 Maple St', 'City I', 'State I', '99999', 'Country I', 1, 0),
(10, 10, '707 Pine St', 'City J', 'State J', '10101', 'Country J', 0, 1),
(11, 11, '808 Oak St', 'City K', 'State K', '11112', 'Country K', 1, 1),
(12, 12, '909 Cedar St', 'City L', 'State L', '12121', 'Country L', 1, 0),
(13, 13, '1001 Fir St', 'City M', 'State M', '13131', 'Country M', 0, 1),
(14, 14, '1111 Spruce St', 'City N', 'State N', '14141', 'Country N', 1, 0),
(15, 15, '1212 Willow St', 'City O', 'State O', '15151', 'Country O', 1, 1),
(16, 16, '1313 Birch St', 'City P', 'State P', '16161', 'Country P', 0, 1),
(17, 17, '1414 Elm St', 'City Q', 'State Q', '17171', 'Country Q', 1, 0);

-- Insert Inventory
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, ReorderThreshold, UnitCost, LastUpdated) VALUES 
(1, 1, 50, 10, 199.99, '2024-03-01'),
(2, 2, 20, 5, 150.00, '2024-03-02'),
(3, 3, 30, 8, 20.00, '2024-01-03'),
(4, 4, 40, 12, 30.00, '2024-03-04'),
(5, 5, 25, 10, 40.00, '2024-01-05'),
(6, 6, 15, 5, 50.00, '2024-03-06'),
(7, 7, 10, 3, 250.00, '2024-01-07'),
(8, 8, 5, 2, 15.00, '2024-01-08'),
(9, 9, 12, 4, 20.00, '2024-04-09'),
(10, 10, 8, 3, 80.00, '2024-01-10'),
(11, 11, 40, 10, 199.99, '2024-01-11'),
(12, 12, 25, 5, 150.00, '2024-05-12'),
(13, 13, 30, 8, 20.00, '2024-01-13'),
(14, 14, 15, 12, 30.00, '2024-01-14'),
(15, 15, 22, 10, 40.00, '2024-03-15'),
(16, 16, 18, 5, 50.00, '2024-01-16'),
(17, 17, 12, 3, 250.00, '2024-04-17'),
(18, 18, 6, 2, 15.00, '2024-05-18'),
(19, 19, 10, 4, 20.00, '2024-01-19'),
(20, 20, 5, 3, 80.00, '2024-01-20');


--TASK 3
--A
SELECT * FROM Orders WHERE CustomerID = 1;
/* This query retrieves all orders for a specific customer, which is crucial for tracking their purchase history. */

--B.Get Total Inventory Value
SELECT SUM(QuantityInStock * UnitCost) AS TotalInventoryValue
FROM Inventory;  --This query helps assess the financial impact of each product category within the inventory.

--C.
SELECT ProductID, AVG(Rating) AS AvgRating 
FROM Reviews 
GROUP BY ProductID 
ORDER BY AvgRating DESC;
/* Helps find top-rated products, crucial for marketing and customer recommendations. */

--D.Query: Total Quantity of All Products
SELECT SUM(QuantityInStock) AS TotalQuantity 
FROM Inventory;
--Importance: Calculating the total quantity of all products helps managers assess the overall inventory levels. This information can be crucial for financial forecasting, inventory audits, and deciding on purchasing strategies.


--TASK 4
SELECT TOP 5 C.CustomerID, C.Name, SUM(O.TotalAmount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.Name
ORDER BY TotalSpent DESC

--TASK 5
--5. Retrieve Products with the Highest Average Ratings
SELECT TOP 5 P.ProductID, P.Name, AVG(R.Rating) AS AverageRating
FROM Products P
LEFT JOIN Reviews R ON P.ProductID = R.ProductID
GROUP BY P.ProductID, P.Name
HAVING AVG(R.Rating) IS NOT NULL  -- This ensures that only products with ratings are shown
ORDER BY AverageRating DESC;


--6. Find Customers Who Have Made More Than One Purchase on the Same Day
SELECT C.CustomerID, C.Name, COUNT(O.OrderID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.Name
HAVING COUNT(O.OrderID) > 1;

--TASK 7
--7. Calculate the Total Revenue for Each Product Category
SELECT P.Category, SUM(O.TotalAmount) AS TotalRevenue
FROM Products P
JOIN OrderItems OI ON P.ProductID = OI.ProductID
JOIN Orders O ON OI.OrderID = O.OrderID
GROUP BY P.Category;

--8. List Customers Who Have Not Reviewed Any Products
SELECT C.CustomerID, C.Name
FROM Customers C
LEFT JOIN Reviews R ON C.CustomerID = R.CustomerID
WHERE R.ReviewID IS NULL;


--9. Find Products with Quantities Below the Average Quantity in Stock
SELECT P.ProductID, P.Name, I.QuantityInStock
FROM Products P
JOIN Inventory I ON P.ProductID = I.ProductID
WHERE I.QuantityInStock < (SELECT AVG(QuantityInStock) FROM Inventory);

--10. Calculate the Total Number of Orders for Each Customer and Show Only Those with More Than 5 Orders
SELECT C.CustomerID, C.Name, COUNT(O.OrderID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.Name
HAVING COUNT(O.OrderID) > 5;

--11. Retrieve the 3 Most Recent Orders for a Specific Customer
SELECT TOP 3 O.OrderID, O.OrderDate, O.TotalAmount
FROM Orders O
WHERE O.CustomerID = 1  -- Replace 1 with the specific CustomerID
ORDER BY O.OrderDate DESC


--12. List Customers Who Have Purchased Products from At Least Two Different Sellers
SELECT C.CustomerID, C.Name
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY C.CustomerID, C.Name
HAVING COUNT(DISTINCT P.SellerID) >= 2;

--13. Find Customers Who Have Placed an Order in the Last 30 Days
SELECT DISTINCT C.CustomerID, C.Name
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderDate >= DATEADD(DAY, -30, GETDATE());

--14. List Customers Who Have Made a Purchase in Every Product Category
SELECT C.CustomerID, C.Name,
       CASE 
           WHEN COUNT(DISTINCT P.Category) = (SELECT COUNT(DISTINCT Category) FROM Products) 
           THEN 'Yes' 
           ELSE NULL 
       END AS HasPurchasedAllCategories
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
LEFT JOIN OrderItems OI ON O.OrderID = OI.OrderID
LEFT JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY C.CustomerID, C.Name;


--15. Calculate the Total Number of Products Sold by Each Seller
SELECT S.SellerID, S.Name, SUM(OI.Quantity) AS TotalProductsSold
FROM Sellers S
JOIN Products P ON S.SellerID = P.SellerID
JOIN OrderItems OI ON P.ProductID = OI.ProductID
GROUP BY S.SellerID, S.Name;

--16. Retrieve the Top 5 Products with the Highest Sales in the Last Month
SELECT TOP 5 P.ProductID, P.Name, SUM(OI.Quantity) AS TotalSold
FROM Products P
JOIN OrderItems OI ON P.ProductID = OI.ProductID
JOIN Orders O ON OI.OrderID = O.OrderID
WHERE O.OrderDate >= DATEADD(MONTH, -1, GETDATE())
GROUP BY P.ProductID, P.Name
ORDER BY TotalSold DESC;


--17. Retrieve the Latest 5 Orders Along with Customer Details and Order Items for Each Order
SELECT TOP 5 O.OrderID, O.OrderDate, C.Name AS CustomerName, OI.Quantity, P.Name AS ProductName
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
ORDER BY O.OrderDate DESC

 

--19. List Products That Have Never Been Reviewed and Have Quantities in Stock Greater Than Zero, Along with the Average Rating for Their Category
SELECT P.ProductID, P.Name, I.QuantityInStock, AVG(R.Rating) AS AverageRating
FROM Products P
JOIN Inventory I ON P.ProductID = I.ProductID
LEFT JOIN Reviews R ON P.ProductID = R.ProductID
WHERE R.ReviewID IS NULL AND I.QuantityInStock > 0
GROUP BY P.ProductID, P.Name, I.QuantityInStock;

--20. Find the Top 3 Products with the Highest Total Sales, Including Details of the Reviews for Each Product
SELECT TOP 3 P.ProductID, P.Name, SUM(OI.Quantity) AS TotalSold, AVG(R.Rating) AS AverageRating
FROM Products P
JOIN OrderItems OI ON P.ProductID = OI.ProductID
JOIN Orders O ON OI.OrderID = O.OrderID
LEFT JOIN Reviews R ON P.ProductID = R.ProductID
GROUP BY P.ProductID, P.Name
ORDER BY TotalSold DESC


--21. Retrieve All Customers Who Have Placed Orders, Including Details of Their Orders, Even for Orders with No Associated Customers
SELECT C.CustomerID, C.Name, O.OrderID, O.OrderDate, O.TotalAmount
FROM Orders O
LEFT JOIN Customers C ON O.CustomerID = C.CustomerID;

--22. Write a SQL Query to Retrieve the Total Number of Products and the Total Revenue for Each Product Category, Including Products That May Not Have Been Sold
SELECT P.Category, COUNT(P.ProductID) AS TotalProducts, COALESCE(SUM(OI.Quantity * P.Price), 0) AS TotalRevenue
FROM Products P
LEFT JOIN OrderItems OI ON P.ProductID = OI.ProductID
GROUP BY P.Category
ORDER BY TotalRevenue DESC;

--23. Write a SQL Query to Retrieve Detailed Information About Products and Their Associated Orders
SELECT P.ProductID, P.Name, P.Category, OI.Quantity, OI.Price, (COALESCE(OI.Quantity, 0) * COALESCE(OI.Price, 0)) AS TotalRevenue
FROM Products P
LEFT JOIN OrderItems OI ON P.ProductID = OI.ProductID
WHERE P.Category = 'Electronics'
ORDER BY TotalRevenue DESC;


--24. Retrieve Product Categories with the Total Number of Products Sold\
SELECT P.Category, COUNT(OI.ProductID) AS TotalSold
FROM Products P
JOIN OrderItems OI ON P.ProductID = OI.ProductID
GROUP BY P.Category;

-- 25. Retrieve customers with the total number of orders they have placed,
-- ordered in descending order by the total number of orders, and show
-- only customers who have placed more than 5 orders.
SELECT C.CustomerID, C.Name, COUNT(O.OrderID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.Name
HAVING COUNT(O.OrderID) > 5
ORDER BY TotalOrders DESC;
