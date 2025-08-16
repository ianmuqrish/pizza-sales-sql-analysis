# 🍕 Pizza Sales SQL Analysis

This SQL project explores a fictional pizza sales dataset from Maven Analytics. Using structured queries, I analyzed sales performance, customer behavior, and pizza trends to extract meaningful business insights.

---

## 📁 Dataset Overview

The database contains four main tables:

- **orders**: order_id, date, time  
- **order_details**: order_id, pizza_id, quantity  
- **pizzas**: pizza_id, pizza_type_id, size, price  
- **pizza_types**: pizza_type_id, name, category, ingredients  

---

## 🎯 Objectives

The main goals of this project were to:

- Practice SQL querying skills  
- Analyze pizza sales trends  
- Discover insights to improve restaurant performance  

---

## 🔍 Key Questions Answered

### 1. What is the total number of pizzas sold?
```sql
SELECT SUM(quantity) AS total_pizzas_sold
FROM order_details;
```

**Answer:**

<img width="100" height="33" alt="Screenshot 2025-08-16 101039" src="https://github.com/user-attachments/assets/9682ad82-1465-4654-a30b-f255034fc59e" />


Total number of pizzas sold are 49574.

***

### 2. Which pizza type was ordered the most?
```sql
SELECT pt.name AS pizza_type, SUM(od.quantity) AS total_quantity_sold
FROM order_details  od
JOIN pizzas pi 
ON od.pizza_id = pi.pizza_id
JOIN pizza_types pt
ON pt.pizza_type_id = pi.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity_sold DESC;
```

**Answer:**

<img width="265" height="36" alt="Screenshot 2025-08-16 102110" src="https://github.com/user-attachments/assets/7107f2a2-9bb2-474c-a495-92b8c72de5f2" />

The Classic Deluxe Pizza was ordered the most.

***

### 3. What is the total number of orders made each day?
```sql
SELECT date, COUNT(order_id) AS total_orders
FROM orders
GROUP BY date;
```

**Answer:**

<img width="148" height="188" alt="Screenshot 2025-08-16 102705" src="https://github.com/user-attachments/assets/312e1325-13b4-40ad-99b6-5899fcba0b4e" />

The picture attached is an example of the total number of orders made for 10 days.

***

### 4. When (time) were the most orders made?
```sql
SELECT time, COUNT(order_id) AS total_orders
FROM orders
GROUP BY time
ORDER BY total_orders DESC;
```

**Answer:**

<img width="135" height="35" alt="Screenshot 2025-08-16 103225" src="https://github.com/user-attachments/assets/5d8cd446-1eaf-49c0-856a-837dae79ab2e" />

At 6:49 p.m were the most orders made.

***

### 5. Which pizza size generated the most revenue?
```sql
SELECT pi.size, ROUND(SUM(od.quantity * pi.price),2) AS total_revenue
FROM order_details od
JOIN pizzas pi ON od.pizza_id = pi.pizza_id
GROUP BY pi.size
ORDER BY total_revenue DESC;
```

**Answer:**

<img width="123" height="104" alt="Screenshot 2025-08-16 103616" src="https://github.com/user-attachments/assets/78926f8f-e00f-4fc0-9c11-d03bd7f36a11" />

Size L pizza generated the most revenue.

***

### 6. What is the total revenue for each order?
```sql
SELECT od.order_id, SUM(od.quantity * pi.price) AS order_revenue
FROM order_details od
JOIN pizzas pi
ON od.pizza_id = pi.pizza_id
GROUP BY od.order_id;
```

**Answer:**

<img width="146" height="189" alt="Screenshot 2025-08-16 104022" src="https://github.com/user-attachments/assets/917f651a-dcaa-4d6b-bf59-cd9d6342a421" />

The picture attached is an example of the total revenue for 10 orders.

***

### 7. What is the total quantity sold for each pizza category?
```sql
SELECT pt.category, SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN pizzas pi 
ON od.pizza_id = pi.pizza_id
JOIN pizza_types pt
ON pt.pizza_type_id = pi.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity_sold;
```

**Answer:**

<img width="166" height="86" alt="Screenshot 2025-08-16 104617" src="https://github.com/user-attachments/assets/c87b8e5f-ea85-4db0-b1be-2671330cb01d" />

- Total quantity sold for **Chicken**: 11,050  
- Total quantity sold for **Veggie**: 11,649  
- Total quantity sold for **Supreme**: 11,987  
- Total quantity sold for **Classic**: 14,888  

***

### 8. What are the top 3 most profitable pizza types (by revenue)?
```sql
SELECT pt.name, SUM(od.quantity * pi.price) AS total_revenue
FROM order_details od
JOIN pizzas pi
ON od.pizza_id = pi.pizza_id
JOIN pizza_types pt
ON pt.pizza_type_id = pi.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC;
```

**Answer:**

<img width="274" height="69" alt="Screenshot 2025-08-16 105322" src="https://github.com/user-attachments/assets/95459a2d-6c1b-405b-b7e4-ee00f666bf38" />
The top 3 most profitable pizza types based on revenue:
- The Thai Chicken Pizza 
- The Barbecue Chicken Pizza
- The Califronia Chicken Pizza  

***

### 9. What is the average number of pizzas per order?
```sql
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 2) AS avg_pizzas_per_order
FROM order_details;
```

**Answer:**

<img width="125" height="38" alt="Screenshot 2025-08-16 105730" src="https://github.com/user-attachments/assets/061ceb7c-acdc-4713-8396-4199e4ef9d07" />
The average number of pizzas per order is 2.32

### 10. Which pizza category has the highest average price?
```sql
SELECT pt.category, ROUND(AVG(pi.price), 2) AS avg_price
FROM pizzas pi
JOIN pizza_types pt 
  ON pi.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY avg_price DESC;
```

**Answer:**

<img width="123" height="87" alt="Screenshot 2025-08-16 110014" src="https://github.com/user-attachments/assets/e8632455-ea48-408a-a7d6-512f530c4cf2" />
The Supreme pizza category has the highest average price.

---

## 📊 Key Insights

- **Over 49,000 pizzas** were sold in total.
- The **"Classic Deluxe" pizza** was the most ordered type.
- **Large-sized pizzas** generated the highest revenue across all orders.
- Most orders were placed during the **evening hours**, showing peak demand around dinner time.
- The **Supreme** category had the highest **average price per pizza**.
- The average customer ordered **around 2.32 pizzas** per order.
- The **top 3 revenue-generating pizzas** are The Thai Chicken Pizza, The Barbecue Chicken Pizza and The California Chicken Pizza.

These insights help understand what types, sizes, and times are most profitable — which can guide pricing, inventory, and marketing strategies.

---

## 🛠️ Skills Used

- SQL (JOIN, GROUP BY, ORDER BY, LIMIT, ROUND)
- Aggregation (SUM, COUNT)
- Data exploration & analysis

---

## 📌 Tools

- **SQL** (MySQL)
- **DB Tool**: MySQL Workbench

---

## 📚 Source

- [Maven Analytics Pizza Sales Dataset](https://www.mavenanalytics.io/data-playground)

---





