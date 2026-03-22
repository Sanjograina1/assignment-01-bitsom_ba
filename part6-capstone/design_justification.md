## Storage Systems
To achieve the four diverse goals of the hospital system, I decided upon a storage approach using several engines, focusing on a Data Lakehouse:
1. Real-time Vitals (Goal 1): I went with Apache Kafka along with Delta Lake. ICU sensor readings that occur often need a widely spread streaming system to manage the input without losing any information. Keeping the original feeds in Delta Lake (Bronze layer) permits looking back at patient events for troubleshooting purposes.
2. Predictive Modeling (Goal 2): Past patient care details are kept in Parquet files inside the Silver and Gold sections. The columnar structure of Parquet works best for the deep feature pulling that machine learning tools need to forecast chances of being admitted again.
3. Plain-English Queries (Goal 3): For the artificial intelligence used by the doctors, I picked a Vector Database (like Pinecone or Weaviate). Converting patient records into deep numerical representations lets the system run meaning-based searches to answer spoken language questions that standard SQL struggles to interpret.
4. Management Reporting (Goal 4): DuckDB serves as the analysis tool for the reports generated each month. It is able to directly read the Gold layer Parquet files with incredible speed, giving the fast summarizing needed for looking at how full beds are and tracking expenses without the extra work of a complete data warehouse.

## OLTP vs OLAP Boundary
In this design, the boundary between OLTP(Online Transacrtional Processing) and OLAP(Online Analytical Processing) is defined by the ingestion layer. 

The OLTP side consists of source EMR, admin, and ICU monitoring systems, these are write-heavy environments specially optimized for individual patient updates and real time managemen. The boundary is crossed by data via **Change Data Capture** or streamin into **Bronze Layer** of the lakehouse. 

Once the data crosses into lakehouse, it enters the OLAP environment where the data isnt updated individually, instead it is transformed, cleaned, and aggregated for high volume reads. This separation ensures that critical systems needed for during patient care are not to slow down for complex AI queries or management reports. 
## Trade-offs
A major compromise in this layout involves Architectural Complexity versus Data Freshness.

When selecting a Lakehouse featuring several layers (Bronze/Silver/Gold) plus an independent Vector DB, we create lag time. Information needs to move through various steps of processing until it is "prepared" for the AI application or administrative summaries. Within a critical care setting, any slowness in showing a patient's condition might become an issue.
#### Mitigation: 
I would lessen this by putting Lambda Architecture ideas to work for the most essential metrics. Although the older information follows the less quick "Gold" process, the immediate ICU feed can skip large processing steps to supply a "Speed Layer" display right from Kafka. Furthermore, employing Delta Live Tables might make the data flow automatic to confirm that the "analytical" information gets updated every few minutes instead of just one time daily.