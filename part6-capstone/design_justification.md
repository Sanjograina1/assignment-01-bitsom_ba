## Storage Systems
To achieve the four diverse goals of the hospital system, I decided upon a storage approach using several engines, focusing on a Data Lakehouse:
1. Real-time Vitals (Goal 4): I went with Apache Kafka along with Delta Lake. ICU sensor readings that occur often need a widely spread streaming system to manage the input without losing any information. Keeping the original feeds in Delta Lake (Bronze layer) permits looking back at patient events for troubleshooting purposes.
2. Predictive Modeling (Goal 1): Past patient care details are kept in Parquet files inside the Silver and Gold sections. The columnar structure of Parquet works best for the deep feature pulling that machine learning tools need to forecast chances of being admitted again.
3. Plain-English Queries (Goal 2): For the artificial intelligence used by the doctors, I picked a Vector Database (like Pinecone or Weaviate). Converting patient records into deep numerical representations lets the system run meaning-based searches to answer spoken language questions that standard SQL struggles to interpret.
4. Management Reporting (Goal 3): DuckDB serves as the analysis tool for the reports generated each month. It is able to directly read the Gold layer Parquet files with incredible speed, giving the fast summarizing needed for looking at how full beds are and tracking expenses without the extra work of a complete data warehouse.

## OLTP vs OLAP Boundary

## Trade-offs