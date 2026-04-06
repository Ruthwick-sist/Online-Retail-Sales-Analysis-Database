# Online Retail Sales Analysis Database

This is a mini SQL project developed as part of my internship. It simulates an online retail store database where customer, product, and order data are stored. The project includes SQL queries to analyze sales performance and gain insights about products, customers, and revenue. 

---

## Features / Key Tasks

- **Top-Selling Products** – Find which products are selling the most.  
- **Most Valuable Customers** – Identify customers who spent the most money.  
- **Monthly Revenue Calculation** – Calculate revenue month-wise.  
- **Category-Wise Sales Analysis** – Analyze sales for each product category.  
- **Detect Inactive Customers** – Find customers who haven’t placed any orders.  

---

## Database Structure

- **Customers** `(customer_id, name, city)`  
- **Products** `(product_id, name, category, price)`  
- **Orders** `(order_id, customer_id, date)`  
- **Order_Items** `(order_id, product_id, quantity)`  

---

## How to Use

1. Open the file `RetailStore.sql` in SQL Server Management Studio (SSMS).  
2. Execute the script to create the database, tables, and insert sample data.  
3. Run the queries at the end of the file to analyze sales and get insights.  

---

## Technologies

- **SQL Server** – For database creation and query execution.  
- **SQL** – For writing queries and managing relational data.  

---

## Sample Data

The project includes 10 customers, 10 products, and 10 orders covering multiple categories and cities.
