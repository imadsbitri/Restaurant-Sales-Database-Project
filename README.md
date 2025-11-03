# 🍽️ Restaurant Sales Database Project

## 📖 Project Overview
This project builds a **relational SQL database** for a restaurant management system, designed to track menu items, customer orders, and sales activity.  
It simulates restaurant operations, allowing data analysts and business users to query insights like:
- Best-selling menu items  
- Revenue by category (American, Asian, Mexican, Italian, etc.)  
- Order frequency by time or date  

The dataset was created using **MySQL Workbench**, with properly structured schemas, foreign keys, and sample data inserts for analysis.

---

## 🧱 Database Schema

**Schema:** `restaurant_db`

The project includes two main tables:

### 1️⃣ `menu_items`
Stores details about each item offered by the restaurant.

| Column | Type | Description |
|---------|------|-------------|
| menu_item_id | SMALLINT | Unique ID for each menu item |
| item_name | VARCHAR(45) | Name of the food item |
| category | VARCHAR(45) | Type of cuisine (American, Asian, etc.) |
| price | DECIMAL(5,2) | Item price |

### 2️⃣ `order_details`
Records all individual order transactions and links each order to the corresponding menu item.

| Column | Type | Description |
|---------|------|-------------|
| order_details_id | SMALLINT | Unique ID for each order detail |
| order_id | SMALLINT | Identifier for a group of ordered items |
| order_date | DATE | Date of the order |
| order_time | TIME | Time the order was placed |
| item_id | SMALLINT | Links to `menu_items(menu_item_id)` |

---

## 📊 Insights You Can Derive

- Top 10 most ordered menu items  
- Most popular cuisine categories  
- Peak hours and busiest days  
- Average order value  
- Menu optimization opportunities based on demand  

---

## ⚙️ Technologies Used

- **SQL (MySQL Workbench)** — Database creation and querying  
- **ER Modeling** — Database normalization and relationships  
- **Data Analysis Queries** — Aggregations, joins, and insights extraction  

---

## 📈 Example Query

### 🥇 1. Find the Most Expensive and Least Expensive Items
```sql
SELECT 
    item_name, category, price
FROM menu_items
ORDER BY price ASC
LIMIT 1;

SELECT 
    item_name, category, price
FROM menu_items
ORDER BY price DESC
LIMIT 1;
```

### 🍝 2. Find the Average Price per Category
```sql
SELECT category,
       ROUND(AVG(price), 2) AS average_price
FROM menu_items
GROUP BY category
ORDER BY average_price DESC;
```

### 💰 3. Top 5 Highest-Spending Orders
```sql
SELECT od.order_id,
       ROUND(SUM(mi.price), 2) AS total_spent
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY od.order_id
ORDER BY total_spent DESC
LIMIT 5;
```

###  📦 4. Most Ordered Menu Items by Category
```sql
SELECT mi.category,
       mi.item_name,
       COUNT(od.item_id) AS times_ordered
FROM order_details od
JOIN menu_items mi ON od.item_id = mi.menu_item_id
GROUP BY mi.category, mi.item_name
ORDER BY times_ordered DESC;
```
