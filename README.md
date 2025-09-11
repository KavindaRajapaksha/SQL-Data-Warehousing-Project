# AWS End-to-End Data Warehousing Project

This project showcases a robust, end-to-end AWS data warehousing pipeline built on a modern medallion (multi-layered) architecture. It leverages AWS-native services for scalable and secure data ingestion, transformation, modeling, and analytics—culminating in actionable business intelligence dashboards.

---

## Solution Overview

This solution demonstrates how to efficiently integrate, cleanse, and model enterprise data using AWS, following industry best practices for cloud data warehousing and the medallion architecture. The pipeline is designed to handle raw data ingestion, rigorous data transformations, and advanced data modeling, making it ready for analytics and reporting in tools such as Microsoft Power BI.

---

## Architecture

<figure>
  <img width="2511" height="840" alt="SQLDataWarehouseArchitecture-Page-1 drawioAWS" src="https://github.com/user-attachments/assets/4d2c6571-7c2a-4b98-9ddb-a0dfa488e651" />
  <figcaption><b>Figure 1:</b> High-level AWS Data Warehousing Architecture and Data Flow</figcaption>
</figure>

### Components & Workflow

1. **Data Sources:**  
   - CRM and ERP data exported as CSV files.

2. **AWS S3:**  
   - Central data lake for raw source files.

   <figure>
     <img width="1897" height="908" alt="S3 Input csv data lake" src="https://github.com/user-attachments/assets/5c066257-502a-4d1b-a698-eb2eebf78a97" />
     <figcaption><b>Figure 2:</b> Input CSV Data Lake in S3</figcaption>
   </figure>

3. **AWS Glue:**  
   - Crawls S3 to catalog raw datasets in the AWS Glue Data Catalog.
   - Enables schema discovery and metadata management.
   - Provides ETL/ELT pipelines for data movement and transformation.

   <figure>
     <img width="1918" height="822" alt="Ingest data into glue" src="https://github.com/user-attachments/assets/c02c826e-937a-41cf-8f5c-ffe449518db4" />
     <figcaption><b>Figure 3:</b> Data Ingestion into AWS Glue</figcaption>
   </figure>

   <figure>
     <img width="1883" height="870" alt="ETL pipeline creation" src="https://github.com/user-attachments/assets/32561d1f-468e-4393-a77e-196bad5e765c" />
     <figcaption><b>Figure 4:</b> ETL Pipeline Creation in Glue</figcaption>
   </figure>

4. **AWS Athena:**  
   - Used for quick SQL-based validation and exploration of S3 data.

   <figure>
     <img width="1900" height="867" alt="Query using athena" src="https://github.com/user-attachments/assets/7fe88b5b-8387-44da-bd80-56700b3bec8f" />
     <figcaption><b>Figure 5:</b> Querying the Data Using AWS Athena</figcaption>
   </figure>

5. **AWS EC2 + SSMS:**  
   - EC2 instance hosts SQL Server Management Studio (SSMS) for SQL operations.
   - Connects securely to AWS Aurora (RDS for SQL Server).

   <figure>
     <img width="1905" height="873" alt="create EC2 instance for handle the schema" src="https://github.com/user-attachments/assets/8402bb73-ae15-4b07-bbb8-24c8002abd62" />
     <figcaption><b>Figure 6:</b> Creating the EC2 Instance for Schema Management</figcaption>
   </figure>

   <figure>
     <img width="1912" height="1015" alt="Install SSMS to EC2 And create schemas of layers" src="https://github.com/user-attachments/assets/66f6ed83-7eb8-4141-9411-b4447b2a5eb6" />
     <figcaption><b>Figure 7:</b> Installing SSMS on EC2 and Creating Schemas</figcaption>
   </figure>

6. **AWS Aurora RDS (SQL Server):**  
   - Cloud-native relational database hosting the multi-layered data warehouse.

   <figure>
     <img width="1547" height="571" alt="Datawarehouse creation" src="https://github.com/user-attachments/assets/b984e00d-e27d-4e06-8ef5-351dac845b0e" />
     <figcaption><b>Figure 8:</b> Data Warehouse Creation on Aurora</figcaption>
   </figure>

   <figure>
     <img width="1908" height="920" alt="JDBC connection to RDS" src="https://github.com/user-attachments/assets/de5fcc9b-8442-4c5f-82e1-5e63bc5c6b72" />
     <figcaption><b>Figure 9:</b> JDBC Connection to RDS</figcaption>
   </figure>

7. **Medallion Architecture Layers:**  
   - **dbo Layer:** Staging area for raw data via JDBC ingestion. No transformations.
   - **Bronze Layer:** Initial cleansing, type casting, and integrity checks. Preserves as much rawness as possible.
   - **Silver Layer:** Deep transformation—data cleaning, normalization, enrichment, and standardization. Prepares data for analytics.
   - **Gold Layer:** Business-ready data models—fact tables, star schemas, and aggregated objects for BI consumption.

