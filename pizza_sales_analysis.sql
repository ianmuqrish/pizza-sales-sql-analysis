-- 1. What is the total number of pizzas sold?
SELECT SUM(quantity) AS total_pizzas_sold
FROM order_details;

-- 2. Which pizza type was ordered the most?
SELECT pt.name AS pizza_type, SUM(od.quantity) AS total_quantity_sold
FROM order_details  od
JOIN pizzas pi 
ON od.pizza_id = pi.pizza_id
JOIN pizza_types pt
ON pt.pizza_type_id = pi.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity_sold DESC;

-- 3. What is the total number of orders made each day?
SELECT date, COUNT(order_id) AS total_orders
FROM orders
GROUP BY date;

-- 4. When (time) were the most orders made?
SELECT time, COUNT(order_id) AS total_orders
FROM orders
GROUP BY time
ORDER BY total_orders DESC;

-- 5. Which pizza size generated the most revenue?
SELECT pi.size, ROUND(SUM(od.quantity * pi.price),2) AS total_revenue
FROM order_details od
JOIN pizzas pi ON od.pizza_id = pi.pizza_id
GROUP BY pi.size
ORDER BY total_revenue DESC;

-- 6.  What is the total revenue for each order?
SELECT od.order_id, SUM(od.quantity * pi.price) AS order_revenue
FROM order_details od
JOIN pizzas pi
ON od.pizza_id = pi.pizza_id
GROUP BY od.order_id;

-- 7.  What is the total quantity sold for each pizza category?
SELECT pt.category, SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN pizzas pi 
ON od.pizza_id = pi.pizza_id
JOIN pizza_types pt
ON pt.pizza_type_id = pi.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity_sold;

-- 8.  What are the top 3 most profitable pizza types (based on total revenue)?
SELECT pt.name, SUM(od.quantity * pi.price) AS total_revenue
FROM order_details od
JOIN pizzas pi
ON od.pizza_id = pi.pizza_id
JOIN pizza_types pt
ON pt.pizza_type_id = pi.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC;

-- 9. What is the average number of pizzas per order?
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS avg_pizzas_per_order
FROM order_details;

-- 10. Which pizza category has the highest average price per pizza?
SELECT pt.category, ROUND(AVG(pi.price), 2) AS avg_price
FROM pizzas pi
JOIN pizza_types pt 
  ON pi.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY avg_price DESC;

