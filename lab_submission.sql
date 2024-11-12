-- (i) A Procedure called PROC_LAB5
DELIMITER $$

CREATE PROCEDURE PROC_LAB5(IN saleDate DATE)
BEGIN
    SELECT s.saleId, s.date, c.customerName, p.productName, s.Quantity_sold, s.unit_price
    FROM sale s
    JOIN product p ON s.ProductId = p.productId
    JOIN customer c ON s.customerName = c.customerName
    WHERE s.date = saleDate;
END$$

DELIMITER ;



-- (ii) A Function called FUNC_LAB5
DELIMITER $$

CREATE FUNCTION FUNC_LAB5(productId INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_sales DECIMAL(10, 2);
    
    SELECT SUM(s.Quantity_sold * s.unit_price) INTO total_sales
    FROM sale s
    WHERE s.ProductId = productId;
    
    RETURN total_sales;
END$$

DELIMITER ;


-- (iii) A View called VIEW_LAB5
CREATE VIEW VIEW_LAB5 AS
SELECT o.OrderId, o.Order_Date, c.customerName, p.productName, o.Quantity_Ordered, o.Productprice
FROM order o
JOIN customer c ON o.customerId = c.customerId
JOIN product p ON o.ProductName = p.productName;