8. **Microsoft Power BI:**  
   - Connects to the Gold layer for highly interactive dashboards and advanced analytics.

---

## Medallion Data Architecture Explained

The medallion (Bronze-Silver-Gold) architecture is a proven approach for organizing data pipelines:

- **Bronze Layer:**  
  Stores raw or minimally processed data. Maintains maximum fidelity to the source, ensuring traceability and auditability.

- **Silver Layer:**  
  Applies rigorous data cleaning, standardization, type corrections, deduplication, and enrichment. This layer ensures data quality and consistency, making it suitable for analytical modeling.

- **Gold Layer:**  
  Contains business-level aggregates, star schemas, and curated views. It enables fast, reliable analytics and reporting, serving as the foundation for dashboards and machine learning models.

---

## Data Flow & Transformations

| Step            | Layer        | Actions / Transformations                                                                                                         |
|-----------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------|
| **Ingest**      | S3 → Glue   | CSVs uploaded to S3, cataloged by Glue crawler.                                                                                   |
| **Staging**     | dbo         | Data loaded into Aurora RDS via JDBC (no transformations).                                                                       |
| **Raw Layer**   | Bronze      | Type casting, integrity checks, initial filtering, and batch inserts.                                                             |
| **Clean Layer** | Silver      | Data cleaning (null handling, outlier removal), normalization, standardization, derived column creation, enrichment.              |
| **Model Layer** | Gold        | Data integration, advanced aggregations, star schema modeling, business logic, and creation of analytical views/tables.           |
| **BI Layer**    | Power BI    | Consumption of Gold layer for dashboard creation and business insights.                                                           |

---

## Business Intelligence Example

The Gold layer is connected to Microsoft Power BI, powering dashboards for business stakeholders. Example insights include:

- Sales trends over time
- Product category analysis
- Customer segmentation by demographics

<figure>
  <img width="1910" height="977" alt="Star schema Data Modeling For BI Dashboard" src="https://github.com/user-attachments/assets/e5e4de03-82ad-446d-a43a-295f720f5c16" />
  <figcaption><b>Figure 10:</b> Star Schema Data Modeling for BI Dashboard</figcaption>
</figure>

<figure>
  <img width="1898" height="978" alt="Create BI Dashboard using Power BI" src="https://github.com/user-attachments/assets/e4db6f00-50c7-4b0e-a6fe-a05009ebecd6" />
  <figcaption><b>Figure 11:</b> Creating a BI Dashboard using Power BI</figcaption>
</figure>

---

## How to Deploy (AWS Workflow)

1. **Upload Source Data:**  
   Place CRM/ERP CSV files into an S3 bucket.

2. **Catalog with Glue:**  
   Run an AWS Glue Crawler to automatically catalog the datasets.

3. **Provision RDS:**  
   Create an Aurora (SQL Server compatible) RDS instance.

4. **Ingest Data:**  
   Use Glue ETL jobs to load data from Glue Catalog into the `dbo` layer of Aurora via JDBC.

5. **Schema Creation & ETL:**  
   - Use SSMS (on EC2) to create schemas for Bronze, Silver, and Gold layers.
   - Run ETL scripts to move and transform data through each medallion stage.

6. **Analytics & Visualization:**  
   Connect Power BI to the Gold layer for business reporting and dashboarding.

---

## Data Modeling & Transformations

- **Type Casting:** All incoming data types are validated and cast appropriately.
- **Data Cleaning:** Remove duplicates, correct inconsistencies, handle nulls, filter out invalid records.
- **Standardization:** Normalize date/time formats, categorical values, and measurement units.
- **Enrichment:** Derive new columns and enhance data for deeper analytics.
- **Business Logic:** Apply business rules, create aggregated metrics, and build star schemas for efficient analysis.

---

## Repository Structure

- `datasets/` — Example source data (CSV).
- `scripts/` — SQL/ETL scripts for schema creation and data transformations.
- `docs/` — Documentation and data catalog.
- `tests/` — Data quality scripts.

---

## Why This Project Stands Out

- **Production-Ready Design:** Implements a scalable, auditable, and flexible data warehouse pipeline using AWS best practices.
- **End-to-End Integration:** From raw data to interactive BI dashboards—demonstrates the full journey of enterprise data.
- **Modern Medallion Layers:** Ensures data quality, traceability, and business readiness at every stage.
- **Cloud-Native:** Utilizes the power and security of AWS services for every step.

---

## License

See [LICENSE](LICENSE) for details.

---

> **Unlock the full value of your data—one layer at a time!**
