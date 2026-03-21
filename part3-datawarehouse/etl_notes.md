## ETL Decisions
- Decision 1: ***Date Format Standardization***

**Problem:** The raw data contained inconsistent date formats which were not as per the Standard SQL date types and would not be able to process time-series business intelligence queries.

**Resolution:** I implemented a parsing logic to convert all variations to standardized YYYY-MM-DD. Furthermore, I transformed them into numerics named date_key which serves as a smart surrogate key in dim_date table, ensuring data warehouse has a unified timeline for month-over-month reporting. 

- Decision 2: ***Categorical casing and pluralization***

**Problem:** The category field had duplicate logical entries caused by incosistent naming such as electronics(lowercase) versus Electronics(Capital first letter), and Grocery versus groceries. If left as is, it would result in fragmented BI reports where sales for the same department are split across multiple rows. 

**Resolution:** I applied clean at source rule during the transformation stage, in this stage I standardized all string to proper case and mapped the related terms to a single master term. This will ensure that dim_product maintains referential integrity and provided accurate total sales seggregated by correct category results. 

- Decision 3: ***Handling referential gaps(NULL Prevention)***

**Problem:** Several transactions in the raw data were referenced products which were not part of the initial top 5 electronics/grocery sample list. Loading these into fact_sales table without updating the dimensions would cause JOIN operations to return NULL values for product name as well as category. 

**Resolution:** I expanded dim_product table to include the unique entries for all items referenced in the transaction log, this satisfies the FOREIGN KEY constraints defined in the schema and ensures that every row in the fact table successfully maps to a descriptive attribute in the dimension table, preventing data "leakage" in the final BI dashboard. 



