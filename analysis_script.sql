-- Total units sold
SELECT 
    SUM(quantity)
FROM purchase_order_details;

-- How many units were sold (By Product)
SELECT 
	product_id,
    SUM(quantity) AS quantity,
    SUM(quantity * unit_cost) AS revenue
FROM purchase_order_details
GROUP BY product_id;

-- Total revenue
SELECT 
    SUM(quantity * unit_cost) AS total_revenue
FROM purchase_order_details;

-- REVENUE PER MONTH
SELECT 
    DATE_FORMAT(o.order_date, '%M-%Y'),
    SUM(od.quantity * od.unit_price)
FROM orders o
JOIN order_details od
	on o.id = od.order_id
GROUP BY DATE_FORMAT(o.order_date, '%M-%Y');


-- Top Customers 
SELECT
	c.id AS customer_id,
    c.state_province AS state,
    SUM(od.quantity) AS units_purchased,
    SUM(od.unit_price * od.quantity) AS total_spent
FROM customers c
JOIN orders o
	ON c.id = o.customer_id
JOIN order_details od
	ON od.order_id = o.id
GROUP BY c.id
ORDER BY total_spent DESC;

-- AVG time to ship orders
SELECT 
	AVG(DATEDIFF(shipped_date, order_date)) AS avg_shipping_time
FROM orders;




    

