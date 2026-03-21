//OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertmany([
 {
"product_id": "E101",
"name": "Zolo Pro Watch",
"category": "Electronics",
"brand": "Zolo",
"price": 199.99,
"specifications": {
    "display": "AMOLED",
    "battery_life": "15 days",
    "water_resistance": "5 ATM",
    "voltage": "5V",
    "warranty": {
        "duration_months": 24,
        "type": "Manufacturer Limited Warranty"}
    },
    "features": [
    "Heart Rate Monitor",
    "Sleep Tracking",
    "GPS"]
 },
 {
    "product_id": "C202",
    "name": "Organic Cotton Comfort Hoodie",
    "category": "Clothing",
    "brand": "EcoWear",
    "price": 50.00,
    "variants": [
        {"size":"S", "color": "Sky Blue", "sku": "EW-HOD-S-BL"},
        {"size":"M", "color": "Sky Blue", "sku": "EW-HOD-M-BL"},
        {"size":"L", "color": "Sky Blue", "sku": "EW-HOD-L-BL"}
    ],
    "care_instructions": ["Machine wash cold", "Tumble dry low"]
  },
  {
    "product_id": "G303",
    "name": "Lajawab Granola Bar - Honey and Cashew",
    "category": "Groceries",
    "brand": "Lajawab Foods",
    "price": 10.00,
    "nutritional_info": {
        "calories": 150,
        "protein": "10g",
        "allergens": ["Nuts", "Gluten"],
        "ingredients": ["Oats", "Honey", "Cashews", "Brown Sugar", "Salt", "Whey Protein Concentrate"]
    },
    "batch_details": {
        "batch_number": "BN-9582",
        "expiry_date": "2027-02-20"
    }
  }
]);
//OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
    "category": "Electronics", "price": { "$gt" : 20000 }
    });

//OP3:find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
    "category": "Groceries", "batch_details.expiry_date":
    { "$lt": "2025-01-01" }
})
// OP4: updateOne() — add a "discount_percent" field to a specific product( Zolo Pro Watch)
db.products.updateOne(
    { "product_id": "E101" },
    { $set: { "discount_percent": 10 } }
);
// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ "category": 1 });
/* Explanation: We are using the category to index the fields because it is the primary filter which will be used by the customers.
Without an index, MongoDB will perform a full collection scan for finding matching products whereas with an index, search performance will be significantly improved as the database would jump directly to the relevant category.*/
    