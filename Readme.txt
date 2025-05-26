# 🛒 E-Commerce Order Management System 

A real-world relational database system designed to manage orders, customers, products, payments, and inventory for an e-commerce platform. Built using SQL (T-SQL/MySQL/PostgreSQL) with full normalization, performance tuning, security practices, and automation logic.

---

## 📁 Project Overview

This project simulates a production-grade e-commerce order management system that can be used by online retailers to:

- Manage customer accounts
- Track product inventory
- Process orders and payments
- Generate sales reports
- Automate stock updates
- Implement role-based access control

---

## 🧾 Features

✅ Fully normalized schema (3NF)  
✅ 100+ rows of realistic sample data  
✅ Stored procedures for common operations  
✅ Triggers for automatic stock updates  
✅ Views for simplified reporting  
✅ Indexes for performance optimization  
✅ Role-based access control (RBAC)  
✅ ER Diagram included  
✅ Ready to upload to GitHub  

---



### Relationships:
- A `customer` belongs to one `role`
- A `product` belongs to one `category`
- An `order` is placed by one `customer`
- An `order` contains multiple `order_items`
- Each `order_item` references one `product`
- A `payment` is associated with one `order`

---

## 📁 Folder Structure
ecommerce-order-system/
│
├── documentation/
│ ├── er_diagram.drawio # Entity Relationship diagram
│ └── README.md # This file
│
├── sample_data/
│ └── insert_realistic_data.sql # 100+ rows of realistic test data
│
├── database_setup/
│ └── setup_database.sql # Database schema (tables, constraints, keys)
│
├── query_scripts/
│ ├── advanced_queries.sql # JOINs, GROUP BY, Subqueries
│ └── sales_reports.sql # Sales reports, top-selling products
│
├── automation/
│ ├── custom_procedures.sql # CreateNewOrder, etc.
│ └── automated_triggers.sql # AdjustStockInsteadOfInsert
│
├── access_control/
│ └── user_permissions.sql # Role-based access control
│
├── performance_tuning/
│ └── optimize_queries.sql # Performance tuning with indexes
│
└── validation_tests/
└── test_scenarios.sql # Test cases for validation


---

## 🔧 Technologies Used

- **SQL** (Compatible with SQL Server, MySQL, PostgreSQL)
- **T-SQL / PL/pgSQL / PL/MySQL** (depending on DBMS)
- **GitHub** – For version control and portfolio display
- **draw.io** – For ER Diagram creatio

## How to Run

1. Open your preferred SQL client (e.g., SSMS, MySQL Workbench, pgAdmin)
2. Create a new database:  
   ```sql
   CREATE DATABASE ECommerceDB;
   USE ECommerceDB;
