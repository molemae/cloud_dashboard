-- total number of orders for each employee
SELECT
  e.employeeID,
  e.firstName || ' ' || e.lastName AS employeeName,
  COUNT(o.orderID) AS totalOrders
FROM employees e
LEFT JOIN orders o ON e.employeeID = o.employeeID
GROUP BY e.employeeID, employeeName
ORDER BY totalOrders DESC;

-- best sales person overall 
select e.firstname || ' ' || e.lastname as name, SUM(od.unitprice * od.quantity * (1 - od.discount)) as ordersum
from employees e
join orders o on e.employeeid = o.employeeid
join order_details od on o.orderid = od.orderid
group by e.employeeid
order by ordersum DESC

-- sales person of the month
WITH MonthlyEmployeeOrderSums as(
    select
        substr(orderdate,1,7) as month,
        e.firstname || ' ' || e.lastname as e_name,
        sum(od.unitprice * od.quantity * (1 - od.discount)) as ordersum,
        RANK() over (partition by substr(orderdate,1,7) order by sum(od.unitprice * od.quantity * (1 - od.discount)) desc) as e_rank
    from employees e
    join orders o on e.employeeid = o.employeeid
    join order_details od on o.orderid = od.orderid
    group by month, e_name
)
select month, e_name, ordersum
from MonthlyEmployeeOrderSums
where e_rank = 1
order by month desc

-- Orders per city
SELECT shipcountry, shipcity, SUM(order_sum) AS city_order_sum
FROM (
  SELECT shipcountry, shipcity, quantity * unitprice AS order_sum
  FROM customers AS c
  JOIN orders o ON c.customerid = o.customerid 
  JOIN order_details od ON o.orderid = od.orderid
  -- WHERE quantity * unitprice > 100
) AS subquery
GROUP BY shipcountry, shipcity
order by shipcountry, city_order_sum DESC;

-- average order value per month
SELECT
  SUBSTRING(o.orderDate, 1, 7) AS month,
  AVG(od.unitPrice * od.quantity * (1 - od.discount)) AS avgOrderValue
FROM orders o
JOIN order_details od ON o.orderID = od.orderID
GROUP BY month
ORDER BY month;

-- top-selling products:
SELECT
  p.productID,
  p.productName,
  SUM(od.quantity) AS totalQuantitySold
FROM products p
JOIN order_details od ON p.productID = od.productID
GROUP BY p.productID, p.productName
ORDER BY totalQuantitySold DESC;

-- total revenue from each category
SELECT
  c.categoryID,
  c.categoryName,
  SUM(od.unitPrice * od.quantity * (1 - od.discount)) AS totalRevenue
FROM categories c
JOIN products p ON c.categoryID = p.categoryID
JOIN order_details od ON p.productID = od.productID
GROUP BY c.categoryID, c.categoryName
ORDER BY totalRevenue DESC;

-- average freight cost by shipper
SELECT
  s.shipperID,
  s.companyName AS shipperName,
  AVG(o.freight) AS avgFreightCost
FROM shippers s
JOIN orders o ON s.shipperID = o.shipVia
GROUP BY s.shipperID, shipperName
ORDER BY avgFreightCost;

-- verage unit price of products by category
SELECT
  c.categoryID,
  c.categoryName,
  AVG(p.unitPrice) AS avgUnitPrice
FROM categories c
JOIN products p ON c.categoryID = p.categoryID
GROUP BY c.categoryID, c.categoryName
ORDER BY avgUnitPrice;






