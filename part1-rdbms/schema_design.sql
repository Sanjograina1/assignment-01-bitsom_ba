#Schema design for 3NF

#Making seperate table with customer data
create table customers (
customer_id VARCHAR(10) PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
customer_email VARCHAR(100) UNIQUE NOT NULL,
customer_city VARCHAR(50) NOT NULL
);  

#Making seperate table with salesrep data
create table salesreps (
salesrep_id VARCHAR(10) PRIMARY KEY,
salesrep_name VARCHAR(100) NOT NULL,
salesrep_email VARCHAR(100) UNIQUE NOT NULL,
office_address TEXT NOT NULL
);

#Making seperate table with product data
create table products (
product_id VARCHAR(10) PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50) NOT NULL,
unit_price DECIMAL(10, 2) NOT NULL
);

#Creating orders table with foriegn keys linking other tables

create table orders (
order_id VARCHAR(10) PRIMARY KEY,
customer_id VARCHAR(10) NOT NULL,
product_id VARCHAR(10) NOT NULL,
salesrep_id VARCHAR(10) NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
order_date DATE NOT NULL,
FOREIGN KEY (customer_id) references customers(customer_id),
FOREIGN key (product_id) references products(product_id),
FOREIGN key (salesrep_id) references salesreps(salesrep_id)
);

#Inserting customer data into table created above
INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

#Inserting salesrep data into table created above
Insert into salesreps (salesrep_id, salesrep_name, salesrep_email, office_address) values
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001'),
('SR04', 'Sunita Reddy', 'sunita@corp.com', 'West Zone, Park Street, Kolkata - 700013'),
('SR05', 'Arjun Patel', 'arjun@corp.com', 'East Zone, Brigade Road, Chennai - 600001');

#Inserting products into table created above
Insert into products (product_id, product_name, category, unit_price) values
('P001', 'Laptop', 'Electronics', 75000.00),
('P002', 'Mouse', 'Electronics', 30000.00),
('P003', 'Desk Chair', 'Accessories', 5000.00),
('P004', 'Notebook', 'Furniture', 12000.00),
('P005', 'Headphones', 'Appliances', 8000.00);

#Inserting orders into table created above
Insert into orders (order_id, customer_id, product_id, salesrep_id, quantity, order_date) values
('ORD1027', 'C002', 'P004', 'SR02', 4, '2023-11-02'),
('ORD1075', 'C005', 'P003', 'SR03', 3, '2023-04-18'),
('ORD1022', 'C005', 'P002', 'SR01', 5, '2023-10-15'),
('ORD1054', 'C002', 'P001', 'SR03', 1, '2023-10-04'),
('ORD1095', 'C001', 'P001', 'SR03', 3, '2023-08-11');
