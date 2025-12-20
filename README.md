# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository.  
This project demonstrates a comprehensive data warehousing and analytics solution, covering the full lifecycle from raw data ingestion to business-ready analytics. It is designed as a **portfolio project**, showcasing industry best practices in **data engineering, data modeling, and analytics** using SQL Server.

---

## 🏗️ Data Architecture

The data architecture for this project follows the **Medallion Architecture**, structured into **Bronze, Silver, and Gold layers**:

- **Bronze Layer**  
  Stores raw data as-is from source systems. Data is ingested from **CSV files** into a **SQL Server database**.

- **Silver Layer**  
  Includes data cleansing, standardization, and normalization processes to improve data quality and prepare datasets for analytical use.

- **Gold Layer**  
  Contains **business-ready data**, modeled using a **star schema** to support efficient reporting and analytical queries.

---

## 📖 Project Overview

This project covers the following key components:

- **Data Architecture**  
  Design and implementation of a modern data warehouse using the Medallion Architecture (Bronze, Silver, Gold).

- **ETL Pipelines**  
  Extraction, transformation, and loading of data from source systems into the data warehouse.

- **Data Modeling**  
  Development of fact and dimension tables optimized for analytical workloads.

- **Analytics & Reporting**  
  Creation of SQL-based analytical queries and reports to generate actionable business insights.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

**Objective**  
Develop a modern data warehouse using **SQL Server** to consolidate sales data and enable analytical reporting and informed decision-making.

**Specifications**

- **Data Sources:**  
  Import data from two source systems (**ERP and CRM**) provided as CSV files.

- **Data Quality:**  
  Cleanse, validate, and resolve data quality issues before analysis.

- **Integration:**  
  Combine both data sources into a single, user-friendly analytical data model.

- **Scope:**  
  Focus on the **latest dataset only**; historization of data is not required.

- **Documentation:**  
  Provide clear documentation of the data model to support business stakeholders and analytics teams.

---

## 📊 BI: Analytics & Reporting (Data Analysis)

**Objective**  
Develop SQL-based analytics to deliver insights into:

- Customer behavior  
- Product performance  
- Sales trends  

These insights enable stakeholders to monitor key business metrics and support strategic decision-making.

---

## 📂 Repository Structure

```text
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # ETL techniques and methods
│   ├── data_architecture.drawio        # Overall data architecture diagram
│   ├── data_catalog.md                 # Dataset catalog with field descriptions and metadata
│   ├── data_flow.drawio                # Data flow diagram
│   ├── data_models.drawio              # Star schema and data models
│   ├── naming-conventions.md           # Naming standards for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Raw data ingestion scripts
│   ├── silver/                         # Data cleansing and transformation scripts
│   ├── gold/                           # Analytical and dimensional modeling scripts
│
├── tests/                              # Data quality checks and test scripts
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information
├── .gitignore                          # Git ignored files and directories
└── requirements.txt                    # Project requirements and dependencies
```
## Acknowledgments

Thank you for reviewing this project.

The idea and motivation for developing this data warehouse solution originate from Baraa Khatib Salkini, also known as Data With Baraa, whose educational content and practical approach strongly inspired the structure and implementation of this project.
