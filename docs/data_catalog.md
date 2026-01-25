# Data Catalog – Gold Layer

## Overview

The **Gold Layer** represents the business-ready data model designed to support analytical, reporting, and decision-making use cases. It follows a dimensional modeling approach and consists primarily of **dimension tables** and **fact tables** that capture key business entities and metrics.

---

## 1. `gold.dim_customers`

### Purpose

Stores customer master data enriched with demographic and geographic attributes, enabling customer-level analysis and segmentation.

### Columns

| Column Name       | Data Type    | Description                                                                     |
| ----------------- | ------------ | ------------------------------------------------------------------------------- |
| `customer_key`    | INT          | Surrogate key uniquely identifying each customer record in the dimension table. |
| `customer_id`     | INT          | Unique numerical identifier assigned to each customer in the source system.     |
| `customer_number` | NVARCHAR(50) | Alphanumeric customer identifier used for tracking and external referencing.    |
| `first_name`      | NVARCHAR(50) | Customer's first name as recorded in the system.                                |
| `last_name`       | NVARCHAR(50) | Customer's last name or family name.                                            |
| `country`         | NVARCHAR(50) | Country of residence of the customer (e.g., `Australia`).                       |
| `marital_status`  | NVARCHAR(50) | Customer's marital status (e.g., `Married`, `Single`).                          |
| `gender`          | NVARCHAR(50) | Customer's gender (e.g., `Male`, `Female`, `n/a`).                              |
| `birthdate`       | DATE         | Customer's date of birth in `YYYY-MM-DD` format (e.g., `1971-10-06`).           |
| `create_date`     | DATE         | Date when the customer record was created in the system.                        |

---

## 2. `gold.dim_products`

### Purpose

Provides descriptive information about products and their attributes, supporting product-level analysis across categories and product lines.

### Columns

| Column Name            | Data Type    | Description                                                                            |
| ---------------------- | ------------ | -------------------------------------------------------------------------------------- |
| `product_key`          | INT          | Surrogate key uniquely identifying each product record in the dimension table.         |
| `product_id`           | INT          | Unique product identifier from the source system.                                      |
| `product_number`       | NVARCHAR(50) | Structured alphanumeric product code used for identification and inventory management. |
| `product_name`         | NVARCHAR(50) | Descriptive product name including key characteristics such as type, color, or size.   |
| `category_id`          | NVARCHAR(50) | Identifier of the product category used for hierarchical classification.               |
| `category`             | NVARCHAR(50) | High-level product category (e.g., `Bikes`, `Components`).                             |
| `subcategory`          | NVARCHAR(50) | More granular product classification within a category.                                |
| `maintenance_required` | NVARCHAR(50) | Indicates whether the product requires maintenance (e.g., `Yes`, `No`).                |
| `cost`                 | INT          | Base cost of the product expressed in whole monetary units.                            |
| `product_line`         | NVARCHAR(50) | Product line or series to which the product belongs (e.g., `Road`, `Mountain`).        |
| `start_date`           | DATE         | Date when the product became available for sale or use.                                |

---

## 3. `gold.fact_sales`

### Purpose

Captures transactional sales data at the line-item level, enabling revenue, volume, and customer behavior analysis.

### Columns

| Column Name     | Data Type    | Description                                                                           |
| --------------- | ------------ | ------------------------------------------------------------------------------------- |
| `order_number`  | NVARCHAR(50) | Unique alphanumeric identifier for each sales order (e.g., `SO54496`).                |
| `product_key`   | INT          | Surrogate key referencing the product dimension (`gold.dim_products`).                |
| `customer_key`  | INT          | Surrogate key referencing the customer dimension (`gold.dim_customers`).              |
| `order_date`    | DATE         | Date when the sales order was placed.                                                 |
| `shipping_date` | DATE         | Date when the order was shipped to the customer.                                      |
| `due_date`      | DATE         | Date when payment for the order was due.                                              |
| `sales_amount`  | INT          | Total monetary value of the sales line item, expressed in whole currency units.       |
| `quantity`      | INT          | Number of product units sold in the line item.                                        |
| `price`         | INT          | Unit price of the product for the sales line item, expressed in whole currency units. |

---

### Notes

* All surrogate keys are generated within the Gold Layer to ensure consistency and performance in analytical queries.
* This data model is optimized for BI tools, dashboards, and ad-hoc analytical queries.
