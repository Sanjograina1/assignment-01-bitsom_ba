# Normalization Analysis
## Anomaly analysis
**Insert Anomaly:**
If we need to add a new product or a sales representative, we cannot do so without the need of creating a fake order as the data is flat, meaning we need to put all details in order to record a new product.
- Example: If a new product has to be recorded in column 'product_id' and 'product_name', or a new salesperson is added to the team, we cannot add them to columns 'sales_rep_id','sales_rep_name','sales_rep_email' and 'office_address' without adding placeholders or NULL in the table just to record a new product or sales represntative. No rows exist in the data for a product which has never been ordered or a sales representative who has never sold any product.

**Update Anomaly:**
When our dataset shows redundant data which needs to be updated simultaneously across all records otherwise it contradicts the data itself. In the event sales person changes their office location, it would need to be updated in each of the entries thus making it cumbersome. 
* Example: SR01(Deepak Joshi) has inconsistent address entries across different orders, 
1. Row 1(ORD1114): Office address is listed as "Nariman Point, Mumbai" 
2. Row 37(ORD1180): Office address here is listed as "Nariman Pt, Mumbai"

**Delete Anomaly:**
The data is lost completely by just deleting it's record in the dataset. 
- Example: P008 which is 'Webcam' appears in only one order, if that order is cancelled or deleted even by mistake, there would be no record of the product in the company's data hence making it lose the knowledge of the product ever existing. 

## Normalization justification 
Keeping data in a single table would appear to be simple as well as straight forward, but doing so in a production process might cost the company more time and effeciency than it saves. Using the dataset as an example, there is an instance with sales represntative (SR01) whose address appears to have two different versions, if and when the representative changes their office, it would need manual updating to all the hisorical data, this is best known as an update anomaly. Furthermore, the flat structure of the data makes it quite easy to completely delete data which was not intended to be deleted as in the case of product (P008) which is a webcam only recorded once in the dataset. Should the order be cancelled, the company would have no record of having the product in their data which is known as a delete anomaly. Finally, if a new product or sales representative joins the company, we cannot record that unless there is an order for that specific product or sale by that specific representative which is known as an insert anomaly. 

Normalization makes scalability possible for the business's master data making 3NF a neccessity for a reliable and professional database's foundation. 

*********************************************

